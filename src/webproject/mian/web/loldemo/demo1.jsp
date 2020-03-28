<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019-12-16 0016
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>


<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/Leagueofjs.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>

<style type="text/css">
    .aa{
        color: #ffffff;
    background-color: rgba(44, 58, 71,0.8);

    text-shadow:1px 1px 1px #4bcffa;
    }
    .fm{
        width: 289px;
        height: 230px;
        background:rgba(255, 255, 255,0.9);
        position:absolute;
        top:80px;
        border: 1px rgba(44, 58, 71,0.8) solid;

    }
    .wjipwd{
        width: 289px;
        height: 300px;
        background:rgba(255, 255, 255,0.9);
        position:absolute;
        top:80px;
        border: 1px rgba(44, 58, 71,0.8) solid;
    }
    .name{
       width: 150px;
        height: 30px;
    margin-top:10px;
        margin-left:6px;
    }
    .pwd{
        width: 150px;
        height: 30px;
    margin-top:15px;
        margin-left:6px;
    }
    .yzm{
        width: 65px;
        height: 30px;
        margin-top:15px;
        margin-left:6px;
    }
    .inse{
        margin-top:15px;
        font-size: 12px;
        padding-left: 50px;
       float: left;
    }
    .upda{
        margin-top:15px;
        font-size: 12px;
        padding-right: 50px;
        float: right;
    }
    .log{
        margin-top:-16px;
         width: 80px;

    }
    .leftlg{
        position: absolute;
        left: 6px;
        top:65px;
    }
    .riglg{
        position: absolute;
        right: 6px;
        top:65px;
    }
    .denlv{
        margin-top:15px;
        font-size: 12px;
        padding-left: 50px;
        float: left;
    }
    #subject{
        width: 100%;
        height: 600px;

        border: 1px red solid;
        background-color:#ffffff;
    }
    #subject div{
        display:inline-block;

    }
    #activity li{
    list-style-type:none;
        margin-top: 18px;
        margin-right: 65px;
    }


</style>


<script>
    $(function () {

        $(".herd2,.herd3,.herd4").hover(function () {
            $(this).addClass("aa");
            $(this).css("color","#ffffff");
        },function () {
            $(this).removeClass("aa");
            $(this).css("color","#ffffff");
        });
//悬浮登录界面 下滑登录框
        $(".herd5").hover(function () {
            $(".herd5").addClass("aa").css("color","#ffffff");
            $(".herd5 a").click(function () {
                $(".fm:hidden").slideDown(300);
            })
        },function () {
            $(".fm:visible").slideUp(0);
            $(this).removeClass("aa");
        });

        $(".leftlg").hover(function () {
            $(this).attr("src","\\subject\\lefts.png");
        },function () {
            $(this).attr("src","\\subject\\left.png");
        });
        $(".riglg").hover(function () {
            $(this).attr("src","\\subject\\rights.png");
        },function () {
            $(this).attr("src","\\subject\\right.png");
        });

     /*   $(".herd5").hover(function () {
            $(".herd5").addClass("aa").css("color","#ffffff");
            $(".herd5 a").click(function () {
                $(".wjipwd:hidden").slideDown(300);
            });
        },function () {
            $(".wjipwd:visible").slideUp(0);
            $(this).removeClass("aa");
        });*/

    //点击按钮隐藏 文本框显示
        $(".phone").click(function () {
            $(this).hide();
            $(".phone").next().show();
        });

        //鼠标悬浮在用户登录提交按钮时
        $(".fm [type=submit]").hover(function () {
           $(this).css({
               "background-color":"#00b894",
               "color": "#ffffff",
               "width": "90px"
           })
        },function () {
            $(this).css({
                "background-color":"#ffffff",
                "color": "#05c46b",
                "width": "55px"
            })
        })

    })

</script>
<body>

<div>

        <div id="bodys">
        <video id="v1" autoplay muted loop>
            <source src="\subject\hero-l10-bg.mp4">
        </video>

        <div>
            <ul id="herd">
                <li class="herd1"><img src="\subject\logo-public.png" alt=""></li>
                <li  class="herd2">英雄资料<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">영웅 자료</a></li>
                <li  class="herd3">周边商城<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">주변기기 액세리</a></li>
                <li  class="herd4">热门活动(图标)<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">인기 활동</a></li>
                <li  class="herd5"><img  class="log"  src="\subject\lollogo.png" alt=""><br/>欢迎，请<a href="#" style="color: rgba(255, 127, 80,1.0)">登录</a></br>
                           <div>
                               <form action="" class="fm" hidden>
                                   <img style="width: 80px;padding-top: 15px" src="\subject\logo-public.png" alt="">
                                   <br/>

                                  <img src="\subject\left.png" alt="" style="width: 39px" class="leftlg">
                                   <input type="text" class="name" style="font-size: 13px"  placeholder="用户名">

                                   <img src="\subject\right.png" alt="" class="riglg" style="width: 39px">
                                   <input type="password" class="pwd" style="font-size: 13px"  placeholder="密码">

                                   <br/>
                                   <input type="submit" style="background-color: #ffffff;color: #05c46b;border-radius: 25px;font-weight:bold ;margin-top: 20px;width: 55px" value="提交" >
                                   <br/>
                                   <a href="#" class="inse">注册新账号</a>
                                   <a href="#" class="upda">忘记密码？</a>
                               </form>
                           </div>
                                        <div>
                                            <form action="" class="wjipwd" hidden>
                                                <img style="width: 80px;padding-top: 15px" src="\subject\logo-public.png" alt="">
                                                <br/>

                                                <img src="\subject\left.png" alt="" style="width: 39px" class="leftlg">
                                                <input type="text" class="name" style="font-size: 13px" placeholder="找回登录密码的账户名">

                                                <img src="\subject\right.png" alt="" class="riglg" style="width: 39px">

                                                <input type="text" class="name" style="font-size: 13px" placeholder="手机号码">
                                                <br/>

                                                <div style="margin-top: 18px">
                                                <label style="color:#000000; font-size: 13px;">校验码</label>
                                                <input class="phone" type="button" style="font-size: 13px" value="点此免费获取">

                                                    <input type="text" style="width: 60px;color: #333333;font-size: 13px" hidden placeholder="4位数字">
                                                </div>


                                                <br/>
                                                <input type="button" style="margin-top: 20px;width: 80px" value="提交" >

                                                <a href="#" class="inse">注册新账号</a>
                                                <a href="#" class="upda">返回登录界面</a>
                                            </form>
                                        </div>
                </li>
            </ul>
        </div>

    </div>

    <div id="subject">




        <div style="border: 1px red solid;width: 450px;float: left;height: 330px;margin-top: 40px;margin-right: 45px;margin-left: 75px;">
            <h2>英雄联盟活动</h2>
            <ul id="activity">

                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>
                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>
                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>
                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>
                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>
                <li>
                    <a href="">更改《英雄联盟》使用条款和RP政策的通知</a>
                </li>

            </ul>

        </div>
        <div style="border: 1px red solid;width: 750px;margin-right:50px;height:330px;margin-top: 40px;">

        </div>
    </div>

    <div id="model">
        <div id="model1">  <img src="\model\nuoshou.png" alt="" style="width: 280px"></div>
        <div id="model2">  <img src="\model\langren.png" alt="" style="width: 320px"></div>
        <div id="model3">  <img src="\model\yasuo.png" alt="" style="width: 250px"></div>
        <div id="model4">  <img src="\model\bulong.png" alt="" style="width: 290px"></div>
        <div id="model5">  <img src="\model\jinkes.png" alt="" style="width: 210px"></div>
    </div>



</div>




</body>
</html>
