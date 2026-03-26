<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>电商商城首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <!-- 头部 -->
    <div id="header">
        <div class="header_top">
            <div class="container">
                <div class="header_top_left">
                    <span>欢迎来到电商商城！</span>
                </div>
                <div class="header_top_right">
                    <c:if test="${empty sessionScope.loginUser}">
                        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                        <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                    </c:if>
                    <c:if test="${not empty sessionScope.loginUser}">
                        <span>欢迎您，${sessionScope.loginUser.username}</span>
                        <a href="${pageContext.request.contextPath}/user/logout">退出登录</a>
                        <a href="${pageContext.request.contextPath}/cart.jsp">购物车</a>
                        <a href="${pageContext.request.contextPath}/order/myOrders">我的订单</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/admin/login.jsp">管理员入口</a>
                </div>
            </div>
        </div>
        <div class="header_main">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/image/logo.gif" alt="电商商城">
                </a>
            </div>
            <div class="search">
                <form action="${pageContext.request.contextPath}/product/find" method="post">
                    <input type="text" name="pname" placeholder="搜索商品...">
                    <button type="submit">搜索</button>
                </form>
            </div>
        </div>
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/product/frontlist">全部商品</a></li>
                <li><a href="#">新品上市</a></li>
                <li><a href="#">热门商品</a></li>
                <li><a href="#">关于我们</a></li>
            </ul>
        </div>
    </div>

    <!-- 主体内容 -->
    <div id="main">
        <!-- 轮播图 -->
        <div class="banner">
            <img src="${pageContext.request.contextPath}/image/banner.jpg" alt="banner">
        </div>

        <!-- 热门商品 -->
        <div class="hot_goods">
            <div class="title">
                <h3>热门商品</h3>
            </div>
            <div class="goods_list">
                <c:forEach items="${hotProducts}" var="product">
                    <div class="goods_item">
                        <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">
                            <img src="${pageContext.request.contextPath}/image/${product.pic}" alt="${product.pname}" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'">
                        </a>
                        <p class="name">
                            <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">${product.pname}</a>
                        </p>
                        <p class="price">¥${product.sprice}</p>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- 最新商品 -->
        <div class="new_goods">
            <div class="title">
                <h3>最新商品</h3>
            </div>
            <div class="goods_list">
                <c:forEach items="${newProducts}" var="product">
                    <div class="goods_item">
                        <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">
                            <img src="${pageContext.request.contextPath}/image/${product.pic}" alt="${product.pname}" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'">
                        </a>
                        <p class="name">
                            <a href="${pageContext.request.contextPath}/product/detail?pid=${product.pid}">${product.pname}</a>
                        </p>
                        <p class="price">¥${product.sprice}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <div id="footer">
        <p>© 2024 电商商城 版权所有</p>
        <p>联系方式：400-888-8888 | 邮箱：service@shop.com | 地址：北京市朝阳区</p>
    </div>
</body>
</html>