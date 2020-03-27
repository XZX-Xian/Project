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
    <link rel="stylesheet" href="../backstage/css/font.css">
    <link rel="stylesheet" href="../backstage/css/xadmin.css">
    <script src="../backstage/js/jquery.min.js"></script>
	<script src="../backstage/lib/layui/layui.js"></script>
    <script type="text/javascript" src="../backstage/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
<body class="form-wrap">

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header">按钮主题</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn layui-btn-primary">原始按钮</button>
              <button class="layui-btn">默认按钮</button>
              <button class="layui-btn layui-btn-normal">百搭按钮</button>
              <button class="layui-btn layui-btn-warm">暖色按钮</button>
              <button class="layui-btn layui-btn-danger">警告按钮</button>
              <button class="layui-btn layui-btn-disabled">禁用按钮</button>
            </div>
          </div>
        </div>
        <div class="layui-card">
          <div class="layui-card-header">按钮尺寸</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn layui-btn-primary layui-btn-lg">大型按钮</button>
              <button class="layui-btn layui-btn-primary">默认按钮</button>
              <button class="layui-btn layui-btn-primary layui-btn-sm">小型按钮</button>
              <button class="layui-btn layui-btn-primary layui-btn-xs">迷你按钮</button>
              
              <br>
              
              <button class="layui-btn layui-btn-lg">大型按钮</button>
              <button class="layui-btn">默认按钮</button>
              <button class="layui-btn layui-btn-sm">小型按钮</button>
              <button class="layui-btn layui-btn-xs">迷你按钮</button>
              
              <br>
              
              <button class="layui-btn layui-btn-lg layui-btn-normal">大型按钮</button>
              <button class="layui-btn layui-btn-normal">默认按钮</button>
              <button class="layui-btn layui-btn-sm layui-btn-normal">小型按钮</button>
              <button class="layui-btn layui-btn-xs layui-btn-normal">迷你按钮</button>
            </div>
          </div>
        </div>
        <div class="layui-card">
          <div class="layui-card-header">按钮图标</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn"><i class="layui-icon">&#xe600;</i></button>
              <button class="layui-btn"><i class="layui-icon">&#xe603;</i></button>
              <button class="layui-btn"><i class="layui-icon">&#xe602;</i></button>
              <button class="layui-btn"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn"><i class="layui-icon">&#xe640;</i></button>
              <button class="layui-btn"><i class="layui-icon">&#xe641;</i></button>
              
              <br>
              
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe600;</i></button>
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe603;</i></button>
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe602;</i></button>
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe640;</i></button>
              <button class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe641;</i></button>
              
              <br>
              
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe600;</i></button>
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe603;</i></button>
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe602;</i></button>
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
              <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe641;</i></button>
              
              <br>
              
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe600;</i></button>
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe603;</i></button>
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe602;</i></button>
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
              <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe641;</i></button>
              
              <br>
                
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe600;</i></button>
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe603;</i></button>
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe602;</i></button>
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
              <button class="layui-btn layui-btn-normal layui-btn-sm"><i class="layui-icon">&#xe641;</i></button>
            </div>
          </div>
        </div>
      </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <div class="layui-card-header">按钮圆角</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn layui-btn-primary layui-btn-radius">原始按钮</button>
              <button class="layui-btn layui-btn-radius">默认按钮</button>
              <button class="layui-btn layui-btn-normal layui-btn-radius">百搭按钮</button>
              <button class="layui-btn layui-btn-warm layui-btn-radius">暖色按钮</button>
              <button class="layui-btn layui-btn-danger layui-btn-radius">警告按钮</button>
              <button class="layui-btn layui-btn-disabled layui-btn-radius">禁用按钮</button>
            </div>
          </div>
        </div>
        <div class="layui-card">
          <div class="layui-card-header">按钮混搭</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">大型加圆角</button>
              <a href="http://www.layui.com/doc/element/button.html" class="layui-btn" target="_blank">跳转的按钮</a>
              <button class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe640;</i> 删除</button>
              <button class="layui-btn layui-btn-xs layui-btn-disabled"><i class="layui-icon">&#xe641;</i> 分享</button>

            </div>
          </div>
        </div>
        <div class="layui-card">
          <div class="layui-card-header">按钮组合</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <div class="layui-btn-group">
                <button class="layui-btn">增加</button>
                <button class="layui-btn ">编辑</button>
                <button class="layui-btn">删除</button>
              </div>
            </div>
            <div class="layui-btn-container">
              <div class="layui-btn-group">
                <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe654;</i></button>
                <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe642;</i></button>
                <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
                <button class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe602;</i></button>
              </div>
              <div class="layui-btn-group">
                <button class="layui-btn layui-btn-primary layui-btn-sm">文字</button>
                <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe654;</i></button>
                <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe642;</i></button>
                <button class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe640;</i></button>
              </div>
            </div>
          </div>
        </div>
        <div class="layui-card">
          <div class="layui-card-header">按钮铺满</div>
          <div class="layui-card-body">
            <div class="layui-btn-container">
              <button class="layui-btn layui-btn-fluid">好雨知时节</button>
              <button class="layui-btn layui-btn-fluid">当春乃发生</button>
              <button class="layui-btn layui-btn-fluid">随风潜入夜</button>
              <button class="layui-btn layui-btn-fluid">润物细无声</button>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>

  
</body>


</html>
