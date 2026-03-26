<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车 - 商城系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: #f5f5f5;
        }
        .header {
            background: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .header .logo {
            font-size: 24px;
            font-weight: bold;
            color: #3498db;
        }
        .header .nav {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        .header .nav a {
            color: #333;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .header .nav a:hover {
            background: #3498db;
            color: white;
        }
        .header .user-info {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        .header .user-info a {
            color: #666;
            text-decoration: none;
        }
        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .page-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        .cart-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .cart-header {
            display: flex;
            background: #f8f9fa;
            padding: 15px 20px;
            font-weight: bold;
            color: #333;
            border-bottom: 1px solid #eee;
        }
        .cart-header .col-product {
            flex: 2;
        }
        .cart-header .col-price,
        .cart-header .col-quantity,
        .cart-header .col-subtotal,
        .cart-header .col-action {
            flex: 1;
            text-align: center;
        }
        .cart-item {
            display: flex;
            padding: 20px;
            border-bottom: 1px solid #eee;
            align-items: center;
        }
        .cart-item .col-product {
            flex: 2;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .cart-item .col-price,
        .cart-item .col-quantity,
        .cart-item .col-subtotal,
        .cart-item .col-action {
            flex: 1;
            text-align: center;
        }
        .cart-item img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }
        .cart-item .product-name {
            color: #333;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            transition: all 0.3s;
        }
        .btn-danger {
            background: #e74c3c;
            color: white;
        }
        .btn-danger:hover {
            background: #c0392b;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background: #2980b9;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .btn-success:hover {
            background: #219a52;
        }
        .cart-footer {
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8f9fa;
        }
        .cart-footer .total {
            font-size: 18px;
        }
        .cart-footer .total .price {
            font-size: 24px;
        }
        .cart-actions {
            display: flex;
            gap: 10px;
        }
        .empty-cart {
            padding: 60px;
            text-align: center;
            color: #999;
        }
        .empty-cart img {
            width: 100px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">商城系统</div>
        <div class="nav">
            <a href="${pageContext.request.contextPath}/product/frontlist">首页</a>
            <a href="${pageContext.request.contextPath}/car.jsp">购物车</a>
        </div>
        <div class="user-info">
            <c:choose>
                <c:when test="${not empty sessionScope.frontuser}">
                    <span>欢迎，${sessionScope.frontuser}</span>
                    <a href="${pageContext.request.contextPath}/user/logout">退出</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                    <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <div class="container">
        <h2 class="page-title">我的购物车</h2>
        
        <div class="cart-container">
            <c:choose>
                <c:when test="${not empty sessionScope.forder && not empty sessionScope.forder.sorderSet}">
                    <div class="cart-header">
                        <div class="col-product">商品信息</div>
                        <div class="col-price">单价</div>
                        <div class="col-quantity">数量</div>
                        <div class="col-subtotal">小计</div>
                        <div class="col-action">操作</div>
                    </div>
                    
                    <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
                        <div class="cart-item">
                            <div class="col-product">
                                <c:choose>
                                    <c:when test="${not empty sorder.product.pic}">
                                        <img src="${pageContext.request.contextPath}/upload/${sorder.product.pic}" alt="${sorder.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/image/product.gif" alt="${sorder.name}">
                                    </c:otherwise>
                                </c:choose>
                                <div class="product-name">${sorder.name}</div>
                            </div>
                            <div class="col-price price">¥${sorder.price}</div>
                            <div class="col-quantity">${sorder.number}</div>
                            <div class="col-subtotal price">¥${sorder.price * sorder.number}</div>
                            <div class="col-action">
                                <a href="${pageContext.request.contextPath}/sorder/delete?pid=${sorder.pid}" class="btn btn-danger">删除</a>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <div class="cart-footer">
                        <div class="cart-actions">
                            <a href="${pageContext.request.contextPath}/sorder/clear" class="btn btn-danger">清空购物车</a>
                            <a href="${pageContext.request.contextPath}/product/frontlist" class="btn btn-primary">继续购物</a>
                        </div>
                        <div class="total">
                            合计：<span class="price">¥${sessionScope.forder.total}</span>
                            <a href="${pageContext.request.contextPath}/forder/order" class="btn btn-success" style="margin-left: 20px;">去结算</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-cart">
                        <img src="${pageContext.request.contextPath}/image/cart.gif" alt="购物车为空">
                        <p>购物车还是空的，快去挑选商品吧~</p>
                        <a href="${pageContext.request.contextPath}/product/frontlist" class="btn btn-primary" style="margin-top: 20px;">去购物</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
