<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>带摇晃特效的扁平风格登录注册表单界面</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
  </head>
  
  <body>
   <p class="center">登录用户名为：admin，密码为admin</p>
<p class="center">在用户名和密码错误时，点击登录按钮可以看到表单的摇晃效果。</p>
<div id="wrapper" class="login-page">
<div id="login_form" class="form">
<form class="register-form">
<input type="text" placeholder="用户名" value="admin" id="r_user_name" />
<input type="password" placeholder="密码" id="r_password" />
<input type="text" placeholder="电子邮件" id="r_emial" />
<button id="create">创建账户</button>
<p class="message">已经有了一个账户? <a href="#">立刻登录</a></p>
</form>
<form class="login-form">
 <h2>管理登录</h2>
<input type="text" placeholder="用户名" value="admin" id="user_name" />
<input type="password" placeholder="密码" id="password" />
<button id="login">登　录</button>
<p class="message">还没有账户? <a href="#">立刻创建</a></p>
</form>
</div>
</div>

<script src="js/jquery.min.js"></script>
<script type="text/javascript">
	function check_login()
	{
	 var name=$("#user_name").val();
	 var pass=$("#password").val();
	 if(name=="admin" && pass=="admin")
	 {
	  alert("登录成功！");
	  $("#user_name").val("");
	  $("#password").val("");
       $(location).attr('href', 'index.jsp');
	 }
	 else
	 {
	  $("#login_form").removeClass('shake_effect');  
	  setTimeout(function()
	  {
	   $("#login_form").addClass('shake_effect')
	  },1);  
	 }
	}
	function check_register(){
		var name = $("#r_user_name").val();
		var pass = $("#r_password").val();
		var email = $("r_email").val();
		if(name!="" && pass=="" && email != "")
		 {
		  alert("注册成功！");
		  $("#user_name").val("");
		  $("#password").val("");
		 }
		 else
		 {
		  $("#login_form").removeClass('shake_effect');  
		  setTimeout(function()
		  {
		   $("#login_form").addClass('shake_effect')
		  },1);  
		 }
	}
	$(function(){
		$("#create").click(function(){
			check_register();
			return false;
		})
		$("#login").click(function(){
			check_login();
			return false;
		})
		$('.message a').click(function () {
		    $('form').animate({
		        height: 'toggle',
		        opacity: 'toggle'
		    }, 'slow');
		});
	})
	</script>
  </body>
</html>
