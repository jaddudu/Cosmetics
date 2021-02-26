package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.memberDAO;
import com.model.memberDTO;

/**
 * Servlet implementation class LoginService
 */
@WebServlet("/LoginService")
public class LoginService extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		memberDTO dto = new memberDTO(id, pw);
		memberDAO dao = new memberDAO();
		memberDTO list = dao.login(dto);
		
		HttpSession session = request.getSession();
		
		if (list!=null) {
			System.out.println("로그인 성공");
			session.setAttribute("list", list);
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("로그인 실패");
			response.sendRedirect("404.jsp");//에러 페이지 만들자
		}
	}

}
