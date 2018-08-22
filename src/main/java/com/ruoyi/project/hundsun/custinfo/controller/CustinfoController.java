package com.ruoyi.project.hundsun.custinfo.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.constant.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.hundsun.custinfo.domain.Custinfo;
import com.ruoyi.project.hundsun.custinfo.service.ICustinfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: liuzw
 * @Date: 2018/8/20 22:16
 */
@Controller
@RequestMapping("/hundsun/custinfo")
public class CustinfoController extends BaseController{
    private String prefix = "hundsun/custinfo";

    @Autowired
    private ICustinfoService custinfoService;

    @RequiresPermissions("hundsun:custinfo:view")
    @GetMapping()
    public String openView()
    {
        return prefix + "/custinfo";
    }

    /**
     * 查询客户列表
     * @param custinfo
     * @return
     */
    @RequiresPermissions("hundsun:custinfo:select")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Custinfo custinfo){
        startPage();
        List<Custinfo> list = custinfoService.findAll(custinfo);
        return getDataTable(list);
    }

    /**
     * 新增客户
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    @RequiresPermissions("hundsun:custinfo:add")
    @Log(title = "客户新增", action = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult add(Custinfo custinfo){
        return toAjax(custinfoService.addOne(custinfo));
    }
}
