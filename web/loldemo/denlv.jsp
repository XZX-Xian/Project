<%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 2020-2-4 0004
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="../js/denlv.css">
    <link rel="stylesheet" type="text/css" href="js/denlv.css">
</head>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
        $(function () {

            $("#dlv").hover(function () {
               $(".dl").css({"color":"red"});
                $("#dlv").css({"box-shadow":"0 0 1px red"});
                $("#zce").css({"box-shadow":"0 0 0 red"});
                $(".zc").css({"color":"#000000"});
            });
            $("#zce").hover(function () {
                $(".zc").css({"color":"red"});
                $("#zce").css({"box-shadow":"0 0 1px red"});
                $("#dlv").css({"box-shadow":"0 0 0 red"});
                $(".dl").css({"color":"#000000"});
            });

            $(".sj").click(function () {
                $(this).parent().parent().hide();
                $(".userdl").hide();
                $(".userdhdl").show();
                $(".dh").show();
            });
            $(".zh").click(function () {
                $(this).parent().parent().hide();
                $(".userdl").show();
                $(".userdhdl").hide();
                $(".zhanh").show();
            });


            //用户登录
            $(".userdl").click(function () {
               var username=$("input[name=username]").val();
                var userpwd=$("input[name=userpwd ]").val();
                location.href="http://localhost:8080/Project_war_exploded/seluer?username="+username+"&userpwd="+userpwd+"";
            });

            //电话登录
            $(".userdhdl").click(function () {
                var userdh=$("input[name=userdh]").val();
                var userpwd=$("input[name=userpwd ]").val();
                location.href="http://localhost:8080/Project_war_exploded/seluerdh?userdh="+userdh+"&userpwd="+userpwd+"";

            });
            $(".pwd").blur(function () {
                var pwd=$(".pwd").val();
                if(pwd==""||pwd==null){
                    alert("密码不能为空！");
                    return false;
                }else {
                    $(".ispwd").blur(function () {
                        var pwd=$(".pwd").val();
                        var ispwd=$(".ispwd").val();
                        if(pwd!=ispwd){
                            alert("两次输入的密码不相同！");
                            return false;
                }
            })
        }
        });
            //
        $("form").submit(function () {
            var pwd=$(".pwd").val();
            var ispwd=$(".ispwd").val();
            var name=$("input[name=userName]").val();
            var phone=$("input[name=userPhone]").val();
            if (name==""||name==null){
                alert("账号不能为空！");
                    return false;
                }else if (phone==""||phone==null){
                    alert("电话号码不能为空!");
                    return false;
                }else if(pwd==""||pwd==null){
                    alert("密码不能为空！");
                    return false;
                }else if (pwd!=ispwd){
                        alert("两次输入的密码不相同！");
                  return  false;
                }
            })

        })
</script>
<%--<style type="text/css"></style>--%>
<body style="background-color: #f5f5f5">
<form action="http://localhost:8080/Project_war_exploded/seluerUp">
    <table  <%--border="1px"--%>>

               <%--头部--%>
               <div style="width: 1513px;height: 60px;background-color: #ffffff;position: fixed;z-index: 999;">
                   <%--logo--%>

                           <%--头部导航栏框--%>
                           <div style="height:55px;background-color: white;margin-bottom: 30px;">

                               <%--logo框--%>
                               <div style="width: 300px;height: 55px;display:inline-block;margin-right:600px;margin-left: -20px;text-align: center">
                                   <img src="\subject\loading.png" width="100" style="margin-right: 5px">
                                   <div style="display:inline-block;position: absolute;top: 20px"><strong style="font-size: 20px;">魄罗商城</strong></div>
                               </div>

<%--                               &lt;%&ndash;搜索框&ndash;%&gt;--%>
<%--                               <div style="width: 170px;height: 55px;display:inline-block;position:absolute;top: 6px;margin-left: 85px;text-align: center">--%>
<%--                                   <input type="search" style="display:inline-block;border-radius:25px;margin-top: 15px;">--%>
<%--                                   <img src="\subject\cx.png" alt="" width="35px" style="position: absolute;top: 8px" >--%>
<%--                               </div>--%>

<%--                               &lt;%&ndash;登录框&ndash;%&gt;--%>
<%--                               <div style="width: 160px;height: 55px;display:inline-block;margin-left: 50px">--%>
<%--                                   <img src="\subject\yhu.png" alt="" width="30" style="position: absolute;top: 12px;margin-left: 290px;margin-top: 5px">--%>
<%--                                   <strong style="position: absolute;top: 12px;margin-left: 330px;margin-top: 10px;width: 200px">欢迎,请<a href="">登录</a></strong>--%>
<%--                               </div>--%>

<%--                               &lt;%&ndash;购物车框&ndash;%&gt;--%>
<%--                               <div style="width: 120px;height: 55px;display:inline-block;margin-right: 10px">--%>
<%--                                   <img src="\subject\gwc.png" alt="" width="35px" style="position: absolute;top: 12px;margin-left: 280px;margin-top: 3px">--%>
<%--                                   <strong style="position: absolute;top: 12px;margin-left: 320px;margin-top: 10px;width: 90px"><a href="">购物车</a></strong>--%>
<%--                               </div>--%>

               </div>

        <tr>
            <td>
                <div align="center" style="width: 1513px;height: 570px;/*border: 1px red solid;*/margin-top: 105px;">
                    <div  style="/*border: 1px blue solid;*/width: 1100px;height: 570px;" >

                        <%--白条--%>
                        <div align="center" style="box-shadow:0 0 1px #ccc;padding-top: 15px;background-color: #ffffff;/*border: 1px brown solid;*/width: 687px;height: 50px;color: #ffffff;">
                            <label  style=" margin-left: 5px;font-size: 26px;color: #333333;"><span class="zc">注  册</span></label>
                        </div>

                        <%--登录--%>
<%--                        <div  align="left" style="margin-top: 18px;margin-left: 5px;"  hidden>--%>
<%--                        <div   style="background-color: #ffffff;display: inline-block;border: 1px #ffffff solid;width: 530px;height: 400px" id="dlv">--%>
<%--                              <ul>--%>
<%--                                  <li>已注册用户</li>--%>
<%--                              </ul>--%>


<%--                            <div align="left" style="margin-left: 30px;margin-top: 30px;" class="zhanh">--%>
<%--                                <label   style="font-size: 10px;font-weight: bold">用户账户*</label>--%>
<%--                                <div style="margin-top: 5px;margin-bottom: 5px"><input name="username" type="text" style="width: 470px;height: 40px"></div>--%>
<%--                                <label style="font-size: 12px" >或 <span class="sj" style="font-weight: bold">手机号码登录</span></label>--%>
<%--                            </div>--%>

<%--                    &lt;%&ndash;电话登录&ndash;%&gt;--%>
<%--                      <div class="dh" style="margin-left: 30px;margin-top: 35px;" hidden>--%>
<%--                                <label  style="font-size: 10px;margin-top: 35px;font-weight: bold">电话号码*</label>--%>
<%--                                <div style="margin-top: 5px;margin-bottom: 5px"><input type="text" name="userdh" style="width: 470px;height: 40px"></div>--%>
<%--                                 <label style="font-size: 12px" >或 <span class="zh" style="font-weight: bold">用户账号登录</span></label>--%>
<%--                            </div>--%>

<%--                            <div  align="left" style="margin-left: 30px;margin-top: 28px">--%>
<%--                                <label  style="font-size: 10px;margin-top: 35px;font-weight: bold">密码*</label>--%>
<%--                                <div style="margin-top: 5px"><input type="password" name="userpwd"  style="width: 470px;height: 40px"></div>--%>
<%--                            </div>--%>

<%--                            <div style="margin-top: 20px;margin-left: 30px" align="left">--%>
<%--                                <input align="center" type="checkbox" checked="checked" style="width: 16px;height: 16px"><span style="font-size: 12px">欢迎登录（魄罗商城）</span>--%>
<%--                            </div>--%>

<%--                            <div style="margin-right: 30px;margin-top: -15px" align="right">--%>
<%--                               <a href="" style="font-size: 12px">忘记密码？</a>--%>
<%--                            </div>--%>

<%--                            &lt;%&ndash;用户登录&ndash;%&gt;--%>
<%--                            <div align="center" style="margin-top: 40px">--%>
<%--                                <input type="button" class="userdl" value="登录" style="border:none;font-size: 15px;font-weight: bold;color: white;background-color: black;border-radius: 5px;width: 295px;height: 50px;">--%>
<%--                                 </div>--%>

<%--                            &lt;%&ndash;电话登录&ndash;%&gt;--%>
<%--                            <div align="center" style="margin-top: 40px" >--%>
<%--                               <input type="button" class="userdhdl" hidden value="手机登录" style="border:none;font-size: 15px;font-weight: bold;color: white;background-color: black;border-radius: 5px;width: 295px;height: 50px;;">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        </div>--%>

                        <%--注册--%>
<%--                            style="margin-top: -420px;margin-right: 5px;"--%>
                        <div>
                        <div style="background-color: #ffffff;display: inline-block;margin-top: 18px;width: 530px;height: 480px;" id="zce">
                            <ul>
                                <li>新用户注册</li>
                                <li style="color: rgb(163,167,168);"><span style="font-size: 8px">*(必填框)</span></li>
                            </ul>

                            <div align="left" style="margin-top: 25px;margin-left: 30px">
                                <label  style="font-size: 10px;font-weight: bold">注册用户*</label>
                                <div style="margin-top: 5px"><input type="text" name="userName" style="width: 475px;height: 40px"></div>
                            </div>

                            <div align="left" style="margin-top: 30px;margin-left: 30px">
                                <label  style="font-size: 10px;font-weight: bold">电话号码*</label>
                                <div style="margin-top: 5px"><input type="text" name="userPhone" style="width: 475px;height: 40px"></div>
                            </div>

                            <div align="left" style="margin-left: 30px">
                                <div style="display: inline-block;margin-top: 30px">
                                    <label  style="font-size: 10px;font-weight: bold">密码*</label>
                                    <div style="margin-top: 5px"><input type="password" class="pwd"  style="width: 235px;height: 40px"></div>
                                </div>

                                <div align="left"  style="display: inline-block;margin-top: 30px">
                                    <label  style="font-size: 10px;font-weight: bold">确认密码*</label>
                                    <div style="margin-top: 5px"><input type="password" class="ispwd" name="userPwd" style="width: 235px;height: 40px"></div>
                                </div>
                            </div>
                            <div style="margin-top: 25px;margin-left: 30px" align="left">
                                <input align="center" type="checkbox" style="width: 16px;height: 16px"><span style="font-size: 12px">您接受并同意遵守我们的 条款与条件， 隐私政策， 以及 个人敏感信息政策.</span>
                            </div>
                            <div align="right" style="margin-right: 20px;margin-top: 40px">
                                <input type="submit"  value="注册" class="userZche" style="border:none;font-size: 15px;font-weight: bold;color: white;background-color: black;border-radius: 5px;width: 295px;height: 50px">
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                    <div style="width: 1518px;height: 90px;background-color: #333333;margin-top: 20px">
                        <ul>
                            <li style="list-style-type: none">
                                <img src="\subject\LOl.png" alt="" height="45px " style="margin-left: 460px;margin-top: 18px;vertical-align: middle">
                                <img src="\subject\loading.png" alt="" height="45px " style="margin-top: 18px;vertical-align: middle">
                                <p style="font-size: 12px;color: white;margin-top: -45px;margin-left: 645px;width: 360px;white-space:pre-wrap;">Copyright (C) 20119 – 2029 Polo. All Rights Reserved.魄罗公司 全国文化市场统一举报电话：123456                                            客服邮箱：54181452@.qq.com </p>
                            </li>
                        </ul>
                </div>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
