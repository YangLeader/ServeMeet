<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/header.jsp" />
<title>배팅 목록</title>


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
				<p>총 ${totalContents }건의 배팅이 있습니다.</p>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>A팀 인원</th>
						<th>B팀 인원</th>
					</tr>
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.battingId}">
						<td>${b.battingId}</td>
						<td>타-이틀(매칭과 조인)</td>
						<td>${b.battingPNumA}</td>
						<td>${b.battingPNumB}</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
	</div>

</body>
</html>