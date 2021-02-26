package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.model.weatherDAO;


@WebServlet("/mise")
public class mise extends HttpServlet {
   private static final long serialVersionUID = 1L;

   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      HttpSession session = request.getSession();
      
      
      weatherDAO weatherdao = new weatherDAO();
      
      ArrayList<String> miselist = weatherdao.mise();
      ArrayList<String> uvlist =   weatherdao.uvtoday();
      
      System.out.println("miselist: " + miselist);
      System.out.println("uvlist: " + uvlist);
      
      session.setAttribute("uv", uvlist);
      
      session.setAttribute("mise", miselist);
      
      response.sendRedirect("weather.jsp");
      
           
   }

}