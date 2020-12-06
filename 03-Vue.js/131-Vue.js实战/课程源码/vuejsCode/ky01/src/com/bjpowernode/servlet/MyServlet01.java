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
		
		System.out.println("���뵽�������������������ִ��doGet����...");
		
		/*
		 * 
		 * �÷�������Ҫ���տ�������
		 * ����Ҫ����һ����������Ĳ���������callback
		 * 
		 */
		
		
		String callback = request.getParameter("callback");
		
		Student s = new Student("ky-A0001","ky-zs","23");

        //��s�������Ϊjson�������ص�ǰ��
        //{"id":"?","name":"?","age":?}
        String str = "{\"id\":\""+s.getId()+"\",\"name\":\""+s.getName()+"\",\"age\":"+s.getAge()+"}";
        
        //��Ӧ���ݣ��������callback���﷨��callback(json)
        response.getWriter().print(callback+"("+str+")");
		
        
        
	}

}










































