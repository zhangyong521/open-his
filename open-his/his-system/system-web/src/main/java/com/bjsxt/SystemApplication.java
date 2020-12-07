package com.bjsxt;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 创建SystemApplication主启动类
 * @date 2020/12/7 10:22
 */
@SpringBootApplication
@EnableDubbo
@MapperScan(basePackages = {"com.bjsxt.mapper"})
public class SystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(SystemApplication.class, args);
        System.out.println("SystemApplication主启动类");
    }
}
