<%@ page import="webProject.service.UserService" %>
<%@ page import="webProject.service.impl.UserServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="webProject.entity.Comm" %>
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
</head>
<style type="text/css">
     .sm li{
        list-style-type: none;
        display: inline-block;
        text-align: center;
        width: 180px;
        font-size: 16px;

    }
     .sm li a{
         text-decoration:none;
         color: white;
     }
    .sm{
        margin-top: 5px;
        color: white;
    }
     html, body {
         margin:0;
         padding:0;
         background-color: rgba(236, 240, 241, 0.3);

     }

    #bt li{
        list-style-type: none;
        padding-top: 2px;
        display: block;
    }
     #bt li img{
         width: 215px;
     }

     #bt1 li{
         list-style-type: none;
         padding-top: 2px;
         display: block;
     }
     #bt1 li img{
         width: 160px;
     }

     #bt2 li{
         list-style-type: none;
         padding-top: 2px;
         display: block;
     }
     #bt2 li img{
         width: 165px;
     }


</style>
<%
    Comm com=new Comm();
    UserService str=new UserServiceImpl();
    List<Comm> list=new ArrayList<Comm>();
    list=str.SeleteCom();
    request.setAttribute("list",list);

    List<Comm> list1=new ArrayList<Comm>();
    list1=str.recreationdemo();
    request.setAttribute("list1",list1);
%>
<link rel="icon" href="\subject\loading.png">

<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
  $(function () {
        $("#sel").change(function () {
             var size = $('#sel option:selected').val();
             var type=$("#shob").val();

                var json={"size":size,"type":type};
                $.getJSON("http://localhost:6060/League_of_Legends_war_exploded/selcom",json,function (data) {
                    $("#sese").html("");
                        var jsonData = JSON.stringify(data);// 转成JSON格式
                        var results = $.parseJSON(jsonData);// 转成JSON对象
                        var a="";
                        var count=0;
                        $.each(results,function (i,item) {
                            count++;
                            if (i<6){
                                a+=  "                                  <li style=\"display: inline-block;margin: 16px 30px;text-align: center;\" class=\"tup\">\n" +
                                "                                        <div style=\"width: 185px; height: 195px;margin: 0 50px\">\n" +
                                "                                            <a href=\"http://localhost:6060/League_of_Legends_war_exploded/selehome?name="+item.comID+"\"><img src=\""+item.comOve+"\" alt=\"\" width=\"165\">\n" +
                                                                                "<label hidden class='itid'>"+item.comID+"</label>"+
                                "                                                <img src=\""+item.comOut+"\" alt=\"\" width=\"135\" hidden ></a>\n" +
                                "                                        </div>\n" +
                                "                                        <div style=\"margin-bottom: 0\" >\n" +
                                "                                            <p style=\"margin: 20px 35px 0;font-size: 16px;line-height: 31px\"><a style=\"color:salmon\">[英雄联盟]</a>"+item.comName+"<strong style=\"padding-top: 5px\"><br/>价格:"+item.comMoney+"元</strong></p>\n" +
                                "                                        </div>\n" +
                                "                                    </li>"

                            }else{
                               a+="                                    <li hidden style=\"display: inline-block;margin: 16px 35px;text-align: center;\" class=\"tup\" >\n" +
                                "                                    <div hidden style=\"width: 185px; height: 195px;margin: 0 46px\">\n" +
                                "                                        <a href=\"http://localhost:6060/League_of_Legends_war_exploded/selehome?name="+item.comID+"\"><img src=\""+item.comOve+"\" alt=\"\" height='215px' width=\"178px\">\n" +
                                "                                            <img src=\""+item.comOut+"\" alt=\"\" width=\"137px\" hidden ></a>\n" +
                                "                                    </div>\n" +
                                "                                    <div hidden style=\"margin-bottom: 0\" >\n" +
                                "                                        <p style=\"margin: 20px 35px 0;font-size: 16px;line-height: 31px\"><a style=\"color:salmon\">[英雄联盟]</a>"+item.comName+"<strong style=\"padding-top: 5px\"><br/>价格:"+item.comMoney+"元</strong></p>\n" +
                                "                                    </div>\n" +
                                "                                    </li>\n"
                            }

                        });
                    $("#sese").append(a);

                    if (count<6){
                        $(".gend").hide();
                        $(".shoh").hide();
                    }else {
                        $(".gend").show();
                        $(".shoh").hide();
                    }
                    $(".tup").hover(function () {
                        $(this).children("div").children("a").children("img:eq(1)").show()
                        $(this).css({"box-shadow":"darkgrey  0px 0px 5px 5px"});
                        $(this).children("div").next().css({"background-color":"rgba(255, 221, 89,1.0)"})
                        $(this).css({"transform":"scale(1.08)"});
                        $(this).children("div").children("a").children("img:eq(0)").hide()
                    },function () {
                        $(this).children("div").children("a").children("img:eq(0)").show()
                        $(this).children("div").slideDown(600).css({"background-color":"#ffffff"});
                        $(this).css({"box-shadow":"0px 0px 0px 0px"});
                        $(this).css({"transform":"scale(1)"});
                        $(this).children("div").children("a").children("img:eq(1)").hide()
                    });

                })

        });
        //数量

      $(".demo").click(function () {
         var leix=$(this).children("input").val();

        // var cs=$(".cs").val();
         var cs=$(this).children(".cs").val();

         var a=parseInt(cs);
      if (a>=4){
          a=2;
      }else {
          a+=2;
      }
          // $(".cs").val(a);a
          $(this).children(".cs").val(a);
         var qis=2;

          var json={"leix":leix,"cs":cs,"qis":qis};
          $.getJSON("http://localhost:6060/League_of_Legends_war_exploded/selhyh",json,function (data) {
              var jsonData = JSON.stringify(data);// 转成JSON格式
              var results = $.parseJSON(jsonData);// 转成JSON对象
              var a="";
              var type="";
              $.each(results,function (i,item) {
                  type=item.comtype;
                    a+="       <li><a href=\"http://localhost:6060/League_of_Legends_war_exploded/selehome?name="+item.comID+"\" style=\"font-size: 12px\">[英雄联盟]"+item.comName+"\n" +
                        "                                    <img src=\""+item.comOve+"\" alt=\"\" height=\"80px\" width=\"178px\"></a>\n" +
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

           //  if (type==11){
           //
           // $("input[value=leix]").html("");
           //      alert( $(this).children("input").val());
        /*   $("#tz input[value=type]").parent().parent().next("ul").html("");*/


           // $(this).parent("h3").next("ul").html(a);

         /*else if (type==22){
                $("#bt1").html("");
                $("#bt1").append(a);

            }*/
              // alert(type);
        /*      $(".hyh[value=type]").parent().next().html("");*/
     /*         $(".hyh[value=type]").parent().next().append(a);*/

          })
      })


  });

</script>
<script type="text/javascript">
    $(function () {
        $(".sm li a").hover(function () {
            $(this).css({"color":"#EE5A24"});
        },function () {
            $(this).css({"color":"#ffffff"});
        });

        $(".tup").hover(function () {
            $(this).children("div").children("a").children("img:eq(1)").show();
            $(this).css({"box-shadow":"darkgrey  0px 0px 5px 5px"});
            $(this).children("div").next().css({"background-color":"rgba(255, 221, 89,1.0)"});
            $(this).children("div")
            $(this).css({"transform":"scale(1.08)"});
            $(this).children("div").children("a").children("img:eq(0)").hide()

        },function () {
            $(this).children("div").children("a").children("img:eq(0)").show();
            $(this).children("div").slideDown(600).css({"background-color":"#ffffff"});
            $(this).css({"box-shadow":"0px 0px 0px 0px"});
            $(this).css({"transform":"scale(1)"});
            $(this).children("div").children("a").children("img:eq(1)").hide()

        });
    $(".tup").click(function () {
       var name=$(this).next("p").text();
        location.href="http://localhost:6060/League_of_Legends_war_exploded/selehome?name="+name+"";
    })
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

<body>
    <%--最大的主体框--%>
        <div style="width:1518px;height: 1400px;min-width:100%">

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
                        <strong style="position: absolute;top: 12px;margin-left: 330px;margin-top: 10px;width: 200px">欢迎,请<a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/denlv.jsp">登录</a></strong>

                    </div>
                    <%--购物车框--%>
                    <div style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">
                        <img src="\subject\gwc.png" alt="" width="35px" style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">
                        <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a href="">购物车</a></strong>
                    </div>

            </div>
                <%--导航栏内容--%>
                <div style="width: 1518px;height: 36px;background-color: #1e272e;">
                    <ul class="sm">
                        <li><strong><a href="http://localhost:6060/League_of_Legends_war_exploded/loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                        <li><a href="">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                        <li><a href="">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                        <li><a href="">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                    </ul>
                </div>
            </div>

        <%--    &lt;%&ndash;联动&ndash;%&gt;
                <div style="border: 1px red solid;width: 100%;height: 70px;display:inline-block">
                    <span>商品首页</span>

                </div>--%>

                <%--海报框--%>
                <div style="/*margin-top:80px;*/display:inline-block;box-shadow:0 2px 1px #ccc;">
                    <img src="\subject\index.jpg" alt="" width="1518px">
                </div>


            <%--主体内容框--%>
            <div align="center" style="width: 1518px;height: 960px;margin-top: -55px;">
                <%--第二大主题框背景颜色灰色--%>

                <%--手办商品--%>
                    <div>



                <div  align="center" style="border: 1px red solid;box-shadow:0 0 2px #ccc;overflow:auto;width: 1121px;display: inline-block;background-color: white" id="zhuti">

                    <div style="width: 170px;height: 50px;margin-top: 18px;text-align: center;line-height:50px;background-color:black">
                        <a href="" style="text-decoration:none;"><strong  style="font-size: 18px;color:white;" >手办系列</strong></a>
                        <input type="text" value="1" id="shob" hidden>
                    </div>

                    <select name="" id="sel" style="position: absolute;right: 245px;height: 45px;top: 355px">
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

                    <ul id="sese" style="margin-left: -30px">
                        <c:forEach var="in" items="${list}" varStatus="stas">
                            <c:if test="${stas.index<6}">
                                <li style="display: inline-block;margin: 16px 30px;text-align: center;" class="tup">
                                    <div style="width: 185px; height: 195px;margin: 0 50px">
                                        <a><img src="${in.comOve}" alt="" width="165">
                                            <img style="margin-top: 23px" src="${in.comOut}" alt="" width="135" hidden ></a>
                                    </div>
                                    <div style="margin-bottom: 0" >
                                        <p style="margin: 20px 35px 0;font-size: 16px;line-height: 31px"><a style="color:salmon;margin-top: 20px">[英雄联盟]</a>${in.comName}<strong style="padding-top: 5px"><br/>价格:${in.comMoney}元</strong></p>
                                    </div>
                                </li>
                                <p hidden>${in.comID}</p>
                            </c:if>

                            <c:if test="${stas.index>5}">
                                <li hidden style="display: inline-block;margin: 16px 35px;text-align: center;" class="tup" >
                                    <div hidden style="width: 185px; height: 195px;margin: 0 40px">
                                        <a><img src="${in.comOve}" alt="" width="178px">
                                            <img style="margin-top: 23px"  src="${in.comOut}" alt="" width="145" hidden ></a>
                                    </div>
                                    <div hidden style="margin-bottom: 0" >
                                        <p style="margin: 50px 35px 0;font-size: 16px;line-height: 31px"><a style="color:salmon">[英雄联盟]</a>${in.comName}<strong style="padding-top: 5px"><br/>价格:${in.comMoney}元</strong></p>
                                    </div>
                                </li>
                                <p hidden>${in.comID}</p>
                            </c:if>
                        </c:forEach>
                    </ul>

                    <div align="center" style="width: 180px;height: 40px;margin-top: 5px;margin-bottom: 0">
                        <input type="button" value="展示全部" class="gend" style="width: 100px;height: 30px;background-color: black;color: white;border: #ffffff 1px solid">
                        <input hidden type="button" value="隐藏" class="shoh"  style="width: 100px;height: 30px;margin-top:-10px;background-color: black;color: white;border: #ffffff 1px solid" >
                    </div>
                </div>



                    </div>

                    <div style="width: 1120px;background-color: white;margin-top: 35px;box-shadow:0 0 1px #ccc;" >

                        <h5 align="center" style="padding-top: 15px">更多商品</h5>
                        <%-- &lt;%&ndash;内容标题框&ndash;%&gt;--%>
                        <div style="display: inline-block;width: 300px;background-color: white;">
                            <h3>🈲爆套装<a  class="demo" style="float:right;font-size: 12px;margin-right: 8px;margin-top: 12px;cursor: hand">换一换
                                <input type="text" class="hyh" value="11"  hidden>
                                <input type="text" class="cs" value="2"  hidden>
                                <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a></h3>
                            <ul id="bt">
                                <li><a style="font-size: 12px" href="http://localhost:6060/League_of_Legends_war_exploded/selehome?name=14">[英雄联盟]龙年限定迷你套装
                                    <img src="\commodity\longnian.png"  height="80px" width="178px" ></a>
                                </li>
                                <li><a style="font-size: 12px"  href="http://localhost:6060/League_of_Legends_war_exploded/selehome?name=15">[英雄联盟]复活节限定迷你套装
                                    <img src="\commodity\fuhj.png" height="80px" width="178px" ></a>
                                </li>
                            </ul>
                        </div>
                        <div style="display: inline-block;width: 300px;background-color: white;margin-left: 25px;">
                            <h3 style="display: block">🈲销公仔<a class="demo" style="float: right;font-size: 12px;margin-right: 8px;margin-top: 10px;cursor: hand">换一换
                                <input type="text" class="hyh" value="22"  hidden>
                                <input type="text" class="cs" value="2"  hidden>
                                <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a></h3>

                            <ul id="bt1">
                                <li><a style="font-size: 12px" href="">[英雄联盟]提伯斯周边大型套装
                                    <img src="\commodity\gjtbstz.png" height="80px" width="178px"></a>
                                </li>
                                <li><a style="font-size: 12px" href="">[英雄联盟]欧米伽魄罗小队
                                    <img src="\commodity\polo.png" height="80px" width="178px"  alt="" ></a>
                                </li>
                            </ul>

                        </div>
                        <div style="display: inline-block;width: 300px;background-color: white;margin-left: 25px;">
                            <h3>🈲事服装<a class="demo"  style="cursor: hand;float: right;font-size: 12px;margin-right: 8px;margin-top: 10px">换一换
                                <input type="text" class="hyh" value="33"  hidden>
                                <input type="text" class="cs" value="2"  hidden>
                                <img src="\subject\hyh.png" alt="" width="18px" style="vertical-align: middle;margin-top: -2px"></a></h3>
                            <ul id="bt2">

                                <li><a style="font-size: 12px" href="">[英雄联盟]星际守护者迷你套装
                                    <img src="\commodity\yf.png" alt="" height="80px" width="178px"></a>
                                </li>
                            </ul>

                        </div>
                            <div align="center"  style="background-color: #ffffff;width: 1120px;height: 80px;display: inline-block;margin-top: -10px">
                                <ul style="list-style-type: none;display: inline-block">
                                    <li style="display: inline-block;margin-right: 120px;"><img src="\subject\7.png" alt="" width="45px" style="vertical-align: middle" ><a style="font-size: 14px;">7天无理由退换货</a></li>
                                    <li style="display: inline-block;margin-left: 0;margin-right: 120px"><img src="\subject\z.png" alt="" width="45px" style="vertical-align: middle"><a style="font-size: 14px">100%官方正品</a></li>
                                    <li style="display: inline-block;margin-left: 0;margin-right: 0"><img src="\subject\m.png" alt="" width="45px" style="vertical-align: middle"><a style="font-size: 14px">全场每单满199元包邮</a></li>
                                </ul>

                            </div>

                    </div>
                    <%--第三大尾部--%>
                    <div align="left" style=";width: 1518px;height: 82px;background-color: #000;">
                        <ul>
                            <li style="list-style-type: none">
                                <img src="\subject\LOl.png" alt="" height="45px " style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
                                <img src="\subject\loading.png" alt="" height="45px " style="margin-top: 18px;vertical-align: middle">
                                <p style="font-size: 12px;color: white;margin-top: -45px;margin-left: 645px;width: 360px;white-space:pre-wrap;">Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456                                            客服邮箱：54181452@.qq.com </p>
                            </li>

                        </ul>

                    </div>
            </div>

        </div>




</body>
</html>
