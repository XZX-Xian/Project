<%@ page import="webproject.service.UserService" %>
<%@ page import="webproject.service.impl.UserServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="webproject.entity.Comm" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>周边商城</title>
    <link rel="stylesheet" type="text/css" href="../js/indexCss.css">
    <link rel="stylesheet" type="text/css" href="webproject/js/indexCss.css">
</head>
<style type="text/css">


    .c2{
        background-color: white;
        position: fixed;
        width: 400px;
        height: 300px;
        top:50%;
        left: 50%;
        z-index: 3;
        margin-top: -150px;
        margin-left: -200px;
    }

    #bg{
        position: fixed;
        width: 100%;
        height:100%;
        margin: 0;
        padding: 0;
        top: 0;
        left: 0;
        background-color: rgba(0,0,0,0.5);
        z-index: 100;
    }

</style>
<%
    //获取当前请求的上一个URL，即访问登陆页面前的URL
//    String preUrl = request.getHeader("Referer");
//    session.setAttribute("preUrl",preUrl);
%>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        //获得跳转这里的地址
        var url=document.referrer;
        //获得当前页面的地址
        var href=window.location.href;
        //单击登录
        $(".dlu").click(function () {
            $(".c2").show();
            $("#bg").show();
        });

        //弹框登录
        $(".userdl").click(function () {
            var username=$("input[name=username]").val();
            var userpwd=$("input[name=userpwd ]").val();
            location.href="http://localhost:8080/Project_war_exploded/seluer?username="+username+"&userpwd="+userpwd+"";
        });

        //得到账号
        var account = "<%= session.getAttribute("account")%>";
        if (account != "" && account != null && account != "null") {
            $("#register").hide();
            $("#greet").hide();
            $("#cancel").show();
            $("#account").text(account);
        }else {
            if (url==href){
                alert("登录失败!")
            }
        };

        //注销
        $("#cancel").click(function () {
            $("#register").show();
            $("#greet").show();
            $("#cancel").hide();
            $("#account").text("");
            $.getJSON("http://localhost:8080/Project_war_exploded/userclear", "", function (data) {})
        });

        // 单击账号
        $("#account").click(function () {
           var id=$(this).text();
            location.href="http://localhost:8080/Project_war_exploded/userquery?id="+id;
        });



        //分类查询
        $("#sel").change(function () {
            var size = $('#sel option:selected').val();
            var type = $("#shob").val();
            var json = {"size": size, "type": type};
            $.getJSON("http://localhost:8080/Project_war_exploded/selcom", json, function (data) {
                $("#sese").html("");
                var jsonData = JSON.stringify(data);// 转成JSON格式
                var results = $.parseJSON(jsonData);// 转成JSON对象
                var a = "";
                var count = 0;
                $.each(results, function (i, item) {
                    //判断个数
                    count++;
                    if (i < 6) {
                        a += "                                  <li style=\"display: inline-block;margin: 16px 30px;text-align: center;\" class=\"tup\">\n" +
                            "                                        <div style=\"width: 185px; height: 195px;margin: 0 50px\">\n" +
                            "                                            <a href=\"\"><img src=\"" + item.comOve + "\" alt=\"\" width=\"165\">\n" +
                            "                                                <img src=\"" + item.comOut + "\" alt=\"\" width=\"135\" hidden ></a>\n" +
                            "                                        </div>\n" +
                            "                                        <div style=\"margin-bottom: 0\" >\n" +
                            "                                            <p style=\"margin: 20px 35px 0;font-size: 16px;line-height: 31px\"><a style=\"color:salmon\">[英雄联盟]</a>" + item.comName + "<strong style=\"padding-top: 5px\"><br/>价格:" + item.comMoney + "元</strong></p>\n" +
                            "                                        </div>\n" +
                            "                                    </li>"

                    } else {
                        a += "                                    <li hidden style=\"display: inline-block;margin: 16px 35px;text-align: center;\" class=\"tup\" >\n" +
                            "                                    <div hidden style=\"width: 185px; height: 195px;margin: 0 40px\">\n" +
                            "                                        <a href=\"\"><img src=\"" + item.comOve + "\" alt=\"\" width=\"178px\">\n" +
                            "                                            <img src=\"" + item.comOut + "\" alt=\"\" width=\"162px\" hidden ></a>\n" +
                            "                                    </div>\n" +
                            "                                    <div hidden style=\"margin-bottom: 0\" >\n" +
                            "                                        <p style=\"margin: 20px 35px 0;font-size: 16px;line-height: 31px\"><a style=\"color:salmon\">[英雄联盟]</a>" + item.comName + "<strong style=\"padding-top: 5px\"><br/>价格:" + item.comMoney + "元</strong></p>\n" +
                            "                                    </div>\n" +
                            "                                    </li>\n"
                    }

                });
                //页面添加商品信息
                $("#sese").append(a);

                //全部商品显示和隐藏
                if (count < 6) {
                    $(".gend").hide();
                    $(".shoh").hide();
                } else {
                    $(".gend").show();
                    $(".shoh").hide();
                }
                $(".tup").hover(function () {
                    $(this).children("div").children("a").children("img:eq(1)").show()
                    $(this).css({"box-shadow": "darkgrey  0px 0px 5px 5px"});
                    $(this).children("div").next().css({"background-color": "rgba(255, 221, 89,1.0)"})
                    $(this).css({"transform": "scale(1.08)"});
                    $(this).children("div").children("a").children("img:eq(0)").hide()
                }, function () {
                    $(this).children("div").children("a").children("img:eq(0)").show()
                    $(this).children("div").slideDown(600).css({"background-color": "#ffffff"});
                    $(this).css({"box-shadow": "0px 0px 0px 0px"});
                    $(this).css({"transform": "scale(1)"});
                    $(this).children("div").children("a").children("img:eq(1)").hide()
                });

            })

        });

        //数量
        $(".demo").click(function () {
            var leix = $(this).children("input").val();
            // var cs=$(".cs").val();
            var cs = $(this).children(".cs").val();
            var a = parseInt(cs);
            if (a >= 4) {
                a = 2;
            } else {
                a += 2;
            }
            // $(".cs").val(a);a
            $(this).children(".cs").val(a);
            var qis = 2;
            var json = {"leix": leix, "cs": cs, "qis": qis};
            $.getJSON("http://localhost:8080/Project_war_exploded/selhyh", json, function (data) {
                var jsonData = JSON.stringify(data);// 转成JSON格式
                var results = $.parseJSON(jsonData);// 转成JSON对象
                var a = "";
                var type = "";
                $.each(results, function (i, item) {
                    type = item.comtype;
                    a += "       <li><a style=\"font-size: 12px\" href=\"\">[英雄联盟]" + item.comName + "\n" +
                        "                                    <img src=\"" + item.comOve + "\" alt=\"\" width=\"180px\"></a>\n" +
                        "             </li>"
                });

                switch (type) {
                    case 11:
                        $("#bt").html("").append(a);
                        break;
                    case 22:
                        $("#bt1").html("").append(a);
                        break;
                    case 33:
                        $("#bt2").html("").append(a);
                        break;
                }


            })
        });

        $(".sm li a").hover(function () {
            $(this).css({"color": "#EE5A24"});
        }, function () {
            $(this).css({"color": "#ffffff"});
        });

        $(".tup").hover(function () {
            $(this).children("div").children("a").children("img:eq(1)").show();
            $(this).css({"box-shadow": "darkgrey  0px 0px 5px 5px"});
            $(this).children("div").next().css({"background-color": "rgba(255, 221, 89,1.0)"});
            $(this).css({"transform": "scale(1.08)"});
            $(this).children("div").children("a").children("img:eq(0)").hide()

        }, function () {
            $(this).children("div").children("a").children("img:eq(0)").show();
            $(this).children("div").slideDown(600).css({"background-color": "#ffffff"});
            $(this).css({"box-shadow": "0px 0px 0px 0px"});
            $(this).css({"transform": "scale(1)"});
            $(this).children("div").children("a").children("img:eq(1)").hide()

        });

        $(".gend").click(function () {
            $("#zhuti li>div:hidden").show();
            $(".shoh").show();
            $(this).hide();
        });

        $(".shoh").click(function () {
            $("#zhuti li:gt(5)>div:visible").hide();
            $(".gend").show();
            $(this).hide();
        });


    })

</script>
<%
    Comm com = new Comm();
    UserService str = new UserServiceImpl();
    List<Comm> list = new ArrayList<Comm>();
    list = str.SeleteCom();
    request.setAttribute("list", list);
%>
<body>

<%--遮罩层--%>
<div id="bg" hidden></div>
<table border="1px" align="center">

    <div class="c2" hidden style="z-index: 101" >
        <div align="center">
            <div align="right">
                <img src="\subject\gb.png" style="cursor:pointer;width: 50px;height: 30px" class="gb">
            </div>

            <form action="">
                <div align="center"style="z-index: 101">
                    <img style="width: 80px;padding-top:-5px;" src="\subject\loading.png" alt="">
                    <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗登录</p>
                    <br/>
                </div>
                <input type="text" class="name" name="username" style="margin-top: -5px;width: 250px;height: 35px;margin-bottom: 25px;font-size: 13px;display: block"  placeholder="用户名">


                <input type="password" name="userpwd" class="pwd" style="margin-left: 5px;width: 250px;height: 35px;font-size: 13px"  placeholder="密码">

                <br/>
                <input type="button" class="userdl" style="background-color: #ffffff;color: #05c46b;border-radius: 25px;font-weight:bold ;margin-top: 20px;width: 95px" value="登录" >
                <div align="right" style="margin-right: 15px;margin-top: 10px">
                    <a href="http://localhost:8080/Project_war_exploded/loldemo/denlv.jsp" style="font-size: 11px;" >注册新用户/忘记密码</a>
                </div>
            </form>
        </div>
    </div>
<%--最大的主体框--%>
<div style="width:1518px;height: 1400px;min-width:100%">

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
                <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px">
            </div>

            <%--登录框--%>
            <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">
                <img src="\subject\yhu.png" alt="" width="30"
                     style="position: absolute;top: 12px;margin-left: 260px;margin-top: 5px">
                <strong style="position: absolute;top: 12px;margin-left: 295px;margin-top: 10px;width: 200px"><span
                        id="greet">欢迎,请</span><a href="#" id="register" class="dlu">登录</a>
                    <%--存放账号--%>
                    <label class="userid"></label>
                    <span id="account" ></span>
                    <span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
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
                <li><strong><a href="http://localhost:8080/Project_war_exploded/loldemo/sy.jsp">商城首页</a></strong><img
                        src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
            </ul>
        </div>
    </div>

    <%--海报框--%>
    <div style="/*margin-top:80px;*/display:inline-block">
        <img src="\subject\index.jpg" alt="" width="1518px">
    </div>

    <%--第二大主题框背景颜色灰色--%>
    <div style="width: 1518px;height: 980px;margin-top: 15px">
        <%--主体内容框--%>
        <div>
            <%--内容标题框--%>
            <div style="border: 1px olivedrab solid;width: 300px;display: inline-block;background-color: white;margin-left: 25px">
                <h3>🈲爆套装<a class="demo"
                            style="float: right;font-size: 12px;margin-right: 8px;margin-top: 12px;cursor: hand">换一换
                    <input type="text" class="hyh" value="11" hidden>
                    <input type="text" class="cs" value="2" hidden>
                    <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a>
                </h3>
                <ul id="bt">
                    <li><a style="font-size: 12px" href="">[英雄联盟]龙年限定迷你套装
                        <img src="\commodity\longnian.png" alt="" width="180px"></a>
                    </li>
                    <li><a style="font-size: 12px" href="">[英雄联盟]复活节限定迷你套装
                        <img src="\commodity\fuhj.png" alt="" width="180px"></a>
                    </li>
                </ul>

                <h3>🈲销公仔<a class="demo"
                            style="float: right;font-size: 12px;margin-right: 8px;margin-top: 10px;cursor: hand">换一换
                    <input type="text" class="hyh" value="22" hidden>
                    <input type="text" class="cs" value="2" hidden>
                    <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a>
                </h3>

                <ul id="bt1">
                    <li><a style="font-size: 12px" href="">[英雄联盟]提伯斯周边大型套装
                        <img src="\commodity\gjtbstz.png" alt="" width="180px"></a>
                    </li>
                    <li><a style="font-size: 12px" href="">[英雄联盟]欧米伽魄罗小队
                        <img src="\commodity\polo.png" alt="" width="180px"></a>
                    </li>
                </ul>

                <h3>🈲事服装<a class="demo"
                            style="cursor: hand;float: right;font-size: 12px;margin-right: 8px;margin-top: 10px">换一换
                    <input type="text" class="hyh" value="33" hidden>
                    <input type="text" class="cs" value="2" hidden>
                    <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a>
                </h3>
                <ul id="bt2">

                    <li><a style="font-size: 12px" href="">[英雄联盟]星际守护者迷你套装
                        <img src="\commodity\yf.png" alt="" width="180px"></a>
                    </li>
                    <li><a style="font-size: 12px" href="">[英雄联盟]欧米伽魄罗小队
                        <img src="\commodity\polo.png" alt="" width="180px"></a>
                    </li>
                </ul>

            </div>

            <%--商品--%>
            <div style="border: 1px #333333 solid;overflow:auto;height: 825px;width: 1121px;position: absolute;display: inline-block;margin-left: 40px;background-color: white"
                 id="zhuti">

                <div style="width: 170px;height: 50px;margin-top: 18px;text-align: center;line-height:50px;background-color:black">
                    <a href="" style="text-decoration:none;"><strong style="font-size: 18px;color:white;">手办周边</strong></a>
                    <input type="text" value="1" id="shob" hidden>
                </div>

                <select name="" id="sel" style="position: absolute;right: 35px;height: 45px;top: 25px">
                    <option value="0">
                        全部商品
                    </option>
                    <option value="1">
                        迷你手办
                    </option>
                    <option value="2">
                        中型手办
                    </option>
                    <option value="3">
                        大型手办
                    </option>

                </select>

                <ul id="sese">
                    <c:forEach var="in" items="${list}" varStatus="stas">
                        <c:if test="${stas.index<6}">
                            <li style="display: inline-block;margin: 16px 30px;text-align: center;" class="tup">
                                <div style="width: 185px; height: 195px;margin: 0 50px">
                                    <a href=""><img src="${in.comOve}" alt="" width="165">
                                        <img style="margin-top: 23px" src="${in.comOut}" alt="" width="135" hidden></a>
                                </div>
                                <div style="margin-bottom: 0">
                                    <p style="margin: 20px 35px 0;font-size: 16px;line-height: 31px"><a
                                            style="color:salmon;margin-top: 20px">[英雄联盟]</a>${in.comName}<strong
                                            style="padding-top: 5px"><br/>价格:${in.comMoney}元</strong></p>
                                </div>
                            </li>

                        </c:if>

                        <c:if test="${stas.index>5}">
                            <li hidden style="display: inline-block;margin: 16px 35px;text-align: center;" class="tup">
                                <div hidden style="width: 185px; height: 195px;margin: 0 40px">
                                    <a href=""><img src="${in.comOve}" alt="" width="178px">
                                        <img style="margin-top: 23px" src="${in.comOut}" alt="" width="145" hidden></a>
                                </div>
                                <div hidden style="margin-bottom: 0">
                                    <p style="margin: 50px 35px 0;font-size: 16px;line-height: 31px"><a
                                            style="color:salmon">[英雄联盟]</a>${in.comName}<strong
                                            style="padding-top: 5px"><br/>价格:${in.comMoney}元</strong></p>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>

                <div style="width: 180px;height: 40px;margin-left: 510px;margin-top: 5px;margin-bottom: 0">
                    <input type="button" value="展示全部" class="gend"
                           style="width: 100px;height: 30px;background-color: black;color: white;border: #ffffff 1px solid">
                    <input hidden type="button" value="隐藏" class="shoh"
                           style="width: 100px;height: 30px;margin-top:-10px;background-color: black;color: white;border: #ffffff 1px solid">
                </div>


            </div>


        </div>
    </div>
    <div style="width: 1090px;height: 80px;display: inline-block;margin-left: 315px;margin-top: -100px">
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
    <div style="width: 1518px;height: 82px;background-color: #bdc3c7;margin-top: -20px">
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
</html>
