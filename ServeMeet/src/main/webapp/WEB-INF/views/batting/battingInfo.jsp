
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
<title>배팅 배팅 배팅</title>



<c:import url="../common/header.jsp" />


</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div>
		<input type="button" onclick="button1_click();" value="A팀" /> <input
			type="button" value="b팀" />
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="40" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${batting.battingPNumA}%">40% Complete (success)</div>




			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
				style="width: 50%">50% Complete (info)</div>
		</div>
	</div>

	<div class="progress">
		<div class="progress-bar progress-bar-warning" role="progressbar"
			aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
			style="width: 60%">60% Complete (warning)</div>
	</div>

	<div class="progress">
		<div class="progress-bar progress-bar-danger" role="progressbar"
			aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
			style="width: 70%">70% Complete (danger)</div>
	</div>

	<script>
		function button1_click() {
			var result = confirm("한번 선택한 배팅은 취소나 변경이 불가능 합니다. A팀이 맞습니까? ");
			if (result) {
				alert("선택되었습니다.");
			} else {
				alert("다시 선택해주세요.");
			}
		}
	</script>
</body>
</html>