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

<style type="text/css">
    .sm li{
        list-style-type: none;
        display: inline-block;
        text-align: center;
        width: 180px;
        font-size: 16px;
        line-height: 36px;

    }
    .sm li a{
        text-decoration:none;
        color: white;
    }
    .sm{
        margin-top: 5px;
        color: white;
    }
    /*ul去黑点*/
    ul li {
        list-style: none;
    }

    /*购物车框架*/
    .buyshop {
        width: 1080px;
        background-color: #ffffff;
        border: 1px rgba(129, 129, 129, 0.66) solid;
    }



    /*选项*/
    .buyli li {
        padding-left: 80px;
        display: inline-block;
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
    .collect td{
        border-bottom: 1px #cccccc solid;
    }
    .grzx li{
        text-align: center;line-height: 30px;width: 75px;height: 30px;border-top: 1px #fff solid;color: #ccc;background-color: rgba(0,0,0,0.4)
    }
    /*结算框*/
    .buyrigh {
        width: 200px;
        border: 2px #959595 solid;
        position: fixed;
        left: 1150px;
        bottom: 425px;
        padding: 5px;
    }
    .c2cyh{
        border: orange 1.5px solid;
        background-color: white;
        position: fixed;
        width: 200px;
        height: 75px;
        top:50%;
        left: 50%;
        z-index: 3;
        margin-top: -75px;
        margin-left: -100px;
    }

</style>
<%--提示框--%>
<div class="c2cyh" hidden style="z-index: 101" >
    <p style="position:absolute;top: 15px;left:80px;font-size: 14px;color: orange"></p>
    <div align="center"style="z-index: 101;margin-right: 120px;margin-top: 15px">
        <img style="width: 45px;" src="\subject\loading.png" alt="">
        <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗提示</p>
        <br/>
    </div>
</div>
<body>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {

        //获得跳转这里的地址
        var url=document.referrer;
        // 判断是否直接跳入
        if (url == null || url == "") {
            location.href = "http://localhost:8080/Project_war_exploded/loldemo/home.jsp";
        }
        var pds ="<%=session.getAttribute("pds")%>";
        var oves ="<%=request.getAttribute("listove")%>";
        $(".oves").text(oves);

        var account ="<%=session.getAttribute("account")%>";

        if (account!=null&&account!=""&&account!="null"){
            $(".hyp").show();
            $(".userid").text(account);
        }else{
            $(".userid").hide();

        }
        //登录框
        if(account!=""&&account!=null&&account!="null"){
            $(".grdiv").hover(function () {
                $(".grzx").show();
                $(".grzx li").hover(function () {
                    $(this).css("color","#ffffff")
                },function () {
                    $(this).css("color","#ccc")
                })
            },function () {
                $(".grzx").hide();
            })
        }

        //注销
        $("#nullopen").click(function () {
            location.href="http://localhost:8080/Project_war_exploded/remouser";
        });
        if(pds=="false"){            //判断从登录jsp内传过来的值判断是否登录成功！
            location.href="http://localhost:8080/Project_war_exploded/loldemo/home.jsp"
        }

        if(account=="null"){
            $(".dlus").click(function () {
                $(".c2").show();
                $("#bg").show();
            });
        }else{
            $(".dlus").click(function () {
                $(".c2").hide();
                $("#bg").hide();
            });
        }

        $(".sm li a").hover(function () {
            $(this).css({"color":"#EE5A24"});
        },function () {
            $(this).css({"color":"#ffffff"});
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
        // $(".gwc").click(function () {
        //     if(account!=""&&account!=null&&account!="null"){
        //         var id=$(".bh").text();
        //         var name=$(".nam").text();
        //         var money=$(".mone").text();
        //         var size=$("input[name=size]").val();
        //         var ove=  $(".oves").text();
        //         var userid=$(".userid").text();
        //         location.href="http://localhost:8080/Project_war_exploded/inseshop?id="+id+"&name="+name+"&money="+money+"&size="+size+"&ove="+ove+"&userid="+userid+"";
        //     }else{
        //         alert("请先登录");
        //         $(".dlus").click();
        //         return false;
        //     }
        // });
        $(".gouwuc").click(function () {
            if(account!=""&&account!=null&&account!="null"){
                var userid=$(".userid").text();
                location.href="http://localhost:8080/Project_war_exploded/seleshop?id="+userid+"";
            }else{
                alert("请先登录");
                $(".dlus").click();
                return false;
            }
        });

        $(".shdz").click(function () {
            var userid=$(".userid").text();
            location.href="http://localhost:8080/Project_war_exploded/seleord?userid="+userid+"";
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

//默认选中

        var count = document.getElementsByName("goodsId");
        for (var i = 0; i < count.length; i++) {
            var state=($(".wcenter:eq(" + i + ")").next().next().next("span").text());
            if (state=="默认地址") {
                $(".wcenter:eq("+i+")").prop('checked',true);
                $(".wcenter:eq("+i+")").parent().css("border","2px #fbc531 solid");
            }
        }

      $(".wcenter").click(function() {
          var id=$(this).val();
          var userid = $(".userid").text();
          var count = document.getElementsByName("goodsId");
          var ids = new Array();

          for (var i = 0; i < count.length; i++) {
              if (count[i].checked != true) {
                  var idm = count[i].value; // value被绑定了ID
                  ids.push(idm);
              }
          }
          if (ids.length > 0) {
              location.href = "http://localhost:8080/Project_war_exploded/oraddup?id=" + id + "&userid=" + userid + "&ids="+ids+"";
          } else {
              alert("请先选中地址！");
          }
      });

        //提交订单
        $("#sumrder").click(function () {
           var money=$("#summonry").text();
           var count=$(".collname").length;
            var ids=new Array();
            for(var i=0;i<count;i++){
                    var name=$(".collname:eq("+i+")").html();
                    ids.push(name);
            }
            var ordernumbers=new Array();
            for(var i=0;i<count;i++){
                var order=$(".collname:eq("+i+")").next().html();
                ordernumbers.push(order);
            }
            var id=$("input[name='goodsId']:checked").val();
            var name=$("input[name='goodsId']:checked").next().text();
            var address=$("input[name='goodsId']:checked").next().next().text();
            var json={"name":name,"id":id,"address":address};
            $.getJSON("http://localhost:8080/Project_war_exploded/orderaddress?ordernumbers="+ordernumbers, json, function (data) {
                if (data>0){
                    location.href="http://localhost:8080/Project_war_exploded/payment/index.jsp?ids="+ids+"&money="+money+"&name="+name;
                }
            });
        })
        //个人中心
        $("#user").click(function () {
            location.href = "http://localhost:8080/Project_war_exploded/userquery";
        })
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
        </div>
    </div>
    <div <%--style="position: fixed;z-index: 999"--%>>
        <%--头部导航栏框--%>
            <div style="height:45px;background-color: white">

                <%--logo框--%>
                <div style="width: 300px;height: 45px;display:inline-block;margin-right:600px;margin-left: -20px;text-align: center">
                    <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                    <div style="display:inline-block;position: absolute;top: 18px"><strong style="font-size: 20px;">魄罗商城</strong></div>
                </div>
                <div style="position: absolute;right: 1px;top: 1px">
                    <%--登录框--%>
                    <div style="width: 160px;height: 55px;display:inline-block;margin-right: 25px">
                        <div  style="position: absolute;top: 5px;margin-top:3px"><img src="\subject\yhu.png" class="dlus" alt="" width="40"></div>
                        <div class="grdiv" style=";margin-left: 50px;border-top: 1px #ffffff solid">
                            <p hidden class="hyp" style="position: absolute;top: 12px;margin-top: 10px;"><strong style="font-size: 12px;">(<label class="userid"></label>)</strong></p>
                            <ul style=" padding:0; margin:0;list-style-type: none;margin-top: 60px" hidden class="grzx">
                                <li id="user">个人中心</li>
                                <li id="nullopen">注销</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        <div style="width: 1518px;height: 36px;background-color: #1e272e;">
            <ul class="sm">
                <li><strong><a href="http://localhost:8080/Project_war_exploded/loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="http://localhost:8080/Project_war_exploded/loldemo/index.jsp?shopdemo=">商品区</a><img src="\subject\zuo.png" alt="" width="14px"></li>
            </ul>
        </div>
    </div>
    <div align="center">

        <!--商品-->
        <div class="buyshop"  style="margin-top: 15px">
            <p align="left" style="color: #000000;margin-left: 15px">确认收货地址 </p>
            <div align="left" >
                <c:forEach items="${listord}" var="lits">
                    <ul style="list-style-type: none">
                        <li  style="border: 1px #cccccc solid;line-height: 40px;background-color: #ffffff;height: 40px;width: 1000px">
                            <input  class="wcenter" name="goodsId" value="${lits.id}" type="radio" >
                            收货人：<span>${lits.name}</span>
                            收货地址： <span>${lits.province}|${lits.city}|${lits.county}|${lits.address}</span>
                            <span style="position: absolute;left: 780px;font-size: 14px;color: #ccc">${lits.state}</span>
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
                           <td><img src="${lit.ove}" height="80" width="80"></td>
                           <td><span class="collname">${lit.name}</span><span hidden>${lit.ordernumber}</span></td>
                           <td>￥<span>${lit.money}</span></td>
                           <td>
                               <input  type="text" value="${lit.size}" readonly="readonly" size="1">
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
                                <input type="button" id="sumrder" value="提交订单" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: orangered;width: 203px;height: 50px;margin-top: -1px">
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
</body>
</html>
