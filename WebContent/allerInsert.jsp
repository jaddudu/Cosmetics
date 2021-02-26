<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ReportDAO"%>
<%@page import="com.model.ReportDTO"%>
<%@page import="com.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//세션에서 아이디 받아옴
memberDTO member = (memberDTO)session.getAttribute("list");
String id = member.getId();
request.setCharacterEncoding("utf-8");
response.setContentType("application/json;charset=utf-8");

String company = request.getParameter("com");
String proName = request.getParameter("pro");
String symptom = request.getParameter("sym");
System.out.println("아이디 :  "+id+"    회사 :"+company+"   제품명 : "+proName +"   증상 : "+symptom);

// 알러지 제보
ReportDTO insDto = new ReportDTO(id,company,proName,symptom);
ReportDAO insDao = new ReportDAO();
int cnt = insDao.insertAllergy(insDto);

// 제보했던 제품들 조회
ArrayList<ReportDTO> array = insDao.selectAller(id);

%>

{"aller" : [
<%for(int i = 0; i<array.size(); i ++) {%>
{"num" : "<%=i+1 %>",
"company": "<%=array.get(i).getCompany() %>",
"proName":"<%=array.get(i).getProName() %>",
"symptom":"<%=array.get(i).getSymptom() %>"}
<%
	if(i!=array.size()-1){
%>
,
<%} %>
<%} %>
]}