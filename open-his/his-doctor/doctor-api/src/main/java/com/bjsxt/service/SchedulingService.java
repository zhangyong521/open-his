package com.bjsxt.service;

import com.bjsxt.domain.Scheduling;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bjsxt.dto.SchedulingFormDto;
import com.bjsxt.dto.SchedulingQueryDto;

import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: TODO
 * @date 2020/12/14
 */
public interface SchedulingService {
    /**
     * 查询排班的数据
     *
     * @param schedulingDto
     * @return
     */
    List<Scheduling> queryScheduling(SchedulingQueryDto schedulingDto);

    /**
     * 保存排班的数据
     *
     * @param schedulingFormDto
     * @return
     */
    int saveScheduling(SchedulingFormDto schedulingFormDto);

}
