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

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		//kljnjk
		System.out.println(id);
		
		memberDTO dto = new memberDTO(id, pw, name, phone, email);
		memberDAO dao = new memberDAO();
		int cnt = dao.join(dto);
		HttpSession session = request.getSession();
		
		
		if (cnt>0) {
			System.out.println("회원가입 성공");
			session.setAttribute("dto", dto);
			response.sendRedirect("login.jsp");
		}
		else {
			System.out.println("회원가입 실패");
			response.sendRedirect("index.jsp");
		}
		
	}
}
