package com.bjsxt.service;

import com.bjsxt.domain.Notice;
import com.bjsxt.dto.NoticeDto;
import com.bjsxt.vo.DataGridView;

/**
 * @author zy
 * @version 1.0
 * @description: TODO
 * @date 2020/12/10 14:28
 */
public interface NoticeService {

    /**
     * 分页查询
     *
     * @param noticeDto
     * @return
     */
    DataGridView listNoticePage(NoticeDto noticeDto);

    /**
     * 根据ID查询
     *
     * @param noticeId
     * @return
     */
    Notice getOne(Long noticeId);

    /**
     * 添加
     *
     * @param noticeDto
     * @return
     */
    int addNotice(NoticeDto noticeDto);

    /**
     * 修改
     *
     * @param noticeDto
     * @return
     */
    int updateNotice(NoticeDto noticeDto);

    /**
     * 根据ID删除
     *
     * @param noticeIds
     * @return
     */
    int deleteNoticeByIds(Long[] noticeIds);

}
