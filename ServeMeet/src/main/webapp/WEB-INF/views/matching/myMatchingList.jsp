<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/matching.css"
	type="text/css">
<meta charset="UTF-8">
<title>매칭 리스트</title>
</head>
<body style="background-color: white;">
	<header>
		<c:import url="../common/header.jsp" />
	</header>


	<div class="listDiv">
		<br>
		<br>
		<br>
		<br>
		<div id="topMenu">
			<div class="category">
				<div class="condition on" id="loc" onclick="ingMatching()">
					<span>진행중인 매칭</span>
				</div>
				<div class="condition" id="cate" onclick="endMatching()">
					<span>종료된 매칭</span>
				</div>
			</div>
		</div>
		<br /> <br />
	</div>
	<div class="listDetailDiv">
		<div class="objTitle">
			<div class="conTitle" id="catBName">매칭 종류</div>
			<div class="conTitle" id="catSName">분류</div>
			<div class="conTitle" id="mtTitle">제목</div>
			<div class="conTitle" id="locName">지역</div>
			<div class="conTitle" id="mtwriter">등록자</div>
			<div class="conTitle" id="mTimeTitle">날짜</div>
			<div class="conTitle" id="mpeople">모집 인원</div>
			<div class="conTitle" id="mStatus">매칭 상태</div>
		</div>
		<c:forEach items="${matchingList}" var="m">
			<div class="objM" onclick="showMatching()">
				<div class="con" id="catBName">${m.BIGCATEGORY}</div>
				<div class="con" id="catSName">${m.MIDCATEGORY }</div>
				<div class="con" id="mtTitle">
					<strong>${m.MTITLE }</strong>
				</div>
				<div class="con" id="locName">${m.BIGLOCATION }
					${m.MIDLOCATION} ${m.SMALLLOCATION}</div>
				<div class="con" id="mtwriter">${m.MWRITER }</div>
				<div class="con" id="mtTime">${m.MTIME}</div>
				<div class="con" id="mpeople">${m.MPEOPLENUM}명</div>
				<c:choose>
					<c:when test="${m.MSTATUS eq 'BEFORE'}">
						<div class="con cgr" id="mStatus">● 매칭 대기</div>
					</c:when>
					<c:when test="${m.MSTATUS eq 'ING'}">
						<div class="con cbl" id="mStatus">매칭 중</div>
					</c:when>
					<c:otherwise>
						<div class="con crd" id="mStatus">매칭 종료</div>
					</c:otherwise>
				</c:choose>
				<input type="hidden" id="mid" value="${m.MATCHINGID }" />
			</div>
		</c:forEach>
	</div>
	</div>
	<br />
	<br />
	<footer>
		<c:import url="../common/footer.jsp" />
	</footer>


	<script>
		$('.con').click(function() {
			var matNum = $(this).siblings().last().val();
			location.href = "${pageContext.request.contextPath}/matching/matchingDetail.md?matNum="
					+ matNum;
		});
		function(ingMatching){
			$.ajax({
				type : "GET",
				url : "/ServeMeet/matching/myMatchingList.ma",
				datatype : "JSON",
				data : { type = "P" },
				success
				
			})
		}
	</script>
</body>
</html>