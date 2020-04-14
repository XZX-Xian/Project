<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020-02-29
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台数据</title>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">

    <script src="js/jquery.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>
</head>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String admin=(String)session.getAttribute("admin");
%>
<%--<script src="js/jquery-1.12.4.js" type="javascript"></script>--%>
<script>
    $(function () {
        //获得跳转这里的地址
        var url=document.referrer;
        //判断是否直接跳入
        if (url == null || url == "") {
            location.href = "http://localhost:8080/Project_war_exploded/loldemo/register.jsp";
        }
    })
</script>
<body>
<!-- 顶部开始 -->

<div class="container">
    <div class="logo"><a href="index.html">魄罗商城后台</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><%=admin%></a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('编辑','html/admin-edit.jsp?account='+<%=admin%>)">个人信息</a></dd>
<%--                <dd><a onClick="x_admin_show('切换帐号','')">切换帐号</a></dd>--%>
                <dd><a href="http://localhost:8080/Project_war_exploded/adminclear">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="http://localhost:8080/Project_war_exploded/loldemo/home.jsp">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6eb;</i>
                    <cite>主页</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li><a _href="html/welcome.jsp"><i class="iconfont">&#xe6a7;</i><cite>控制台</cite></a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6f6;</i>
                    <cite>商品管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="html/comm-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe69e;</i>
                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="html/order-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="html/admin-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="html/member-list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='html/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019 L-admin v2.3 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
</body>

</html>
