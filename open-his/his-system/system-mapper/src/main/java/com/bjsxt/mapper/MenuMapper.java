package com.bjsxt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bjsxt.domain.Menu;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.List;

/**
 * @description: TODO 菜单Mapper
 * @author zy
 * @date 2020/12/7 17:47
 * @version 1.0
*/
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 根据菜单ID查询当前菜单的子节点的个数
     *
     * @param menuId
     * @return
     */
    Long queryChildCountByMenuId(@Param("menuId") Long menuId);

    /**
     * 根据角色ID查询所有选中的权限菜单ID【只查子节点的】
     *
     * @param roleId
     * @return
     */
    List<Long> queryMenuIdsByRoleId(@Param("roleId") Long roleId);

}