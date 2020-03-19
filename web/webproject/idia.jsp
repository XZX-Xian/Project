<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020-02-29
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!--全选框-->
<th width="10%">
    <input type="checkbox"  οnclick="ckAll();" id="p1"/>
</th>

<!--子选框-->
<!--设置value值是为批量删除传递id-->
<td><input type="checkbox" name="child" value="${uu.id }" οnclick="clickChild();"/></td>

<!--批量删除按钮-->
<input type="button" value="批量删除" οnclick="deleteUsers();" id="dele"/>
<script src="../jquery-1.12.4.js" type="text/javascript"></script>
<script type="text/javascript">

    //全选
    function ckAll(){
        var status=document.getElementById("p1").checked; //全选按钮的状态
        var childs=document.getElementsByName("child"); //子节点的数组
        for(var i=0;i<childs.length;i++){
            childs[i].checked=status;
        }
    }

    //点击孩子
    function clickChild(){
        var childs=document.getElementsByName("child"); //子节点的数组
        var count=childs.length; //所有的孩子的个数
        var CheckedCount=0; //选中的孩子个数
        for(var i=0;i<childs.length;i++){
            if(childs[i].checked==true){
                CheckedCount++;
            }
        }
        //若子选按钮全选中，则全选按钮也选中
        if(count==CheckedCount){
            document.getElementById("p1").checked=true;
        }else{
            document.getElementById("p1").checked=false;
        }
    }

    $(function () {
        //批量删除
        // function deleteUsers(){
        $("#dele").click(function () {


            // var ids=new Array(); //数组，存储选中的id  1,3,5
            // //获取选中的复选框的ID
            // var childs=document.getElementsByName("child"); //子节点的数组
            // for(var i=0;i<childs.length;i++){
            //     if(childs[i].checked==true){
            //         var id=childs[i].value; // value被绑定了ID
            //         ids.push(id);
            //     }
            // }

            // if(ids.length>0){
            //     if(confirm("确定要删除选中的用户吗")){
                    //确定要删除
                    var ids="1,0";
                    location.href="http://localhost:8080/Project_war_exploded/asas?ids="+ids;
                    alert("1")
                // }
            // }else{
            //     alert("请先选中要删除的用户数据！");
            // }
        })
    })

</script>
</body>
</html>
