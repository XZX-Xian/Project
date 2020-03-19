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
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script src="../js/jquery.min.js"></script>
	<script src="../lib/layui/layui.js"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
<body class="form-wrap">

  <style>
  /* 这段样式只是用于演示 */
  .layui-progress{margin: 20px 0;}
  </style>

  <div class="layui-fluid" id="LAY-component-progress">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">默认进度条</div>
          <div class="layui-card-body">
          
            <div class="layui-progress">
              <div class="layui-progress-bar" lay-percent="50%"></div>
            </div>
            <div class="layui-row layui-col-space15">
              <div class="layui-col-xs6">
                <div class="layui-progress">
                  <div class="layui-progress-bar" lay-percent="50%"></div>
                </div>
              </div>
              <div class="layui-col-xs6">
                <div class="layui-progress">
                  <div class="layui-progress-bar" lay-percent="50%"></div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">更多颜色进度条</div>
          <div class="layui-card-body">
          
            <div class="layui-progress">
              <div class="layui-progress-bar layui-bg-red" lay-percent="20%"></div>
            </div>

            <div class="layui-progress">
              <div class="layui-progress-bar layui-bg-orange" lay-percent="30%"></div>
            </div>

            <div class="layui-progress">
              <div class="layui-progress-bar layui-bg-green" lay-percent="40%"></div>
            </div>

            <div class="layui-progress">
              <div class="layui-progress-bar layui-bg-blue" lay-percent="50%"></div>
            </div>

            <div class="layui-progress">
              <div class="layui-progress-bar layui-bg-cyan" lay-percent="60%"></div>
            </div>
            
            <div class="layui-progress layui-progress-big">
              <div class="layui-progress-bar" lay-percent="20%"></div>
            </div>
            <div class="layui-progress layui-progress-big">
              <div class="layui-progress-bar layui-bg-green" lay-percent="35%"></div>
            </div>
            <div class="layui-progress layui-progress-big">
              <div class="layui-progress-bar layui-bg-cyan" lay-percent="75%"></div>
            </div>
            
          </div>
        </div>
      </div>
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">动态改变进度</div>
          <div class="layui-card-body">

              <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="component-progress-demo">
                <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
              </div>
               
              <div class="layui-btn-container" style="margin-top: 20px; margin-bottom: 0;">
                <button class="layui-btn site-demo-active" data-type="setPercent">设置50%</button>
                <button class="layui-btn site-demo-active" data-type="loading">模拟loading</button>
              </div>
            
          </div>
        </div>
      </div>
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">显示进度比文本</div>
          <div class="layui-card-body">

            <div class="layui-progress" lay-showpercent="true">
              <div class="layui-progress-bar" lay-percent="20%"></div>
            </div>
            <div class="layui-progress" lay-showpercent="true">
              <div class="layui-progress-bar" lay-percent="5 / 10"></div>
            </div>
            <div class="layui-progress layui-progress-big" lay-showpercent="true">
              <div class="layui-progress-bar" lay-percent="70%"></div>
            </div>
          
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="../lib/layui/layui.js"></script>
  <script>
  layui.config({
    base: '../../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index'], function(){
    var $ = layui.$
    ,admin = layui.admin
    ,element = layui.element
    ,router = layui.router();

    element.render('progress');
    
    //触发事件
    var active = {
      setPercent: function(){
        //设置50%进度
        element.progress('component-progress-demo', '50%')
      }
      ,loading: function(othis){
        var DISABLED = 'layui-btn-disabled';
        if(othis.hasClass(DISABLED)) return;
      
        //模拟loading
        var n = 0, timer = setInterval(function(){
          n = n + Math.random()*10|0;  
          if(n>100){
            n = 100;
            clearInterval(timer);
            othis.removeClass(DISABLED);
          }
          element.progress('component-progress-demo', n+'%');
        }, 300+Math.random()*1000);
        
        othis.addClass(DISABLED);
      }
    };
    
    $('#LAY-component-progress .site-demo-active').on('click', function(){
      var othis = $(this), type = $(this).data('type');
      active[type] ? active[type].call(this, othis) : '';
    });
    
  });
  </script>
</body>

</html>