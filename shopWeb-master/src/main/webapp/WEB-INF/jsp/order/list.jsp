<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单管理 - 商城后台管理系统</title>
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
                <li>
                    <a href="${pageContext.request.contextPath}/product/list">商品管理</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/order/list">订单管理</a>
                </li>
            </ul>
        </div>
        
        <!-- 主内容区 -->
        <div class="admin-content">
            <div class="content-header">
                <h2>订单列表</h2>
            </div>
            <div class="content-body">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>订单ID</th>
                            <th>收货人</th>
                            <th>联系电话</th>
                            <th>收货地址</th>
                            <th>订单金额</th>
                            <th>订单状态</th>
                            <th>下单时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="order">
                            <tr>
                                <td>${order.fid}</td>
                                <td>${order.name}</td>
                                <td>${order.phone}</td>
                                <td>${order.address}</td>
                                <td>¥${order.total}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.status == 0}">
                                            <span class="badge badge-warning">未发货</span>
                                        </c:when>
                                        <c:when test="${order.status == 1}">
                                            <span class="badge badge-success">已发货</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-info">已完成</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <fmt:formatDate value="${order.date}" pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                                <td>
                                    <c:if test="${order.status == 0}">
                                        <a href="${pageContext.request.contextPath}/order/updatestatus?fid=${order.fid}&status=1" class="btn btn-small btn-success" onclick="return confirm('确定发货吗？')">发货</a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/order/delete?fid=${order.fid}" class="btn btn-small btn-danger" onclick="return confirm('确定删除该订单吗？')">删除</a>
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
