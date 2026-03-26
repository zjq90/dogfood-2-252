<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车 - 电商商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css">
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

    <!-- 购物车主体 -->
    <div id="cart_main">
        <div class="cart_title">
            <h2>我的购物车</h2>
        </div>
        <c:if test="${empty sessionScope.cart}">
            <div class="cart_empty">
                <p>购物车是空的，快去挑选心仪的商品吧！</p>
                <a href="${pageContext.request.contextPath}/product/frontlist">去购物</a>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.cart}">
            <div class="cart_table">
                <table>
                    <thead>
                        <tr>
                            <th width="100">商品图片</th>
                            <th width="300">商品名称</th>
                            <th width="100">单价</th>
                            <th width="100">数量</th>
                            <th width="100">小计</th>
                            <th width="100">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0" />
                        <c:forEach items="${sessionScope.cart}" var="sorder">
                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}/image/${sorder.product.pic}" alt="${sorder.name}" width="80" height="80" onerror="this.src='${pageContext.request.contextPath}/image/default.jpg'">
                                </td>
                                <td>${sorder.name}</td>
                                <td>¥${sorder.price}</td>
                                <td>${sorder.number}</td>
                                <td>¥<fmt:formatNumber value="${sorder.price * sorder.number}" pattern="0.00" /></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/sorder/removeCart?sid=${sorder.sid}">删除</a>
                                </td>
                            </tr>
                            <c:set var="total" value="${total + sorder.price * sorder.number}" />
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" align="right">总计：</td>
                            <td colspan="2" class="total_price">¥<fmt:formatNumber value="${total}" pattern="0.00" /></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="cart_btn">
                <a href="${pageContext.request.contextPath}/product/frontlist" class="continue_btn">继续购物</a>
                <a href="${pageContext.request.contextPath}/forder/toAddOrder" class="checkout_btn">去结算</a>
                <a href="${pageContext.request.contextPath}/sorder/clearCart" class="clear_btn">清空购物车</a>
            </div>
        </c:if>
    </div>

    <!-- 底部 -->
    <div id="footer">
        <p>© 2024 电商商城 版权所有</p>
        <p>联系方式：400-888-8888 | 邮箱：service@shop.com | 地址：北京市朝阳区</p>
    </div>
</body>
</html>