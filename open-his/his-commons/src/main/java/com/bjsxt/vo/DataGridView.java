package com.bjsxt.vo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 表格数据传输对象
 * @date 2020/12/8 15:01
 */
@ApiModel(value="com-bjsxt-vo-DataGridView")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataGridView implements Serializable {

    private Long total;
    private List<?> data;

}
