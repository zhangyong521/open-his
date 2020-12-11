package com.bjsxt.utils;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.IdUtil;
import lombok.extern.slf4j.Slf4j;


/**
 * @author zy
 * @version 1.0
 * @description: TODO 雪花算法工具类
 * @date 2020/12/7 16:07
 */
@Slf4j
public class IdGeneratorSnowflake {
    private static long workId = 0;
    private static long datacenterId = 1;
    private static Snowflake snowflake;


    static {
        try {
            //workId = NetUtil.ipv4ToLong(NetUtil.getLocalhostStr());
            //log.info("当前机器的工作ID为:" + workId);
            /**
             * 解决workId过大的问题
             */
            snowflake=IdUtil.createSnowflake(workId, datacenterId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("当前机器的workId获取失败", e);
            workId = NetUtil.getLocalhostStr().hashCode();
        }
    }

    /**
     * 生成ID
     */
    public static synchronized Long snowflakeId() {
        return snowflake.nextId();
    }

    /**
     * 根据前缀前成ID
     */
    public static String generatorIdWithProfix(String profix) {
        return profix + snowflakeId();
    }

}
