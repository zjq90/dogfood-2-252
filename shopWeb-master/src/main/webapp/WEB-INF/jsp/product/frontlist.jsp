<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品列表 - 商城系统</title>
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
                <li><a href="${pageContext.request.contextPath}/product/frontlist" class="active">全部商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/hot">热门商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/new">最新上架</a></li>
            </ul>
        </div>
        
        <!-- 商品列表 -->
        <div class="content">
            <div class="section">
                <div class="section-title">
                    <h3>全部商品</h3>
                </div>
                <div class="product-list">
                    <c:forEach items="${list}" var="product">
                        <div class="product-item">
                            <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">
                                <div class="product-img">
                                    <c:choose>
                                        <c:when test="${not empty product.pic}">
                                            <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/image/product.gif" alt="${product.pname}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="product-info">
                                    <h4>${product.pname}</h4>
                                    <p class="price">¥${product.sprice}</p>
                                    <p class="desc">${product.pdesc}</p>
                                </div>
                            </a>
                            <div class="product-actions">
                                <form action="${pageContext.request.contextPath}/sorder/add" method="post" style="display: inline;">
                                    <input type="hidden" name="pid" value="${product.pid}">
                                    <input type="hidden" name="number" value="1">
                                    <button type="submit" class="btn-add-cart">加入购物车</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
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
