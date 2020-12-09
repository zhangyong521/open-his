package com.bjsxt.service;

import com.bjsxt.domain.OperLog;
import com.bjsxt.dto.OperLogDto;
import com.bjsxt.vo.DataGridView;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 操作日志记录
 * @date 2020/12/9 13:03
 */
public interface OperLogService {

    /**
     * 插入操作日志
     *
     * @param operLog
     */
    void insertOperLog(OperLog operLog);

    /**
     * 分页查询操作日志
     *
     * @param operLogDto
     * @return
     */
    DataGridView listForPage(OperLogDto operLogDto);

    /**
     * 根据ID删除操作日志
     *
     * @param infoIds
     * @return
     */
    int deleteOperLogByIds(Long[] infoIds);

    /**
     * 清空操作日志
     *
     * @return
     */
    int clearAllOperLog();

}
