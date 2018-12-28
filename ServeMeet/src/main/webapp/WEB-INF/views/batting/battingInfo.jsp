
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배팅 배팅 배팅</title>



<c:import url="../common/header.jsp" />

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div>
	<c:if test='${batting.bStatus eq "N" }'>
		<input type="button" onclick="button1_click('A');" value="A팀" /> 
		<input type="button" onclick="button1_click('B');" value="b팀" />
		</c:if>
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}%"><fmt:formatNumber value="${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>% Complete (success)</div>





			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: ${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}%"><fmt:formatNumber value="${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>% Complete (info)</div>
		</div>
	</div>
	
	<div>
		<c:if test='${batting.bStatus eq "N" }'>현재 배율</c:if><c:if test='${batting.bStatus eq "Y" }'>최종 배율</c:if> : A팀 : <fmt:formatNumber value="${(100-batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>배 &nbsp;B팀 : <fmt:formatNumber value="${(100-batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>배
	</div>
	
	<br><br><br>
	
	<div>
		<input type="button" value="배팅 종료" onclick="location.href='${pageContext.request.contextPath}/batting/battingAllocation.ba?battingId=${batting.battingId}';" />
	</div>

	<!-- <div class="progress">
		<div class="progress-bar progress-bar-warning" role="progressbar"
			aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
			style="width: 60%">60% Complete (warning)</div>
	</div>

	<div class="progress">
		<div class="progress-bar progress-bar-danger" role="progressbar"
			aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
			style="width: 70%">70% Complete (danger)</div>
	</div> -->

	<script>
		function button1_click(battingType) {
			var result = confirm("한번 선택한 배팅은 취소나 변경이 불가능 합니다. 선택하신 팀이 맞습니까? ");
			
			if (result) {
				location.href="${pageContext.request.contextPath}/batting/battingPick.ba?battingId="+${batting.battingId}+"&battingType="+battingType+"&userName=${member.userName}";
				alert("선택되었습니다.");
			} else {
			}
		}
	</script>
</body>
</html>