<%@page import="com.model.MemHistoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>No Sidebar - Strongly Typed by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <script src="assets/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function searchFunction(){
	var name = document.getElementById("proName").value;
	$.ajax({
		url: "cosSelect.jsp",
		type : "GET",
		data : {proName : name},
		dataType : "json",
		success : function (res) {
			/* alert(res)
			console.log(res) */
			$('#ajaxTable').empty();
			for(let i = 0; i < res.cosmetics.length; i++){
							
				let company = res.cosmetics[i].company;
				let proName = res.cosmetics[i].proname;
				let img = res.cosmetics[i].img;
				let proNum = res.cosmetics[i].proNum;
				
				$('#ajaxTable').append("<tr><td>"+company+"</td><td>"+proName+"</td><td ><img class='imgs' src='"+img+".jpg'></td><td style ='display:flex;padding-top: 60px;'><button class='GOOD' id ='"+proNum+"'><img src='./images/up.png'></button>\t<button class='BAD' id ='"+proNum+"'><img src ='./images/down.png' style='padding-top:13px;'></button></td></tr>");
			}
			
		    $("td > button").click(function(){
		    	var id = $(this).attr('id');
		    	var rat = $(this).attr('class');
		    	$.ajax({
		    		url : "memHisInsert.jsp",
		    		type : "GET",
		    		data : {proNum : id, rating : rat},
		    		dataType : "json",
		    		success : function (result){
/* 		    			alert(result); 바꿔
 */		    			$('#ajaxTable2').empty();
						for(let j = 0; j< result.cosmetics.length; j++){
							let num = result.cosmetics[j].num;
							let proName = result.cosmetics[j].proname;
							let rating = result.cosmetics[j].rating;
		    				$('#ajaxTable2').append("<tr><td>"+num+"번</td><td>"+proName+"</td><td>"+rating+"</td></tr>");
						}
						var offset = $('.memTable').offset();
						$('html,body').animate({scrollTop : offset.top}, 400);
						// 이력 추가시 이력 사용했던 제품이 기록된 테이블로 이동
		    		},
		    		error : function(a,b,c){
		    			alert("fail")
		    			alert(b)
		    			alert(c)
		    		}
		    	})
		    });
		},
		error : function(a,b,c){
			alert("fail")
			alert(b)
			alert(c)
		}
	})
	
}
$( document ).ready(function() {
$("td > button").click(function(){
	var id = $(this).attr('id');
	var rat = $(this).attr('class');
	$.ajax({
		url : "memHisInsert.jsp",
		type : "GET",
		data : {proNum : id, rating : rat},
		dataType : "json",
		success : function (result){
/* 		    			alert(result); 바꿔
*/		    			$('#ajaxTable2').empty();
			for(let j = 0; j< result.cosmetics.length; j++){
				let proName = result.cosmetics[j].proname;
				let rating = result.cosmetics[j].rating;
				let num = result.cosmetics[j].num;
				$('#ajaxTable2').append("<tr><td>"+num+"번</td><td>"+proName+"</td><td>"+rating+"</td></tr>");
				
			}
			var offset = $('.memTable').offset();
			$('html,body').animate({scrollTop : offset.top}, 400);
			// 이력 추가시 이력 사용했던 제품이 기록된 테이블로 이동
		},
		error : function(a,b,c){
			alert("fail")
			alert(b)
			alert(c)
		}
	})
});
});

function moveEvent1() {
	let move1 = $('#memList').offset();
	$('html,body').animate({scrollTop : move1.top},400);
	// 나의 이력 목록으로 이동
}

function moveEvent2() {
	let move2 = $('.no-sidebar').offset();
	$('html,body').animate({scrollTop : move2.top},400);
	// 맨 위로 가기
	
}
$('document').ready(function () {
	$('#upBtn').hide();
	$(function(){
		$(window).scroll(function(){
			if($(this).scrollTop() >100){
				$('#upBtn').fadeIn();
			} else{
				$('#upBtn').fadeOut();
			}
		})
	})
	
	// 위로가는 버튼 제일 윗 페이지에서는 숨기고 아래로 스크롤 할수록 보이게 하기.
})
</script>
<style type="text/css">
.imgs{
width:10rem;
}
.GOOD, .BAD {
   padding-left: 20px;
   padding-right: 20px;
   border-radius: 50px;

}

td {
   vertical-align : middle;
   justify-content: center;
   color: black;
}
button img {
   width: 30px;
}
tr > td:nth-child(4){
   display: flex;
   padding-top: 55px;
   justify-content: space-around; 
}

#proName {
   width: 250px;
    height: 40px;
}
#proNameBtn{
   border: 1px soild black;
   padding-top: 0px;
    padding-left: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    height: 40px;
    width: 60px;
}
#searchGroup{
   margin-left: 0px;
    margin-top: 0px;
    padding-left: 20px;
    justify-content: center;
}

button{
   background: white;
   cursor: pointer;
}
.GOOD:hover {
   background: #4472C4;
}
.BAD:hover {
   background: #fd887a;
}
table thead {
   background: #e5e5e5;
   color: black;
}
.nuribox{
	text-align: center;
}

#upBtn,#upBtnImg{
			width: 40px ;
			height: 40px ;
/* 			background-color: red !important;
			color: white !important; */
			position: fixed;
			right: 5px ;
			bottom: 50px ;
			z-index: 50 !important;
		}
#upBtn{
	background: #e5e5e5;
}
#moveMemList{
	padding-top: 0px;
    padding-left: 0px;
    align-self: center;
    border-bottom: none;
    margin-left: 50px;
}

</style>
   </head>
   <body class="no-sidebar is-preload">
  		 <div id="upBtn" onclick="moveEvent2()" >
			<img id="upBtnImg"  src="./images/up-arrow.png">
		</div>
      <div id="page-wrapper">

         <!-- Header -->
            <section id="header">
               <div class="container">

                  <!-- Logo -->
                     <h1 id="logo"><a href="index.jsp">나의 화장품 사용이력</a></h1>
                     <p>내가 사용한 화장품 목록을 확인해 보세요.</p>

                     <!-- Nav -->
						<nav id="nav">
							<ul>
								
								<li><a class="icon solid fa-home" href="index.jsp"><span>HOME</span></a></li>
								
								<li display = hidden>
									<a href="#" class="icon fa-chart-bar"><span>회원가입/로그인</span></a>
									<ul>
										<li><a href="join.jsp">회원가입</a></li>
										<li><a href="login.jsp">로그인</a></li>
									</ul>
								</li>
								<li><a class="icon solid fa-cog" href="camRecog.jsp"><span>화장품 성분 분석</span></a></li>
								<li><a class="icon solid fa-retweet" href="mise"><span>날씨별 화장품 추천</span></a></li>
								<li><a class="icon solid fa-sitemap" href="BefoHis"><span>나의 사용목록 추가</span></a></li>
								<li><a class="icon solid fa-sitemap" href="BefoAller"><span>알러지 제보</span></a></li>
							</ul>
						</nav>

               </div>
            </section>

         <!-- Main -->
            <section id="main">
               <div class="container">
                  <div id="content">
                     <div class="form-group row pull-right" id="searchGroup" >
                        <span style="padding-top: 0px; padding-left: 0px;">
                        <input class="form-control" placeholder="제품 이름을 입력해 주세요!" name = "proName" id="proName"type="text" size="20"></span>
                        <% request.setCharacterEncoding("EUC-KR"); %>
                        <span style="padding-top: 0px; padding-left: 0px;">
                        <button class="btn btn-primary" id="proNameBtn" onclick="searchFunction();" type="button"style="text-align = center;padding-top: 0px;padding-left: 0px; cursor: pointer;"><img src="./images/search.png"></button></span>
                     	<h1 id="moveMemList" onclick="moveEvent1()" style="cursor: pointer;">나의 이력 보러가기 !
                     	<!-- <img style ="width:40px; height:40px;" src="images/to-do-list.png"> -->
                     	</h1>
                     </div>
<%
	ArrayList<MemHistoryDTO> cosList = (ArrayList)session.getAttribute("cosList");
%>
   <div class="nuribox">
      <div class = "box"> 
      <br>
      <table class="selectTable" style="text-align: center; border: 1px solid">
         <thead>
            <tr>
               <th style="text-align: center; width: 15%; border: 1px;">회사명</th>
               <th style="text-align: center; width: 30%; border: 1px;">제품명</th>
               <th style="text-align: center; width: 30%; border: 1px;">사진</th>
                <th style="text-align: center; width: 25%; border: 1px;">평가</th>
            </tr>
         </thead>
         <tbody id="ajaxTable">
         <%for(int i = 0; i< cosList.size(); i++) {%>
            <tr>
               <td style="font-size: 1em"><%=cosList.get(i).getCompany() %></td>
               <td><%=cosList.get(i).getProName() %></td>
               <td><img class='imgs' src ="images/cosImgs/<%=cosList.get(i).getPath() %>.jpg"></td>
               <td style ='display:flex;padding-top: 60px;'><button class='GOOD' id ="<%=cosList.get(i).getProNum() %>"><img src='./images/up.png'></button><button class='BAD' id ="<%=cosList.get(i).getProNum() %>"><img src ='./images/down.png' style='padding-top:13px;'></button></td>
            </tr>
          <%} %>
         </tbody>
      </table>
      </div>
<% memberDTO dto = (memberDTO)session.getAttribute("list");
	String name = dto.getName();
	ArrayList<MemHistoryDTO> memHis  = (ArrayList)session.getAttribute("memHis");
	
%>
      <div class = "nuribox" id="memList">
      <h1 style="font-size: 1.5em;"><%=name %>님의 이용목록</h1>
      <br>
      <table  class = "memTable" style="text-align: center; border: 1px solid">
         <thead>
            <tr>
               <th style="text-align: center; width: 25%; border: 1px;">번호</th>
               <th style="text-align: center; width: 50%; border: 1px;">제품명</th>
               <th style="text-align: center; width: 25%; border: 1px;">평가</th>
            </tr>
         </thead>
         <tbody id = "ajaxTable2">
         <%for(int i = 0; i<memHis.size(); i++) {%>
	         <tr>
	             <td><%=i+1 %>번</td>
		         <td><%=memHis.get(i).getProName() %></td>
		         <td><%=memHis.get(i).getRating() %></td>
	         </tr>
	      <%} %>
         </tbody>
      </table>
      </div>
   </div>

                  </div>
               </div>
            </section>

         <!-- Footer -->
            <section id="footer">
               <!-- <div class="container">
                  <header>
                     <h2>사용했던 화장품 검색</h2>
                  </header>
                  <div class="row">
                     <div class="col-6 col-12-medium">
                        <section>
                           <form method="post" action="#">
                              <div class="row gtr-50">
                              
                              
                              <div class = "search">
                              
                                 
                                 <input type = "text" list = "search">
                                 <datalist id = "search">
                                 
                                 화장품 검색 탭 if문, for 문 돌려서 찾기
                                 
                                    <option>진식 </option>
                                    <option>요셉 </option>
                                    <option>누리 </option>
                                    <option>덕운 </option>
                                    <option>미림 </option>
                                    <option>수지 </option>
                                                                  
                                 
                                 
                                 </datalist>
                              
                           
                              </div>
                                 <br><br>
                                 <p> <strong>나의 화장품 이력</strong> </p>                                                            
                                 
                                 
                                 
                                 <div class="col-12">
                                    <textarea name="message" placeholder="Message"></textarea>
                                 </div>
                                 
                                 
                                 
                                 <div class="col-12">
                                    <a href="#" class="form-button-submit button icon solid fa-envelope">Send Message</a>
                                 </div>

                              </div>

                           </form>
                        </section>
                     </div>
                     <div class="col-6 col-12-medium">
                        
                     </div>
                  </div>
               </div> -->
               <div id="copyright" class="container">
                  <ul class="links">
                     <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">JIN6IX__O</a></li>
                  </ul>
               </div>
            </section>

      </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>