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
		<title>Strongly Typed by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />

	<style>
	
	#skinType {

    -webkit-appearance: none;  /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    background: url(./images/triangle.png) no-repeat 97% 50%;  /* 화살표 모양의 이미지 */
    background-size: contain;
    
}


	
	</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container">

						<!-- Logo -->
							<h1 id="logo"><a href="index.html">SKIN CARE</a></h1>
							<p>당신의 피부를 안전하게 지켜주세요</p>

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
				<!--join-->
				
	<!-- check out section -->
	<div class="checkout-section mt-150 mb-150">
		<div class="container">
				<div class="box-body">
							<P></P>
							<h2 align = center><strong style="font-size: 1.5em;">회원가입</strong></h2>
							<P4 align = center><strong>필수 입력 사항</strong></P4>

							<p></p>
							<form action="JoinService" method="post">
								<div class="form-group">
									<label>아이디</label>
									<input type="text" name="id" class="form-control">
								</div>
								<br>
								<div class="form-group">
									<label>비밀번호</label>
									<input type="password" name="pw" class="form-control">
								</div>
								<br>
								<div class="form-group">
									<label>이름</label>
									<input type="text" name="name" class="form-control">
								</div>
								<br>
								<div class="form-group">
									<label>연락처</label>
									<input type="text" name="phone" class="form-control">
								</div>
								<br>
								<div class="form-group">
									<label>E-MAIL</label>
									<input type="text" name="email" class="form-control">
								</div>
								<br>
								<div class="form-group">
                  					<label>피부타입</label>
								<select id="skinType" name="mySelect" style="text-align-last : center; background-color: #e8e8e8;" >
			           	          <option hidden >자신의 피부 타입을 선택하세요!</option>
			          	          <option value="건성" >건성</option>
			            	      <option value="지성">지성</option>
			              	      <option value="복합성">복합성</option>
			          	        </select>						
								</div>					
								<br>
								<br>
								<br>
								<div class="form-group text-right" align = center>
									<button class="btn btn-primary btn-block" style="font-family: inherit;">회원가입</button>
								</div>
								<p></p>
								<div class="form-group text-center">
									<span class="text-muted">이미 가입이 되어있으시다면     </span>   <a href="login.jsp"><u><strong>     로그인하기</strong></u></a>
								</div>
							</form>
						</div>
				
		</div>
	</div>
	<!-- end check out section -->
				<!--join end-->
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

			<div id="copyright" class="container">
				<ul class="links">
					<li>© Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">JIN6IX__O</a></li>
				</ul>
			</div>

	</body>
</html>