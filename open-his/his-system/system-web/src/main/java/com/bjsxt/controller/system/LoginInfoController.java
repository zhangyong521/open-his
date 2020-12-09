package com.bjsxt.controller.system;

import com.bjsxt.aspectj.annotation.Log;
import com.bjsxt.aspectj.enums.BusinessType;
import com.bjsxt.dto.LoginInfoDto;
import com.bjsxt.service.LoginInfoService;
import com.bjsxt.vo.AjaxResult;
import com.bjsxt.vo.DataGridView;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 系统访问记录
 * @date 2020/12/9 15:24
 */
@Log4j2
@RestController
@RequestMapping("system/loginInfo")
public class LoginInfoController {
    @Autowired
    private LoginInfoService loginInfoService;

    /**
     * 分页查询
     */
    @GetMapping("listForPage")
    public AjaxResult listForPage(LoginInfoDto loginInfoDto) {
        DataGridView gridView = loginInfoService.listForPage(loginInfoDto);
        return AjaxResult.success("查询成功", gridView.getData(), gridView.getTotal());
    }

    /**
     * 删除
     */
    @DeleteMapping("deleteLoginInfoByIds/{infoIds}")
    @Log(title = "删除登录日志", businessType = BusinessType.DELETE)
    public AjaxResult deleteLoginInfoByIds(@PathVariable Long[] infoIds) {
        return AjaxResult.toAjax(this.loginInfoService.deleteLoginInfoByIds(infoIds));
    }

    /**
     * 清空删除
     */
    @DeleteMapping("clearLoginInfo")
    @Log(title = "清空登录日志", businessType = BusinessType.DELETE)
    public AjaxResult clearLoginInfo() {
        return AjaxResult.toAjax(this.loginInfoService.clearLoginInfo());
    }

}
