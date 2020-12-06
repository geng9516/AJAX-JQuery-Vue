<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>mytitle</title>
    <!--

        导入axios插件来实现ajax请求

    -->
    <script src="vue/vue-2.4.0.js"></script>

    <!--

        之前老师在讲解ajax的时候，最后总结时说道推荐使用axios的方式
        但是，如果想要处理跨域请求，那么我们就必须要使用vue-resource的方式
    -->
    <%--<script src="vue/axios.min.js"></script>--%>
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

                    /*

                        案例：
                            当前项目所在服务器为
                            协议：http
                            域名：localhost
                            端口号：8080

                            将请求发送到以下配置的服务器，来从跨域的服务器中接收数据
                            协议：http
                            域名：localhost
                            端口号：8088

                     */

                    //使用jsonp的方式发出跨域请求
                    this.$http.jsonp("http://localhost:8088/ky01/getKyStudentData.do").then(result=>{

                        result = result.body;

                        this.id = result.id;
                        this.name = result.name;
                        this.age = result.age;


                    })

                }

            }

        })



    </script>


</body>
</html>








































