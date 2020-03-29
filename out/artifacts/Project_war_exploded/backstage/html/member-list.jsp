<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="webproject.service.UserService" %>
<%@ page import="webproject.service.impl.UserServiceImpl" %>
<%@ page import="webproject.entity.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <script src="../js/jquery.min.js"></script>
<%--    <script src="backstage/js/jquery.min.js"></script>--%>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    UserService str = new UserServiceImpl();
    List<User> list = new ArrayList<User>();
    String name="";
    list = str.Seleuser(name);
    request.setAttribute("list", list);
%>
<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
            <input type="text" name="username" placeholder="请输入用户名"  size="20" id="fuzzy" style="height: 40px;">
            <button class="layui-btn" onclick="fuzzy()"><i class="layui-icon">&#xe615;</i></button>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <span class="x-right" style="line-height:40px">共有数据：<%=list.size()%> 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox " lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>账号</th>
            <th>性别</th>
            <th>手机</th>
            <th>邮箱</th>
            <th>生日时间</th>
            <th>大区编号</th>
            <th>操作</th>
        </tr>`
        </thead>
        <tbody id="listall">
        <c:forEach items="${list}" var="in">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox layui-form-checkbox" lay-skin="primary" data-id='2'><i
                            class="layui-icon">&#xe605;</i><span hidden>${in.account}</span></div>
                </td>
                <td>${in.account}</td>
                <td>${in.sex}</td>
                <td>${in.phone}</td>
                <td>${in.email}</td>
                <td>${in.birthday}</td>
                <td>${in.state}</td>
                <td class="td-manage">
                    <a title="删除" class="layui-btn layui-btn-sm layui-btn-danger"
                       onclick="member_del(this,'${in.account}')" href="javascript:;">
                        删除
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--分页--%>
    <%--      <div class="page">--%>
    <%--        <div>--%>
    <%--          <a class="prev" href="">&lt;&lt;</a>--%>
    <%--          <a class="num" href="">1</a>--%>
    <%--          <span class="current">2</span>--%>
    <%--          <a class="num" href="">3</a>--%>
    <%--          <a class="num" href="">4</a>--%>
    <%--          <a class="next" href="">&gt;&gt;</a>--%>
    <%--        </div>--%>
    <%--      </div>--%>
</div>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用');
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    $(function () {
        //用户名模糊查询
        fuzzy=function () {
          var name=$("#fuzzy").val();
            var json={"name":name};
            $("#listall").html("");
            $.getJSON("http://localhost:8080/Project_war_exploded/userlist",json,function (data) {
                var list="";
                $("#listall").html(list);
                $.each(data,function (i,item) {
                    list+="    <tr>\n" +
                        "                <td>\n" +
                        "                    <div class=\"layui-unselect layui-form-checkbox layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><i\n" +
                        "                            class=\"layui-icon\">&#xe605;</i><span hidden>"+item.account+"</span></div>\n" +
                        "                </td>\n" +
                        "                <td>"+item.account+"</td>\n" +
                        "                <td>"+item.sex+"</td>\n" +
                        "                <td>"+item.phone+"</td>\n" +
                        "                <td>"+item.email+"</td>\n" +
                        "                <td>"+item.birthday+"</td>\n" +
                        "                <td>"+item.state+"</td>\n" +
                        "                <td class=\"td-manage\">\n" +
                        "                    <a title=\"删除\" class=\"layui-btn layui-btn-sm layui-btn-danger\"\n" +
                        "                       onclick=\"member_del(this,'"+item.account+"')\" href=\"javascript:;\">\n" +
                        "                        删除\n" +
                        "                    </a>\n" +
                        "                </td>\n" +
                        "            </tr>";
                });
                $("#listall").html(list);
            })
        };

        /*用户-删除*/
        member_del=function(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                var json={"account":id};
                $.getJSON("http://localhost:8080/Project_war_exploded/userdel",json,function (data) {
                    if (data>0){
                        $(obj).parents("tr").remove();
                        //提示弹窗
                        layer.msg('已删除!', {icon: 111, time: 1000});
                    }
                });
            });
        };
        //选中删除
        delAll=function(argument) {
            // var data = tableCheck.getData();
            var date=new Array();
            var index=$(".layui-form-checked").length;
            for(var i=0;i<index;i++){
                    var id=$(".layui-form-checked:eq("+i+")>span").text(); // value被绑定了ID
                date.push(id);
                }
            layer.confirm('确认要删除吗？' + date, function (index) {
                //提示弹窗
                layer.msg('删除成功', {icon: 1,time:2000});
                $(".layui-form-checked").not('.header').parents('tr').remove();
                location.href="http://localhost:8080/Project_war_exploded/userdelall?account="+date;
            });
        };
    });

</script>
</body>

</html>