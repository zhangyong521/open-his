package com.bjsxt.service;

import com.bjsxt.domain.CheckItem;
import com.bjsxt.dto.CheckItemDto;
import com.bjsxt.vo.DataGridView;

import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: TODO
 * @date 2020/12/10 15:16
 */
public interface CheckItemService {

    /**
     * 分页查询
     *
     * @param checkItemDto
     * @return
     */
    DataGridView listCheckItemPage(CheckItemDto checkItemDto);

    /**
     * 根据ID查询
     *
     * @param checkItemId
     * @return
     */
    CheckItem getOne(Long checkItemId);

    /**
     * 添加
     *
     * @param checkItemDto
     * @return
     */
    int addCheckItem(CheckItemDto checkItemDto);

    /**
     * 修改
     *
     * @param checkItemDto
     * @return
     */
    int updateCheckItem(CheckItemDto checkItemDto);

    /**
     * 根据ID删除
     *
     * @param checkItemIds
     * @return
     */
    int deleteCheckItemByIds(Long[] checkItemIds);

    /**
     * 查询所有可用的检查项目
     *
     * @return
     */
    List<CheckItem> queryAllCheckItems();

}
