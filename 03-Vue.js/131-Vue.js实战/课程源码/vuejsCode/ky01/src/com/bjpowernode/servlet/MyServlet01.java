package com.bjpowernode.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjpowernode.domain.Student;

public class MyServlet01 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("进入到跨域请求服务器，正在执行doGet方法...");
		
		/*
		 * 
		 * 该服务器将要接收跨域请求
		 * 必须要接收一个跨域请求的参数叫做：callback
		 * 
		 */
		
		
		String callback = request.getParameter("callback");
		
		Student s = new Student("ky-A0001","ky-zs","23");

        //将s对象解析为json串，返回到前端
        //{"id":"?","name":"?","age":?}
        String str = "{\"id\":\""+s.getId()+"\",\"name\":\""+s.getName()+"\",\"age\":"+s.getAge()+"}";
        
        //响应数据，必须加上callback，语法：callback(json)
        response.getWriter().print(callback+"("+str+")");
		
        
        
	}

}










































