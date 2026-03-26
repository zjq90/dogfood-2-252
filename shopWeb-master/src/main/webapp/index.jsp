<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商城首页</title>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .section-title {
            font-size: 20px;
            color: #333;
            margin: 30px 0 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
        }
        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .product-card:hover {
            transform: translateY(-5px);
        }
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-card .info {
            padding: 15px;
        }
        .product-card .name {
            font-size: 14px;
            color: #333;
            margin-bottom: 10px;
            height: 40px;
            overflow: hidden;
        }
        .product-card .price {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .product-card .current-price {
            color: #e74c3c;
            font-size: 18px;
            font-weight: bold;
        }
        .product-card .original-price {
            color: #999;
            font-size: 12px;
            text-decoration: line-through;
        }
        .product-card .actions {
            padding: 0 15px 15px;
            display: flex;
            gap: 10px;
        }
        .btn {
            flex: 1;
            padding: 8px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            text-align: center;
            text-decoration: none;
        }
        .btn-primary {
            background: #3498db;
            color: white;
        }
        .btn-success {
            background: #27ae60;
            color: white;
        }
        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 30px;
        }
        .pagination a {
            padding: 8px 15px;
            background: white;
            color: #333;
            text-decoration: none;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .pagination a.active {
            background: #3498db;
            color: white;
            border-color: #3498db;
        }
        .hot-tag {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e74c3c;
            color: white;
            padding: 2px 8px;
            border-radius: 3px;
            font-size: 12px;
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
        <h3 class="section-title">热门商品</h3>
        <div class="product-grid">
            <c:forEach items="${pages.list}" var="product" varStatus="status">
                <c:if test="${product.isHot && status.index < 5}">
                    <div class="product-card" style="position: relative;">
                        <span class="hot-tag">热门</span>
                        <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">
                            <c:choose>
                                <c:when test="${not empty product.pic}">
                                    <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/image/product.gif" alt="${product.pname}">
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <div class="info">
                            <div class="name">${product.pname}</div>
                            <div class="price">
                                <span class="current-price">¥${product.cprice}</span>
                                <span class="original-price">¥${product.sprice}</span>
                            </div>
                        </div>
                        <div class="actions">
                            <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}" class="btn btn-primary">详情</a>
                            <form action="${pageContext.request.contextPath}/sorder/add" method="post" style="flex: 1;">
                                <input type="hidden" name="pid" value="${product.pid}">
                                <input type="hidden" name="number" value="1">
                                <button type="submit" class="btn btn-success" style="width: 100%;">加入购物车</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        
        <h3 class="section-title">全部商品</h3>
        <div class="product-grid">
            <c:forEach items="${pages.list}" var="product">
                <div class="product-card">
                    <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">
                        <c:choose>
                            <c:when test="${not empty product.pic}">
                                <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image/product.gif" alt="${product.pname}">
                            </c:otherwise>
                        </c:choose>
                    </a>
                    <div class="info">
                        <div class="name">${product.pname}</div>
                        <div class="price">
                            <span class="current-price">¥${product.cprice}</span>
                            <span class="original-price">¥${product.sprice}</span>
                        </div>
                    </div>
                    <div class="actions">
                        <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}" class="btn btn-primary">详情</a>
                        <form action="${pageContext.request.contextPath}/sorder/add" method="post" style="flex: 1;">
                            <input type="hidden" name="pid" value="${product.pid}">
                            <input type="hidden" name="number" value="1">
                            <button type="submit" class="btn btn-success" style="width: 100%;">加入购物车</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="pagination">
            <c:if test="${pages.pageNum > 1}">
                <a href="${pageContext.request.contextPath}/product/frontlist?pageNum=${pages.pageNum - 1}">上一页</a>
            </c:if>
            <c:forEach begin="1" end="${pages.pages}" var="i">
                <a href="${pageContext.request.contextPath}/product/frontlist?pageNum=${i}" class="${pages.pageNum == i ? 'active' : ''}">${i}</a>
            </c:forEach>
            <c:if test="${pages.pageNum < pages.pages}">
                <a href="${pageContext.request.contextPath}/product/frontlist?pageNum=${pages.pageNum + 1}">下一页</a>
            </c:if>
        </div>
    </div>
</body>
</html>