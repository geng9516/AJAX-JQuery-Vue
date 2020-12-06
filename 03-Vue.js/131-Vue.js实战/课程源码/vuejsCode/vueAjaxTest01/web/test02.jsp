<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>mytitle</title>
    <!--

        导入vue-resource类库之后，就可以使用this.$http.xxx来实现ajax功能了

        注意：对于idea，直接复制粘贴过来的文件有可能报404错误（资源定位不到的）
            这时我们可以先手动创建这个文件，在复制粘贴里面的内容到该文件中就可以了


    -->
    <script src="vue/vue-2.4.0.js"></script>
    <script src="vue/vue-resource-1.3.4.js"></script>
</head>
<body>

    <div id="app">

        <button @click="getStudent">点击取得学生信息</button>

        <br/>
        <br/>

        编号：<span>{{id}}</span><br/>
        姓名：<span>{{name}}</span><br/>
        年龄：<span>{{age}}</span><br/>

    </div>

    <script>

        var vm = new Vue({

            el : "#app",
            data : {

                "id" : "",
                "name" : "",
                "age" : ""

            },
            methods : {

                getStudent(){

                    //发出ajax请求，取得学生信息，在页面中局部刷新学生信息
                    //发出post请求
                    //post请求参数传递的方式，是以请求体的方式来传递的，所以不能将参数挂在url后面
                    /*

                        关于post请求传递参数的问题：

                        手动发起的post请求，默认没有表单格式，所以有些服务器就处理不了
                        我们需要通过post方法的第三个参数，{emulateJSON:true}设置，提交的内容类型就设置为了普通表单的格式传递参数

                     */
                    this.$http.post("myServlet02.do",{"name":"ls123"},{emulateJSON:true}).then(function (data) {

                        //与get请求一样，我们接受到后台响应的信息，需要先使用data.body进行处理，才能够拿到我们需要的值
                        data = data.body;

                        this.id = data.id;
                        this.name = data.name;
                        this.age = data.age;

                    })



                }

            }

        })



    </script>


</body>
</html>








































