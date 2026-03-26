<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>消息提示 - 商城系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <div class="container">
        <!-- 顶部导航 -->
        <div class="header">
            <div class="header-top">
                <div class="welcome">
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            欢迎，${sessionScope.username}！
                            <a href="${pageContext.request.contextPath}/user/logout">退出</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                            <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="quick-menu">
                    <a href="${pageContext.request.contextPath}/car.jsp">购物车</a>
                    <a href="${pageContext.request.contextPath}/order.jsp">我的订单</a>
                </div>
            </div>
            <div class="header-main">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/image/logo.gif" alt="商城Logo">
                    </a>
                </div>
                <div class="search-box">
                    <form action="${pageContext.request.contextPath}/product/search" method="get">
                        <input type="text" name="keyword" placeholder="搜索商品...">
                        <button type="submit">搜索</button>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- 导航菜单 -->
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/product/frontlist">全部商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/hot">热门商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/new">最新上架</a></li>
            </ul>
        </div>
        
        <!-- 消息内容 -->
        <div class="content">
            <div class="msg-container">
                <div class="msg-box">
                    <h2>系统消息</h2>
                    <div class="msg-content">
                        <p>${msg}</p>
                    </div>
                    <div class="msg-actions">
                        <a href="${pageContext.request.contextPath}/" class="btn-home">返回首页</a>
                        <a href="${pageContext.request.contextPath}/product/frontlist" class="btn-continue">继续购物</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 页脚 -->
        <div class="footer">
            <p>&copy; 2024 商城系统 版权所有</p>
        </div>
    </div>
</body>
</html>
