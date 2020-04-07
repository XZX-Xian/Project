<%@ page import="webproject.service.CommService" %>
<%@ page import="webproject.service.impl.CommServiceImpl" %>
<%@ page import="webproject.entity.Comm" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 康爸爸
  Date: 2020-03-26
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
    CommService str=new CommServiceImpl();
    List<Comm> list = new ArrayList<Comm>();
    String name="";
    list=str.CommLike(name);
    request.setAttribute("list",list);
%>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <input type="text" name="username" placeholder="请输入商品名称" size="20" id="fuzzy" style="height: 40px;">
        <button class="layui-btn" onclick="fuzzy()"><i class="layui-icon">&#xe615;</i></button>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加商品','./comm-add.jsp')"><i class="layui-icon"></i>添加</button>

        <span class="x-right" style="line-height:40px">共有数据：${list.size()} 条</span>
</xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>商品编号</th>
            <th>单价</th>
            <th>颜色</th>
            <th>大小</th>
            <th>库存</th>
            <th>名称</th>
            <th>销量</th>
            <th>评价</th>
            <th>展示图(一)</th>
            <th>展示图(二)</th>
            <th>商品详情展示图</th>
            <th>类型</th>
            <th>操作</th>
        </thead>
        <tbody id="listall">
        <c:forEach items="${list}" var="in">
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><span style="display:none">${in.comID}</span><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${in.comID}</td>
            <td>${in.comMoney}</td>
            <td>${in.comColor}</td>
            <td><span class="size" hidden>${in.comSize}</span><span></span></td>
            <td>${in.comQuantity}</td>
            <td>${in.comName}</td>
            <td>${in.comCount}</td>
            <td>${in.comAppCount}</td>
            <td><img src="${in.comOve}" title="展示图(一)"></td>
            <td><img src="${in.comOut}" title="展示图(二)"></td>
            <td><img src="${in.comCCTV}" title="商品详情展示图" height="100px"></td>
            <td><span class="type" hidden>${in.comtype}</span><span></span></td>
            <td class="td-manage">
                <a title="编辑"  onclick="x_admin_show('编辑','admin-edit.html')" href="javascript:;">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="member_del(this,'${in.comID}')" href="javascript:;">
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</div>
<script>
    layui.use('laydate', function(){
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
    $(function () {
        state();

        //商品模糊查询
        fuzzy = function () {
            var name = $("#fuzzy").val();
            var json = {"name": name};
            $("#listall").html("");
            $.getJSON("http://localhost:8080/Project_war_exploded/comlike", json, function (data) {
                var list = "";
                $("#listall").html("");
                $.each(data, function (i, item) {
                    list += "    <tr>\n" +
                        "            <td>\n" +
                        "                <div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><span style=\"display:none\">"+item.comID+"</span><i class=\"layui-icon\">&#xe605;</i></div>\n" +
                        "            </td>\n" +
                        "            <td>"+item.comID+"</td>\n" +
                        "            <td>"+item.comMoney+"</td>\n" +
                        "            <td>"+item.comColor+"</td>\n" +
                        "            <td><span class=\"size\" hidden>"+item.comSize+"</span><span></span></td>\n" +
                        "            <td>"+item.comQuantity+"</td>\n" +
                        "            <td>"+item.comName+"</td>\n" +
                        "            <td>"+item.comCount+"</td>\n" +
                        "            <td>"+item.comAppCount+"</td>\n" +
                        "            <td><img src=\""+item.comOve+"\" title=\"展示图(一)\"></td>\n" +
                        "            <td><img src=\""+item.comOut+"\" title=\"展示图(二)\"></td>\n" +
                        "            <td><img src=\""+item.comCCTV+"\" title=\"商品详情展示图\" height=\"100px\"></td>\n" +
                        "            <td><span class=\"type\" hidden>"+item.comtype+"</span><span></span></td>\n" +
                        "            <td class=\"td-manage\">\n" +
                        "                <a title=\"编辑\"  onclick=\"x_admin_show('编辑','admin-edit.html')\" href=\"javascript:;\">\n" +
                        "                    <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                </a>\n" +
                        "                <a title=\"删除\" onclick=\"member_del(this,'"+item.comID+"')\" href=\"javascript:;\">\n" +
                        "                    <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                </a>\n" +
                        "            </td>\n" +
                        "        </tr>";
                });
                $("#listall").html(list);
               state();
            })
        };

        /*商品-删除*/
        member_del = function (obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                var json = {"ids": id};
                $.getJSON("http://localhost:8080/Project_war_exploded/commdel",json, function (data) {
                    if (data > 0) {
                        $(obj).parents("tr").remove();
                        //提示弹窗
                        layer.msg('已删除!', {icon: 111, time: 1000});
                    }
                });
            });
        };
        //商品选中删除
        delAll = function (argument) {
            var date = new Array();
            var index = $(".layui-form-checked").length;
            for (var i = 0; i < index; i++) {
                var id = $(".layui-form-checked:eq(" + i + ")>span").text(); // value被绑定了ID
                date.push(id);
            }
            layer.confirm('确认要删除吗？' + date, function (index) {
                $.getJSON("http://localhost:8080/Project_war_exploded/commdel?ids=" + date, "", function (data) {
                    if (data > 0) {
                        //提示弹窗
                        layer.msg('删除成功', {icon: 1, time: 2000});
                        $(".layui-form-checked").not('.header').parents('tr').remove();
                    }
                });
            });
        };

        //状态
        function state() {
            var count = $(".size").length;
            for (var i = 0; i < count; i++) {
                var size = $(".size:eq(" + i + ")").text();
                switch (size) {
                    case "1":
                        $(".size:eq(" + i + ")").next().text("迷你型");
                        break;
                    case "2":
                        $(".size:eq(" + i + ")").next().text("中型");
                        break;
                    case "3":
                        $(".size:eq(" + i + ")").next().text("大型");
                        break;
                }

                var type = $(".type:eq(" + i + ")").text();
                switch (type) {
                    case "1":
                        $(".type:eq(" + i + ")").next().text("手办");
                        break;
                    case "2":
                        $(".type:eq(" + i + ")").next().text("公仔");
                        break;
                    case "11":
                        $(".type:eq(" + i + ")").next().text("手办套装");
                        break;
                    case "22":
                        $(".type:eq(" + i + ")").next().text("公仔套装");
                        break;
                }
            }
            ;
        };
    });
</script>
</body>
</html>
