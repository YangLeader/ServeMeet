<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<html>
<head>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" rel="stylesheet">
    <!-- Fontello CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/fontello.css" rel="stylesheet">
    <!-- Style Custom CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		font-family: sans-serif !important; color: black;
	}
	
	h1{
		
		font-family: sans-serif !important; color: black;
	}
	
	.out{
		border: 1px solid black;
		width: 1200px;
		height: 500px;
		margin: 0 auto;
	}
	
	.in{
		border-top: 1px solid black;
		float: left;
		display: inline-block;
		width: 15%;
		height: 300px;
		overflow: auto;
		margin: auto;
		
	}
	
	li{
		width: 28%;
		display: inline-block;
		margin-left: 15px;
		margin-top: 15px;
		
	}
	.itemframe{
		width: 100%;
		padding: 0px !important;
		cursor: focus;
	}
	
	.item{
		padding-bottom: 20px;
		width: 28%;

	}
	
	#midDiv{
		width: 40%;
	}
	
	#smallDiv{
		width: 45%;
	}
	
	#bottomDiv{
		width: 100%;
		height: 20%;
		border: 1px solid black;
		padding: 20px;
	}
	span{
		width: 20px;
		
	}
	
	#sca{
		border: 1px solid black;
	}
</style>
</head>
<body >

	<div class="out">
	<h1>조건 선택</h1>
		<div class="in" >
			<ul class="itemframe">
				<li class="item" id="서울특별시">서울</li>
				<li class="item" id="경기도">경기</li>
				<br  />
				<li class="item" id="인천광역시">인천</li>
				<li class="item" id="대전광역시">대전</li>
				<br  />
				<li class="item" id="세종특별자치시">세종</li>
				<li class="item" id="충청남도">충남</li>
				<br  />
				<li class="item" id="충청북도">충북</li>
				<li class="item" id="광주광역시">광주</li>
				<br  />
				<li class="item" id="전라남도">전남</li>
				<li class="item" id="전라북도">전북</li>
				<br />
				<li class="item" id="대구광역시">대구</li>
				<li class="item" id="경상북도">경북</li>
				<br class="item" />
				<li class="item" id="부산광역시">부산</li>
				<li class="item" id="울산광역시">울산</li>
				<br />
				<li class="item" id="경상남도">경남</li>
				<li class="item" id="강원도">강원</li>
				<br />
				<li class="item" id="제주특별자치도">제주</li>
			</ul>   
		</div>
		<div class="in" id="midDiv" style=" background: yellow;">
			<br />
			&nbsp; ← 지역을 선택해주세요.
		</div>
		<div class="in" id="smallDiv" style="background: lightgreen">
			
		</div>
		<div class="in" id="bottomDiv">
			
		</div>
	</div>
	
	
	 <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <!-- Sticky Header -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/sticky-header.js"></script>
    <!-- Menu Maker - Navigations -->
    <script src="${pageContext.request.contextPath }/resources/js/menumaker.js"></script>
    <!-- Back to top -->
    <script src="${pageContext.request.contextPath }/resources/js/back-to-top.js" type="text/javascript"></script>
</body>

<script>
	var arr = new Array();	
	var cnt = 0;
		var locName = "";
	$(function () {
		
		$(".item").click(function(){
			$("div #smallDiv").children().remove();
			var locId = $(this).attr('id');
			locName = $(this).text();
			console.log(locId);
				$.ajax({
					url : "/location/midLocation.do",
					type : "GET",
					datatype: "JSON",
					data : {bloc:locId},
					async : false,
					success: function(data) {
						console.log(data);
						var html = "<ul class='itemframe'>";
						for(var i in data){
							if(i % 3 == 0 && i != 0){
								html += "<br>";
								html += "<li class='item'>";
								html += "<span  id='sca'>"+data[i]+"</span>";
								html += "</li>";
							}else{								
								html += "<li class='item'>";
								html += "<span  id='sca'>"+data[i]+"</span>";
								html += "</li>";
							}
						
						}
						html += "</ul>";
		
						$("#midDiv").html(html);
						
						eventBind();
						
					}, error : function (data) {
						console.log("에러");
					}
				})
				$(this).css("font-weight","bold");
				console.log(cnt);
				arr[cnt] = locName;
				$("div #bottomDiv").append("&nbsp;<a class='btn-xs btn-default'>"+locName+"</a>");
				for(var i=0; i<=cnt; i++){
					console.log("cnt : " + i + ","+arr[i]);
				}
				cnt++;
		});
		
		
			
	});
	
	function eventBind(obj){
		$("#midDiv").children("ul").children("li").click(function() {
			var locId = $(this).text();
			console.log(locId);
			
			$.ajax({
				url: "/location/smallLocaion.do",
				type: "GET",
				datatype: "JSON",
				data: {sloc:locId},
				async: false,
				success: function(data) {
					console.log(data);
					
					if(data.length != 0){
						var html = "<ul class='itemframe'>";
						for(var i in data){
							
							if(i % 3 == 0 && i != 0){
								html += "<br>";
								html += "<li class='item'>";
								html += "<span id='sca'>"+data[i]+"</span>";
								html += "</li>";
							}else{								
								html += "<li class='item'>";
								html += "<span id='sca'>"+data[i]+"</span>";
								html += "</li>";
							}
						
						}
						html += "</ul>";
						$("#smallDiv").html(html);						
					}
					
					
				}, error: function (data) {
					console.log("에러2");
				}
			})
			console.log(":::" + locName);
			/* var test = jQuery.inArray(locName, arr);
			arr[test] += locId;
			 */
			var asd = locName + locId;
			console.log(asd);
			$("div #bottomDiv").append("&nbsp;<a class='btn-xs btn-default'>"+asd+"</a>");
			for(var i=0; i<=cnt; i++){
				console.log("cnt : " + i + ","+arr[i]);
			}
			
			
		});
	}
	
</script>
</html>