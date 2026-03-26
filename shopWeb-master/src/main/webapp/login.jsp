<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录 - 商城系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/image/logo.gif" alt="商城Logo">
                </a>
            </div>
        </div>
        
        <div class="content">
            <div class="login-box">
                <h2>用户登录</h2>
                <form action="${pageContext.request.contextPath}/user/login" method="post">
                    <div class="form-item">
                        <label for="username">用户名：</label>
                        <input type="text" id="username" name="username" required placeholder="请输入用户名">
                    </div>
                    <div class="form-item">
                        <label for="password">密码：</label>
                        <input type="password" id="password" name="password" required placeholder="请输入密码">
                    </div>
                    <c:if test="${not empty msg}">
                        <div class="error-msg">${msg}</div>
                    </c:if>
                    <div class="form-item">
                        <button type="submit" class="btn-login">登录</button>
                    </div>
                    <div class="form-links">
                        <a href="${pageContext.request.contextPath}/register.jsp">立即注册</a>
                        <a href="${pageContext.request.contextPath}/">返回首页</a>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="footer">
            <p>&copy; 2024 商城系统 版权所有</p>
        </div>
    </div>
</body>
</html>
