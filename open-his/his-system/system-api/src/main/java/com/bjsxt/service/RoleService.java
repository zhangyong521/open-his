package com.bjsxt.service;

import com.bjsxt.domain.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bjsxt.dto.RoleDto;
import com.bjsxt.vo.DataGridView;

import java.util.List;

/**
 * @description: TODO 角色信息表
 * @author zy
 * @date 2020/12/9 17:58
 * @version 1.0
*/
public interface RoleService{

        /**
         * 分页查询角色
         * @param roleDto
         * @return
         */
        DataGridView listRolePage(RoleDto roleDto);

        /**
         * 查询所有可用角色
         * @return
         */
        List<Role> listAllRoles();

        /**
         * 根据ID查询角色
         * @param roleId
         * @return
         */
        Role getOne(Long roleId);

        /**
         * 添加一个角色
         * @param roleDto
         * @return
         */
        int addRole(RoleDto roleDto);

        /**
         * 修改角色
         * @param roleDto
         * @return
         */
        int updateRole(RoleDto roleDto);

        /**
         * 根据角色ID删除角色
         * @param roleIds
         * @return
         */
        int deleteRoleByIds(Long[] roleIds);


        /**
         * 保存角色和菜单之间的关系
         * @param roleId
         * @param menuIds
         */
        void saveRoleMenu(Long roleId, Long[] menuIds);

}
