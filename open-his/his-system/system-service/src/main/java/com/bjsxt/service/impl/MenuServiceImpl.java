package com.bjsxt.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bjsxt.constants.Constants;
import com.bjsxt.domain.SimpleUser;
import com.bjsxt.dto.MenuDto;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.bjsxt.domain.Menu;
import com.bjsxt.mapper.MenuMapper;
import com.bjsxt.service.MenuService;
/**
 * @description: TODO 菜单的逻辑层
 * @author zy
 * @date 2020/12/7 17:47
 * @version 1.0
*/
@Service
public class MenuServiceImpl implements MenuService{
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> selectMenuTree(boolean isAdmin, SimpleUser simpleUser) {

        QueryWrapper<Menu> qw = new QueryWrapper<>();
        qw.eq(Menu.COL_STATUS, Constants.STATUS_TRUE);
        qw.in(Menu.COL_MENU_TYPE,Constants.MENU_TYPE_M,Constants.MENU_TYPE_C);
        qw.orderByDesc(Menu.COL_PARENT_ID);
        if(isAdmin){
            return menuMapper.selectList(qw);
        }else {
            //TODO 需要修改哦
            //根据用户id查询用户拥有的菜单信息
            return menuMapper.selectList(qw);
        }
    }

    @Override
    public List<Menu> listAllMenus(MenuDto menuDto) {
        QueryWrapper<Menu> qw = new QueryWrapper<>();
        qw.like(StringUtils.isNotBlank(menuDto.getMenuName()), Menu.COL_MENU_NAME, menuDto.getMenuName());
        qw.eq(StringUtils.isNotBlank(menuDto.getStatus()), Menu.COL_STATUS, menuDto.getStatus());
        return this.menuMapper.selectList(qw);
    }

    @Override
    public Menu getOne(Long menuId) {
        return this.menuMapper.selectById(menuId);
    }

    @Override
    public int addMenu(MenuDto menuDto) {
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuDto, menu);
        //设置创建时间创建人
        menu.setCreateBy(menuDto.getSimpleUser().getUserName());
        menu.setCreateTime(DateUtil.date());
        return this.menuMapper.insert(menu);
    }

    @Override
    public int updateMenu(MenuDto menuDto) {
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuDto, menu);
        //设置修改人
        menu.setUpdateBy(menuDto.getSimpleUser().getUserName());
        return this.menuMapper.updateById(menu);
    }

    @Override
    public int deleteMenuById(Long menuId) {
        //先删除role_menu的中间表的数据【后面再加】TODO 需要修改哦
        //再删除菜单或权限
        return this.menuMapper.deleteById(menuId);
    }

    @Override
    public boolean hasChildByMenuId(Long menuId) {
        return this.menuMapper.queryChildCountByMenuId(menuId) > 0L ? true : false;
    }

    @Override
    public List<Long> getMenusIdsByRoleId(Long roleId) {
        return this.menuMapper.queryMenuIdsByRoleId(roleId);
    }
}
