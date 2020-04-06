<%--
  Created by IntelliJ IDEA.
  User: 康爸爸
  Date: 2020-03-25
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-L-admin1.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <%-- <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />--%>
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

<body>
<div class="x-body">
    <form class="layui-form" action="http://localhost:8080/Project_war_exploded/comadd" method="post"
          enctype="multipart/form-data">
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>价格
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="AddMoney" <%--required lay-verify="phone--%> required
                       lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>价格
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>颜色
            </label>
            <div class="layui-input-inline">
                <select name="Color">
                    <option value="彩色">彩色</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>颜色
            </div>
        </div>


        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>尺码
            </label>
            <div class="layui-input-inline">
                <select name="Size">
                    <option value="1">迷你型</option>
                    <option value="2">中型</option>
                    <option value="3">大型</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>尺码
            </div>
        </div>


        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>库存
            </label>
            <div class="layui-input-inline">
                <input type="number" name="AddQuantity" required lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>库存
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>商品名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_email" name="AddName" required lay-verify="required"
                       autocomplete="off" class="layui-input">
                <img src="">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>商品名称
            </div>
        </div>

        <%--        <div class="layui-form-item">--%>
        <%--            <label for="L_email" class="layui-form-label">--%>
        <%--                <span class="x-red">*</span>购买记录--%>
        <%--            </label>--%>
        <%--            <div class="layui-input-inline">--%>
        <%--                <input type="text" id="L_email" name="AddJilu" required lay-verify="required"--%>
        <%--                       autocomplete="off" class="layui-input">--%>
        <%--            </div>--%>
        <%--            <div class="layui-form-mid layui-word-aux">--%>
        <%--                <span class="x-red">*</span>购买记录--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <%--        <div class="layui-form-item">--%>
        <%--            <label for="L_email" class="layui-form-label">--%>
        <%--                <span class="x-red">*</span>售后评价--%>
        <%--            </label>--%>
        <%--            <div class="layui-input-inline">--%>
        <%--                <input type="text" id="L_email" name="AddPingjia" required lay-verify="required"--%>
        <%--                       autocomplete="off" class="layui-input">--%>
        <%--            </div>--%>
        <%--            <div class="layui-form-mid layui-word-aux">--%>
        <%--                <span class="x-red">*</span>售后评价--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>展示图(一)
            </label>
            <div class="layui-input-inline">
                <input type="file" name="Mouseove" class="form-control" style="padding: 0px;" onchange="imagesrc('imgove')" id="imgove"
                       placeholder="&nbsp;上传文件">
                <span hidden> <img src="" height="100px" width="100px" ></span>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>展示图(一)
                <span id="ove" style="color: red" hidden>请选择商品图片</span>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>展示图(二)
            </label>
            <div class="layui-input-inline">
                <input type="file" name="Mouseout" <%--class="form-control"--%> value="" onchange="imagesrc('imgout')"
                       id="imgout"
                       style="padding: 0px;"
                       <%--placeholder="&nbsp;上传文件"--%>
                >
                <span hidden> <img src="" height="100px" width="100px" ></span>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>展示图(二)
                <span id="out" style="color: red" hidden>请选择商品图片</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>商品详情图
            </label>
            <div class="layui-input-inline">
                <input type="file" name="Mouseout" <%--class="form-control"--%> value="" onchange="imagesrc('imgcctv')"
                       id="imgcctv"
                       style="padding: 0px;"
                <%--placeholder="&nbsp;上传文件"--%>
                >
                <span hidden> <img src="" height="100px" width="100px" ></span>
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>商品详情图
                <span id="cctv" style="color: red" hidden>请选择商品图片</span>
            </div>
        </div>
        <div class="layui-form-item">
        <label for="L_email" class="layui-form-label">
            <span class="x-red">*</span>商品类型
        </label>
        <div class="layui-input-inline">
            <select name="type">
                <option value="1">手办</option>
                <option value="2">公仔</option>
                <option value="11">手办套装</option>
                <option value="22">公仔套装</option>
            </select>
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>商品类型
        </div>
    </div>
        <div class="layui-form-item">
            <label <%--for="L_repass"--%> class="layui-form-label">
            </label>
            <button class="layui-btn"<%-- lay-filter="add" lay-submit="" --%>>
                增加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        /* form.verify({
             nikename: function(value){
                 if(value.length < 5){
                     return '昵称至少得5个字符啊';
                 }
             }
             ,pass: [/(.+){6,12}$/, '密码必须6到12位']
             ,repass: function(value){
                 if($('#L_pass').val()!=$('#L_repass').val()){
                     return '两次密码不一致';
                 }
             }
         });*/
    });

    $(function () {

        //图片显示
        imagesrc = function (id) {
            var $file = $("#" + id);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            var $img = $("#" + id).next().children("img");
            $("#" + id).next().show();
            if (fileObj && fileObj.files && fileObj.files[0]) {
                dataURL = windowURL.createObjectURL(fileObj.files[0]);
                $img.attr('src', dataURL);
            } else {
                dataURL = $file.val();
                var imgObj =$("#" + id).next().children("img");
                    // 两个坑:
                    // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
                    // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
            }
        };

            $("form").submit(function () {
                var ove = $("#imgove").val();
                var out= $("#imgout").val();
                var cctv= $("#imgcctv").val();
               if (ove==""){
                   $("#ove").show();
                    return false;
               }else {
                   $("#ove").hide();
               }
               if (out==""){
                   $("#out").show();
                   return false;
               }else {
                   $("#out").hide();
               }
               if(cctv==""){
                   $("#cctv").show();
                   return false;
               }else {
                   $("#cctv").hide();
               }
            })
        }
    )
</script>
</body>
</html>
