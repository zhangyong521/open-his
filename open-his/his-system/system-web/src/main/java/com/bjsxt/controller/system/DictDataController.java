package com.bjsxt.controller.system;

import com.bjsxt.aspectj.annotation.Log;
import com.bjsxt.aspectj.enums.BusinessType;
import com.bjsxt.dto.DictDataDto;
import com.bjsxt.service.DictDataService;
import com.bjsxt.utils.ShiroSecurityUtils;
import com.bjsxt.vo.AjaxResult;
import com.bjsxt.vo.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


/**
 * @author zy
 * @version 1.0
 * @description: TODO 字典数据控制层
 * @date 2020/12/8 16:25
 */
@RestController
@RequestMapping("system/dict/data")
public class DictDataController {

    @Autowired
    private DictDataService dictDataService;

    /**
     * 分页查询
     */
    @GetMapping("listForPage")
    public AjaxResult listForPage(DictDataDto dictDataDto) {
        DataGridView gridView = this.dictDataService.listPage(dictDataDto);
        return AjaxResult.success("查询成功", gridView.getData(), gridView.getTotal());
    }

    /**
     * 添加
     */
    @PostMapping("addDictData")
    @Log(title = "添加字典数据", businessType = BusinessType.INSERT)
    public AjaxResult addDictData(@Validated DictDataDto dictDataDto) {
        dictDataDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.dictDataService.insert(dictDataDto));
    }

    /**
     * 修改
     */
    @PutMapping("updateDictData")
    @Log(title = "修改字典数据", businessType = BusinessType.UPDATE)
    public AjaxResult updateDictData(@Validated DictDataDto dictDataDto) {
        dictDataDto.setSimpleUser(ShiroSecurityUtils.getCurrentSimpleUser());
        return AjaxResult.toAjax(this.dictDataService.update(dictDataDto));
    }

    /**
     * 根据ID查询一个字典信息
     */
    @GetMapping("getOne/{dictCode}")
    public AjaxResult getDictData(@PathVariable @Validated @NotNull(message = "字典ID不能为空") Long dictCode) {
        return AjaxResult.success(this.dictDataService.selectDictDataById(dictCode));
    }

    /**
     * 删除
     */
    @DeleteMapping("deleteDictDataByIds/{dictCodeIds}")
    @Log(title = "删除字典数据", businessType = BusinessType.DELETE)
    public AjaxResult updateDictData(@PathVariable @Validated @NotEmpty(message = "要删除的ID不能为空") Long[] dictCodeIds) {
        return AjaxResult.toAjax(this.dictDataService.deleteDictDataByIds(dictCodeIds));
    }

    /**
     * 查询所有可用的字典类型
     */
    @GetMapping("getDataByType/{dictType}")
    public AjaxResult getDataByType(@PathVariable @Validated @NotEmpty(message = "字典类型不能为空") String dictType) {
        return AjaxResult.success(this.dictDataService.selectDictDataByDictType(dictType));
    }

}