<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="webproject.service.OrderService" %>
<%@ page import="webproject.service.impl.OrderServiceImpl" %>
<%@ page import="webproject.entity.Order" %>
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
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
    OrderService str = new OrderServiceImpl();
    List<Order> list = new ArrayList<Order>();
    list = str.OrderList();
    request.setAttribute("list", list);
%>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a id="refresh" class="layui-btn layui-btn-primary layui-btn-small"
       style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);"
       title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-input-inline">
            <select name="contrller" onchange="state()" id="state">
                <option value="">订单状态</option>
                <option value="0">待付款</option>
                <option value="1">待发货</option>
                <option value="2">待收货</option>
                <option value="3">待评价</option>
            </select>
        </div>
        <input type="text" name="username" placeholder="请输入订单号" size="20" id="fuzzy" style="height: 40px;">
        <button class="layui-btn" onclick="fuzzy()"><i class="layui-icon">&#xe615;</i></button>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <span class="x-right" style="line-height:40px">共有数据：${list.size()} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>订单编号</th>
            <th>收货人</th>
            <th>总金额</th>
            <th>订单状态</th>
            <th>下单时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="listall">
        <c:forEach items="${list}" var="in">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><span
                            hidden="">${in.ordernumber}</span><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${in.ordernumber}</td>
                <td>${in.username}</td>
                <td>${in.money}</td>
                <td><span hidden class="state">${in.state}</span><span></span></td>
                <td>${in.date}</td>
                <td class="td-manage">
                    <a title="删除" onclick="member_del(this,'${in.ordernumber}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

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

    $(function () {
        oderstate();
        //订单状态查询
        state = function () {
            var state = $("#state").val();
            if (state == "") {
                //页面涮新
                location.href = "javascript:location.replace(location.href);";
            }
            var json = {"state": state};
            $("#listall").html("");
            $.getJSON("http://localhost:8080/Project_war_exploded/orderstate", json, function (data) {
                var list = "";
                $.each(data, function (i, item) {
                    list += "<tr>\n" +
                        "            <td>\n" +
                        "              <div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><span hidden=\"\">" + item.ordernumber + "</span><i class=\"layui-icon\">&#xe605;</i></div>\n" +
                        "            </td>\n" +
                        "            <td>" + item.ordernumber + "</td>\n" +
                        "            <td>" + item.username + "</td>\n" +
                        "            <td>" + item.money + "</td>\n" +
                        "            <td><span hidden class=\"state\">" + item.state + "</span><span></span></td>\n" +
                        "            <td>" + item.date + "</td>\n" +
                        "            <td class=\"td-manage\">\n" +
                        "              <a title=\"删除\" onclick=\"member_del(this,'" + item.ordernumber + "')\" href=\"javascript:;\">\n" +
                        "                <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "              </a>\n" +
                        "            </td>\n" +
                        "          </tr>";
                });
                $("#listall").html(list);
                oderstate();
            })
        };

        //订单状态
        function oderstate() {
            var count = $(".state").length;
            for (var i = 0; i < count; i++) {
                var id = $(".state:eq(" + i + ")").text();
                switch (id) {
                    case "0":
                        $(".state:eq(" + i + ")").next().text("待付款");
                        break;
                    case "1":
                        $(".state:eq(" + i + ")").next().text("待发货");
                        break;
                    case "2":
                        $(".state:eq(" + i + ")").next().text("待收货");
                        break;
                    case "3":
                        $(".state:eq(" + i + ")").next().text("待评价");
                        break;
                }
            }
            ;
        };
        //订单模糊查询
        fuzzy = function () {
            var name = $("#fuzzy").val();
            var json = {"ordernumber": name};
            $("#listall").html("");
            $.getJSON("http://localhost:8080/Project_war_exploded/orderlike", json, function (data) {
                var list = "";
                $("#listall").html("");
                $.each(data, function (i, item) {
                    list += "<tr>\n" +
                        "            <td>\n" +
                        "              <div class=\"layui-unselect layui-form-checkbox\" lay-skin=\"primary\" data-id='2'><span hidden=\"\">" + item.ordernumber + "</span><i class=\"layui-icon\">&#xe605;</i></div>\n" +
                        "            </td>\n" +
                        "            <td>" + item.ordernumber + "</td>\n" +
                        "            <td>" + item.username + "</td>\n" +
                        "            <td>" + item.money + "</td>\n" +
                        "            <td><span hidden class=\"state\">" + item.state + "</span><span></span></td>\n" +
                        "            <td>" + item.date + "</td>\n" +
                        "            <td class=\"td-manage\">\n" +
                        "              <a title=\"删除\" onclick=\"member_del(this,'" + item.ordernumber + "')\" href=\"javascript:;\">\n" +
                        "                <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "              </a>\n" +
                        "            </td>\n" +
                        "          </tr>";
                });
                $("#listall").html(list);
                oderstate();
            })
        };

        /*订单-删除*/
        member_del = function (obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                var json = {"ordernumber": id};
                $.getJSON("http://localhost:8080/Project_war_exploded/orderdel", json, function (data) {
                    if (data > 0) {
                        $(obj).parents("tr").remove();
                        //提示弹窗
                        layer.msg('已删除!', {icon: 111, time: 1000});
                    }
                });
            });
        };
        //订单选中删除
        delAll = function (argument) {
            var date = new Array();
            var index = $(".layui-form-checked").length;
            for (var i = 0; i < index; i++) {
                var id = $(".layui-form-checked:eq(" + i + ")>span").text(); // value被绑定了ID
                date.push(id);
            }
            layer.confirm('确认要删除吗？' + date, function (index) {
                $.getJSON("http://localhost:8080/Project_war_exploded/orderdel?ordernumber=" + date, "", function (data) {
                    if (data > 0) {
                        //提示弹窗
                        layer.msg('删除成功', {icon: 1, time: 2000});
                        $(".layui-form-checked").not('.header').parents('tr').remove();
                    }
                });
                // location.href="http://localhost:8080/Project_war_exploded/userdelall?account="+date;
            });
        };
    });
</script>
</body>

</html>
