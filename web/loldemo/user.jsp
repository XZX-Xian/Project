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
    <title>用户中心</title>
    <link rel="stylesheet" type="text/css" href="../js/userCss.css">
    <link rel="stylesheet" type="text/css" href="js/userCss.css">
</head>
<%--<style type="text/css"></style>--%>
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
                         style="position: absolute;top: 12px;margin-left: 260px;margin-top: 5px">
                    <strong style="position: absolute;top: 12px;margin-left: 295px;margin-top: 10px;width: 200px"><span
                            id="greet">欢迎,请</span><a href="#" id="register" class="dlu">登录</a>
                        <%--存放账号--%>
                        <label class="userid"></label>
                        <span id="account"></span>
                        <span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
                </div>
                <%--购物车框--%>
                <div class="gouwuc" style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">
                    <img src="\subject\gwc.png" alt="" width="35px" style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">
                    <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a>购物车</a></strong>
                </div>

        </div>
        <%--导航栏内容--%>
        <div style="width: 1518px;height: 36px;background-color: #1e272e;">
            <ul class="sm">
                <li><strong><a href="loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="loldemo/index.jsp">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="#">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="#">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
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
            <%--个人资料--%>
            <li>
                <c:forEach var="in" items="${list}">
                    <%--头提示--%>
                    <div class="memright clearf">
                        <div class="mem_sai clearf">
                            <div class="clearf lh20 c666">
                                <span class="c000">维护您的个人信息</span><br>
                                完善以下个人信息，将有助于我们为您提供更定制化的服务。
                            </div>
                        </div>

                        <div class="memtabbar">
                            <form id="userInfoForm" action="http://localhost:8080/Project_war_exploded/userupdate">
                                <input type="hidden" id="province_hid" value="">
                                <input type="hidden" id="city_hid" value="">
                                <input type="hidden" id="district_hid" value="">
                                <table border="0" cellspacing="0" cellpadding="0" class="memtab">
                                    <tbody>
                                    <tr>
                                        <th colspan="2">个人资料</th>
                                    </tr>
                                    <tr class="user_qq" style="">
                                        <td width="200" class="right">账号：</td>
                                        <td width="740"><span id="userAccount">${in.account}</span></td>
                                        <td><input type="text" value="${in.account}" name="account" hidden></td>
                                    </tr>
                                    <tr>
                                        <td width="200" class="right">游戏大区：</td>
                                        <td width="740">
                                            <span hidden id="state">${in.state}</span>
                                            <select name="region" id="regionId" style="width:120px;">
                                                <option value="0">请选择大区</option>
                                                <option value="1">艾欧尼亚 电信</option>
                                                <option value="2">比尔吉沃特 网通</option>
                                                <option value="3">祖安 电信</option>
                                                <option value="4">诺克萨斯 电信</option>
                                                <option value="6">德玛西亚 网通</option>
                                                <option value="5">班德尔城 电信</option>
                                                <option value="7">皮尔特沃夫 电信</option>
                                                <option value="8">战争学院 电信</option>
                                                <option value="9">弗雷尔卓德 网通</option>
                                                <option value="10">巨神峰 电信</option>
                                                <option value="11">雷瑟守备 电信</option>
                                                <option value="12">无畏先锋 网通</option>
                                                <option value="13">裁决之地 电信</option>
                                                <option value="14">黑色玫瑰 电信</option>
                                                <option value="15">暗影岛 电信</option>
                                                <option value="17">钢铁烈阳 电信</option>
                                                <option value="16">恕瑞玛 网通</option>
                                                <option value="19">均衡教派 电信</option>
                                                <option value="18">水晶之痕 电信</option>
                                                <option value="21">教育网专区</option>
                                                <option value="22">影流 电信</option>
                                                <option value="23">守望之海 电信</option>
                                                <option value="20">扭曲丛林 网通</option>
                                                <option value="24">征服之海 电信</option>
                                                <option value="25">卡拉曼达 电信</option>
                                                <option value="27">皮城警备 电信</option>
                                                <option value="26">巨龙之巢 网通</option>
                                                <option value="30">男爵领域 全网络</option>
                                            </select>
                                            <span style="color:red;display:none" id="regionIdPrompt" class="pl5 c999">请选择游戏大区</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="200" class="right"><font class="cfb6">*</font> 生日：</td>
                                        <td width="740">
                                            <input name="birthday" id="birthday" type="text" value="${in.birthday}">
                                            <span>yy-mm-dd</span>
                                            <span style="color:red;display:none" id="birthdayPrompt"
                                                  class="pl5 c999">请填写生日或正确格式</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="200" class="right"><font class="cfb6">*</font> 性别：</td>
                                        <td id="sexMan" width="740">
                                            <span hidden id="sexId">${in.sex}</span>
                                            <input type="radio" name="sex" value="男" class="sexs" checked>男
                                            <input type="radio" name="sex" value="女" class="sexs">女
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200" valign="top" class="right"><span class="lh24"><font
                                                class="cfb6">*</font> 手机：</span></td>
                                        <td width="740"><input value="${in.phone}" name="userInfo" id="mobile"
                                                               type="text" size="15">
                                            <span style="color:red;display:none" id="mobilePrompt">请填写正确的手机号码</span>
                                            <br><img src="//img.lolriotmall.qq.com/imgjs_pc/images/member/mobile.jpg"
                                                     style="vertical-align:middle"><span
                                                    class="cfb6 pl5">填写手机号码!</span></td>
                                    </tr>
                                    <tr>
                                        <td width="200" class="right"><font class="cfb6">*</font> 邮箱：</td>
                                        <td width="740"><input value="${in.email}" name="email" id="email"
                                                               type="text"
                                                               class="gew_inp" size="20">
                                            <span style="color:red;display:none" id="emailPrompt">请填写正确电子邮件</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td width="200" class="right">&nbsp;</td>
                                        <td width="740" height="60">
                                            <input type="submit" value="提交" id="personage">
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </c:forEach>
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
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

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


        //判断是否直接跳入
        if (url == null || url == "") {
            location.href = "http://localhost:8080/Project_war_exploded/comselete";
        }

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

        //单击购物车
        $(".gouwuc").click(function () {
            location.href="http://localhost:8080/Project_war_exploded/seleshop";
        });

        // 我的购物车
        $("#shopping").click(function () {
            location.href="http://localhost:8080/Project_war_exploded/seleshop";
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

        //个人资料
        //下拉框 大区
        var reop = $("#state").text();
        $("#regionId").val(reop);

        //性别
        var sex = $("#sexId").text();
        $("input[type='radio'][value=" + sex + "]").attr("checked", "checked");

        //生日验证
        var birthdayreg = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;
        $("#birthday").blur(function () {
            var birthday=$("#birthday").val();
            if (birthday==null||birthday==""||(birthdayreg.test(birthday)==false)){
                $("#birthdayPrompt").show();
            }else {
                $("#birthdayPrompt").hide();
            }
        });
        //手机验证
        var phonereg=/^1(3|4|5|6|7|8|9)\d{9}$/
        $("#mobile").blur(function () {
            var phone=$("#mobile").val();
            if (phone==""||phone==null||(phonereg.test(phone)==false)){
                $("#mobilePrompt").show();
            }else {
                $("#mobilePrompt").hide();
            }
        });

        //邮箱
        var emailreg=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        $("#email").blur(function () {
            var email=$("#email").val();
            if (email==""||email==null||(emailreg.test(email)==false)){
                $("#emailPrompt").show();
            }else {
                $("#emailPrompt").hide();
            }
        });

        //表单验证
        $("#userInfoForm").submit(function () {
            //生日
            var birthday=$("#birthday").val();
            if (birthday==null||birthday==""||(birthdayreg.test(birthday)==false)){
                $("#birthdayPrompt").show();
                $("#birthday").focus();
                return false;
            };
            //手机号
            var phone=$("#mobile").val();
            if (phone==""||phone==null||(phonereg.test(phone)==false)){
                $("#mobilePrompt").show();
                $("#mobile").focus();
                return false;
            };
            //邮箱
            var email=$("#email").val();
            if (email==""||email==null||(emailreg.test(email)==false)){
                $("#emailPrompt").show();
                $("#emai").focus();
                return false;
            }
        });

        //悬浮a连接时带下划线
        $("a").hover(function () {
            $(this).addClass("a");
        }, function () {
            $(this).removeClass("a");
        });

        $("#list li:eq(4)").addClass("list");
        // 根据下标显示内容

        // $("#list li").click(function () {
        //     var inde = $(this).index();
        //     $("#list li:eq(" + inde + ")").addClass("list");
        //     $("#list li:eq(" + inde + ")").siblings().removeClass("list");
        //     //下标减一
        //     inde = inde - 1;
        //     $("#content li:eq(" + inde + ")").show();
        //     $("#content li:eq(" + inde + ")").siblings().hide();
        // })

        // //收货地址


        // // 购物车
        // $("#shopping").click(function () {
        //     location.href = "";
        // });
        // //商品收藏
        // $(".mem_shouc").click(function () {
        //     if ($('#selectAll').is(':checked')) {//判断是否被选中
        //         $(".wcenter").each(function () {
        //             this.checked = true;
        //         });
        //     } else {
        //         $(".wcenter").each(function () {
        //             this.checked = false;
        //         });
        //     }
        // });
        //
        // //==>我的订单
        // // 连接悬浮时添加样式
        // $(".mem_saileft a").hover(function () {
        //     $(this).addClass("sai");
        // }, function () {
        //     $(this).removeClass("sai");
        // });
        //
        // //     var zhi=$("#zhi").text();
        // // if (zhi=="" ||zhi==null){
        // //     $("#zhi").text("zhi");
        // //     $("#detailsHer").click(alert("110"));
        // // }
        //
        //
        // // 点击链接时条件查询
        // $(".mem_saileft a").click(function () {
        //     var id = $(this).index();
        //     // location.href = "";
        //     // location.href="?id="+id;
        // });
        //
        //

        //
        // //列表文字悬浮时带下划线
        // $("#list li").hover(function () {
        //     $(this).addClass("a");
        // }, function () {
        //     $(this).removeClass("a");
        // });
        //
        // //默认选择个人资料
        // // $("#content li:eq(3)").show();
        // // $("#list li:eq(4)").addClass("list");
        // var count = $("#content li").length;
        // for (var i = 0; i < count; i++) {
        //     if ($("#content li:eq(" + i + ")").is(":visible")) {
        //         var inde = i + 1;
        //         $("#list li:eq(" + inde + ")").addClass("list");
        //     }
        // }
        //

    });
</script>
</html>
