package com.bjsxt.service;


import com.bjsxt.domain.User;

/**
 * @author zy
 * @version 1.0
 * @description: 用户的接口
 * @date 2020/12/7 17:33
 */
public interface UserService {
    /**
     * 根据手机号查询用户
     * @param phone 手机号
     * @return
     */
    User queryUserByPhone(String phone);

    /**
     * 根据用户ID查询用户
     * @param userId 用户编号
     * @return
     */
    User getOne(Long userId);

}
