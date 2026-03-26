package com.shop.entity;

import java.io.Serializable;
import java.util.Objects;

/**
 * 订单明细实体类
 * 对应数据库表 zk_sorder
 * 存储订单中的商品明细信息
 * 
 * @author shop
 * @version 1.0
 */
public class Sorder implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 订单明细ID，主键自增 */
    private Integer sid;
    
    /** 商品名称（冗余存储，防止商品信息变更影响历史订单） */
    private String name;
    
    /** 商品单价（下单时的价格） */
    private Double price;
    
    /** 购买数量 */
    private Integer number;
    
    /** 订单ID，关联zk_forder表 */
    private Integer fid;
    
    /** 商品ID，关联zk_product表 */
    private Integer pid;
    
    /** 商品对象（关联查询时使用） */
    private Product product;

    /**
     * 无参构造函数
     */
    public Sorder() {
    }

    /**
     * 获取订单明细ID
     * @return 订单明细ID
     */
    public Integer getSid() {
        return sid;
    }

    /**
     * 设置订单明细ID
     * @param sid 订单明细ID
     */
    public void setSid(Integer sid) {
        this.sid = sid;
    }

    /**
     * 获取商品名称
     * @return 商品名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置商品名称
     * @param name 商品名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取商品单价
     * @return 商品单价
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 设置商品单价
     * @param price 商品单价
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 获取购买数量
     * @return 购买数量
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * 设置购买数量
     * @param number 购买数量
     */
    public void setNumber(Integer number) {
        this.number = number;
    }

    /**
     * 获取订单ID
     * @return 订单ID
     */
    public Integer getFid() {
        return fid;
    }

    /**
     * 设置订单ID
     * @param fid 订单ID
     */
    public void setFid(Integer fid) {
        this.fid = fid;
    }

    /**
     * 获取商品ID
     * @return 商品ID
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * 设置商品ID
     * @param pid 商品ID
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * 获取关联的商品对象
     * @return 商品对象
     */
    public Product getProduct() {
        return product;
    }

    /**
     * 设置关联的商品对象
     * @param product 商品对象
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * 判断两个订单明细对象是否相等
     * @param o 比较对象
     * @return 相等返回true，否则返回false
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Sorder sorder = (Sorder) o;
        return Objects.equals(sid, sorder.sid) &&
                Objects.equals(name, sorder.name) &&
                Objects.equals(price, sorder.price) &&
                Objects.equals(number, sorder.number) &&
                Objects.equals(fid, sorder.fid) &&
                Objects.equals(product, sorder.product);
    }

    /**
     * 计算对象的哈希码
     * @return 哈希码
     */
    @Override
    public int hashCode() {
        return Objects.hash(sid, name, price, number, fid, product);
    }

    /**
     * 返回订单明细对象的字符串表示
     * @return 订单明细信息字符串
     */
    @Override
    public String toString() {
        return "Sorder{" +
                "sid=" + sid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", fid=" + fid +
                ", pid=" + pid +
                '}';
    }
}
