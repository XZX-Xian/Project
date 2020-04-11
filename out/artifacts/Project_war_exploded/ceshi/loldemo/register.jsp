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
    <title>登录首页</title>
    <link rel="stylesheet" type="text/css" href="../js/domeCss.css">
    <link rel="stylesheet" type="text/css" href="js/domeCss.css">
    <link rel="stylesheet" type="text/css" href="../js/register.css">
    <link rel="stylesheet" type="text/css" href="js/register.css">
</head>


<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/Leagueofjs.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<%--<style type="text/css"></style>--%>

<body>
<div style="height: 600px">
    <div id="bodys">
        <video id="v1" autoplay muted loop>
            <source src="\subject\hero-l10-bg.mp4">
        </video>
        <div class="table">
            <div>
            <div id="theme">
                <span>登录</span>
            </div>
            <form action="http://localhost:8080/Project_war_exploded/adminlogin" id="register">
                <table id="dl">
                    <tr>
                        <td>账号：</td>
                        <td><input type="text" value="" name="account"></td>
                        <td><span id="name" hidden >账号不能为空</span></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" value="" name="pwd"></td>
                        <td><span id="pwd" hidden>密码不能为空</span></td>
                    </tr>
                </table>

                <input type="submit" value="提交"  style="width: 90px;margin-top: 30px">
                <div style="margin-top: 20px;/*border: 1px red solid*/">
<%--                    <span>注册新用户</span>--%>
                    <span>忘记密码</span>
                </div>
            </form>
            </div>
            <%--注册--%>
<%--            <div class="table" style="height: 400px" hidden>--%>
<%--            <form action="" id="log">--%>
<%--                <table >--%>
<%--                    <tr>--%>
<%--                        <td>账号：</td>--%>
<%--                        <td><input type="text" value="" name="account"></td>--%>
<%--                        <td><span hidden >账号不能为空</span></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>密码：</td>--%>
<%--                        <td><input type="password" value="" name="pwd"></td>--%>
<%--                        <td><span hidden>密码不能为空，不足六位数</span></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>确认密码：</td>--%>
<%--                        <td><input type="password" value="copwd" ></td>--%>
<%--                        <td><span hidden>密码不能为空，不足六位数或密码不一致</span></td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>手机号：</td>--%>
<%--                        <td><input type="password" value="phone" ></td>--%>
<%--                        <td><span hidden>手机号不能为空或格式不正确</span></td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--                <input type="submit" value="提交"  style="width: 90px;margin-top: 30px">--%>
<%--                <div style="margin-top: 20px">--%>
<%--                    <span id="return">返回</span>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        //弹框正则判断
        //密码
        $("input[name=userpwd ]").blur(function () {
            var userpwd=$("input[name=userpwd ]").val();
            if(userpwd==""){
                $("#pwd").show();
                $("#pwd").delay(1000).hide(0);
            }else {
                $("#pwd").hide();
                $("#pwd").delay(1000).hide(0);
            }
        });
        //用户
        $("input[name=username]").blur(function () {
            var username=$("input[name=username]").val();
            var red=/^\S{6,10}$/;
            if(username==""){
                $("#name").show();
                $("#name").delay(1000).hide(0);
            }else{
                $("#name").hide();
                $("#name").delay(1000).hide(0);
            }
        });
        //表单提交
            $("#register").submit(function () {
                var userpwd=$("input[name=userpwd ]").val();
                var username=$("input[name=username]").val();
                if(username==""){
                    $("#name").show();
                    return false;
                }
                if(userpwd==""){
                    $("#pwd").show();
                    return false;
                }
            });
    })
</script>
</html>
