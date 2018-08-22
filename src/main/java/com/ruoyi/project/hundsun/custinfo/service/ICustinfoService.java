package com.ruoyi.project.hundsun.custinfo.service;

import com.ruoyi.project.hundsun.custinfo.domain.Custinfo;

import java.util.List;

/**
 * @Author: liuzw
 * @Date: 2018/8/20 22:12
 */
public interface ICustinfoService {

   public List<Custinfo> findAll(Custinfo custinfo);

   public int addOne(Custinfo custinfo);
}
