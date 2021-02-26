<%@page import="com.model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				$('#ajaxTable').append("<tr><td>"+company+"</td><td>"+proName+"</td><td><img class='imgs' src='"+img+".jpg'></td><td><button class='GOOD' id ='"+proNum+"'>좋음</button>\t<button class='BAD' id ='"+proNum+"'>나쁨</button></td></tr>");
			}
			
		    $("td > button").click(function(){
		    	var id = $(this).attr('id');
		    	var rat = $(this).attr('class');
		    	$.ajax({
		    		url : "memHisInsert.jsp",
		    		type : "GET",
		    		data : {proName : id, rating : rat},
		    		dataType : "json",
		    		success : function (result){
/* 		    			alert(result);
 */		    			$('#ajaxTable2').empty();
						for(let j = 0; j< result.cosmetics.length; j++){
							let proName = result.cosmetics[j].proname;
							let rating = result.cosmetics[j].rating;
							
		    				$('#ajaxTable2').append("<tr><td>"+proName+"</td><td>"+rating+"</td></tr>");
						}
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

</script>
<style type="text/css">
.imgs{
width:10rem;
}

.container{
	display: flex;
}
</style>

</head>
<body>

		<div class="form-group row pull-right">
				<input class="form-control"  name = "proName" id="proName"type="text" size="20">
			<% request.setCharacterEncoding("EUC-KR"); %>
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
		</div>
	<div class="container">
		<div class = "box"> 
		<h1>제품 검색</h1>
		<table class="selectTable" style="text-align: center; border: 1px solid">
			<thead>
				<tr>
					<th style="text-align: center; width: 150px; border: 1px;">회사명</th>
					<th style="text-align: center; width: 150px; border: 1px;">제품명</th>
					<th style="text-align: center; width: 150px; border: 1px;">사진</th>
				    <th style="text-align: center; width: 150px; border: 1px;">평가</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
				
			</tbody>
		</table>
		</div>
		<div class = "box">
		<h1>평가 목록</h1>
		<table class = "memTable" style="text-align: center; border: 1px solid">
			<thead>
				<tr>
					<th style="text-align: center; width: 150px; border: 1px;">제품명</th>
					<th style="text-align: center; width: 150px; border: 1px;">평가</th>
				</tr>
			</thead>
			<tbody id = "ajaxTable2">
			
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>