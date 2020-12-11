package com.bjsxt.service;


import com.bjsxt.domain.Medicines;
import com.bjsxt.dto.MedicinesDto;
import com.bjsxt.vo.DataGridView;

import java.util.List;

/**
 * @author zy
 * @version 1.0
 * @description: TODO 药品信息表
 * @date 2020/12/11 9:48
 */
public interface MedicinesService {
    /**
     * 分页查询
     *
     * @param medicinesDto
     * @return
     */
    DataGridView listMedicinesPage(MedicinesDto medicinesDto);

    /**
     * 根据ID查询
     *
     * @param medicinesId
     * @return
     */
    Medicines getOne(Long medicinesId);

    /**
     * 添加
     *
     * @param medicinesDto
     * @return
     */
    int addMedicines(MedicinesDto medicinesDto);

    /**
     * 修改
     *
     * @param medicinesDto
     * @return
     */
    int updateMedicines(MedicinesDto medicinesDto);

    /**
     * 根据ID删除
     *
     * @param medicinesIds
     * @return
     */
    int deleteMedicinesByIds(Long[] medicinesIds);

    /**
     * 查询所有可用生产厂家
     * @return
     */
    List<Medicines> selectAllMedicines();

    /**
     * 调整库存
     * @param medicinesId
     * @param medicinesStockNum
     * @return
     */
    int updateMedicinesStorage(Long medicinesId, Long medicinesStockNum);

}
