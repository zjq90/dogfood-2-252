package com.shop.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品实体类
 * 对应数据库表 zk_product，存储商品信息
 * 
 * @author shop
 * @date 2024-03-24
 */
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Integer pid;
    
    /** 商品名称 */
    private String pname;
    
    /** 商品售价 */
    private Double sprice;
    
    /** 商品成本价 */
    private Double cprice;
    
    /** 商品图片文件名 */
    private String pic;
    
    /** 商品描述 */
    private String pdesc;
    
    /** 是否热门：1-热门，0-非热门 */
    private Boolean isHot;
    
    /** 商品上架时间 */
    private Date pdate;
    
    /** 商品库存数量 */
    private Integer number;

    /**
     * 默认构造方法
     */
    public Product() {
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

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getPdesc() {
        return pdesc;
    }

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
