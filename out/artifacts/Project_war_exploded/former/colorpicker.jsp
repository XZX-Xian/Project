<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../backstage/lib/layui/css/global.css">
    <link rel="stylesheet" type="text/css" href="../backstage/lib/layui/css/layui.css">
        <link rel="stylesheet" href="../backstage/css/font.css">
    <script src="../backstage/js/jquery.min.js"></script>
    <script src="../backstage/lib/layui/layui.js"></script>
    <script type="text/javascript" src="../backstage/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body  class=" layui-fluid"><fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>基础效果</legend>
</fieldset>
 
<div id="test1"></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>显示文字</legend>
</fieldset>
 
<div id="test2"></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>半星效果</legend>
</fieldset>
 
<div id="test3"></div>
<div><div id="test4"></div></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>自定义内容</legend>
</fieldset>
 
<div id="test5"></div>
<div><div id="test6"></div></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>自定义长度</legend>
</fieldset>
 
<div id="test7"></div>
<div><div id="test8"></div></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>只读</legend>
</fieldset>
  
<div id="test9"></div>
 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>自定义主题色</legend>
</fieldset>
 
<ul>
  <li><div id="test10"></div></li>
  <li><div id="test11"></div></li>
  <li><div id="test12"></div></li>
  <li><div id="test13"></div></li>
  <li><div id="test14"></div></li>
</ul>
            
          
<script src="../backstage/lib/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['rate'], function(){
  var rate = layui.rate;
  //基础效果
  rate.render({
    elem: '#test1'
  })
 
  //显示文字
  rate.render({
    elem: '#test2'
    ,value: 2 //初始值
    ,text: true //开启文本
  });
 
  //半星效果
  rate.render({
    elem: '#test3'
    ,value: 2.5 //初始值
    ,half: true //开启半星
  })
  rate.render({
    elem: '#test4'
    ,value: 3.5
    ,half: true
    ,text: true
  })
 
  //自定义文本
  rate.render({
    elem: '#test5'
    ,value: 3
    ,text: true
    ,setText: function(value){ //自定义文本的回调
      var arrs = {
        '1': '极差'
        ,'2': '差'
        ,'3': '中等'
        ,'4': '好'
        ,'5': '极好'
      };
      this.span.text(arrs[value] || ( value + "星"));
    }
  })
  rate.render({
    elem: '#test6'
    ,value: 1.5
    ,half: true
    ,text: true
    ,setText: function(value){
      this.span.text(value);
    }
  })
 
  //自定义长度
  rate.render({
    elem: '#test7'
    ,length: 3
  });
  rate.render({
    elem: '#test8'
    ,length: 10
    ,value: 8 //初始值
  });
 
  //只读
  rate.render({
    elem: '#test9'
    ,value: 4
    ,readonly: true
  });
 
  //主题色
  rate.render({
    elem: '#test10'
    ,value: 3
    ,theme: '#FF8000' //自定义主题色
  });
  rate.render({
    elem: '#test11'
    ,value: 3
    ,theme: '#009688'
  });
 
  rate.render({
    elem: '#test12'
    ,value: 2.5
    ,half: true
    ,theme: '#1E9FFF'
  })
  rate.render({
    elem: '#test13'
    ,value: 2.5
    ,half: true
    ,theme: '#2F4056'
  });
  rate.render({
    elem: '#test14'
    ,value: 2.5
    ,half: true
    ,theme: '#FE0000'
  })
});
</script></body>

</html>
