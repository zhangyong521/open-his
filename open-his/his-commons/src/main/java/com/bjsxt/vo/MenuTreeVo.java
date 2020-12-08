package com.bjsxt.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @author zy
 * @version 1.0
 * @description: 构造菜单返回给前台的vo
 * @date 2020/12/7 16:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuTreeVo {

    private String id;

    /**
     * 菜单表里面的url
     */
    private String serPath;

    /**
     * 是否显示
     */
    private boolean show = true;

    public MenuTreeVo(String id, String serPath) {
        this.id = id;
        this.serPath = serPath;
    }

}
