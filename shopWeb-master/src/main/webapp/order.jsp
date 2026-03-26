<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单结算 - 商城系统</title>
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
        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .page-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        .order-container {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .order-summary {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .order-summary h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .order-summary .item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f5f5f5;
        }
        .order-summary .item:last-child {
            border-bottom: none;
        }
        .price {
            color: #e74c3c;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3498db;
        }
        .form-group textarea {
            height: 80px;
            resize: vertical;
        }
        .total-section {
            text-align: right;
            padding: 20px 0;
            border-top: 1px solid #eee;
            margin-top: 20px;
        }
        .total-section .total {
            font-size: 20px;
        }
        .total-section .total .price {
            font-size: 28px;
        }
        .btn {
            padding: 12px 30px;
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
        .btn-default {
            background: #95a5a6;
            color: white;
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
        <h2 class="page-title">订单结算</h2>
        
        <div class="order-container">
            <div class="order-summary">
                <h3>订单商品</h3>
                <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
                    <div class="item">
                        <span>${sorder.name} x ${sorder.number}</span>
                        <span class="price">¥${sorder.price * sorder.number}</span>
                    </div>
                </c:forEach>
            </div>
            
            <form action="${pageContext.request.contextPath}/forder/order" method="post">
                <div class="form-group">
                    <label for="name">收货人姓名 *</label>
                    <input type="text" id="name" name="name" placeholder="请输入收货人姓名" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">联系电话 *</label>
                    <input type="text" id="phone" name="phone" placeholder="请输入联系电话" required>
                </div>
                
                <div class="form-group">
                    <label for="address">收货地址 *</label>
                    <input type="text" id="address" name="address" placeholder="请输入详细收货地址" required>
                </div>
                
                <div class="form-group">
                    <label for="post">邮政编码</label>
                    <input type="text" id="post" name="post" placeholder="请输入邮政编码（选填）">
                </div>
                
                <div class="form-group">
                    <label for="remark">订单备注</label>
                    <textarea id="remark" name="remark" placeholder="请输入订单备注（选填）"></textarea>
                </div>
                
                <div class="total-section">
                    <div class="total">
                        订单总计：<span class="price">¥${sessionScope.forder.total}</span>
                    </div>
                </div>
                
                <div style="text-align: center; margin-top: 20px;">
                    <button type="submit" class="btn btn-success">提交订单</button>
                    <a href="${pageContext.request.contextPath}/car.jsp" class="btn btn-default" style="margin-left: 10px;">返回购物车</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
