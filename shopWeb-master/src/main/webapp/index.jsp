<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商城首页 - 商城系统</title>
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
                <li><a href="${pageContext.request.contextPath}/" class="active">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/product/frontlist">全部商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/hot">热门商品</a></li>
                <li><a href="${pageContext.request.contextPath}/product/new">最新上架</a></li>
            </ul>
        </div>
        
        <!-- 轮播图区域 -->
        <div class="banner">
            <img src="${pageContext.request.contextPath}/image/header.jpg" alt="Banner">
        </div>
        
        <!-- 热门商品 -->
        <div class="section">
            <div class="section-title">
                <h3>热门商品</h3>
                <a href="${pageContext.request.contextPath}/product/hot">更多 ></a>
            </div>
            <div class="product-list">
                <c:forEach items="${hotProducts}" var="product">
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
                                <p class="price">¥${product.cprice}</p>
                                <p class="original-price">原价：¥${product.sprice}</p>
                                <p class="desc">${product.pdesc}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <!-- 最新商品 -->
        <div class="section">
            <div class="section-title">
                <h3>最新上架</h3>
                <a href="${pageContext.request.contextPath}/product/new">更多 ></a>
            </div>
            <div class="product-list">
                <c:forEach items="${newProducts}" var="product">
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
                                <p class="price">¥${product.cprice}</p>
                                <p class="original-price">原价：¥${product.sprice}</p>
                                <p class="desc">${product.pdesc}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <!-- 页脚 -->
        <div class="footer">
            <p>&copy; 2024 商城系统 版权所有</p>
        </div>
    </div>
</body>
</html>
