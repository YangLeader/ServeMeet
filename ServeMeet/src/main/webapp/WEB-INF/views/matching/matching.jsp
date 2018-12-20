<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		border: 1px solid black;
		width: 300px;
		height: 400px;
	}
</style>
</head>
<body>
	<h1>매칭페이지</h1>
<%-- 	<ul>
		<c:forEach items="${list}" var="loc" varStatus="vs">
			<li><a href="#">${loc.bigloCation} ${loc.midloCation} ${loc.smallCategory}</a></li>
			
		</c:forEach>
	</ul> --%>
	<div>
		<ul>
			<li id="서울특별시">서울</li>
			<li id="경기도">경기</li>
			<li id="인천광역시">인천</li>
			<li id="대전광역시">대전</li>
			<li id="세종특별자치시">세종</li>
			<li id="충청남도">충남</li>
			<li id="충청북도">충북</li>
			<li id="광주광역시">광주</li>
			<li id="전라남도">전남</li>
			<li id="전라북도">전북</li>
			<li id="대구광역시">대구</li>
			<li id="경상북도">경북</li>
			<li id="부산광역시">부산</li>
			<li id="울산광역시">울산</li>
			<li id="경상남도">경남</li>
			<li id="강원도">강원</li>
			<li id="제주특별자치도">제주</li>	
		</ul>   
	</div>
	<div>
		<ul>
			<c:forEach items="${blist}" var="loc" varStatus="vs">
				<li>${loc.bigloCation} ${loc.midloCation} ${loc.smallCategory}</li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
	$(function () {
		$("li").click(function(){
			var test = $(this).attr('id');
			console.log(test);
			location.href = "${pageContext.request.contextPath}/location/bigLocation.do?bloc="+test;
			
		});
	});
</script>
</html>