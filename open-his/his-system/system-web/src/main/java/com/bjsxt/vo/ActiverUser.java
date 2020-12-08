package com.bjsxt.vo;

import com.bjsxt.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: 自定义realm去匹配用户名和密码
 * @date 2020/12/7 10:22
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActiverUser implements Serializable {

    private User user;
    /**
     * 角色
     */
    private List<String> roles = Collections.EMPTY_LIST;
    /**
     * 权限
     */
    private List<String> permissions = Collections.EMPTY_LIST;

}