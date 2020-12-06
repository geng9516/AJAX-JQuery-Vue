package com.bjpowernode.servlet;

import com.bjpowernode.domain.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyServlet03 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("进入到doGet方法，处理get请求");

        String name = request.getParameter("name");

        System.out.println("name:"+name);

        Student s = new Student("A0003","ww","25");

        //将s对象解析为json串，返回到前端
        //{"id":"?","name":"?","age":?}
        String str = "{\"id\":\""+s.getId()+"\",\"name\":\""+s.getName()+"\",\"age\":"+s.getAge()+"}";

        response.getWriter().print(str);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("进入到doPost方法，处理post请求");

        String name = request.getParameter("name");

        System.out.println("name:"+name);

        Student s = new Student("A0004","abc","25");

        //将s对象解析为json串，返回到前端
        //{"id":"?","name":"?","age":?}
        String str = "{\"id\":\""+s.getId()+"\",\"name\":\""+s.getName()+"\",\"age\":"+s.getAge()+"}";

        response.getWriter().print(str);
    }
}

