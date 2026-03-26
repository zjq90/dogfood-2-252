<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加商品 - 商城后台管理系统</title>
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
                <h2>添加商品</h2>
            </div>
            <div class="content-body">
                <form action="${pageContext.request.contextPath}/product/add" method="post" enctype="multipart/form-data" class="form">
                    <div class="form-item">
                        <label for="pname">商品名称：</label>
                        <input type="text" id="pname" name="pname" required placeholder="请输入商品名称">
                    </div>
                    <div class="form-item">
                        <label for="sprice">售价：</label>
                        <input type="number" id="sprice" name="sprice" step="0.01" required placeholder="请输入售价">
                    </div>
                    <div class="form-item">
                        <label for="cprice">成本价：</label>
                        <input type="number" id="cprice" name="cprice" step="0.01" required placeholder="请输入成本价">
                    </div>
                    <div class="form-item">
                        <label for="number">库存数量：</label>
                        <input type="number" id="number" name="number" required placeholder="请输入库存数量">
                    </div>
                    <div class="form-item">
                        <label for="isHot">是否热门：</label>
                        <select id="isHot" name="isHot">
                            <option value="false">否</option>
                            <option value="true">是</option>
                        </select>
                    </div>
                    <div class="form-item">
                        <label for="pdesc">商品描述：</label>
                        <textarea id="pdesc" name="pdesc" rows="4" placeholder="请输入商品描述"></textarea>
                    </div>
                    <div class="form-item">
                        <label for="file">商品图片：</label>
                        <input type="file" id="file" name="file" accept="image/*">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">保存</button>
                        <a href="${pageContext.request.contextPath}/product/list" class="btn">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
