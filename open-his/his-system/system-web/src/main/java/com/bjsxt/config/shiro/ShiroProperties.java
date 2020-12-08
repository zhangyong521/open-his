package com.bjsxt.config.shiro;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;



/**
 * @author zy
 * @version 1.0
 * @description:  shiro基本类
 * @date 2020/12/7 18:09
 */

@Data
@ConfigurationProperties(prefix = "shiro")
public class ShiroProperties {
    /**
     * 密码加密方式
     */
    private String hashAlgorithmName="md5";
    /**
     * 密码散列次数
     */
    private Integer hashIterations=2;

    /**
     * 不拦击的路径
     */
    private String[] anonUrls;

    /**
     * 拦截的路径
     */
    private String[] authcUrls;

}