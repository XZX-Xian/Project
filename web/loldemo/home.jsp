<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="webproject.entity.Comm" %>
<%@ page import="webproject.service.UserService" %>
<%@ page import="webproject.service.impl.UserServiceImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019-12-22 0022
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="../js/home.css">
    <link rel="stylesheet" type="text/css" href="js/home.css">
</head>
<%--<style type="text/css"></style>--%>
<%
    Comm com = new Comm();
    UserService str = new UserServiceImpl();
    List<Comm> list1 = new ArrayList<Comm>();
    List<Comm> list2 = new ArrayList<Comm>();
    List<Comm> list3 = new ArrayList<Comm>();
    List<Comm> list4 = new ArrayList<Comm>();
    list1 = str.recreationdemo();
    list2 = str.recreationdemo();
    list3 = str.recreationdemo();
    list4 = str.recreationdemo();
    request.setAttribute("list1", list1);
    request.setAttribute("list2", list2);
    request.setAttribute("list3", list3);
    request.setAttribute("list4", list4);
%>

<link rel="icon" href="\subject\loading.png">


<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>

<script type="text/javascript">
    $(function () {
        //获得跳转这里的地址
        var url = document.referrer;
        //获得当前页面的地址
        var href = window.location.href;
        //获的页面状态
        var pd = "<%= session.getAttribute("pd")%>";
        //修改页面状态
        if (pd == "null") {
            location.href = "http://localhost:8080/Project_war_exploded/pagestate";
        }

        //单击登录
        $(".dlu").click(function () {
            $(".c2").show();
            $("#bg").show();
        });

        //弹框登录
        $(".userdl").click(function () {
            var username = $("input[name=username]").val();
            var userpwd = $("input[name=userpwd ]").val();
            location.href = "http://localhost:8080/Project_war_exploded/seluer?username=" + username + "&userpwd=" + userpwd + "";
        });

        //得到账号
        var account = "<%= session.getAttribute("account")%>";
        if (account != "" && account != null && account != "null") {
            $("#register").hide();
            $("#greet").hide();
            $("#cancel").show();
            $("#account").text(account);
        } else {
            if (url == href && pd == "true") {
                alert("登录失败!");
                //重置页面状态
                location.href = "http://localhost:8080/Project_war_exploded/pagestate";
            }
        }
        ;

        //注销
        $("#cancel").click(function () {
            $("#register").show();
            $("#greet").show();
            $("#cancel").hide();
            $("#account").text("");
            $.getJSON("http://localhost:8080/Project_war_exploded/userclear", "", function (data) {
            })
        });

        // 单击账号
        $("#account").click(function () {
            var id = $(this).text();
            location.href = "http://localhost:8080/Project_war_exploded/userquery?id=" + id;
        });

        //关闭登录框
        $(".gb").click(function () {
            $(".c2").hide();
            $("#bg").hide();
        });

        var count = 0;
        timers(count);
        $("#smk li:eq(0)").css("background", "#fed330");
        $("#smk li").hover(function () {
            indexs = $(this).index();
            $(".imgs").css("display", "none");
            $(".imgs").eq(indexs).css("display", "block");
            $(this).css("background", "#fed330");
            $(this).siblings().css("background", "#ffffff");
            window.clearInterval(timer);
            demos = indexs;
        }, function () {
            timers(indexs);
        });


        function timers(count) {
            timer = window.setInterval(function () {
                count++;
                if (count == 3) {
                    count = 0;
                }
                $(".imgs").css("display", "none");
                $(".imgs").eq(count).css("display", "block");
                $("#smk li:eq(" + count + ")").css("background", "#fed330");
                $("#smk li:eq(" + count + ")").siblings().css("background", "#ffffff");
            }, 1000);
        }

        $("#img1").click(function () {
            var name = $(".lit1").text();
            location.href = "http://localhost:8080/Project_war_exploded/selehome?name=" + name + "";
        });
        $("#img2").click(function () {
            var name = $(".lit2").text();
            location.href = "http://localhost:8080/Project_war_exploded/selehome?name=" + name + "";
        });
        $("#img3").click(function () {
            var name = $(".lit3").text();
            location.href = "http://localhost:8080/Project_war_exploded/selehome?name=" + name + "";
        });
        $("#img4").click(function () {
            var name = $(".lit4").text();
            location.href = "http://localhost:8080/Project_war_exploded/selehome?name=" + name + "";
        });

        //单击购物车
        $(".gouwuc").click(function () {
            if (account != "" && account != null && account != "null") {
                location.href = "http://localhost:8080/Project_war_exploded/seleshop";
            } else {
                alert("请先登录");
                $(".dlu").click();
                return false;
            }
        })

        //单击模糊查询
        $("#search").click(function () {
            var name = $(this).prev().val();
            var
            alert(name)
            location.href="http://localhost:8080/Project_war_exploded/";

        })
    });
</script>

<body>
<%--遮罩层--%>
<div id="bg" hidden></div>
<table border="1px" align="center">

    <div class="c2" hidden style="z-index: 101">
        <div align="center">
            <div align="right">
                <img src="\subject\gb.png" style="cursor:pointer;width: 50px;height: 30px" class="gb">
            </div>

            <form action="">
                <div align="center" style="z-index: 101">
                    <img style="width: 80px;padding-top:-5px;" src="\subject\loading.png" alt="">
                    <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗登录</p>
                    <br/>
                </div>
                <input type="text" class="name" name="username"
                       style="margin-top: -5px;width: 250px;height: 35px;margin-bottom: 25px;font-size: 13px;display: block"
                       placeholder="用户名">


                <input type="password" name="userpwd" class="pwd"
                       style="margin-left: 5px;width: 250px;height: 35px;font-size: 13px" placeholder="密码">

                <br/>
                <input type="button" class="userdl"
                       style="background-color: #ffffff;color: #05c46b;border-radius: 25px;font-weight:bold ;margin-top: 20px;width: 95px"
                       value="登录">
                <div align="right" style="margin-right: 15px;margin-top: 10px">
                    <a href="http://localhost:8080/Project_war_exploded/loldemo/denlv.jsp" style="font-size: 11px;">注册新用户/忘记密码</a>
                </div>
            </form>
        </div>
    </div>
    <%--最大的主体框--%>
    <div style="width:1518px;height: 950px;min-width:100%">

        <div <%--style="position: fixed;z-index: 999"--%>>
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
                    <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px" id="search">
                </div>

                <%--登录框--%>
                <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">
                    <img src="\subject\yhu.png" alt="" width="30"
                         style="position: absolute;top: 12px;margin-left: 260px;margin-top: 5px">
                    <strong style="position: absolute;top: 12px;margin-left: 295px;margin-top: 10px;width: 200px"><span
                            id="greet">欢迎,请</span><a href="#" id="register" class="dlu">登录</a>
                        <%--存放账号--%>
                        <span id="account"></span>
                        <span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
                </div>

                <%--购物车框--%>
                <div class="gouwuc" style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">
                    <img src="\subject\gwc.png" alt="" width="35px"
                         style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">
                    <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a>购物车</a></strong>
                </div>

            </div>
            <%--导航栏内容--%>
            <div style="width: 1518px;height: 36px;background-color: #1e272e;">
                <ul class="sm">
                    <li><strong><a href="#">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="index.jsp">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                </ul>
            </div>
        </div>

        <%--海报框--%>
        <div id="stu" style="/*margin-top:80px;*/display:inline-block;">

            <a href="http://localhost:8080/Project_war_exploded/loldemo/index.jsp"><img src="\subject\sy1.jpg" alt=""
                                                                                        width="1518px" height="502px"
                                                                                        class="imgs" name="0"
                                                                                        style="display: block"></a>
            <a href="http://localhost:8080/Project_war_exploded/loldemo/home.jsp"><img src="\subject\sy2.jpg" alt=""
                                                                                       width="1518px" height="502px"
                                                                                       class="imgs" name="1"
                                                                                       style="display: none"></a>
            <a href="http://localhost:8080/Project_war_exploded/loldemo/demo1.jsp"><img src="\subject\sy3.jpg" alt=""
                                                                                        width="1518px" height="502px"
                                                                                        class="imgs" name="2"
                                                                                        style="display: none"></a>

            <ul id="smk">
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>

        <div style="border: 1px red solid;width: 1517px;height: 460px" id="spl">
            <div align="center"
                 style="margin-top: 50px;margin-left: 35px;width: 230px;height: 40px;border: 1px red solid">
                <p style="display: inline-block">娱乐活动：<span style="display: inline-block;color: red">随机商品！</span></p>
            </div>
            <c:forEach items="${list1}" var="lit">
                <ul>
                    <div id="img1">
                        <img src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <p hidden class="lit1">${lit.comID}</p>
                    </div>
                </ul>
            </c:forEach>

            <c:forEach items="${list2}" var="lit">

                <ul>

                    <div id="img2">
                        <img style="width: 180px;" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit2" hidden>${lit.comID}</label>
                    </div>
                </ul>
            </c:forEach>
            <ul>
                <c:forEach items="${list3}" var="lit">

                    <div id="img3">
                        <img style="width: 180px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit3" hidden>${lit.comID}</label>
                    </div>
                </c:forEach>
            </ul>

            <c:forEach items="${list4}" var="lit">

                <ul>

                    <div id="img4">
                        <img style="width: 180px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit4" hidden>${lit.comID}</label>
                    </div>
                </ul>
            </c:forEach>
        </div>

        <div style="padding-left: 200px;padding-top: 20px" onclick="deleteUsers()">删除选中的商品</div>

        <%--三个标标--%>
        <div style="width: 1090px;height: 80px;display: inline-block;margin-left: 120px;margin-top: 10px">
            <ul style="list-style-type: none;display: inline-block">
                <li style="display: inline-block;margin-left: 220px;margin-right: 120px;"><img src="\subject\7.png"
                                                                                               alt="" width="45px"
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
        <div style="width: 1518px;height: 82px;background-color: #bdc3c7;margin-top: -20px">
            <ul>
                <li style="list-style-type: none">
                    <img src="\subject\LOl.png" alt="" height="45px "
                         style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
                    <img src="\subject\loading.png" alt="" height="45px "
                         style="margin-top: 18px;vertical-align: middle">
                    <p style="font-size: 12px;color: white;margin-top: -45px;margin-left: 645px;width: 360px;white-space:pre-wrap;">
                        Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456
                        客服邮箱：54181452@.qq.com </p>
                </li>

            </ul>

        </div>

</body>
</html>
