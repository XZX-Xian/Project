<%@ page import="webProject.entity.Comm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="webProject.service.UserService" %>
<%@ page import="webProject.service.UserServiceImpl" %><%--
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
</head>
<link rel="icon" href="\subject\loading.png">
<body>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../../../src/webproject/mian/web/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../../src/webproject/mian/web/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
  $(function () {
      //登录判断
      var pd ="<%=session.getAttribute("pd")%>";
      var pds ="<%=session.getAttribute("pds")%>";
      //收藏判断
      var scpd ="<%=session.getAttribute("scpd")%>";



      var oves ="<%=request.getAttribute("listove")%>";
      $(".oves").text(oves);

      $(".sm li a").hover(function () {
          $(this).css({"color":"#EE5A24"});
      },function () {
          $(this).css({"color":"#ffffff"});
      });
      var account ="<%=session.getAttribute("account")%>";
      if (account!=null&&account!=""&&account!="null"){

          $(".userid").text(account);
          $(".hyp").show();
          $(".dltis").css("right","290px");
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
          $(".dltis").css("right","210px");
          location.href="http://localhost:6060/League_of_Legends_war_exploded/remouser";
      });
      if(pds=="false"){            //判断从登录jsp内传过来的值判断是否登录成功！
          location.href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/home.jsp"
      }


      var sum=0;
      var size=0;
      $(".fu").click(function () {
          this.form.size.value--;
           size=$("input[name=size]").val();
          if (size<1){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("数量不得少于1");
              $(".c2cyh").delay(2000).hide(0);
              this.form.size.value++;
              sum=((size+1)*<%=request.getAttribute("listmoney")%>);
              $("#sum").text(sum);
              return false;
          }else{
              sum=(size*<%=request.getAttribute("listmoney")%>);
              $("#sum").text(sum);
          }
      });
      $(".jia").click(function () {
        this.form.size.value++;
        size=$("input[name=size]").val();
            if (size><%=request.getAttribute("listquantity")%>){
                $(".c2cyh").show();
                $(".c2cyh").children("p").text("数量不得大于库存");
                $(".c2cyh").delay(2000).hide(0);
                this.form.size.value--;
                sum=((size-1)*<%=request.getAttribute("listmoney")%>);
                $("#sum").text(sum);
                return  false;
          }else{
                sum=(size*<%=request.getAttribute("listmoney")%>);
                $("#sum").text(sum);
            }
      });
      $(".out").hover(function () {
          $(".perso").attr("src","<%=request.getAttribute("listout")%>")
      },function () {
          $(".perso").attr("src","<%=request.getAttribute("listove")%>")
      });
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


      //弹框登录
      $(".userdl").click(function () {
          var username=$("input[name=username]").val();
          var userpwd=$("input[name=userpwd ]").val();
          var red=/^\S{6,10}$/;
          if(username==""||userpwd==""){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("请先填完数据!");
              $(".c2cyh").delay(1000).hide(0);
          }else if (!red.test(username)){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("账户格式错误!");
              $(".c2cyh").delay(1000).hide(0);
          }else {
              location.href="http://localhost:6060/League_of_Legends_war_exploded/seluer?username="+username+"&userpwd="+userpwd+"";
          }
      });
      if(pd=="true"){            //判断从登录jsp内传过来的值判断是否登录成功！
          <%session.setAttribute("pd",false);%>
          $(".c2cyh").show();
          $(".c2cyh").children("p").text("登录失败!");
          $(".c2cyh").delay(2000).hide(0);
      }

      //弹框正则判断
      //用户
      $("input[name=userpwd ]").blur(function () {

          var userpwd=$("input[name=userpwd ]").val();
          if(userpwd==""){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("密码不能为空!");
              $(".c2cyh").delay(1000).hide(0);
          }
      });
      //密码
      $("input[name=username]").blur(function () {
          var username=$("input[name=username]").val();
          var red=/^\S{6,10}$/;
          if(username==""){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("用户不能为空!");
              $(".c2cyh").delay(1000).hide(0);
          }else if (!red.test(username)){
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("用户格式错误!");
              $(".c2cyh").delay(1000).hide(0);
          }
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
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("请先登录");
              $(".c2cyh").delay(1000).hide(0);
              $(".dlus").click();
              return false;
          }
      });
      $(".gouwuc").click(function () {
          if(account!=""&&account!=null&&account!="null"){
              var userid=$(".userid").text();
              location.href="http://localhost:6060/League_of_Legends_war_exploded/seleshop?id="+userid+"";
          }else{
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("请先登录!");
              $(".c2cyh").delay(1000).hide(0);
              $(".dlus").click();
              return false;
          }

      });
      $(".zkai").click(function () {
          $(".cctv").css("overflow","auto")
          $(".zkai").hide();
          $(".sohui").show();
      });
      $(".sohui").click(function () {
          $(".cctv").css("overflow","hidden")
          $(".zkai").show();
          $(".sohui").hide();
      });

      //单击收藏
      $(".shouc").click(function () {
          var userid=$(".userid").text();
          var id=$(".bh").text();
          var name=$(".nam").text();
          var money=$(".mone").text();
          var size=$("input[name=size]").val();
          var ove=  $(".oves").text();
          if(account!=""&&account!=null&&account!="null"){
               location.href="http://localhost:6060/League_of_Legends_war_exploded/collinse?id="+id+"&name="+name+"&money="+money+"&size="+size+"&ove="+ove+"&userid="+userid;
          }else{
              $(".c2cyh").show();
              $(".c2cyh").children("p").text("请先登录,再收藏");
              $(".c2cyh").delay(1000).hide(0);
              $(".dlus").click();
              return false;
          }
      });

//判断是否收藏成功！
      if (scpd=="true") {
          <%session.setAttribute("scpd",false);%>
          $(".c2cyh").show();
          $(".c2cyh").children("p").text("收藏成功!");
          $(".c2cyh").delay(2000).hide(0);
      }else if (scpd=="yes") {
          <%session.setAttribute("scpd","no");%>
          $(".c2cyh").show();
          $(".c2cyh").children("p").text("已经收藏过了!");
          $(".c2cyh").delay(2000).hide(0);
      }






  })


</script>
<style type="text/css">
    .shangp li{
        list-style-type: none;
        border-bottom:1px solid #ccc
    }
    .sm li{
        list-style-type: none;
        display: inline-block;
        text-align: center;
        width: 180px;
        font-size: 16px;
        margin-top: 7px;
    }
    .sm li a{
        text-decoration:none;
        color: white;
    }
    .sm{
        margin-top: 5px;
        color: white;
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
    .grzx li{
        text-align: center;line-height: 30px;width: 75px;height: 30px;border-top: 1px #fff solid;color: #ccc;background-color: rgba(0,0,0,0.4)
    }
</style>
<p class="oves" hidden></p>
<%--遮罩层--%>
<div id="bg" hidden></div>

<form>
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
                        <a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/denlv.jsp" style="font-size: 11px;" >注册新用户/忘记密码</a>
                    </div>
                </form>
            </div>
        </div>

        <%--提示框--%>
        <div class="c2cyh" hidden style="z-index: 101" >
            <p style="position:absolute;top: 15px;left:80px;font-size: 14px;color: orange"></p>
            <div align="center"style="z-index: 101;margin-right: 120px;margin-top: 15px">
                <img style="width: 45px;" src="\subject\loading.png" alt="">
                <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗提示</p>
                <br/>
            </div>
        </div>



        <div align="center">
                <%--头部--%>
            <div  align="center" style="width: 1080px;height: 50px;background-color: #ffffff;/*position: fixed;z-index: 999;*/">
                    <%--logo--%>

                    <%--头部导航栏框--%>
                <div a style="height:55px;background-color: white;margin-bottom: 30px;">

                        <%--logo框--%>
                    <div style="width: 300px;height: 55px;display:inline-block;margin-right: 820px;margin-left: -100px;margin-top: 15px;text-align: center">
                        <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                        <div style="display:inline-block;position: absolute;top: 20px"><strong style="font-size: 20px;">魄罗商城</strong>
                            <p style="font-size: 12px;color: #ccc">商品详情</p>
                        </div>
                    </div>
                   <%--     &lt;%&ndash;搜索框&ndash;%&gt;
                    <div style="width: 170px;height: 55px;display:inline-block;position:absolute;left:550px;top: 6px;text-align: center">
                        <input type="search" style="width: 400px;height: 40px;display:inline-block;border-radius:25px;margin-top: 15px;padding-left: 10px;font-size: 18px">
                        <img src="\subject\cx.png" alt="" width="35 px" style="position: absolute;top: 15px;left: 405px" >
                    </div>--%>


                            <%--登录框--%>
                            <div class="dltis" style="width: 160px;height: 47px;display:inline-block;position: absolute;right: 210px;">
                                <div  style="position: absolute;top: 12px;margin-top: 5px"><img src="\subject\yhu.png" alt="" class="dlus" width="40"></div>
                                <div class="grdiv" style="margin-left: 50px;border-top: 1px #ffffff solid">
                                    <p hidden class="hyp" style="position: absolute;top: 12px;margin-top: 17px;"><strong style="font-size: 13px;">(<label class="userid"></label>)</strong></p>
                                    <ul style=" padding:0; margin:0;list-style-type: none;margin-top: 50px;margin-right: 17px" hidden class="grzx">
                                        <li>个人中心</li>
                                        <li id="nullopen">注销</li>
                                    </ul>
                                </div>
                            </div>
                            <%--购物车框--%>
                            <div class="gouwuc" style="height: 55px;display:inline-block;margin-left: 15px;position: absolute;right: 255px;top: 25px;">
                                <img src="\subject\gwc.png" style="cursor: pointer;" alt="" width="42px" >
                            </div>

                </div>

            </div>

                    <%--三级联动--%>
                    <div  style="width: 1082px;height: 36px;margin-top: 35px;">
                        <div align="left" style="width: 1082px;height: 36px;background-color: #0abb26;">
                            <ul  class="sm">
                                <li><strong><a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                                <li><a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp?shopdemo=">商品区</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                            </ul>
                        </div>
                    </div>

                <%--内容框--%>
            <div style="width: 1080px;height: 680px;margin-top: 0;border: 1px #ccc solid">



                <div style="width: 500px;height: 500px;float: left;display: block;margin-left: 40px;margin-top: 25px;">
                    <div style="display: block;margin-right: 20px;margin-top: 40px">
                        <img style="width: 300px;height: 340px" class="perso" src="<%=request.getAttribute("listove")%>" alt="">
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
                            <div align="right">

                            </div>
                            <li>
                                <p style="font-size: 24px" class="nam"><%=request.getAttribute("listname")%></p>
                                <p style="display: inline;font-size: 25px;font-weight: bold" class="mone"><%=request.getAttribute("listmoney")%></p><label style="font-size: 13px">RMB</label>
                                <div style="height: 15px"></div>
                            </li>
                        </ul>

                        <%--收藏、交易量--%>
                        <div style="position: absolute;top:247px;right: 280px;">
                        <text class="shouc" style="display: block;border: 1px #ccc solid;text-align: center;width: 45px;height: 45px;line-height: 45px;background-color: white;font-size: 12px">收藏</text>

                        <text disabled style="display: block;margin-top: 13px;text-align: center;border: 1px #ccc solid;width: 43px;height: 40px;background-color: white;font-size: 9px;padding-top: 5px">交易量<p style="margin-top: 5px;font-size: 12px"><%=request.getAttribute("listcount")%></p></text>
                        </div>
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
                            <input type="button" value="采购" style="border:none;font-size: 15px;font-weight: bold;color: #ffffff;background-color: #2e8de5;border-radius: 5px;width: 203px;height: 50px;">
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

            <div class="cctv" style="height: 780px;overflow: hidden">
                <img align="center" src="<%=request.getAttribute("listcctv")%>" alt="" style="width: 850px;margin-top: 35px">
            </div>
                <div class="zkai" style="border-radius: 5px;line-height: 50px;border: 1px #cccccc solid;background-color: #ffffff;width: 250px;height: 50px;color: black;font-weight: bold">展开全部</div>
             <div class="sohui" style="border-radius: 5px;line-height: 50px;border: 1px #cccccc solid;background-color: #ffffff;width: 250px;height: 50px;color: black;font-weight: bold" hidden>收回</div>


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
