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
<title>등록한 매칭</title>


<script>
$(function(){
	console.log("${list}");
})
$(function(){
	$("tr[id]").on("click",function(){
		var matchingId = $(this).attr("id");
		console.log("matchingId="+matchingId);
		location.href = "${pageContext.request.contextPath}/matching/mHistorySelectOne.ma?no="+matchingId;
	});
});
</script>
</head>
<body>

<div id="container">
			<section id="board-container" class="container">
				<p>총 ${totalContents}건의 매칭이 있습니다.</p>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>인원수</th>
						<th>지역</th>
						<th>카테고리</th>
					</tr>
					<c:forEach items="${list}" var="item"> 
					<tr id="${item.MATCHINGID}">
						<td>${item.MATCHINGID}</td>
						<td>${item.MTITLE}</td>
						<td>${item.MPEOPLENUM}</td>
						<td>${item.BIGLOCATION}&nbsp; ${item.MIDLOCATION}&nbsp; ${item.SMALLLOCATION}</td>
						<td>${item.BIGCATEGORY}&nbsp; ${item.MIDCATEGORY}</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
	</div>
	
</body>
</html>