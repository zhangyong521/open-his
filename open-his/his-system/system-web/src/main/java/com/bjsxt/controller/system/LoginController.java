package com.bjsxt.controller.system;

import com.bjsxt.aspectj.annotation.Log;
import com.bjsxt.aspectj.enums.BusinessType;
import com.bjsxt.constants.Constants;
import com.bjsxt.constants.HttpStatus;
import com.bjsxt.domain.Menu;
import com.bjsxt.domain.SimpleUser;
import com.bjsxt.dto.LoginBodyDto;
import com.bjsxt.service.MenuService;
import com.bjsxt.vo.ActiverUser;
import com.bjsxt.vo.AjaxResult;
import com.bjsxt.vo.MenuTreeVo;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 写登陆、退出、查询用户信息、接口控制层
 * @date 2020/12/7 10:22
 */
@RestController
@Log4j2
public class LoginController {

    @Autowired
    private MenuService menuService;

    /**
     * 登录方法
     * @RequestBody 传入类型json
     * @Validated 接口数据校验
     * @return 结果
     */
    @PostMapping("login/doLogin")
    @Log(title = "用户登录",businessType = BusinessType.OTHER)
    public AjaxResult login(@RequestBody @Validated LoginBodyDto loginBodyDto, HttpServletRequest request) {
        AjaxResult ajax = AjaxResult.success();
        String username = loginBodyDto.getUsername();
        String password = loginBodyDto.getPassword();
        //构造用户名和密码的token
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            //得到会话的token==也就是redis里面存的
            Serializable webToken = subject.getSession().getId();
            ajax.put(Constants.TOKEN, webToken);
        } catch (Exception e) {
            log.error("用户名或密码不正确", e);
            ajax = AjaxResult.error(HttpStatus.ERROR, "用户名或密码不正确");
        }
        return ajax;
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("login/getInfo")
    public AjaxResult getInfo() {
        Subject subject = SecurityUtils.getSubject();
        ActiverUser activerUser = (ActiverUser) subject.getPrincipal();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("username", activerUser.getUser().getUserName());
        ajax.put("picture", activerUser.getUser().getPicture());
        ajax.put("roles", activerUser.getRoles());
        ajax.put("permissions", activerUser.getPermissions());
        return ajax;
    }

    /**
     * 用户退出
     */
    @PostMapping("login/logout")
    public AjaxResult logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return AjaxResult.success("用户退出成功");
    }

    /**
     * 获取应该显示的菜单信息
     *
     * @return 菜单信息
     */
    @GetMapping("login/getMenus")
    public AjaxResult getMeuns() {
        Subject subject = SecurityUtils.getSubject();
        ActiverUser activerUser = (ActiverUser) subject.getPrincipal();
        boolean isAdmin = activerUser.getUser().getUserType().equals(Constants.USER_ADMIN);
        SimpleUser simpleUser = null;
        if (!isAdmin) {
            simpleUser = new SimpleUser(activerUser.getUser().getUserId(), activerUser.getUser().getUserName());
        }
        List<Menu> menus = menuService.selectMenuTree(isAdmin, simpleUser);
        List<MenuTreeVo> menuVos = new ArrayList<>();
        for (Menu menu : menus) {
            menuVos.add(new MenuTreeVo(menu.getMenuId().toString(), menu.getPath()));
        }
        return AjaxResult.success(menuVos);
    }

}