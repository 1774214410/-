package com.ruoyi.project.hundsun.custinfo.mapper;

import com.ruoyi.project.hundsun.custinfo.domain.Custinfo;

import java.util.List;

/**
 * @Author: liuzw
 * @Date: 2018/8/20 21:56
 */
public interface CustinfoMapper {

   public  List<Custinfo> findAll(Custinfo custinfo);

   public int addOne(Custinfo custinfo);

   public int removeOne(String[] ids);
}
