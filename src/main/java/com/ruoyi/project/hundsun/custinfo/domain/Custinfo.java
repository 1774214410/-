package com.ruoyi.project.hundsun.custinfo.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
/**
 * @Author: liuzw
 * @Date: 2018/8/20 21:56
 */
public class Custinfo extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /** 编号ID*/
    private int id;
    /** 姓名*/
    private String name;
    /** 性别*/
    private String gender;
    /** 年龄*/
    private String age;
    /** 地址*/
    private String address;
    /** 手机号*/
    private String phone;
    /** 头像*/
    private String imageaddr;
    /** 状态(0 显示  1 不显示)*/
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImageaddr() {
        return imageaddr;
    }

    public void setImageaddr(String imageaddr) {
        this.imageaddr = imageaddr;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
