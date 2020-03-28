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
</head>
<style type="text/css">
    .sm li {
        list-style-type: none;
        display: inline-block;
        text-align: center;
        width: 180px;
        font-size: 16px;
        line-height: 36px;

    }

    .sm li a {
        text-decoration: none;
        color: white;
    }

    .sm {
        margin-top: 5px;
        color: white;
    }

    html, body {
        margin: 0;
        padding: 0;
    }

    #bt li {
        list-style-type: none;
        padding-top: 3px;
    }

    #bt1 li {
        list-style-type: none;
        padding-top: 3px;
    }

    #bt2 li {
        list-style-type: none;
        padding-top: 3px;
    }

    #spl ul {
        /*      border: 1px black solid;*/
        width: 260px;
        height: 290px;
        display: inline-block;
        margin-left: 58px;
        margin-top: 45px;
    }

    #spl ul li {
        list-style-type: none;
        font-size: 18px;
        color: black;
        font-weight: bold;
    }

    #spl ul div {
        text-align: center;
        margin-top: 20px;
        /*     border: 1px red solid;*/
        width: 200px;
        height: 185px;

    }

    #spl ul div img {
        height: 190px;
        width: 190px;
        max-width: 190px;
    }

    #smk {
        margin-top: -60px;
        margin-left: 650px;
    }

    #smk li {
        display: inline-block;
        font-size: 10px;
        line-height: 20px;
        margin: 0 1px;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background: #ffffff;
        text-align: center;
        color: #ffffff;
        margin-left: 20px;

    }

    .c2 {
        background-color: white;
        position: fixed;
        width: 400px;
        height: 300px;
        top: 50%;
        left: 50%;
        z-index: 3;
        margin-top: -150px;
        margin-left: -200px;
    }

    .c2cyh {
        border: orange 1.5px solid;
        background-color: white;
        position: fixed;
        width: 200px;
        height: 75px;
        top: 50%;
        left: 50%;
        z-index: 3;
        margin-top: -75px;
        margin-left: -100px;
    }

    .grzx li {
        text-align: center;
        line-height: 30px;
        width: 75px;
        height: 30px;
        border-top: 1px #fff solid;
        color: #ccc;
        background-color: rgba(0, 0, 0, 0.4)
    }

    #bg {
        position: fixed;
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        top: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 100;
    }


</style>
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
        var account = "<%=session.getAttribute("account")%>";
        var pd = "<%=session.getAttribute("pd")%>";
        var pds = "<%=session.getAttribute("pds")%>";

        if (account == "null") {
            $(".dlu").click(function () {
                $(".c2").show();
                $("#bg").show();
            });
        } else {
            $(".dlu").click(function () {
                $(".c2").hide();
                $("#bg").hide();
            });
        }


        //弹框登录
        $(".userdl").click(function () {
            var username = $("input[name=username]").val();
            var userpwd = $("input[name=userpwd ]").val();
            var red = /^\S{6,10}$/;
            if (username == "" || userpwd == "") {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("请先填完数据!");
                $(".c2cyh").delay(1000).hide(0);
            } else if (!red.test(username)) {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("账户格式错误!");
                $(".c2cyh").delay(1000).hide(0);
            } else {
                location.href = "http://localhost:6060/League_of_Legends_war_exploded/seluer?username=" + username + "&userpwd=" + userpwd + "";
            }
        });


        if (pd == "true") {            //判断从登录jsp内传过来的值判断是否登录成功！
            <%session.setAttribute("pd",false);%>
            $(".c2cyh").show();
            $(".c2cyh").children("p").text("登录失败!");
            $(".c2cyh").delay(2000).hide(0);
        }


        //弹框正则判断
        //密码
        $("input[name=userpwd ]").blur(function () {
            var userpwd = $("input[name=userpwd ]").val();
            if (userpwd == "") {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("密码不能为空!");
                $(".c2cyh").delay(1000).hide(0);
            }
        });
        //用户
        $("input[name=username]").blur(function () {
            var username = $("input[name=username]").val();
            var red = /^\S{6,10}$/;
            if (username == "") {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("用户不能为空!");
                $(".c2cyh").delay(1000).hide(0);
            } else if (!red.test(username)) {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("用户格式错误!");
                $(".c2cyh").delay(1000).hide(0);
            }
        });


        $(".gb").click(function () {
            $(".c2").hide();
            $("#bg").hide();
        });
        $(".gbs").click(function () {
            $(".c2c").hide();
            $("#bg").hide();
        });

        if (account != null && account != "" && account != "null") {
            $(".userid").text(account);
            $(".dltis").css("right", "110px")
            $(".hyp").show();
        } else {
            $(".userid").hide();
        }

        $(".sm li a").hover(function () {
            $(this).css({"color": "#EE5A24"});
        }, function () {
            $(this).css({"color": "#ffffff"});
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
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/selehome?name=" + name + "";
        });
        $("#img2").click(function () {
            var name = $(".lit2").text();
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/selehome?name=" + name + "";
        });
        $("#img3").click(function () {
            var name = $(".lit3").text();
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/selehome?name=" + name + "";
        });
        $("#img4").click(function () {
            var name = $(".lit4").text();
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/selehome?name=" + name + "";
        });

        $(".gouwuc").click(function () {
            if (account != "" && account != null && account != "null") {
                var userid = $(".userid").text();
                location.href = "http://localhost:6060/League_of_Legends_war_exploded/seleshop?id=" + userid + "";
            } else {
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("请先登录!");
                $(".c2cyh").delay(1000).hide(0);
                $(".dlu").click();
                return false;
            }

        });
        //登录框
        if (account != "" && account != null && account != "null") {
            $(".grdiv").hover(function () {
                $(".grzx").show();
                $(".grzx li").hover(function () {
                    $(this).css("color", "#ffffff")
                }, function () {
                    $(this).css("color", "#ccc")
                })
            }, function () {
                $(".grzx").hide();
            })
        }
        //注销
        $("#nullopen").click(function () {
            $(".dltis").css("right", "50px")
            $(".hyp").hide();
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/remouser";
        });
        if (pds == "false") {            //判断从登录jsp内传过来的值判断是否登录成功！
            <%session.setAttribute("pds",true);%>
            $(".c2cyh").show();
            $(".c2cyh").children("p").text("注销成功!");
            $(".c2cyh").delay(2000).hide(0);
        }

        $(".shopsele").click(function () {
            var shopdemo = $(".shopse").val();
            location.href = "http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp?shopdemo=" + shopdemo;
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
                    <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/denlv.jsp"
                       style="font-size: 11px;">注册新用户/忘记密码</a>
                </div>
            </form>
        </div>
    </div>
    <%--提示框--%>
    <div class="c2cyh" hidden style="z-index: 101">
        <p style="position:absolute;top: 15px;left:80px;font-size: 14px;color: orange"></p>
        <div align="center" style="z-index: 101;margin-right: 120px;margin-top: 15px">
            <img style="width: 45px;" src="\subject\loading.png" alt="">
            <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗提示</p>
            <br/>
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
                    <input class="shopse" type="search"
                           style="display:inline-block;border-radius:25px;margin-top: 15px;">
                    <img class="shopsele" src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px">
                </div>


                <div style="position: absolute;right: 1px;top: 1px">

                    <%--登录框--%>
                    <div class="dltis"
                         style="width: 160px;height: 55px;display:inline-block;position: absolute;right: 50px">
                        <div style="position: absolute;top: 10px;"><img src="\subject\yhu.png" class="dlu" alt=""
                                                                        width="40"></div>
                        <div class="grdiv" style="margin-left: 40px;border-top: 1px #ffffff solid">
                            <p class="hyp" hidden style="position: absolute;top: 12px;margin-top: 10px;"><strong
                                    style="font-size: 13px;">(<label class="userid"></label>)</strong></p>
                            <ul style=" padding:0; margin:0;list-style-type: none;margin-top: 60px" hidden class="grzx">
                                <li>个人中心</li>
                                <li id="nullopen">注销</li>
                            </ul>
                        </div>
                    </div>

                    <%--购物车框--%>
                    <div class="gouwuc"
                         style="width: 120px;height: 55px;display:inline-block;position: absolute;right: 10px">
                        <img src="\subject\gwc.png" alt="" width="40px"
                             style="position: absolute;top: 10px;margin-top: 2px">
                        <strong style="position: absolute;top: 12px;margin-top: 10px;width: 90px;margin-left: 40px"></strong>
                    </div>
                </div>
            </div>
            <%--导航栏内容--%>
            <div style="width: 1518px;height: 36px;background-color: #1e272e;">
                <ul class="sm">
                    <li><strong><a href="">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li>
                        <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp?shopdemo=">商品区</a><img
                            src="\subject\zuo.png" alt="" width="14px"></li>

                </ul>
            </div>
        </div>

        <%--海报框--%>
        <div id="stu" style="/*margin-top:80px;*/display:inline-block;">

            <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp?shopdemo="><img
                    src="\subject\sy1.jpg" alt="" width="1518px" height="502px" class="imgs" name="0"
                    style="display: block"></a>
            <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/home.jsp"><img src="\subject\sy2.jpg"
                                                                                                 alt="" width="1518px"
                                                                                                 height="502px"
                                                                                                 class="imgs" name="1"
                                                                                                 style="display: none"></a>
            <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/demo1.jsp"><img src="\subject\sy3.jpg"
                                                                                                  alt="" width="1518px"
                                                                                                  height="502px"
                                                                                                  class="imgs" name="2"
                                                                                                  style="display: none"></a>

            <ul id="smk">
                <li></li>
                <li></li>
                <li></li>
            </ul>

        </div>


        <div style="border: 1px #ffffff solid;width: 1517px;height: 460px" id="spl">
            <div align="center"
                 style="margin-top: 50px;margin-left: 35px;width: 230px;height: 40px;border: 1px #ffffff solid">
                <p style="display: inline-block">娱乐活动：<span style="display: inline-block;color: red">随机商品</span></p>
            </div>
            <c:forEach items="${list1}" var="lit">
                <ul>
                    <div id="img1">
                        <img style="width: 165px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label hidden class="lit1">${lit.comID}</label>
                    </div>
                </ul>
            </c:forEach>

            <c:forEach items="${list2}" var="lit">

                <ul>

                    <div id="img2">
                        <img style="width: 165px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit2" hidden>${lit.comID}</label>
                    </div>
                </ul>
            </c:forEach>
            <ul>
                <c:forEach items="${list3}" var="lit">

                    <div id="img3">
                        <img style="width: 165px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit3" hidden>${lit.comID}</label>
                    </div>
                </c:forEach>
            </ul>

            <c:forEach items="${list4}" var="lit">

                <ul>

                    <div id="img4">
                        <img style="width: 165px" src="${lit.comOve}">
                        <p style="text-align: center">${lit.comName}</p>
                        <label class="lit4" hidden>${lit.comID}</label>
                    </div>
                </ul>
            </c:forEach>
        </div>


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
</table>
</body>
</html>
