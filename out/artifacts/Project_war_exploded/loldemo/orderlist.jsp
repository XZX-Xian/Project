<%@ page import="webproject.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020-02-05
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品订单</title>
    <link rel="stylesheet" type="text/css" href="../js/userCss.css">
    <link rel="stylesheet" type="text/css" href="js/userCss.css">
</head>
<style type="text/css">
</style>
<body>
<%--最大的主体框--%>
<div style="width:1518px;height: 950px;min-width:100%">

    <div>
        <%--头部导航栏框--%>
        <div style="height:55px;background-color: white">

            <%--logo框--%>
            <div style="width: 300px;height: 55px;display:inline-block;margin-right:600px;margin-left: -20px;text-align: center">
                <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                <div style="display:inline-block;position: absolute;top: 18px"><strong
                        style="font-size: 20px;">魄罗商城</strong></div>
            </div>
            <%--搜索框--%>
            <div style="width: 170px;height: 55px;display:inline-block;position:absolute;top: 6px;margin-left: 85px;text-align: center">
                <input type="search" style="display:inline-block;border-radius:25px;margin-top: 15px;">
                <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px">
            </div>

            <%--登录框--%>
            <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">
                <img src="\subject\yhu.png" alt="" width="30"
                     style="position: absolute;top: 12px;margin-left: 290px;margin-top: 5px">
                <strong style="position: absolute;top: 12px;margin-left: 295px;margin-top: 10px;width: 200px"><span
                        id="greet">欢迎,请</span><a href="http://localhost:8080/Project_war_exploded/webproject/loldemo/denlv.jsp" id="register">登录</a>
                    <span id="account"></span><span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
            </div>
            <%--购物车框--%>
            <div style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">
                <img src="\subject\gwc.png" alt="" width="35px"
                     style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">
                <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a href="">购物车</a></strong>
            </div>

        </div>
        <%--导航栏内容--%>
        <div style="width: 1518px;height: 36px;background-color: #1e272e;">
            <ul class="sm">
                <li><strong><a href="">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href=""></a><img src="\subject\zuo.png" alt="" width="14px"></li>
<%--                <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>--%>
<%--                <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>--%>
            </ul>
        </div>
    </div>

    <%--个人信息的功能--%>
    <div class="memleft" id="categoryAddress">
        <ul id="list">
            <li><a href="#" style="color: black" id="shopping">我的购物车</a></li>
            <li><a href="#" style="color: black" id="order">我的订单</a></li>
            <li><a href="#" style="color: black" id="collect">商品收藏</a></li>
            <li><a href="#" style="color: black" id="site">收货地址</a></li>
            <li><a href="#" style="color: black" id="data">个人资料</a></li>
        </ul>
        <ul id="content">
            <%--订单--%>
            <li>
                <div class="mem_saileft">
                    <span></span>
                    <a href="javascript:doChangeStateOrder(9);" id="detailsHer">全部</a>
                    <a href="javascript:doChangeStateOrder(2);" id="detailsHer_2">待付款</a>
                    <a href="javascript:doChangeStateOrder(3);" id="detailsHer_3">待发货</a>
                    <a href="javascript:doChangeStateOrder(4);" id="detailsHer_4">待收货</a>
                    <a href="javascript:doChangeStateOrder(6);" id="detailsHer_5">待评价</a>
                </div>
                <table class="mermtab" width="100%" cellspacing="0" cellpadding="10" border="0">
                    <tr>
                        <th>订单商品</th>
                        <th>订单号/时间</th>
                        <th>总金额</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td>1212113</td>
                        <td>123</td>
                        <td>2010</td>
                        <td>123</td>
                        <td>111111</td>
                    </tr>
                </table>
            </li>

        </ul>
    </div>
</div>

<%--三个标标--%>
<div style=" width: 1090px;height: 80px;display: inline-block;margin-left: 120px;margin-top: -180px">
    <ul style="list-style-type: none;display: inline-block">
        <li style="display: inline-block;margin-left: 220px;margin-right: 120px;"><img src="\subject\7.png" alt=""
                                                                                       width="45px"
                                                                                       style="vertical-align: middle"><a
                style="font-size: 14px;">7天无理由退换货</a></li>
        <li style="display: inline-block;margin-left: 0;margin-right: 120px"><img src="\subject\z.png" alt=""
                                                                                  width="45px"
                                                                                  style="vertical-align: middle"><a
                style="font-size: 14px">100%官方正品</a></li>
        <li style="display: inline-block;margin-left: 0;margin-right: 0"><img src="\subject\m.png" alt=""
                                                                              width="45px"
                                                                              style="vertical-align: middle"><a
                style="font-size: 14px">全场每单满199元包邮</a></li>
    </ul>
</div>

<%--第三大尾部--%>
<div style="width: 1518px;height: 82px;background-color: #bdc3c7;margin-top: -100px;">
    <ul>
        <li style="list-style-type: none">
            <img src="\subject\LOl.png" alt="" height="45px "
                 style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
            <img src="\subject\loading.png" alt="" height="45px " style="margin-top: 18px;vertical-align: middle">
            <p style="font-size: 12px;color: white;margin-top: -45px;margin-left: 645px;width: 360px;white-space:pre-wrap;">
                Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456
                客服邮箱：54181452@.qq.com </p>
        </li>
    </ul>
</div>

</body>

<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="webproject/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="webproject/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //判断是否直接跳入
        var url = document.referrer;
        // if (url == null || url == "") {
        //     location.href = "http://localhost:8080/Project_war_exploded/comselete";
        // }

        //得到账号
        var account = "<%= session.getAttribute("account")%>";
        if (account != "" && account != null && account != "null") {
            $("#register").hide();
            $("#greet").hide();
            $("#cancel").show();
            $("#account").text(account);
        };

        //注销
        $("#cancel").click(function () {
            $("#register").show();
            $("#greet").show();
            $("#cancel").hide();
            $("#account").text("");
            $.getJSON("http://localhost:8080/Project_war_exploded/userclear", "", function (data) {});
            location.href="http://localhost:8080/Project_war_exploded/comselete";
        });

        // 单击账号
        $("#account").click(function () {
            location.href="http://localhost:8080/Project_war_exploded/userquery";
        });
        //购物车
        $("#shopping").click(function () {
            location.href="..";
        });

        // 我的订单
        $("#order").click(function () {
            location.href="..";
        });

        // 商品收藏
        $("#collect").click(function () {
            location.href="..";
        });

        // 收货地址
        $("#site").click(function () {
            location.href="http://localhost:8080/Project_war_exploded/shiselete";
        });

        //==>我的订单
        // 连接悬浮时添加样式
        $(".mem_saileft a").hover(function () {
            $(this).addClass("sai");
        }, function () {
            $(this).removeClass("sai");
        });

        //     var zhi=$("#zhi").text();
        // if (zhi=="" ||zhi==null){
        //     $("#zhi").text("zhi");
        //     $("#detailsHer").click(alert("110"));
        // }


        // 点击链接时条件查询
        $(".mem_saileft a").click(function () {
            var id = $(this).index();
            // location.href = "";
            // location.href="?id="+id;
        });


        //悬浮a连接时带下划线
        $("a").hover(function () {
            $(this).addClass("a");
        }, function () {
            $(this).removeClass("a");
        });

        //列表文字悬浮时带下划线
        $("#list li").hover(function () {
            $(this).addClass("a");
        }, function () {
            $(this).removeClass("a");
        });

        //列表样式
        $("#list li:eq(1)").addClass("list");

    });
</script>
</html>
