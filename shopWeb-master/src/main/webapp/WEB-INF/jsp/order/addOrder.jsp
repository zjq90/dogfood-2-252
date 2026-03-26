<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>确认订单 - 电商商城</title>
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
                <span>欢迎您，${sessionScope.loginUser.username}</span>
                <a href="${pageContext.request.contextPath}/user/logout">退出登录</a>
                <a href="${pageContext.request.contextPath}/cart.jsp">购物车</a>
                <a href="${pageContext.request.contextPath}/order/myOrders">我的订单</a>
            </div>
        </div>
        <div class="header_main">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/image/logo.gif" alt="电商商城">
                </a>
            </div>
        </div>
    </div>

    <!-- 确认订单主体 -->
    <div id="order_main">
        <div class="order_title">
            <h2>确认订单信息</h2>
        </div>

        <form action="${pageContext.request.contextPath}/forder/addOrder" method="post">
            <!-- 收货地址 -->
            <div class="address_section">
                <h3>收货地址</h3>
                <div class="address_form">
                    <div class="form_item">
                        <label>收货人：</label>
                        <input type="text" name="name" value="${sessionScope.loginUser.realname}" required>
                    </div>
                    <div class="form_item">
                        <label>联系电话：</label>
                        <input type="text" name="phone" value="${sessionScope.loginUser.phone}" required>
                    </div>
                    <div class="form_item">
                        <label>收货地址：</label>
                        <input type="text" name="address" value="${sessionScope.loginUser.addr}" required>
                    </div>
                    <div class="form_item">
                        <label>邮编：</label>
                        <input type="text" name="post" placeholder="选填">
                    </div>
                    <div class="form_item">
                        <label>备注：</label>
                        <textarea name="remark" placeholder="选填"></textarea>
                    </div>
                </div>
            </div>

            <!-- 商品清单 -->
            <div class="goods_section">
                <h3>商品清单</h3>
                <div class="cart_table">
                    <table>
                        <thead>
                            <tr>
                                <th width="100">商品图片</th>
                                <th width="300">商品名称</th>
                                <th width="100">单价</th>
                                <th width="100">数量</th>
                                <th width="100">小计</th>
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
                                </tr>
                                <c:set var="total" value="${total + sorder.price * sorder.number}" />
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" align="right">商品总计：</td>
                                <td class="total_price">¥<fmt:formatNumber value="${total}" pattern="0.00" /></td>
                            </tr>
                            <tr>
                                <td colspan="4" align="right">运费：</td>
                                <td>¥0.00</td>
                            </tr>
                            <tr>
                                <td colspan="4" align="right">应付金额：</td>
                                <td class="total_price">¥<fmt:formatNumber value="${total}" pattern="0.00" /></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>

            <div class="order_btn">
                <a href="${pageContext.request.contextPath}/cart.jsp" class="back_btn">返回购物车</a>
                <button type="submit" class="submit_btn">提交订单</button>
            </div>
        </form>
    </div>

    <!-- 底部 -->
    <div id="footer">
        <p>© 2024 电商商城 版权所有</p>
        <p>联系方式：400-888-8888 | 邮箱：service@shop.com | 地址：北京市朝阳区</p>
    </div>
</body>
</html>