package com.bjsxt.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;


/**
 * @author zy
 * @version 1.0
 * @description: TODO 登陆用户的数据传输对象
 * @date 2020/12/7 16:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SimpleUser implements Serializable {

    private Serializable userId;
    private String userName;

}
