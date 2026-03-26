<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>确认订单 - 商城系统</title>
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
        
        <!-- 订单确认内容 -->
        <div class="content">
            <div class="order-container">
                <h2>确认订单</h2>
                
                <c:choose>
                    <c:when test="${empty sessionScope.forder or empty sessionScope.forder.sorderSet}">
                        <div class="empty-order">
                            <p>购物车是空的，无法提交订单！</p>
                            <a href="${pageContext.request.contextPath}/product/frontlist" class="btn-continue">去购物</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 商品清单 -->
                        <div class="order-items">
                            <h3>商品清单</h3>
                            <table class="order-table">
                                <thead>
                                    <tr>
                                        <th>商品图片</th>
                                        <th>商品名称</th>
                                        <th>单价</th>
                                        <th>数量</th>
                                        <th>小计</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty sorder.product.pic}">
                                                        <img src="${pageContext.request.contextPath}/upload/${sorder.product.pic}" alt="${sorder.name}" width="60">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/image/product.gif" alt="${sorder.name}" width="60">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${sorder.name}</td>
                                            <td>¥${sorder.price}</td>
                                            <td>${sorder.number}</td>
                                            <td>¥${sorder.price * sorder.number}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- 收货信息 -->
                        <div class="order-form">
                            <h3>收货信息</h3>
                            <form action="${pageContext.request.contextPath}/forder/order" method="post">
                                <div class="form-item">
                                    <label for="name">收货人姓名：</label>
                                    <input type="text" id="name" name="name" required placeholder="请输入收货人姓名" value="${sessionScope.user.realname}">
                                </div>
                                <div class="form-item">
                                    <label for="phone">联系电话：</label>
                                    <input type="text" id="phone" name="phone" required placeholder="请输入联系电话" value="${sessionScope.user.phone}">
                                </div>
                                <div class="form-item">
                                    <label for="post">邮政编码：</label>
                                    <input type="text" id="post" name="post" placeholder="请输入邮政编码">
                                </div>
                                <div class="form-item">
                                    <label for="address">收货地址：</label>
                                    <input type="text" id="address" name="address" required placeholder="请输入详细收货地址" value="${sessionScope.user.addr}">
                                </div>
                                <div class="form-item">
                                    <label for="remark">订单备注：</label>
                                    <textarea id="remark" name="remark" rows="3" placeholder="请输入订单备注（可选）"></textarea>
                                </div>
                                
                                <div class="order-total">
                                    <span>订单总金额：</span>
                                    <span class="total-price">¥${sessionScope.forder.total}</span>
                                </div>
                                
                                <div class="form-actions">
                                    <a href="${pageContext.request.contextPath}/car.jsp" class="btn-back">返回购物车</a>
                                    <button type="submit" class="btn-submit">提交订单</button>
                                </div>
                            </form>
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
