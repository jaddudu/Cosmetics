package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.BadEleDAO;
import com.model.BadEleDTO;

/**
 * Servlet implementation class BadEle
 */
@WebServlet("/BadEle")
public class BadEle extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String badEle = request.getParameter("badEle");
		
		BadEleDAO dao = new BadEleDAO();
		BadEleDTO dto = dao.selectSym(badEle);
		Gson gson = new Gson();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(gson.toJson(dto));
		
		
		
		
		
	}
}
