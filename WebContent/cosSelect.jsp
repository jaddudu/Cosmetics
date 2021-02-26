<%@page import="com.model.MemHistoryDAO"%>
<%@page import="com.model.MemHistoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
response.setContentType("application/json;charset=utf-8");
String proName = request.getParameter("proName");
System.out.println(proName);
MemHistoryDAO dao = new MemHistoryDAO();
ArrayList<MemHistoryDTO> array = dao.CosSelect(proName);
 %>
	{"cosmetics":[
	<%for(int i = 0; i<array.size(); i++){ %>
	{"company":"<%=array.get(i).getCompany() %>",
	"proname":"<%=array.get(i).getProName() %>",
	"proNum" :"<%=array.get(i).getProNum() %>",
	"img":"images/cosImgs/<%=array.get(i).getPath() %>"}
	
	<% 
		if(i!=array.size()-1){
	%>
			,
	<%
		}
		
	%>
	
	<%} %>
	]}
