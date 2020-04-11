<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="webproject.entity.Comm" %>
<%@ page import="webproject.service.UserService" %>
<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2020-2-8 0008
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

%>
<html>
<head>
    <title>商品详情页</title>
    <link rel="stylesheet" type="text/css" href="../js/details.css">
    <link rel="stylesheet" type="text/css" href="js/details.css">
</head>
<link rel="icon" href="\subject\loading.png">
<body>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
  $(function () {
      //登录判断
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
      var sum=0;
      var size=0;
      //数量减少
      $(".fu").click(function () {
          this.form.size.value--;
           size=$("input[name=size]").val();
          if (size<1){
              alert("数量不得少于1")
              this.form.size.value++;
              sum=((size+1)*<%=request.getAttribute("listmoney")%>);
              $("#sum").text(sum);
              return false;
          }else{
              sum=(size*<%=request.getAttribute("listmoney")%>);
              $("#sum").text(sum);
          }
      });

      //数量增加
      $(".jia").click(function () {
        this.form.size.value++;
        size=$("input[name=size]").val();
            if (size><%=request.getAttribute("listquantity")%>){
              alert("数量不得大于库存");
                this.form.size.value--;
                sum=((size-1)*<%=request.getAttribute("listmoney")%>);
                $("#sum").text(sum);
                return  false;
          }else{
                sum=(size*<%=request.getAttribute("listmoney")%>);
                $("#sum").text(sum);
            }
      });

      //展示图片一
      $(".out").mousemove(function () {
          $(".perso").attr("src","<%=request.getAttribute("listout")%>");
      });

      //展示图片二
      $(".ove").mouseover(function () {
          $(".perso").attr("src","<%=request.getAttribute("listove")%>");
      });

      //弹框登录
      $(".userdl").click(function () {
          var username=$("input[name=username]").val();
          var userpwd=$("input[name=userpwd ]").val();
          location.href="http://localhost:8080/Project_war_exploded/seluer?username="+username+"&userpwd="+userpwd+"";
      });

      //单击加入购物车
      $(".gwc").click(function () {
          if (account!=null&&account!=""&&account!="null"){
          var id=$(".bh").text();
          var name=$(".nam").text();
              var money=$(".mone").text();
                  var size=$("input[name=size]").val();
                      var ove=  $(".oves").text();
                      var userid=$("#account").text();
          location.href="http://localhost:8080/Project_war_exploded/inseshop?id="+id+"&name="+name+"&money="+money+"&size="+size+"&ove="+ove+"&userid="+userid+"";
          }else {
              $("#register").trigger('click');
          }
      });

      //单击购物车
      $(".gouwuc").click(function () {
          if(account!=""&&account!=null&&account!="null"){
              var userid=$(".userid").text();
              location.href="http://localhost:8080/Project_war_exploded/seleshop?id="+userid+"";
          }else{
              // alert("请先登录");
              $("#register").click();
              // $(".dlus").click();
              // return false;
          }
      });

      //单击购买
      $("#buy").click(function () {
          if(account!=""&&account!=null&&account!="null"){
              // var userid=$(".userid").text();
              // location.href="http://localhost:8080/Project_war_exploded/seleshop?id="+userid+"";
          }else{
              // alert("请先登录");
              $("#register").click();
              // $(".dlus").click();
              // return false;
          }
      })

      //获得跳转这里的地址
      var url=document.referrer;
      //获得当前页面的地址
      var href=window.location.href;
      //获的页面状态
      var pd="<%= session.getAttribute("pd")%>";
      //修改页面状态
      if (pd=="null"){
          location.href="http://localhost:8080/Project_war_exploded/pagestate";
      }

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
          if (url==href&&pd=="true"){
              alert("登录失败!");
              //重置页面状态
              location.href="http://localhost:8080/Project_war_exploded/pagestate";
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

      //关闭登录框
      $(".gb").click(function () {
          $(".c2").hide();
          $("#bg").hide();
      });
  })


</script>
<style type="text/css">

</style>
<p class="oves" hidden></p>
<%--遮罩层--%>
<div id="bg" hidden></div>

<form action="" >
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

        <div align="center">
                <%--头部--%>
            <div  align="center" style="width: 1080px;height: 60px;background-color: #ffffff;/*position: fixed;z-index: 999;*/">
                    <%--logo--%>

                    <%--头部导航栏框--%>
                <div a style="height:55px;background-color: white;margin-bottom: 30px;">

                        <%--logo框--%>
                    <div style="width: 300px;height: 55px;display:inline-block;margin-right: 820px;margin-left: -120px;text-align: center">
                        <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                        <div style="display:inline-block;position: absolute;top: 20px"><strong style="font-size: 20px;">魄罗商城</strong>
                            <p style="font-size: 12px;color: #ccc">商品详情</p>
                        </div>
                    </div>
                        <%--搜索框--%>
                    <div style="width: 170px;height: 55px;display:inline-block;position:absolute;left:550px;top: 6px;text-align: center">
                        <input type="search" style="width: 400px;height: 40px;display:inline-block;border-radius:25px;margin-top: 15px;font-size: 21px">
                        <img src="\subject\cx.png" alt="" width="35 px" style="position: absolute;top: 15px;left: 405px" >
                    </div>
                        <%--购物车框--%>
                    <div class="gouwuc" style="height: 55px;display:inline-block;float: right;margin-top: -45px;margin-right: 55px;">
                        <img src="\subject\gwc.png" style="cursor: pointer;" alt="" width="42px" >
                    </div>

                            <%--登录框--%>
                            <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px;">
                                <img src="\subject\yhu.png" alt="" width="30"
                                     style="position: absolute;top: 12px;margin-left: 270px;margin-top: 5px;">
                                <strong style="position: absolute;top: 12px;margin-left: 300px;margin-top: 10px;width: 200px;" align="left">
                                    <span id="greet">欢迎,请</span><a href="#" id="register" class="dlu">登录</a>
                                    <%--存放账号--%>
                                    <span id="account"></span>
                                    <span id="cancel" hidden style="padding-left: 10px;color:#EE5A24; ">注销</span></strong>
                            </div>

                </div>

            </div>

                    <%--三级联动--%>
                    <div  style="width: 1082px;height: 36px;margin-top: 35px;">
                        <div align="left" style="width: 1082px;height: 36px;background-color: #0abb26;">
                            <ul  class="sm">
                                <li><strong><a href="loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                                <li><a href="loldemo/index.jsp">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                                <li><a href="#">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                                <li><a href="#">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                            </ul>
                        </div>
                    </div>

                <%--内容框--%>
            <div style="width: 1080px;height: 680px;margin-top: 0;border: 1px #ccc solid">

                <div style="width: 500px;height: 500px;float: left;display: block;margin-left: 40px;margin-top: 25px;">
                    <div style="display: block;margin-right: 20px;margin-top: 40px">
                        <img style="width: 300px;height: 340px" class="perso" src="<%=request.getAttribute("listove")%>" alt="">
                    </div>
                    <div class="ove" style="display: inline-block;border: 1px #ccc solid;width: 50px;height: 50px;margin-top: 50px;margin-right: 30px">
                        <img  style="width: 50px;height: 50px" src="<%=request.getAttribute("listove")%>" alt="">
                    </div>

                    <div class="out" style="display: inline-block;border: 1px #ccc solid;width: 50px;height: 50px;margin-top: 50px">
                        <img style="width: 50px;height: 50px" src="<%=request.getAttribute("listout")%>" alt="">
                    </div>
                </div>

                <div style="display: inline-block;width: 460px;margin-top: 25px">

                    <div align="right" style="align-items: center">

                        <ul class="shangp">
                            <li >
                                <h4 align="left">商品类型:<%=request.getAttribute("listproduct")%></h4>
                                <span style="font-size: 12px;color: #ccc">项目编号：<label  class="bh" style="font-size: 12px;color: #ccc"><%=request.getAttribute("listcomId")%></label></span>
                            </li>
                        </ul>
                    </div>


                    <div align="left">
                        <ul class="shangp">
<%--                            <div align="right">--%>
<%--                            </div>--%>
                            <li>
                                <p style="font-size: 24px" class="nam"><%=request.getAttribute("listname")%></p>
                                <p style="display: inline;font-size: 25px;font-weight: bold" class="mone"><%=request.getAttribute("listmoney")%></p><label style="font-size: 13px">RMB</label>
                                <div style="height: 15px"></div>
                            </li>
                        </ul>

                        <%--收藏、交易量--%>
                        <button style="border: 1px red solid;width: 45px;height: 45px;position: absolute;top:265px;right: 280px;background-color: white;font-size: 12px">收藏</button>
                        <text disabled style="text-align: center;border: 1px red solid;width: 43px;height: 40px;position: absolute;top:325px;right: 280px;background-color: white;font-size: 9px;padding-top: 5px">交易量<p style="margin-top: 5px;font-size: 12px"><%=request.getAttribute("listcount")%></p></text>
                    </div>

                    <div align="left">
                        <ul class="shangp">
                            <li>
                                <p style="font-size: 11px;color: #333"> 明天起将 -  CJ快递</p>
                                <p  style="font-size: 11px;color: #333">运费为3,000元 （订单金额为50,000元以上免费）</p>
                            </li>
                        </ul>
                    </div>

                    <div align="left">
                        <ul class="shangp">
                            <li>
                                <p style="font-size: 13px">颜色：<%=request.getAttribute("listcolor")%></p>
                                <p  style="font-size: 13px">尺码：<%=request.getAttribute("listmodell")%></p>
                            </li>
                        </ul>
                    </div>


                    <div align="left">
                        <ul class="shangp">
                            <li>
                                <p style="font-size: 13px">库存:<%=request.getAttribute("listquantity")%></p>


                            </li>
                        </ul>
                    </div>

                    <div align="right">
                        <div align="left">
                            <ul style="list-style-type: none">
                                <li>
                                    <p style="font-size: 13px">数量</p>
                                    <input type="button" class="fu" style="height: 25px;border: 1px #999999 solid;width: 26px;text-align: center;"  value="-">
                                    <input type="text" disabled  name="size" style="background-color: white;width: 43px;text-align: center;border: 1px solid #999999;border-left: none; border-right: none;height: 25px;margin-left: -5px" value="1">
                                    <input type="button" style="height: 25px;border: 1px #999999 solid;width: 25px;text-align: center;margin-left: -5px" class="jia" value="+" >

                                </li>
                            </ul>

                        </div>
                        <ul class="shangp" style="margin-top: -15px">
                            <li>
                                <p style="font-size: 18px">总额:<span id="sum"><%=request.getAttribute("listmoney")%></span><label style="font-size: 13px">:00RMB</label></p>
                            </li>
                        </ul>
                    </div>

                    <div>

                        <div class="gwc" align="center" style="margin-top: 10px;display: inline-block;margin-left: 30px">
                            <input type="button" value="加入购物车" style="border:1px #ccc solid;font-size: 15px;font-weight: bold;color: black;margin-right:5px;background-color: #ffffff;border-radius: 5px;width: 203px;height: 50px;">
                        </div>
                        <div align="center" style="margin-top: 10px;display: inline-block">
                            <input id="buy" type="button" value="采购" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: #2e8de5;border-radius: 5px;width: 203px;height: 50px;">
                        </div>
                    </div>

                </div>
            </div>

                <%--详细--%>

            <div style="margin-top: 25px;width: 1080px;background-color: rgba(223, 230, 233,0.4)">
                <div  align="left" style="margin-top: 15px;width: 1076px;border: 2px #ccc solid;background-color: #ffffff">
                <div style="margin-left: 45px;">

                    <p align="center" style="margin-left: -75px">商品详情资料</p>
                    <p style="display: inline-block;margin-top: -5px">品牌名称：<%=request.getAttribute("listbrand")%></p>
                    <p style="display: block">产品参数:<%=request.getAttribute("listmodell")%></p>
                    <p style="display: inline-block;margin-right: 120px">型号:<%=request.getAttribute("listmodell")%></p>
                    <p style="display: inline-block;margin-right: 120px">积累评价：<%=request.getAttribute("listappcount")%></p>
                    <p style="display: inline-block;margin-right: 120px;margin-bottom: 20px">出售状态:<%=request.getAttribute("liststate")%></p>
                </div>
                </div>


                <img align="center" src="<%=request.getAttribute("listcctv")%>" alt="" style="width: 850px;margin-top: 35px">

            </div>
                    <div align="center" style="width: 1090px;height: 80px;display: inline-block;margin-left: -240px;margin-top: 10px">
                        <ul style="list-style-type: none;display: inline-block">
                            <li style="display: inline-block;margin-left: 220px;margin-right: 120px;"><img src="\subject\7.png" alt="" width="45px" style="vertical-align: middle" ><a style="font-size: 14px;">7天无理由退换货</a></li>
                            <li style="display: inline-block;margin-left: 0;margin-right: 120px"><img src="\subject\z.png" alt="" width="45px" style="vertical-align: middle"><a style="font-size: 14px">100%官方正品</a></li>
                            <li style="display: inline-block;margin-left: 0;margin-right: 0"><img src="\subject\m.png" alt="" width="45px" style="vertical-align: middle"><a style="font-size: 14px">全场每单满199元包邮</a></li>
                        </ul>

                    </div>
        </div>



        <%--第三大尾部--%>
        <div style="width: 1518px;height: 82px;background-color: #000000;margin-bottom: -25px">
            <ul>
                <li style="list-style-type: none">
                    <img src="\subject\LOl.png" alt="" height="45px " style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
                    <img src="\subject\loading.png" alt="" height="45px " style="margin-top: 18px;vertical-align: middle">
                    <p style="font-size: 12px;color: white;margin-top: -45px;margin-left: 645px;width: 360px;white-space:pre-wrap;">Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456                                            客服邮箱：54181452@.qq.com </p>
                </li>

            </ul>

        </div>
    </table>
</form>

</body>
</html>
