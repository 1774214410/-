package com.ruoyi.project.hundsun.custinfo.service;

import com.ruoyi.project.hundsun.custinfo.domain.Custinfo;
import com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: liuzw
 * @Date: 2018/8/20 22:13
 */
@Service
public class CustinfoServiceImpl implements ICustinfoService {

    @Autowired
    private CustinfoMapper custinfoMapper;

    @Override
    public List<Custinfo> findAll(Custinfo custinfo) {
        return custinfoMapper.findAll(custinfo);
    }

    @Override
    public int addOne(Custinfo custinfo) {
        return custinfoMapper.addOne(custinfo);
    }
}
