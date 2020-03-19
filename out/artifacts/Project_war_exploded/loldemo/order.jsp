<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020-02-21
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单页面</title>
    <link rel="stylesheet" type="text/css" href="../js/order.css">
    <link rel="stylesheet" type="text/css" href="js/order.css">
</head>
<%--<style type="text/css"></style>--%>
<body>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        var oves ="<%=request.getAttribute("listove")%>";
        $(".oves").text(oves);

        var account ="<%=session.getAttribute("account")%>";

        if (account!=null&&account!=""&&account!="null"){
            $(".dlus").hide();
            $(".userid").text(account);
        }else{
            $(".userid").hide();
            $(".dlus").show();
        }
        $(".dlus").click(function () {
            $(".c2").show();
            $("#bg").show();
        });
        //弹框登录
        $(".userdl").click(function () {
            var username=$("input[name=username]").val();
            var userpwd=$("input[name=userpwd ]").val();
            location.href="http://localhost:6060/League_of_Legends_war_exploded/seluer?username="+username+"&userpwd="+userpwd+"";
        });
        $(".gb").click(function () {
            $(".c2").hide();
            $("#bg").hide();
        });
        $(".gwc").click(function () {
            if(account!=""&&account!=null&&account!="null"){
                var id=$(".bh").text();
                var name=$(".nam").text();
                var money=$(".mone").text();
                var size=$("input[name=size]").val();
                var ove=  $(".oves").text();
                var userid=$(".userid").text();
                location.href="http://localhost:6060/League_of_Legends_war_exploded/inseshop?id="+id+"&name="+name+"&money="+money+"&size="+size+"&ove="+ove+"&userid="+userid+"";
            }else{
                alert("请先登录");
                $(".dlus").click();
                return false;
            }
        });
        $(".gouwuc").click(function () {
            if(account!=""&&account!=null&&account!="null"){
                var userid=$(".userid").text();
                location.href="http://localhost:6060/League_of_Legends_war_exploded/seleshop?id="+userid+"";
            }else{
                alert("请先登录");
                $(".dlus").click();
                return false;
            }
        });
        $(".shdz").click(function () {
            var userid=$(".userid").text();
            location.href="http://localhost:6060/League_of_Legends_war_exploded/seleord?userid="+userid+"";
        });


        //总量计算

            //总金额
            var moyesum = 0.00;
            var index = $(".collect").length;

        //循环计算金额
        var count = $(".collect").length;

        for (var i = 0; i <= count; i++) {
            //单价
            var unit = $(".collect:eq(" + i + ")").find("td:eq(2)").find("span").text();
            var counts = $(".collect:eq(" + i + ")").find("td:eq(3)").find("input").val();
            var sum = counts * unit;

            $(".collect:eq(" + i + ")").find("td:eq(4)").find("span").text(sum);
        };
        for (var i = 0; i < index; i++) {
            //得到商品的金额
            var mo =  parseInt($(".collect:eq("+i+")").find("td:eq(4)").find("span").text());
            moyesum = mo + moyesum;
        };
        $("#summonry").text(moyesum);



    });
</script>
<%--遮罩层--%>
<div id="bg" hidden></div>
<%--最大的主体框--%>
<div style="width:1518px;;min-width:100%">
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
                    <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/denlv.jsp" style="font-size: 11px;" >注册新用户/忘记密码</a>
                </div>
            </form>
        </div>
    </div>
    <div <%--style="position: fixed;z-index: 999"--%>>
        <%--头部导航栏框--%>
        <div style="height:55px;background-color: white">

            <%--logo框--%>
            <div style="width: 300px;height: 55px;display:inline-block;margin-right:600px;margin-left: -20px;text-align: center">
                <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                <div style="display:inline-block;position: absolute;top: 18px"><strong style="font-size: 20px;">魄罗商城</strong></div>
            </div>
            <%--搜索框--%>
            <div style="width: 170px;height: 55px;display:inline-block;position:absolute;top: 6px;margin-left: 85px;text-align: center">
                <input type="search" style="display:inline-block;border-radius:25px;margin-top: 15px;">
                <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px" >
            </div>

            <%--登录框--%>
            <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">
                <img src="\subject\yhu.png" alt="" width="30" style="position: absolute;top: 12px;margin-left: 290px;margin-top: 5px">
                <strong style="position: absolute;top: 12px;margin-left: 330px;margin-top: 10px;width: 200px">欢迎,<a class="dlus">请登录</a><label class="userid"></label></strong>

            </div>
            <%--购物车框--%>
            <div style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">
                <img src="\subject\gwc.png" alt="" width="35px" style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">
                <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a class="gouwuc">购物车</a></strong>
            </div>

        </div>
        <div style="width: 1518px;height: 36px;background-color: #1e272e;">
            <ul class="sm">
                <li><strong><a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
            </ul>
        </div>
    </div>
    <div align="center">

        <!--商品-->
        <div class="buyshop"  style="margin-top: 15px">
            <p align="left" style="color: #000000;margin-left: 15px">确认收货地址 </p>
            <div align="left" >
                <c:forEach items="${listord}" var="lord">
                    <ul style="list-style-type: none">
                        <li  style="border: 1px #cccccc solid;line-height: 40px;background-color: #ffffff;height: 40px;width: 1000px"><input type="checkbox"><span></span>;地址：<span>
                        </span><span style="margin-left: 50px">
                        默认地址,----<a href="">删除</a>
                    </span>
                        </li>
                    </ul>
                </c:forEach>

            </div>

            <div align="left" style="margin-left: 40px;margin-bottom: 5px">
                <input type="button" class="shdz" value="收货地址管理" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: #e84118;width: 203px;height: 50px;margin-top: -1px">
            </div>
        </div>


<div align="center" style="border: 1px #ccc solid;width: 1080px;margin-top: 30px">
    <p align="left" style="color: #000000;margin-left: 15px">确认订单信息 </p>
   <div style="width: 1000px;border: 1px #ccc solid;margin-bottom: 25px;">

       <div align="center">

           <table  width="1000px" cellspacing="0">
               <%--选项--%>
               <tr  align="center" style="text-align: center;height: 30px;background-color: #000000;">
                   <td  style="color: #ffffff" >商品信息</td>
                        <td style="color: #ffffff">商品属性</td>
                   <td style="color: #ffffff">单价(元)</td>
                   <td style="color: #ffffff">数量</td>
                   <td style="color: #ffffff">金额</td>
               </tr>
                   <c:forEach items="${list1}" var="lit">
                       <tr style="text-align: center;" class="collect" >
                           <td><img src="${lit.comOve}" height="80" width="80"></td>
                            <td>${lit.comName}</td>
                           <td>￥<span>${lit.comMoney}</span></td>
                           <td>
                               <input  type="text" value="${lit.comSize}" readonly="readonly" size="1">
                           </td>
                           <td>￥<span class="moye"></span></td>
                       </tr>
                   </c:forEach>
           </table>
       </div>

       </div>

    <%--结算DIV --%>
            <div align="right">
                    <div align="right" style="width: 350px;border: 1px #ccc solid;background-color: #ffffff;margin-right: 40px;margin-bottom: 15px" >

                        <div style="display: inline;margin-left: 15px;margin-right: 15px">总额:¥<span id="summonry" style="color: #e84118;font-size: 19px;font-weight: bold"></span></div>
                        <div style="display:inline-block;">
                            <div align="right" style="margin-top: 1px">
                                <input type="button" value="提交订单" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: orangered;width: 203px;height: 50px;margin-top: -1px">
                            </div>

                    </div>
                    </div>
            </div>

        </div>

    </div>

    </div>

    <%--三个标标--%>
    <div style=" width: 1090px;height: 80px;display: inline-block;margin-left: 120px;margin-top: 80px">
        <ul style="list-style-type: none;display: inline-block">
            <li style="display: inline-block;margin-left: 220px;margin-right: 120px;"><img src="\subject\7.png" alt="" width="45px" style="vertical-align: middle"><a
                    style="font-size: 14px;">7天无理由退换货</a></li>
            <li style="display: inline-block;margin-left: 0;margin-right: 120px"><img src="\subject\z.png" alt="" width="45px" style="vertical-align: middle"><a
                    style="font-size: 14px">100%官方正品</a></li>
            <li style="display: inline-block;margin-left: 0;margin-right: 0"><img src="\subject\m.png" alt="" width="45px" style="vertical-align: middle"><a
                    style="font-size: 14px">全场每单满199元包邮</a></li>
        </ul>
    </div>

    <%--第三大尾部--%>
    <div style="width: 1519px;height: 82px;background-color: #bdc3c7;margin: 0">
        <ul>
            <li style="list-style-type: none">
                <img src="\subject\LOl.png" alt="" height="45px "
                     style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
                <img src="\subject\loading.png" alt="" height="45px " style="margin-top: 18px;vertical-align: middle">
                <p style="font-size: 12px;color: white;margin-top: -55px;margin-left: 645px;width: 360px;white-space:pre-wrap;">
                    Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456
                    客服邮箱：54181452@.qq.com </p>
            </li>
        </ul>
    </div>
</div>
<%--   <div style="padding-left: 200px;padding-top: 20px" id="deleteAll" class="usershop">删除选中的商品</div>--%>


</body>

</html>
