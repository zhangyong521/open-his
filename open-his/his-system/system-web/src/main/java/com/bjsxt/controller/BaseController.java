package com.bjsxt.controller;

import com.bjsxt.vo.AjaxResult;
import com.netflix.hystrix.contrib.javanica.annotation.DefaultProperties;

/**
 * @author zy
 * @version 1.0
 * @description: TODO
 * @date 2020/12/10 17:54
 */
@DefaultProperties(defaultFallback = "fallback")
public class BaseController {
    /**
     * 如远程服务不可用，或者出现异常，回调的方法
     * @return
     */
    public AjaxResult fallback(){
        return AjaxResult.fail("服务器内部异常，请联系管理员");
    }
}