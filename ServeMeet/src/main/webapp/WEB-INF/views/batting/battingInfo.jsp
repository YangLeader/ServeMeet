
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

<c:set var = "pNumA">${batting.BATTINGPNUMA}</c:set>
<c:set var = "pNumB">${batting.BATTINGPNUMB}</c:set>

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div>
	<c:if test='${batting.BSTATUS eq "N" }'>
		<input type="button" onclick="button1_click('A');" value="A팀" /> 
		<input type="button" onclick="button1_click('B');" value="b팀" />
		</c:if>
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${(pNumA/(pNumA + pNumB))*100}%"><fmt:formatNumber value="${(pNumA/(pNumA + pNumB))*100}" pattern=".00"/>% Complete (success)</div>





			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: ${(pNumB/(pNumA + pNumB))*100}%"><fmt:formatNumber value="${(pNumB/(pNumA + pNumB))*100}" pattern=".00"/>% Complete (info)</div>
		</div>
	</div>
	
	<div>
		<c:if test='${batting.BSTATUS eq "N" }'>현재 배율</c:if><c:if test='${batting.BSTATUS eq "Y" }'>최종 배율</c:if> : A팀 : <fmt:formatNumber value="${(100-pNumA/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배 &nbsp;B팀 : <fmt:formatNumber value="${(100-pNumB/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배
	</div>
	
	<br><br><br>

		<script>
		function button1_click(battingType) {
			var result = confirm("한번 선택한 배팅은 취소나 변경이 불가능 합니다. 선택하신 팀이 맞습니까? ");
			
			if (result) {
				location.href="${pageContext.request.contextPath}/batting/battingPick.ba?battingId="+${batting.BATTINGID}+"&battingType="+battingType+"&userName=${member.userName}";
				alert("선택되었습니다.");
			} else {
			}
		}
	</script>
</body>
</html>