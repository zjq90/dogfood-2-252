<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车 - 商城系统</title>
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
        
        <!-- 购物车内容 -->
        <div class="content">
            <div class="cart-container">
                <h2>我的购物车</h2>
                
                <c:choose>
                    <c:when test="${empty sessionScope.forder or empty sessionScope.forder.sorderSet}">
                        <div class="empty-cart">
                            <p>购物车是空的，快去选购商品吧！</p>
                            <a href="${pageContext.request.contextPath}/product/frontlist" class="btn-continue">去购物</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th>商品图片</th>
                                    <th>商品名称</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>小计</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty sorder.product.pic}">
                                                    <img src="${pageContext.request.contextPath}/upload/${sorder.product.pic}" alt="${sorder.name}" width="80">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/image/product.gif" alt="${sorder.name}" width="80">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${sorder.name}</td>
                                        <td>¥${sorder.price}</td>
                                        <td>${sorder.number}</td>
                                        <td>¥${sorder.price * sorder.number}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/sorder/delete?pid=${sorder.pid}" class="btn-delete">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                        <div class="cart-summary">
                            <div class="total">
                                <span>订单总金额：</span>
                                <span class="total-price">¥${sessionScope.forder.total}</span>
                            </div>
                            <div class="cart-actions">
                                <a href="${pageContext.request.contextPath}/sorder/clear" class="btn-clear">清空购物车</a>
                                <a href="${pageContext.request.contextPath}/product/frontlist" class="btn-continue">继续购物</a>
                                <a href="${pageContext.request.contextPath}/forder/order" class="btn-checkout">去结算</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!-- 页脚 -->
        <div class="footer">
            <p>&copy; 2024 商城系统 版权所有</p>
        </div>
    </div>
</body>
</html>
