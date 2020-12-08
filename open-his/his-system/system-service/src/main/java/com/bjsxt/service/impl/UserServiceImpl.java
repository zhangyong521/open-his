package com.bjsxt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bjsxt.domain.User;
import com.bjsxt.mapper.UserMapper;
import com.bjsxt.service.UserService;
/**
 * @description: TODO 用户的逻辑层
 * @author zy
 * @date 2020/12/7 17:33
 * @version 1.0
*/
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public User queryUserByPhone(String phone) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq(User.COL_PHONE,phone);
        User user = userMapper.selectOne(qw);
        return user;
    }

    @Override
    public User getOne(Long userId) {
        return userMapper.selectById(userId);
    }

}
