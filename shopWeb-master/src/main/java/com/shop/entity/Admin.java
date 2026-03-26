package com.shop.entity;

import java.io.Serializable;

/**
 * 管理员实体类
 * 对应数据库表 zk_admin，存储后台管理员信息
 * 
 * @author shop
 * @date 2024-03-24
 */
public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 管理员ID */
    private Integer aid;
    
    /** 管理员用户名 */
    private String username;
    
    /** 管理员密码 */
    private String password;

    /**
     * 默认构造方法
     */
    public Admin() {
    }

    /**
     * 全参数构造方法
     * 
     * @param aid 管理员ID
     * @param username 用户名
     * @param password 密码
     */
    public Admin(Integer aid, String username, String password) {
        this.aid = aid;
        this.username = username;
        this.password = password;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", username='" + username + '\'' +
                '}';
    }
}
