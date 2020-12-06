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
                    //this.$http.get("请求路径",请求参数，then(回调函数))
                    //对于参数的传递，get请求和post请求的参数传递的语法是不同的，这一点有别于其他的前端语言
                    //对于get请求，必须是在路径的后面以url?key1=value1&key2=value2&key3=value3这种传统的形式来传递参数
                    this.$http.get("myServlet01.do?name=zs123").then(function (data) {

                        //通过data.body的形式来拿到服务器返回成功的数据
                        //alert(data.body.id);

                        //为页面填写值
                        /*this.id = data.body.id;
                        this.name = data.body.name;
                        this.age = data.body.age;*/

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








































