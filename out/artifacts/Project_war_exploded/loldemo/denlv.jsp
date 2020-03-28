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
                $("#wjmm").css({"box-shadow":"0 0 0 red"});
                $(".wjmms").css({"color":"#000000"});
            });
            $("#zce").hover(function () {
                $(".zc").css({"color":"red"});
                $("#zce").css({"box-shadow":"0 0 1px red"});
                $("#dlv").css({"box-shadow":"0 0 0 red"});
                $("#wjmm").css({"box-shadow":"0 0 0 red"});
                $(".dl").css({"color":"#000000"});
                $(".wjmms").css({"color":"#000000"});
                $(".wjname").css({"color":"#000000"});
            });
            $(".wjmm").hover(function () {
                $(".zc").css({"color":"#000000"});
                $("#zce").css({"box-shadow":"0 0 0 red"});
                $("#dlv").css({"box-shadow":"0 0 0 red"});
                $("#wjmm").css({"box-shadow":"0 0 1px red"});
                $(".dl").css({"color":"#000000"});
                $(".wjname").css({"color":"red"});
            });

            $(".wjmms").click(function () {
                $(".wjmm").show();
                $(".yhdl").hide()
            });
            $(".fhdl").click(function () {
                $(".yhdl").show();
                $(".wjmm").hide()
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

            //忘记密码
            $(".userupda").click(function () {
                var Updh=$("input[name=Updh]").val();
                var Uppwd=$("input[name=Uppwd ]").val();
                var Upname=$("input[name=Upname ]").val();

                if(Upname==""||Updh==""||Uppwd==""){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("请先填完全部框!");
                    $(".c2cyh").delay(1000).hide(0);
                }else{
                    /*location.href="http://localhost:8080/Project_war_exploded/upuser?Uppwd="+Uppwd+"&Upname="+Upname+"&Updh="+Upname;*/

                }

            });

            $(".userdhdl").click(function () {
                var userdh=$("input[name=userdh]").val();
                var userpwd=$("input[name=userpwd ]").val();
                location.href="http://localhost:8080/Project_war_exploded/seluerdh?userdh="+userdh+"&userpwd="+userpwd+"";

            });

            //(忘记密码)失去焦点正则判断

            $($("input[name=Upname ]")).blur(function () {
                var Upnames=$("input[name=Upname ]").val();
                var red=/^\S{6,10}$/;
                if (Upnames==null||Upnames==""){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("账户不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                }else if (!red.test(Upnames)) {
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("账户格式不正确!");
                    $(".c2cyh").delay(1000).hide(0);
                }
            });

            //电话
            $("input[name=Updh]").blur(function () {
                var Updh=$("input[name=Updh]").val();
                var phonereg=/^1(3|4|5|6|7|8|9)\d{9}$/
                if (Updh==""){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("电话不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                }else if(!phonereg.test(Updh)){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("电话格式错误!");
                    $(".c2cyh").delay(1000).hide(0);
                    }
                });
            //密码
            $(".pwd").blur(function () {
                var pwd=$(".pwd").val();
                if(pwd==""||pwd==null){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("密码不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                    return false;
                }else {
                    $(".ispwd").blur(function () {
                        var pwd=$(".pwd").val();
                        var ispwd=$(".ispwd").val();
                        if(pwd!=ispwd){
                            $(".c2cyh").show();
                            $(".c2cyh").children("p").text("确认密码不相同!");
                            $(".c2cyh").delay(1000).hide(0);
                            return false;
                }
            })
        }
        });

            //注册
        $("form").submit(function () {
                var pwd=$(".pwds").val();
                var ispwd=$(".ispwds").val();
            var name=$("input[name=userName]").val();
            var phone=$("input[name=userPhone]").val();
                var phonereg=/^1(3|4|5|6|7|8|9)\d{9}$/
                var red=/^\S{6,10}$/;
                if (name==""||phone==""||pwd==""||ispwd==""){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("请先填完全部数据!");
                    $(".c2cyh").delay(2000).hide(0);
                    return false;
                }else if (!$('.tonyi').is(':checked')){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("请先同意协议!");
                    $(".c2cyh").delay(1000).hide(0);
                    return false;
                }
            });

            //(注册)失去焦点正则判断
            //账户

            $("input[name=userName]").blur(function () {
                var name=$("input[name=userName]").val();
                var red=/^\S{6,10}$/;
                if(name==""||name==null){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("账户不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                }else if (!red.test(name)) {
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("账户格式不正确!");
                    $(".c2cyh").delay(1000).hide(0);
                }
            });

            //电话
            $("input[name=userPhone]").blur(function () {
                var phone=$("input[name=userPhone]").val();
                var phonereg=/^1(3|4|5|6|7|8|9)\d{9}$/
                if (phone==""||phone==null){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("电话不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                }else if(!phonereg.test(phone)){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("电话格式错误!");
                    $(".c2cyh").delay(1000).hide(0);
                }
            });
            //密码
            $(".pwds").blur(function () {
                var pwd=$(".pwds").val();
                if(pwd==""||pwd==null){
                    $(".c2cyh").show();
                    $(".c2cyh").children("p").text("密码不能为空!");
                    $(".c2cyh").delay(1000).hide(0);
                    return false;
                }else {
                    $(".ispwds").blur(function () {
                        var pwd=$(".pwds").val();
                        var ispwd=$(".ispwds").val();
                        if(pwd!=ispwd){
                            $(".c2cyh").show();
                            $(".c2cyh").children("p").text("两次密码不相同!");
                            $(".c2cyh").delay(1000).hide(0);
                  return  false;
                }
            })
                }
            });
        })
</script>
<style type="text/css">
    ul li{
        list-style-type: none;
        text-align: left;
        font-size: 18px;
        margin-left: -15px;
    }
    body{
        margin: 0;
        padding: 0;
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
<body style="background-color: #f5f5f5">
<%--提示框--%>
<div class="c2cyh" hidden style="z-index: 101" >

    <div align="center" style="z-index: 101;position: absolute;left: 10px;top: 15px;">
        <img style="width: 45px;" src="\subject\loading.png" alt="">
        <p style="font-size: 11px;color: #ccc;margin-bottom: 1px;">魄罗提示</p>
        <br/>
    </div><p style="margin-left: 70px;margin-top: 27px;font-size: 14px;color: orange"></p>
</div>
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

               </div>

        <tr>
            <td>
                <div align="center" style="width: 1513px;height: 570px;/*border: 1px red solid;*/margin-top: 105px;">
                    <div  style="/*border: 1px blue solid;*/width: 1100px;height: 570px;" >

                        <%--白条--%>
                        <div align="left" style="box-shadow:0 0 1px #ccc;padding-top: 15px;background-color: #ffffff;/*border: 1px brown solid;*/width: 1087px;height: 50px;color: #ffffff;">
                            <label  style="margin-left: 5px;font-size: 22px;color: #333333;"><span class="wjname">忘记密码</span> | <span class="zc">注册</span>    </label>
                        </div>


                            <%--忘记密码--%>
                            <div class="wjmm" align="left" style="margin-top: 18px;margin-left: 5px;">
                                <div  id="wjmm" style="background-color: #ffffff;display: inline-block;border: 1px #ffffff solid;width: 530px;height: 400px">

                                    <ul>
                                        <li>忘记密码</li>
                                    </ul>

                                    <div align="left" style="margin-left: 30px;margin-top:20px;" class="zhanh">
                                        <label   style="font-size: 10px;font-weight: bold">用户账户*</label><span style="font-size: 8px;color: #ccc">(6-10位字符)</span>
                                        <div style="margin-top: 5px;margin-bottom: 5px"><input name="Upname" type="text" style="width: 470px;height: 40px"></div>
                                        <div style="margin-top: 15px;margin-bottom: 5px">  <label style="font-size: 12px" ><span  style="font-weight: bold">补全手机号*</span><span style="font-size: 8px;color: #ccc">(11位号码)</span></label>
                                            <input type="text" name="Updh" style="width: 470px;height: 40px">
                                        </div>
                                    </div>
                                    <div align="left" style="margin-left: 30px">

                                        <div style="display: inline-block;">

                                            <label  style="font-size: 10px;font-weight: bold">密码*</label>
                                            <div style="margin-top: 5px"><input type="password" class="pwd"  style="width: 232px;height: 40px"></div>
                                        </div>
                                        <div align="left"  style="display: inline-block;margin-top: 20px">
                                            <label  style="font-size: 10px;font-weight: bold">确认密码*</label>
                                            <div style="margin-top: 5px"><input type="password" class="ispwd" name="Uppwd" style="width: 232px;height: 40px"></div>

                                        </div>
                                    </div>
                                    <div style="margin-top: 20px;margin-left: 30px" align="left">
                                        <input align="center" type="checkbox" checked="checked" style="width: 16px;height: 16px"><span style="font-size: 12px">欢迎登录（魄罗商城）</span>
                        </div>
                                    <div align="center" style="margin-top: 25px">
                                        <input type="button" class="userupda" value="确认修改" style="border:none;font-size: 15px;font-weight: bold;color: white;background-color: black;border-radius: 5px;width: 295px;height: 50px;">
                                    </div>
                                </div>
                                </div>





                        <%--注册--%>
                        <div  align="right" style="margin-top: -420px;margin-right: 5px;" >
                        <div style="background-color: #ffffff;display: inline-block;margin-top: 18px;width: 530px;height: 480px;" id="zce">
                            <ul>
                                <li>新用户注册</li>
                                <li style="color: rgb(163,167,168);"><span style="font-size: 8px">*(必填框)</span></li>
                            </ul>

                            <div align="left" style="margin-top: 25px;margin-left: 30px">
                                <label  style="font-size: 10px;font-weight: bold">注册用户*</label><span style="font-size: 8px;color: #ccc">(请注册6-10位字符)</span>
                                <div style="margin-top: 5px"><input type="text" name="userName" style="width: 475px;height: 40px"></div>
                            </div>

                            <div align="left" style="margin-top: 30px;margin-left: 30px">
                                <label  style="font-size: 10px;font-weight: bold">电话号码*</label><span style="font-size: 8px;color: #ccc">(11位号码)</span>
                                <div style="margin-top: 5px"><input type="text" name="userPhone" style="width: 475px;height: 40px"></div>
                            </div>

                            <div align="left" style="margin-left: 30px">
                                <div style="display: inline-block;margin-top: 30px">
                                    <label  style="font-size: 10px;font-weight: bold">密码*</label>
                                    <div style="margin-top: 5px"><input type="password" class="pwds"  style="width: 235px;height: 40px"></div>
                                </div>

                                <div align="left"  style="display: inline-block;margin-top: 30px">
                                    <label  style="font-size: 10px;font-weight: bold">确认密码*</label>
                                    <div style="margin-top: 5px"><input type="password" class="ispwds" name="userPwd" style="width: 235px;height: 40px"></div>

                                </div>
                            </div>
                            <div style="margin-top: 25px;margin-left: 30px" align="left">
                                <input align="center" class="tonyi" type="checkbox" style="width: 16px;height: 16px"><span style="font-size: 12px">您接受并同意遵守我们的 条款与条件， 隐私政策， 以及 个人敏感信息政策.</span>
                            </div>
                            <div align="right" style="margin-right: 20px;margin-top: 40px">
                                <input  type="submit" value="注册"  style="border:none;font-size: 15px;font-weight: bold;color: white;background-color: black;border-radius: 5px;width: 295px;height: 50px">
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
