<%@page import="com.model.memberDTO"%>
<%@page import="com.model.MemHistoryDAO"%>
<%@page import="com.model.MemHistoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 세션에서 아이디 받아옴
memberDTO member = (memberDTO)session.getAttribute("list");
String id = member.getId();
request.setCharacterEncoding("utf-8");
response.setContentType("application/json;charset=utf-8");

// 제품의 이름과 평가 결과를 가져옴
String proNum = request.getParameter("proNum");
String rating = request.getParameter("rating");


MemHistoryDTO dto = new MemHistoryDTO(proNum,rating);
MemHistoryDAO dao = new MemHistoryDAO();

// 회원 이력 등록
int cnt = dao.HisInsert(id, dto);


// 회원 이력 조회
ArrayList<MemHistoryDTO> array  = dao.HisSelect(id);

 %>
	{"cosmetics":[
	<%for(int i = 0; i<array.size(); i++){ %>
	{"num" : "<%=i+1 %>",
	"proname":"<%=array.get(i).getProName() %>",
	"rating":"<%=array.get(i).getRating() %>"}
	<% 
		if(i!=array.size()-1){
	%>
			,
	<%
		}
		
	%>
	
	<%} %>
	]}
