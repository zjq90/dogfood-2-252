<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品管理 - 商城后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <div class="admin-container">
        <!-- 顶部导航 -->
        <div class="admin-header">
            <div class="logo">商城后台管理系统</div>
            <div class="user-info">
                欢迎，${sessionScope.adminusername}！
                <a href="${pageContext.request.contextPath}/admin/logout">退出</a>
            </div>
        </div>
        
        <!-- 左侧菜单 -->
        <div class="admin-sidebar">
            <ul class="menu">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/">首页</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/product/list">商品管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/order/list">订单管理</a>
                </li>
            </ul>
        </div>
        
        <!-- 主内容区 -->
        <div class="admin-content">
            <div class="content-header">
                <h2>商品列表</h2>
                <a href="${pageContext.request.contextPath}/product/add" class="btn btn-primary">添加商品</a>
            </div>
            <div class="content-body">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>商品图片</th>
                            <th>商品名称</th>
                            <th>售价</th>
                            <th>成本价</th>
                            <th>库存</th>
                            <th>是否热门</th>
                            <th>上架时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="product">
                            <tr>
                                <td>${product.pid}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty product.pic}">
                                            <img src="${pageContext.request.contextPath}/upload/${product.pic}" alt="${product.pname}" width="60" height="60">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/image/product.gif" alt="暂无图片" width="60" height="60">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${product.pname}</td>
                                <td>¥${product.sprice}</td>
                                <td>¥${product.cprice}</td>
                                <td>${product.number}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.isHot == true}">
                                            <span class="badge badge-hot">热门</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge">普通</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <fmt:formatDate value="${product.pdate}" pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/product/edit?pid=${product.pid}" class="btn btn-small">编辑</a>
                                    <a href="${pageContext.request.contextPath}/product/delete?pid=${product.pid}" class="btn btn-small btn-danger" onclick="return confirm('确定删除该商品吗？')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
