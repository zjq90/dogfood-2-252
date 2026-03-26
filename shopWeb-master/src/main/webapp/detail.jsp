<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.pname} - 商品详情 - 商城系统</title>
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
        .product-detail {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            gap: 40px;
        }
        .product-image {
            flex: 1;
        }
        .product-image img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px;
        }
        .product-info {
            flex: 1;
        }
        .product-info h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        .product-info .price-box {
            background: #fff5f5;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .product-info .price-box .current-price {
            font-size: 28px;
            color: #e74c3c;
            font-weight: bold;
        }
        .product-info .price-box .original-price {
            font-size: 16px;
            color: #999;
            text-decoration: line-through;
            margin-left: 15px;
        }
        .product-info .stock {
            color: #666;
            margin-bottom: 20px;
        }
        .product-info .stock span {
            color: #27ae60;
            font-weight: bold;
        }
        .product-info .desc {
            color: #666;
            line-height: 1.8;
            margin-bottom: 30px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        .quantity-box {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }
        .quantity-box label {
            color: #333;
            font-weight: bold;
        }
        .quantity-box input {
            width: 80px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
        }
        .btn {
            padding: 15px 40px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s;
            text-decoration: none;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .btn-success:hover {
            background: #219a52;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-primary:hover {
            background: #2980b9;
        }
        .actions {
            display: flex;
            gap: 15px;
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
        <div class="product-detail">
            <div class="product-image">
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
                <h1>${product.pname}</h1>
                
                <div class="price-box">
                    <span class="current-price">¥${product.cprice}</span>
                    <span class="original-price">¥${product.sprice}</span>
                </div>
                
                <div class="stock">
                    库存：<span>${product.number}</span> 件
                </div>
                
                <c:if test="${not empty product.pdesc}">
                    <div class="desc">
                        ${product.pdesc}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/sorder/add" method="post">
                    <div class="quantity-box">
                        <label>数量：</label>
                        <input type="number" name="number" value="1" min="1" max="${product.number}" required>
                        <input type="hidden" name="pid" value="${product.pid}">
                    </div>
                    
                    <div class="actions">
                        <button type="submit" class="btn btn-success">加入购物车</button>
                        <a href="${pageContext.request.contextPath}/product/frontlist" class="btn btn-primary">继续购物</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
