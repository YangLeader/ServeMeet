<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- Style Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Fontello CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/fontello.css"
	rel="stylesheet">
<!-- Style Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<!-- category -->
<link href="${pageContext.request.contextPath}/resources/css/category.css"
	rel="stylesheet">
	<!-- scroll -->
<link href="${pageContext.request.contextPath}/resources/css/scroll.css"
	rel="stylesheet">
<!-- Font CSS -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
	<!-- board style -->
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">
<meta charset="UTF-8">
<title>신고 사유</title>
</head>
<body>
	<h2 style="text-align:center;">신고 사유를 선택해주세요.</h1>
	<hr style="border-top:1px solid #222;"/>
	
	<form action="">
		<fieldset>
    		<legend>신고 사유</legend>
       	 	<input type="radio" name="report" value="홍보성 게시글"/> 영리목적 / 홍보성 게시글<br />
			<input type="radio" name="report" value="욕설/인신공격"/> 욕설 / 인신공격 게시글<br />
			<input type="radio" name="report" value="도배/무의미"/> 도배 / 무의미한 게시글<br />
			<input type="radio" name="report" value="음란성/선정성"/> 음란성 / 선정성 게시글<br />
			<input type="radio" name="report" value="기타"/> 기타<br /><br />
		
			<textarea class="form-control" name="content" style="width:95%; resize:none;" required></textarea>
			
			<button style="vertical-align: center;" type="submit" class="btn btn-info btn-sm">
				<span class="glyphicon glyphicon-ok"></span>신고하기
			</button>
		
			<button style="vertical-align: center;" type="submit" class="btn btn-info btn-sm">
				<span class="glyphicon glyphicon-ok"></span>취소
			</button>
    	</fieldset>
	</form>
	
	 
</body>
</html>