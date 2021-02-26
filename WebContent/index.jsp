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
		#img1{
			display : block;
			width : 200px;
			height : 200px;
		}
		.featured{
		
			background-color: floralwhite !important;
		}
		
		#goReport{
			color : floralwhite !important;
		}

		</style>
	</head>
	<body class="homepage is-preload">
		
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					
					<div class="container" >

						<!-- Logo -->
							<h1 id="logo"><a href="index.jsp">Save Your Skin</a></h1>
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

			<!-- Features -->
				<section id="features" class ="backimg">
					<div class="container">
						<header>
							<h2 style="font-size:1.5em; letter-spacing: 1px;">성분 분석과 날씨추천을 통해 당신의 피부를 지켜요!</h2>
							<br>
						</header>
						<div class="row aln-center">
							<div class="col-4 col-6-medium col-12-small">

								<!-- Feature -->
									<section>
										<a href="mise" class="image featured"><img id = img1 src="./images/weather.png" alt="" /></a>
									 	<header>
											<h3>오늘 날씨에 맞는 화장품을 추천!</h3>
										</header> 
										<p>현재 온도, 자외선, 미세먼지, 습도 등을 확인하고 외출 전 날씨에 맞는 화장품을 추천해드려요!</p>
									</section>

							</div>
							<div class="col-4 col-6-medium col-12-small">

								<!-- Feature -->
									<section>
										<a href="camRecog.jsp" class="image featured"><img id = img1 src="./images/cam.png" alt="" /></a>
										<header>
											<h3>카메라를 이용한 화장품 성분 분석!</h3>
										</header>
										<p>촬영을 통해 화장품의 성분을 확인하고 자신에게 적합하지 않은 성분을 찾아내 알려주고 구매에 도움을 드려요! </p>
									</section>

							</div>
					
						
						</div>
					</div>
				</section>

			<!-- Banner -->
				<section id="banner">
				<a id ="goReport" href ="BefoAller"> 
					<div class="container" >
						<div><img src ="./images/alert.png" style="width: 65px;
   																   height: 65px;"></div>
						<p>당신의 피부를 지키기 위해 </p>
						<p>알러지 문의를 해주세요! </p>
					</div>
				</a>
				</section>

		

			<!-- Footer -->
				<section id="footer">
					
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