package com.shop.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品实体类
 * 用于存储商品基本信息，包括商品名称、价格、图片、描述等
 * 
 * @author shop
 * @version 1.0
 */
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 商品ID，主键自增 */
    private Integer pid;
    
    /** 商品名称 */
    private String pname;
    
    /** 商品原价（市场价） */
    private Double sprice;
    
    /** 商品现价（销售价） */
    private Double cprice;
    
    /** 商品图片文件名 */
    private String pic;
    
    /** 商品描述信息 */
    private String pdesc;
    
    /** 是否为热门商品：true-热门，false-普通 */
    private Boolean isHot;
    
    /** 商品上架日期 */
    private Date pdate;
    
    /** 商品库存数量 */
    private Integer number;

    /**
     * 无参构造函数
     */
    public Product() {
    }

    /**
     * 带参构造函数
     * @param pid 商品ID
     * @param pname 商品名称
     * @param sprice 原价
     * @param cprice 现价
     * @param pic 图片
     * @param pdesc 描述
     * @param isHot 是否热门
     * @param pdate 上架日期
     * @param number 库存
     */
    public Product(Integer pid, String pname, Double sprice, Double cprice, String pic, 
                   String pdesc, Boolean isHot, Date pdate, Integer number) {
        this.pid = pid;
        this.pname = pname;
        this.sprice = sprice;
        this.cprice = cprice;
        this.pic = pic;
        this.pdesc = pdesc;
        this.isHot = isHot;
        this.pdate = pdate;
        this.number = number;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Double getSprice() {
        return sprice;
    }

    public void setSprice(Double sprice) {
        this.sprice = sprice;
    }

    public Double getCprice() {
        return cprice;
    }

    public void setCprice(Double cprice) {
        this.cprice = cprice;
    }

    /**
     * 获取商品图片文件名
     * @return 图片文件名
     */
    public String getPic() {
        return pic;
    }

    /**
     * 设置商品图片文件名
     * @param pic 图片文件名
     */
    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    /**
     * 获取商品描述信息
     * @return 商品描述
     */
    public String getPdesc() {
        return pdesc;
    }

    /**
     * 设置商品描述信息
     * @param pdesc 商品描述
     */
    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", sprice=" + sprice +
                ", cprice=" + cprice +
                ", pic='" + pic + '\'' +
                ", pdesc='" + pdesc + '\'' +
                ", isHot=" + isHot +
                ", pdate=" + pdate +
                ", number=" + number +
                '}';
    }
}
