package com.shop.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * 对应数据库表 zk_user，存储前台用户信息
 * 
 * @author shop
 * @date 2024-03-24
 */
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Integer uid;
    
    /** 用户名 */
    private String username;
    
    /** 密码 */
    private String password;
    
    /** 真实姓名 */
    private String realname;
    
    /** 邮箱 */
    private String email;
    
    /** 电话 */
    private String phone;
    
    /** 地址 */
    private String addr;

    /**
     * 默认构造方法
     */
    public User() {
    }

    /**
     * 全参数构造方法
     * 
     * @param uid 用户ID
     * @param username 用户名
     * @param password 密码
     * @param realname 真实姓名
     * @param email 邮箱
     * @param phone 电话
     * @param addr 地址
     */
    public User(Integer uid, String username, String password, String realname, String email, String phone, String addr) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.realname = realname;
        this.email = email;
        this.phone = phone;
        this.addr = addr;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", realname='" + realname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                '}';
    }
}
