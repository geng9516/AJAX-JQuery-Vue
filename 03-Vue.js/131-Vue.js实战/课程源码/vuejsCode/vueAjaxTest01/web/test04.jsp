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
    <script src="vue/axios.min.js"></script>
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

                    /*axios.get(

                        "myServlet04.do",  //请求路径
                        {

                            params : {

                                "name" : "aaabbb"

                            }

                        }  //请求参数

                    ).then(result=>{

                        var data = result.data;

                        this.id = data.id;
                        this.name = data.name;
                        this.age = data.age;

                    })*/

                    axios.post(

                        "myServlet04.do",  //请求路径
                        /*{

                            params : {

                                "name" : "aaabbb"

                            }

                        }*/
                        /*

                            该方式发送数据是一个 Request Payload的数据格式，一般的数据格式都是Form Data格式
                            所以我们之前写的以json形式的参数就发送不出去

                            只能通过传统字符串的方式为后台发送参数

                         */
                        "name=aaabbbccc"

                    ).then(result=>{

                        var data = result.data;

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








































