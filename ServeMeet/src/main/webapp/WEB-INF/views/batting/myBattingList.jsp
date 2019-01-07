<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/header.jsp" />
<title>종료된 배팅 목록</title>


<script>
$(function(){
	$("tr[id]").on("click",function(){
		var battingId = $(this).attr("id");
		console.log("battingId="+battingId);
		location.href = "${pageContext.request.contextPath}/batting/battingInfo.ba?no="+battingId;
	});
});
</script>
</head>
<body>

<div id="container">
			<section id="board-container" class="container">
				<p>총 ${totalContents}건의 배팅이 있습니다.</p><br>
				<p> 내 배팅</p>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>고른 배팅</th>
						<th>배당</th>
						<th>진행여부</th>
						<th>승리여부</th>
					</tr>
					<c:forEach items="${list}" var="mybatting"> 
					<tr id="${mybatting.BATTINGID}">
						<td>${mybatting.BATTINGID}</td>
						<td>${mybatting.BIGCATEGORY} - ${mybatting.MIDCATEGORY}</td>
						<td>${mybatting.MTITLE}</td>
						<td>${mybatting.BATTINGSELECT}팀</td>
						<td>배당</td>
						<td>${mybatting.BSTATUS}</td>
						<td>승리여부</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
	</div>

</body>
</html>