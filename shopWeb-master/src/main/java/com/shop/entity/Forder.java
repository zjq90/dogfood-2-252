package com.shop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 订单实体类
 * 用于存储订单基本信息，包括收货人信息、订单金额、订单状态等
 * 
 * @author shop
 * @version 1.0
 */
public class Forder implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 订单ID，主键自增 */
    private Integer fid;
    
    /** 收货人姓名 */
    private String name;
    
    /** 收货人电话 */
    private String phone;
    
    /** 订单备注 */
    private String remark;
    
    /** 订单创建时间 */
    private Date date;
    
    /** 订单总金额 */
    private Double total;
    
    /** 邮编 */
    private String post;
    
    /** 收货地址 */
    private String address;
    
    /** 订单状态：0-待发货，1-已发货，2-已完成 */
    private Integer status;
    
    /** 用户ID，关联用户表 */
    private Integer uid;
    
    /** 订单项集合，存储订单中的商品信息 */
    private Set<Sorder> sorderSet;

    /**
     * 无参构造函数
     */
    public Forder() {
    }

    /**
     * 带订单项集合的构造函数
     * @param sorderSet 订单项集合
     */
    public Forder(Set<Sorder> sorderSet) {
        this.sorderSet = sorderSet;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * 获取订单状态
     * @return 订单状态：0-待发货，1-已发货，2-已完成
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置订单状态
     * @param status 订单状态：0-待发货，1-已发货，2-已完成
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * 获取订单项集合
     * @return 订单项集合
     */
    public Set<Sorder> getSorderSet() {
        return sorderSet;
    }

    /**
     * 设置订单项集合
     * @param sorderSet 订单项集合
     */
    public void setSorderSet(Set<Sorder> sorderSet) {
        this.sorderSet = sorderSet;
    }

    @Override
    public String toString() {
        return "Forder{" +
                "fid=" + fid +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", remark='" + remark + '\'' +
                ", date=" + date +
                ", total=" + total +
                ", post='" + post + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", uid=" + uid +
                '}';
    }
}
