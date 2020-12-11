package com.bjsxt.service;

import com.bjsxt.dto.InventoryLogDto;
import com.bjsxt.vo.DataGridView;

/**
 * @author zy
 * @version 1.0
 * @description: TODO  入库详情
 * @date 2020/12/11 11:30
 */
public interface InventoryLogService {
    /**
     * 分页查询
     *
     * @param inventoryLogDto
     * @return
     */
    DataGridView listInventoryLogPage(InventoryLogDto inventoryLogDto);
}