package com.shop.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 订单实体类
 * 对应数据库表 zk_forder，存储用户订单信息
 * 
 * @author shop
 * @date 2024-03-24
 */
public class Forder implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 订单ID */
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
    
    /** 邮政编码 */
    private String post;
    
    /** 收货地址 */
    private String address;
    
    /** 用户ID */
    private Integer uid;
    
    /** 订单状态：0-未发货，1-已发货，2-已完成 */
    private Integer status;
    
    /** 订单项集合，用于存储购物车中的商品 */
    private Set<Sorder> sorderSet = new HashSet<>();

    /**
     * 默认构造方法
     */
    public Forder() {
    }

    /**
     * 带订单项集合的构造方法
     * 
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

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Set<Sorder> getSorderSet() {
        return sorderSet;
    }

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
                ", uid=" + uid +
                ", status=" + status +
                ", sorderSet=" + sorderSet +
                '}';
    }
}
