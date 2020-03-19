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
    <title>商品详情页</title>
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
    }

    #bt li{
        list-style-type: none;
        padding-top: 3px;
    }

    #bt1 li{
        list-style-type: none;
        padding-top: 3px;
    }

    #bt2 li{
        list-style-type: none;
        padding-top: 3px;
    }
    #spl>ul{
        border: 1px black solid;
        width: 260px;
        height: 290px;
        display: inline-block;
        margin-left: 58px;
        margin-top: 45px;
    }
    #spl ul li{
        list-style-type: none;
        font-size: 18px;
        color: black;
        font-weight: bold;
    }
    #spl ul div{
        text-align: center;
        margin-top: 20px;
        border: 1px red solid;
        width: 215px;
        height: 195px;
    }
    #smk{
        margin-top: -60px;
        margin-left: 650px;
    }
    #smk li{
        display: inline-block;
        font-size: 10px;
        line-height: 20px; margin: 0 1px;
        width: 20px; height: 20px;
        border-radius: 50%; background: #ffffff;
        text-align: center; color: #ffffff;
        margin-left: 20px;

    }



</style>
<%
    Comm com=new Comm();
    UserService str=new UserServiceImpl();
    List<Comm> list=new ArrayList<Comm>();
    list=str.SeleteCom();
    request.setAttribute("list",list);

%>


<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">






</script>


<body>
<%--最大的主体框--%>
<div style="width:1518px;height: 950px;min-width:100%">

    <div <%--style="position: fixed;z-index: 999"--%>>
        <%--头部导航栏框--%>
        <div style="height:55px;background-color: white">

            <%--logo框--%>
            <div style="width: 300px;height: 55px;display:inline-block;margin-right:600px;margin-left: -20px;text-align: center">
                <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                <div style="display:inline-block;position: absolute;top: 18px"><strong style="font-size: 20px;">魄罗1商城</strong></div>
            </div>
            <%--搜索框--%>
            <div style="width: 170px;height: 55px;display:inline-block;position:absolute;top: 6px;margin-left: 85px;text-align: center">
                <input type="search" style="display:inline-block;border-radius:25px;margin-top: 15px;">
                <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px" >
            </div>

            <%--登录框--%>
            <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">
                <img src="\subject\yhu.png" alt="" width="30" style="position: absolute;top: 12px;margin-left: 290px;margin-top: 5px">
                <strong style="position: absolute;top: 12px;margin-left: 330px;margin-top: 10px;width: 200px">欢迎,请<a href="">登1录</a></strong>

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
                <li><strong><a href="loldemo/home.jsp">商城首页</a></strong><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="loldemo/index.jsp">手办周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="#">赛事周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
                <li><a href="#">服饰周边</a><img src="\subject\zuo.png" alt="" width="14px"></li>
            </ul>
        </div>
    </div>

    <%--中部主体--%>
    <div style="width: 1515px;height: 800px;border: 1px red solid">
        <%--分级标签--%>
        <div style="border: 1px gold solid;height: 70px;width: 1515px">

        </div>
        <%--大图类--%>
        <div style="border: 1px blue solid;width: 1512px;height: 500px;margin-top: 20px">
            <%--图片展示框--%>
            <div style="border: 1px green solid;width: 420px;height: 400px;margin-left: 250px;margin-top: 30px;display: inline-block">

                </div>
                <%--信息--%>
            <div style="border: 1px hotpink solid;width: 600px;margin-left: 40px;height:400px;display: inline-block">
                    <%--标题--%>
                <div></div>
                <%--价格--%>
                <div> </div>
            </div>
        </div>

    </div>



</body>
</html>
