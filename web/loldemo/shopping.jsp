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
    <title>我的购物车</title>
    <link rel="stylesheet" type="text/css" href="../js/shopping.css">
    <link rel="stylesheet" type="text/css" href="js/shopping.css">
</head>
<%--<style type="text/css"></style>--%>
<body>

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
                    <a href="http://localhost:8080/Project_war_exploded/loldemo/denlv.jsp" style="font-size: 11px;" >注册新用户/忘记密码</a>
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
                    <img src="\subject\yhu.png" alt="" width="30"
                         style="position: absolute;top: 12px;margin-left: 260px;margin-top: 5px">
                    <strong style="position: absolute;top: 12px;margin-left: 295px;margin-top: 10px;width: 200px"><span
                            id="greet">欢迎,请</span><a href="#" id="register" class="dlu">登录</a>
                        <%--存放账号--%>
                        <label class="userid"></label>
                        <span id="account"></span>
                        <span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
                </div>


        </div>
            <div style="width: 1518px;height: 36px;background-color: #1e272e;">
                <ul class="sm">
                    <li><strong><a href="http://localhost:8080/Project_war_exploded/loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                    <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                </ul>
            </div>
    </div>
    <div align="center">
    <%--购物车主体--%>
    <div class="buyshop"  align="center">

        <!--商品-->
        <table align="center" class="mermtab" width="1191px" cellspacing="0" cellpadding="10" style="margin-left: -10px;table-layout:fixed">
            <%--选项--%>
            <tr align="center" id="xuan" style="margin-left: -15px;height: 30px;background-color: #fdcb6e;">

                <td style="width: 60px">
                    <input id="selectAll" type="checkbox">
                    <label for="selectAll" style="color: #ffffff">全选 </label>
                </td>
                <td></td>
                <td style="color: #ffffff">商品信息</td>
                <td style="color: #ffffff">单价(元)</td>
                <td style="color: #ffffff">数量</td>
                <td style="color: #ffffff">金额</td>
                <td style="color: #ffffff">操作</td>
            </tr>
<c:forEach items="${list}" var="lit">
    <tr class="collect">
        <td><label><input class="wcenter" name="goodsId" value="${lit.comID}"  type="checkbox"></label></td>
        <td><img src="${lit.comOve}" height="80" width="80"></td>
        <td>${lit.comName}<p></p><label style="display:inline-block;font-size: 11px;color: #ccc">库存:</label><p style="display: inline;font-size: 11px;color: #ccc">${lit.comQuantity}</p></td>
        <td>￥<span class="unit">${lit.comMoney}</span></td>
        <td><img src="\subject\taobao_minus.jpg" alt="minus"  style="width: 15px;height: 15px" class="minus">
            <input class="num" type="text" value="${lit.comSize}" readonly="readonly" size="1">
            <img src="\subject\taobao_adding.jpg" alt="add" style="width: 15px;height: 15px;" class="adding"/>
            <label hidden>${lit.comID}</label>
        </td>
        <td>￥<span class="moye"></span></td>
        <td>
            <div>
                <p style=";margin-bottom: 10px" class="deleshop">删除</p>
                <label hidden class="shopid">${lit.comID}</label>
                <p>移入收藏夹</p>
            </div>
        </td>
    </tr>
</c:forEach>
        </table>
        <div class="ycgwc" hidden style="width: 1191px;height: 300px">
            <div align="center" style="line-height: 300px">购物车内没商品,请添加</div>
        </div>

            <div class="navBox_2" style="top: 95px;background-color: rgba(33,33,33,0.1)" >
                    <div align="right" style="border-top:1px #cccccc solid;">
                        <div align="left" style="position: absolute;left: 195px;margin-top: 15px;display: inline-block">
                            <div align="left" style="display: inline-block;color: #e84118" onclick="deleteUsers()">删除商品</div>
                        </div>
                        <div style="display: inline-block">已选商品：<span id="numcount" style="color: #e84118;font-size: 16px;font-weight: bold">0</span>件</div>
                     <div style="display: inline-block;margin-left: 15px;margin-right: 15px">总额：<span class="cfb6" style="color: #e84118;font-size: 16px;font-weight: bold">¥<font class="cfb6 f16" id="tota">0.00</font></span></div>
                        <div style="display:inline-block;" align="right">
                            <div align="right" >
                                <input onclick="ddcg()" type="button" value="采购" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: #05c46b;width: 203px;height: 50px;margin-top: -1px">
                            </div>
                        </div>

                         <!--无商品 去结算-样式 buy_bothui-->
                </div>
            </div>
        </div>
    </div>
</div>
    <%--三个标标--%>
    <div style=" width: 1090px;height: 80px;display: inline-block;margin-left: 120px;margin-top: 270px">
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
    <div style="width: 1519px;height: 82px;background-color: #bdc3c7;margin: 0;">
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





</body>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {

        //判断是否登录
        var account ="<%=session.getAttribute("account")%>";
        if (account!=null&&account!=""&&account!="null"){
            $("#register").hide();
            $("#greet").hide();
            $("#cancel").show();
            $("#account").text(account);
        }else {

        }
        //获得跳转这里的地址
        var url=document.referrer;
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
            $.getJSON("http://localhost:8080/Project_war_exploded/userclear", "", function (data) {})
            location.href = "http://localhost:8080/Project_war_exploded/comselete";
        });

        // 单击账号
        $("#account").click(function () {
            var id=$(this).text();
            location.href="http://localhost:8080/Project_war_exploded/userquery?id="+id;
        });

        var sm=$(".shopid").text();
        if (sm==""){
            $(".ycgwc").show();
        } else{
            $(".ycgwc").hide();
        }


        //删除商品
        $(".deleshop").click(function () {
           var shopid=$(this).next("label").text();
           var userid=$(".userid").text();
           location.href="http://localhost:8080/Project_war_exploded/dlshop?shopid="+shopid+"&userid="+userid+"";
        });



        });
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
        $(".gb").click(function () {
            $(".c2").hide();
            $("#bg").hide();
        });


    //批量删除
    function deleteUsers(){
        var userid=$(".userid").text();
        var count = document.getElementsByName("goodsId");
        var ids=new Array();

        for(var i=0;i<count.length;i++){
            if(count[i].checked==true){
                var id=count[i].value; // value被绑定了ID
                ids.push(id);
            }
        }

        if(ids.length>0){
            if(confirm("确定要删除选中的商品吗")){
                //确定要删除
                location.href="http://localhost:8080/Project_war_exploded/dlusesp?shopid="+ids;
            }
        }else{
            alert("请先选中要删除的用户数据！");
        }
    }
//订单采购
    function ddcg(){
        var userid=$(".userid").text();
        var count = document.getElementsByName("goodsId");
        var ids=new Array();
        for(var i=0;i<count.length;i++){
            if(count[i].checked==true){
                var id=count[i].value; // value被绑定了ID
                ids.push(id);
            }
        }
        if(ids.length>0){
            location.href="http://localhost:8080/Project_war_exploded/ddcgsele?shopid="+ids+"&useid="+userid+"";
        }else{
            alert("请先选中要采购的商品！");
        }
    }

        //绑定事件
        //选中
        $(".wcenter").on("click",function () {
            var shopid=($(this).next("label").text());
            var userid=$(".userid").text();
            var id=0;
            var count = document.getElementsByName("goodsId");
            var sum=($(".wcenter").length);
            var CheckedCount=0;

            //若子选按钮全选中，则全选按钮也选中
            for(var i=0;i<count.length;i++){
                if(count[i].checked==true){
                    CheckedCount++;
                }
            }
            if(sum==CheckedCount){
                document.getElementById("selectAll").checked=true;
            }else{
                document.getElementById("selectAll").checked=false;
            }
            moyesum();

        });
        //减
        $(".minus").on("click",function () {
            //商品id
            var userid=$(".userid").text();
            var id=$(this).siblings("label").text();
            var count = $(this).next().val();
            count--;
            if (count < 1) {
                count = 1;
                alert("不能低于1")
            }else{
                var sums=count;
                var unit = $(this).parent().prev().find("span").text();
                var sum = count * unit;
                $(this).next().val(count);
                $(this).parent().next().find("span").text(sum);
                location.href="http://localhost:8080/Project_war_exploded/shopud?userid="+userid+"&shopid="+id+"&sum="+sums+"";
                moyesum();
            }

        });
        //加
        $(".adding").on("click",function () {
            //商品id
            var userid=$(".userid").text();
            var id=$(this).siblings("label").text();
            var count = $(this).prev().val();
            count++;
            if(count>$(this).parent().prev().prev().find("p").text()){
                count--;
                alert("数量不能大于库存！");
            }else {
                alert(count)
                var sums=count;
                var unit = $(this).parent().prev().find("span").text();
                var sum = count * unit;
                $(this).next().val(count);
                $(this).parent().next().find("span").text(sum);
                location.href="http://localhost:8080/Project_war_exploded/shopud?userid="+userid+"&shopid="+id+"&sum="+sums+"";
                moyesum();
            }
        });


        //总量计算
        var moyesum = function () {
            //总数量
            var countsum = 0;
            var index = $(".wcenter").length;
            for (var i = 0; i < index; i++) {
                var boolea = $(".wcenter:eq(" + i + ")").is(":checked");
                if (boolea) {
                    //得到商品的数量
                    var mo = parseInt($(".wcenter:eq(" + i + ")").parent().parent().siblings("td:eq(3)").find("input").val());
                    boolea = false;
                    countsum = mo + countsum;
                }
            }
            ;
            $("#numcount").text(countsum);

            //总金额
            var moyesum = 0.00;
            for (var i = 0; i < index; i++) {
                var boolea = $(".wcenter:eq(" + i + ")").is(":checked");
                if (boolea) {
                    //得到商品的金额
                    var mo = parseFloat($(".wcenter:eq(" + i + ")").parent().parent().siblings("td:eq(4)").find("span").text());
                    boolea = false;
                    moyesum = mo + moyesum;
                }
            }
            ;
            $("#tota").text(moyesum);
        };

        //循环计算金额
        var count = $(".collect").length;
        for (var i = 0; i <= count; i++) {
            //单价
            var unit = $(".collect:eq(" + i + ")").find("td:eq(3)").find("span").text();
            var counts = $(".collect:eq(" + i + ")").find("td:eq(4)").find("input").val();
            var sum = counts * unit;
            $(".collect:eq(" + i + ")").find("td:eq(5)").find("span").text(sum);

        };

        // //减个数
        // $(".minus").click(function () {
        // });
        // //加个数
        // $(".adding").click(function () {
        // });

        //全选
        $('#selectAll').click(function () {

            if ($('#selectAll').is(':checked')) {//判断是否被选中
                $(".wcenter").each(function () {
                    this.checked = true;
                });
                moyesum();
            } else {
                $(".wcenter").each(function () {
                    this.checked = false;
                });
                moyesum();
            };
    });
</script>
</html>
