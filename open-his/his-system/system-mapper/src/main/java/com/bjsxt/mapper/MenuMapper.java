package com.bjsxt.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bjsxt.domain.Menu;

/**
 * @description: TODO 菜单Mapper
 * @author zy
 * @date 2020/12/7 17:47
 * @version 1.0
*/
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 根据菜单ID查询它的子节点个数
     *
     * @param menuId
     * @return
     */
    Long queryChildCountByMenuId(Long menuId);

}