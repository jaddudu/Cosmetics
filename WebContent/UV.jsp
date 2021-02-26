<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>




</head>
<body>
   <%
   ArrayList<String> weatherlist = (ArrayList<String>)session.getAttribute("mise");
   ArrayList<String> uvlist = (ArrayList<String>)session.getAttribute("uv");
   
   %>

<!--    인덱스 번호 
   0번 : 시간
   1번 : 경북
   2번 : 경기
   3번 : 경남
   4번 : 전북
   5번 : 전남
   6번 : 부산
   7번 : 서울
   8번 : 대구
   9번 : 대전
   10번 : 광주
   11번 : 제주 -->
   <div>
      <h1>미세먼지 정보</h1>
      <h3> 시간 : <%= weatherlist.get(0) %> </h3>
      <h3> 경북 : <%= weatherlist.get(1) %> </h3>
      <h3> 경기 : <%= weatherlist.get(2) %> </h3>
      <h3> 경남 : <%= weatherlist.get(3) %> </h3>
      <h3> 전북 : <%= weatherlist.get(4) %> </h3>
      <h3> 전남 : <%= weatherlist.get(5) %> </h3>
      <h3> 부산 : <%= weatherlist.get(6) %> </h3>
      <h3> 서울 : <%= weatherlist.get(7) %> </h3>
      <h3> 대구 : <%= weatherlist.get(8) %> </h3>
      <h3> 대전 : <%= weatherlist.get(9) %> </h3>
      <h3> 광주 : <%= weatherlist.get(10) %> </h3>
      <h3> 제주 : <%= weatherlist.get(11) %> </h3>
   </div>
   
   
   <!-- uvlist 정보 순서 시간, 장소, 오늘uv, 내일uv, 모레uv -->
    <div>
      <h1>자외선지수</h1>
        <h3> 시간: <%= uvlist.get(0) %></h3>   
      <h3> 장소: <%= uvlist.get(1) %> </h3> 
      <h3> 오늘uv: <%= uvlist.get(2) %></h3>
      <h3> 내일uv: <%= uvlist.get(3) %></h3>
      <h3> 모레uv: <%= uvlist.get(4) %></h3>
   </div> 
   

</body>
</html>