package com.bjsxt;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 创建StatisticsApplication主启动类
 * @date 2020/12/7 11:26
 */
@SpringBootApplication
@MapperScan(basePackages = {"com.bjsxt.mapper"})
@EnableDubbo
public class StatisticsApplication {
    public static void main(String[] args) {
        SpringApplication.run(StatisticsApplication.class,args);
        System.out.println("统计分析子系统启动成功");
    }
}
