package com.bjsxt;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 创建ErpApplication主启动类
 * @date 2020/12/7 11:02
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.bjsxt.mapper"})
@EnableDubbo
public class ErpApplication {

    public static void main(String[] args) {
        SpringApplication.run(ErpApplication.class, args);
        System.out.println("创建ErpApplication主启动类");
    }

}
