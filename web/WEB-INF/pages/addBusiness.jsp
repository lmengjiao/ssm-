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
    <script src="res/js/layui-v2.5.6/layui/layui.js"></script>
    <link rel="stylesheet" href="res/js/layui-v2.5.6/layui/css/layui.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/vue/2.5.2/vue.min.js"></script>
    <script src="//cdn.bootcss.com/vue-router/3.0.1/vue-router.min.js"></script>
    <script src="//cdn.bootcss.com/vuex/3.0.1/vuex.min.js"></script>
    <script src="//cdn.bootcss.com/axios/0.17.1/axios.min.js"></script>
</head>
<body>
    <div id="app">
        <h1>新增业务</h1>
        <%--@submit.pervent="onSubmit" 禁止提交--%>
        <%--<form action="" method="" @submit.pervent="onSubmit" id="myForm">--%>
        <form action="" method="" @submit="onSubmit" id="myForm">
            业务类型：<select name="typeName" id="sel" v-model="tBussiness.btype">
            <option value="">请选择</option>
            <option :value="item.typeId" v-for="(item,index) in tTypes">{{item.typeName}}</option>
        </select><br>
            排队号：<input type="text" name="" v-model="tBussiness.bnum"><br>
            备注信息：<textarea name="" cols="30" rows="10" v-model="tBussiness.bmark"></textarea><br>
            <input type="submit" value="确认增加">
        </form>

    </div>
    <%--向下拉框添加数据--%>
    <%--<div>--%>
        <%--请选择你的英雄：--%>
        <%--<select name="" id="heroSel">--%>
            <%--<option value="1">玄策</option>--%>
            <%--<option value="2">韩信</option>--%>
            <%--<option value="3">赵云</option>--%>
        <%--</select><br>--%>
    <%--</div>--%>

    <%--向<li></li>添加数据--%>
    <%--<div>--%>
        <%--<ul id="huluselect">--%>
            <%--<li>1</li>--%>
            <%--<li>2</li>--%>
            <%--<li>3</li>--%>
        <%--</ul>--%>
    <%--</div>--%>

<script>
    // $(function() {
    //     $.ajax({
    //         url:'/type/selectAll',
    //         type:'post',
    //         dataType:'json',
    //         success:function (res) {
    //             console.log(res)
    //             //给下拉框渲染数据
    //             var select=$("#sel")
    //             $("#sel").empty(); //清空数据
    //             //遍历
    //             $.each(res.data,function (index,item) {
    //                 select.append(new Option(item.typeName,item.id));  //在下拉菜单里添加元素
    //             });
    //             // layui.form.render("select");
    //         }
    //     });
    //
    //
    //     // 使用Ajax高级版axios异步请求
    //     //             axios.get('/type/selectAll')
    //     //          .then(function (response) {  //ajax中的success
    //     //              console.log(response.data.data);//vue
    //     //})
    //     //          .catch(function (error) { //ajax中的error
    //     //              console.log(error);
    //     //          });
    //     //          })//jquery的数据遍历 [数组] {对象}对象都可以变成json
    //
    //    // 向下拉框添加数据
    //         var names = new Array();
    //         names.push("小乔");
    //         names.push("玄策");
    //         names.push("孙策");
    //         names.push("da乔");
    //         console.log(names)
    //         $("#heroSel").empty() //清空
    //         $.each(names, function (index, value) {
    //             console.log(index) //下标
    //             console.log(value) //值
    //             console.log("-------")
    //             $("#heroSel").append($("<option value='3'>" + value + "</option>"))
    //         })
    //
    //     // //向<li></li>添加数据
    //     var hulunames=new Array();
    //         hulunames.push("大娃");
    //         hulunames.push("二娃");
    //         hulunames.push("三娃");
    //         hulunames.push("四娃");
    //         hulunames.push("五娃");
    //         hulunames.push("六娃");
    //         hulunames.push("七娃");
    //     console.log(hulunames)
    //     $("#huluselect").empty()
    //     $.each(hulunames,function (index,value) {
    //         console.log(index)
    //         console.log(value)
    //         $("#huluselect").append($("<li>"+value+"</li>"))
    //     })
    //     })

    var vm = new Vue({ //create之前
        el:'#app',
        data:{
            tTypes:[],
            tBussiness:{
            }
        },
        created:function () {
            //官网提供的这个api是结合jQuery用的 不是结合vue用的
            //那么就需要用到es中的箭头函数处理
            // axios.get("/type/selectAll").then(function (response) {
            //     console.log(response)
            //     this.tTypes=response.data.data
            //     console.log(this.tTypes)
            // })
            //在es6中 箭头函数是一个缩写 但是功能很强大 可以解决异步渲染问题
            //写法 ()=>{} 中括弧等于大括弧

            axios.get("/type/selectAll").then((response)=>{
                this.tTypes=response.data.data;
            })
        },
        methods:{
            onSubmit:function (e) {
                //凡是事件都有个e 元数据
                //脱离了jQuery
                console.log(e)
                console.log(e.target) //vue事件可以通过e.target拿到标签中的dom元素
                var form=document.getElementById('myForm');
                console.log(form)
                //拿取form表单中的数据
                var fromDate=new FormData(form);
                console.log(fromDate)
                //引入Axios 发送到百度
                // //使用Ajax高级版axios异步请求
                axios.post('/tBussiness/insert', {
                    bmark:this.tBussiness.bmark,
                    btype:this.tBussiness.btype,
                    bnum:this.tBussiness.bnum
                })
                    // .then(function (response) {  //ajax中的success
                    //     console.log(response.data)

                    .then((response)=>{
                        if(response.data.code==0){
                        alert(response.data.msg)
                }else{
                    alert("添加失败")
                }
                    })


                //jquery的数据遍历 [数组] {对象}对象都可以变成json
                console.log(this.tBussiness)
                return false;
            }
        }
    });

</script>
</body>
</html>
