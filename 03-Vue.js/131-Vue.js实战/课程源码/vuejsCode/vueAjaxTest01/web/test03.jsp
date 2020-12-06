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

                    /*

                        在请求执行成功后，执行回调函数中的内容，回调函数处于其他函数的内部，this不会与任何的对象绑定（以this.data的形式引入数据就引不到了）
                        将指向vue对象的this赋值给外部方法定义的属性，然后在内部方法中使用该属性即可

                    */

                    /*var _this = this;
                    axios({

                        method : "get", //请求方式
                        url : "myServlet03.do"  //请求路径

                    }).then(function (result) {

                        /!*

                            注意：
                                之前使用vue-resource插件 对于值的处理 返回值.body的操作
                                这次使用axios插件，同样需要对值进行处理  返回值.data的形式

                         *!/
                        //alert(result.data.id);

                        data = result.data;

                        _this.id = data.id;
                        _this.name = data.name;
                        _this.age = data.age;

                    })*/

                    /*axios({

                        method : "get", //请求方式
                        url : "myServlet03.do?name=aaa"  //请求路径

                    //使用 箭头表达式=> 在代替原有的function来做回调函数
                    }).then(result=> {

                        /!*

                        注意：
                                之前使用vue-resource插件 对于值的处理 返回值.body的操作
                        这次使用axios插件，同样需要对值进行处理  返回值.data的形式

                        *!/
                        //alert(result.data.id);

                        data = result.data;

                        this.id = data.id;
                        this.name = data.name;
                        this.age = data.age;

                    })*/

                    //以param属性的形式来传递参数
                    axios({

                        method : "post", //请求方式
                        url : "myServlet03.do",  //请求路径
                        params : {"name":"bbb"}  //传递参数
                        //使用 箭头表达式=> 在代替原有的function来做回调函数
                    }).then(result=> {

                        /*

                        注意：
                                之前使用vue-resource插件 对于值的处理 返回值.body的操作
                        这次使用axios插件，同样需要对值进行处理  返回值.data的形式

                        */
                        //alert(result.data.id);

                        data = result.data;

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








































