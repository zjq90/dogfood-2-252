package com.shop.entity;

import java.io.Serializable;
import java.util.Objects;

/**
 * 订单项实体类
 * 对应数据库表 zk_sorder，存储订单中的商品项信息
 * 
 * @author shop
 * @date 2024-03-24
 */
public class Sorder implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 订单项ID */
    private Integer sid;
    
    /** 商品名称 */
    private String name;
    
    /** 商品单价 */
    private Double price;
    
    /** 购买数量 */
    private Integer number;
    
    /** 所属订单ID */
    private Integer fid;
    
    /** 商品ID */
    private Integer pid;
    
    /** 关联的商品对象 */
    private Product product;

    /**
     * 默认构造方法
     */
    public Sorder() {
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Sorder sorder = (Sorder) o;
        // 使用pid作为唯一标识，用于购物车中相同商品的判断
        return Objects.equals(pid, sorder.pid);
    }

    @Override
    public int hashCode() {
        // 使用pid计算hashCode
        return Objects.hash(pid);
    }

    @Override
    public String toString() {
        return "Sorder{" +
                "sid=" + sid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", fid=" + fid +
                ", pid=" + pid +
                ", product=" + product +
                '}';
    }
}
