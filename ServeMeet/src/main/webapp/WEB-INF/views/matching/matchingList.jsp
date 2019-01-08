<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<style>
	.listDiv{
		border: 1px solid black;
		margin: auto;
		width: 80%;
		text-align: center;
	}
	
	.listDetailDiv{
		border: 1px solid black;
	}
	
	ul{
		list-style: none;
	}
	
	.objM{
		border: 1px solid black;
		margin: auto;
		width: 100%;
		height: 80px;
	}
	
	.con{
		border: 1px solid black;
		float: left;
		height: 100%;
		text-align: center;
	}
	
	#catBName{
		width: 10%;
	}
	
	#catSName{
		width: 10%;
	}
	
	#mtTitle{
		width: 30%;
	}
	
	#locName{
		width: 20%;
	}
	
	#mtwriter{
		width: 10%;
	}
	
	#mtTime{
		width: 10%;
	}
	
	#mStatus{
		width: 10%;
	}
</style>
<meta charset="UTF-8">
<title>매칭 리스트</title>
</head>
<body>
	<header>
		<c:import url="../common/header.jsp" />
	</header>
	<div class="listDiv">
	<br /><br />
		<h1>매칭 리스트</h1>
		<br /><br />
		<div class="listDetailDiv">
				<div class="objM">
					<div class="con" id="catBName">소모임</div>
					<div class="con" id="catSName">영화</div>
					<div class="con" id="mtTitle">금요일날 영화볼 3명구합니다.</div>
					<div class="con" id="locName">서울특별시 강남구 논현동</div>
					<div class="con" id="mtwriter">관리자</div>
					<div class="con" id="mtTime">2019-01-01 12:00</div>
					<div class="con" id="mStatus">대기중</div>
				</div>
		</div>
	</div>
	<br />
	<br />
	<footer>
		<c:import url="../common/footer.jsp" />	
	</footer>
</body>
</html>