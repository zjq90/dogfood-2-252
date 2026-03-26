<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品详情 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <!-- 头部 -->
    <div id="header">
        <div class="header_top">
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

    <!-- 商品详情主体 -->
    <div id="product_detail">
        <div class="detail_left">
            <img src="${pageContext.request.contextPath}/image/${product.pic}" alt="${product.pname}" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'" class="product_img">
        </div>
        <div class="detail_right">
            <h2 class="product_name">${product.pname}</h2>
            <p class="product_desc">${product.pdesc}</p>
            <div class="product_price">
                <span class="price_label">销售价：</span>
                <span class="price">¥${product.sprice}</span>
                <span class="market_price">市场价：¥${product.cprice}</span>
            </div>
            <div class="product_stock">
                <span>库存数量：${product.number} 件</span>
            </div>
            <div class="buy_num">
                <label>购买数量：</label>
                <input type="number" id="buyNum" value="1" min="1" max="${product.number}">
            </div>
            <div class="buy_btn">
                <button onclick="addToCart()">加入购物车</button>
                <button onclick="buyNow()">立即购买</button>
            </div>
        </div>
    </div>

    <!-- 底部 -->
    <div id="footer">
        <p>© 2024 电商商城 版权所有</p>
        <p>联系方式：400-888-8888 | 邮箱：service@shop.com | 地址：北京市朝阳区</p>
    </div>

    <script type="text/javascript">
        function addToCart() {
            <c:if test="${empty sessionScope.loginUser}">
                alert('请先登录');
                window.location.href = '${pageContext.request.contextPath}/login.jsp';
                return;
            </c:if>
            var num = $('#buyNum').val();
            window.location.href = '${pageContext.request.contextPath}/sorder/addCart?pid=${product.pid}&num=' + num;
        }

        function buyNow() {
            <c:if test="${empty sessionScope.loginUser}">
                alert('请先登录');
                window.location.href = '${pageContext.request.contextPath}/login.jsp';
                return;
            </c:if>
            var num = $('#buyNum').val();
            window.location.href = '${pageContext.request.contextPath}/sorder/addCart?pid=${product.pid}&num=' + num;
        }
    </script>
</body>
</html>