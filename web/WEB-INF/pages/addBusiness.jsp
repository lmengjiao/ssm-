<%--
  Created by IntelliJ IDEA.
  User: 林甜甜
  Date: 2021/9/14
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增业务</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="res/js/layui-v2.5.6/layui/layui.js"></script>
    <link rel="stylesheet" href="res/js/layui-v2.5.6/layui/css/layui.css">
</head>
<body>
    <h1>新增业务</h1>
    <form action="" method="">
    业务类型：<select name="typeId" id="sel">
        <option value="">请选择</option>
        <%--<option value="2">储蓄卡</option>--%>
        <%--<option value="3">vip卡</option>--%>
    </select><br>
    排队号：<input type="text" name=""><br>
    备注信息：<textarea name="" cols="30" rows="1"></textarea><br>
    <input type="submit" value="确认增加">
    </form>

<script>
    $.ajax({
        url:'/type/selectAll',
        type:'post',
        dataType:'json',
        success:function (res) {
            console.log(res)
            var select=$("#sel")
            $.each(res.data,function (index,item) {
                select.append(new Option(item.typeName,item.id));  //在下拉菜单里添加元素
            });
            layui.form.render("select");
        }
    });

</script>
</body>
</html>
