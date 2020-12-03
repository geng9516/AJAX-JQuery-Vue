package com.bjpowernode.controller;

import java.io.IOException;
// servlet
public class BmiServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request,
                          javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request,
                         javax.servlet.http.HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {

        //接收请求参数
        String strName = request.getParameter("name");
        String height = request.getParameter("h");
        String weight =request.getParameter("w");

        //计算bmi ： bmi = 体重/ 身高的平方
        float h = Float.valueOf(height);
        float w = Float.valueOf(weight);
        float bmi = w / ( h * h);

        //判断bmi的范围
        String msg = "";
        if( bmi <= 18.5) {
            msg = "您比较瘦";
        } else if( bmi > 18.5 && bmi <= 23.9 ){
            msg = "你的bmi是正常的";
        } else if( bmi >24 && bmi <=27){
            msg = "你的身体比较胖";
        } else {
            msg = "你的身体肥胖";
        }
        System.out.println("msg="+msg);
        msg = "您好："+strName + "先生/女士, 您的bmi值是："+ bmi + ","+ msg;

        //把数据存入到request
        request.setAttribute("msg",msg);

        //转发到新的页面
        request.getRequestDispatcher("/result.jsp").forward(request,response);

    }
}
