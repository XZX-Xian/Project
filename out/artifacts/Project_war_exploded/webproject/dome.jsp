<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2019-12-16 0016
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>LOL首页</title>
    <link rel="stylesheet" type="text/css" href="../js/domeCss.css">
</head>


<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/Leagueofjs.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<%--<style type="text/css"></style>--%>
<script>
    $(function () {
        $(".herd2,.herd3,.herd4").hover(function () {
            $(this).addClass("aa");
            $(this).css("color", "#ffffff");
        }, function () {
            $(this).removeClass("aa");
            $(this).css("color", "#ffffff");
        });
        //悬浮登录界面
        $(".herd5").mousemove(function () {
            $(".herd5").addClass("aa").css("color", "#ffffff");
            // 单击登录 下滑登录框
            $(".herd5 a").click(function () {
                $(".fm:hidden").slideDown(300);
                //其他区域被单击 就隐藏登录框
                $(document).on('click',function(e){
                    $(".fm:visible").slideUp(300);
                    $(this).removeClass("aa");
                });
                //失去焦判断 其他区域是否发生单击事件
                $(".herd5").on('click',function(e){
                    e.stopPropagation();
                });
            })
        });

        $(".leftlg").hover(function () {
            $(this).attr("src", "\\subject\\lefts.png");
        }, function () {
            $(this).attr("src", "\\subject\\left.png");
        });
        $(".riglg").hover(function () {
            $(this).attr("src", "\\subject\\rights.png");
        }, function () {
            $(this).attr("src", "\\subject\\right.png");
        });

        //单击登录向下显示登录框
        $(".herd5").hover(function () {
            $(".herd5").addClass("aa").css("color", "#ffffff");
            $(".herd5 a").click(function () {
                $(".wjipwd:hidden").slideDown(300);
            });
        }, function () {
            $(".wjipwd:visible").slideUp(0);
            $(this).removeClass("aa");
        });

        //点击按钮隐藏 文本框显示
        $(".phone").click(function () {
            $(this).hide();
            $(".phone").next().show();
        });

        //鼠标悬浮在用户登录提交按钮时
        $(".fm [type=submit]").hover(function () {
            $(this).css({
                "background-color": "#00b894",
                "color": "#ffffff",
                "width": "90px"
            })
        }, function () {
            $(this).css({
                "background-color": "#ffffff",
                "color": "#05c46b",
                "width": "55px"
            })
        });

        //单击注册 弹出注册窗口
        $(".inse").click(function () {
            // var name = $("").val();
            // var pwd = $("").val();

        });

        //用户登录 验证
        $("#fom>form").submit(function () {
            var name = $(".name").val();
            var pwd = $(".pwd").val();
            if (name == "" || name == null) {
                alert("用户名不能为空！");
                return false;
            }
            if (pwd == "" || pwd == null) {
                alert("密码不能为空！");
                return false;
            }
            var reg=/^[0-9a-zA-Z]{6,10}$/;
            if (reg.test(name)==false){
                alert("账号格式不正确!");
                return false;
            };
            var reg2=/^[0-9a-zA-Z.]{6,12}$/;
            if (reg2.test(pwd)==false){
                alert("密码格式不正确!");
                return false;
            }

        });


        //获取进来的地址
        var url=document.referrer;

        //弹出地址验证
        alert("地址"+url);

        //登录与注销 切换
        // if (url==""||url==null){
        //     $(".herd5 span").show();
        //     $("#quit").hide();
        // }else {
        //     $("#quit").show();
        //     $(".herd5 span").hide();
        // }

        //单击退出
        $("#quit").click(function () {
            var user=$("#userID").val();
            var pwd=$(this).next().val();
            alert("值"+$("#userName").text());
            $(".herd5 span").show();
            $("#quit").hide();
            location.href="http://localhost:8080/Project_war_exploded/webquit?user="+user+"&pwd="+pwd;
        });

        //——添加了一个页面跳转加验证
        //单击周边商城跳转到商城页面 判断是否登录成功 否：给出提示弹出登录框 并且传用户账号过去
        $(".herd3").click(function () {
            var userID=$("#userID").val();
            alert(userID);
            if (userID==""||userID==null){
                alert("请先登录!");
                $(".herd5 a").click();
            } else {
                location.href="index.jsp?userID="+userID;
            }
        })

    })

</script>
<body>

<div>

    <div id="bodys">
        <video id="v1" autoplay muted loop>
            <source src="\subject\hero-l10-bg.mp4">
        </video>
        <%--   ——添加了一个小脚本--%>
        <%--用户登录--%>
        <%
            String username = request.getParameter("username");
            String useraccount = request.getParameter("useraccount");
            String userpwd=request.getParameter("userpwd");
            if (username == null) {
                username = "";
                useraccount="";
            }
        %>
        <%--        ——添加一个id标签--%>
        <div id="zhu">
            <ul id="herd">
                <li class="herd1"><img src="\subject\logo-public.png" alt=""></li>
                <li class="herd2">英雄资料<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">영웅 자료</a></li>
                <li class="herd3">周边商城<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">주변기기 액세리</a></li>
                <li class="herd4">热门活动(图标)<br/><a style="font-size: 13px;color: rgba(252, 66, 123,1.0)">인기 활동</a></li>
                <%-- ——添加了一个a链接--%>
                <li class="herd5"><img class="log" src="\subject\lollogo.png" alt=""><br/>
                    欢迎您,<i id="userName"><%=username%></i><span>请<a href="#" style="padding-left: 10px;color: rgba(255, 127, 80,1.0)">登录</a></span><a hidden id="quit" href="#" style="padding-left: 10px;color: rgba(255, 127, 80,1.0)">注销</a><input hidden type="text" value="<%=userpwd%>"></br>

<%--                    欢迎，请<a href="#" style="color: rgba(255, 127, 80,1.0)">登录</a></br>--%>
                    <%-- ——拿到用户登录的账号--%>
                    <input id="userID" type="text" value="<%=useraccount%>" hidden>
                    <input id="pd" type="text" value="" hidden>
                    <%-- ——添加了一个ID标签--%>
                    <div id="fom">
                        <%--用户登录--%>
                        <form action="http://localhost:8080/Project_war_exploded/webuser" class="fm" hidden>
                            <img style="width: 80px;padding-top: 15px" src="\subject\logo-public.png" alt="">
                            <br/>

                            <img src="\subject\left.png" alt="" style="width: 39px" class="leftlg">
                            <input type="text" class="name"  name="name"  style="font-size: 13px" placeholder="用户名">

                            <img src="\subject\right.png" alt="" class="riglg" style="width: 39px">
                            <input type="password" class="pwd" name="pwd" style="font-size: 13px" placeholder="密码">
                            <br/>
                            <input type="submit"
                                   style="background-color: #ffffff;color: #05c46b;border-radius: 25px;font-weight:bold ;margin-top: 20px;width: 55px"
                                   value="提交">
                            <br/>
                            <a href="#" class="inse">注册新账号</a>
                            <a href="#" class="upda">忘记密码？</a>
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
        <div id="model1"><img src="\model\nuoshou.png" alt="" style="width: 280px"></div>
        <div id="model2"><img src="\model\langren.png" alt="" style="width: 320px"></div>
        <div id="model3"><img src="\model\yasuo.png" alt="" style="width: 250px"></div>
        <div id="model4"><img src="\model\bulong.png" alt="" style="width: 290px"></div>
        <div id="model5"><img src="\model\jinkes.png" alt="" style="width: 210px"></div>
    </div>
</div>
</body>
</html>
