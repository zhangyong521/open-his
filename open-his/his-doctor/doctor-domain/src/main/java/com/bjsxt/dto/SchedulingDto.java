package com.bjsxt.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 封装数据使用
 * @date 2020/12/14
 */
@ApiModel(value = "com-bjsxt-dto-SchedulingDto")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SchedulingDto implements Serializable {
    private Long userId;
    private Long deptId;
    private String subsectionType; //上午 下午  晚上
    //星期的值班值
    private Collection<String> schedulingType;
    //星期值班的记录 key 是日期
    @JsonIgnore
    private Map<String, String> record;

    public SchedulingDto(Long userId, Long deptId, String subsectionType, Map<String, String> map) {
        this.userId = userId;
        this.subsectionType = subsectionType;
        this.record = map;
        this.deptId = deptId;
    }

}