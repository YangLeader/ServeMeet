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
		width: 95%;
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
		width: 7%;
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
		width: 7%;
	}
	#mpeople{
		width: 6%;
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
				<c:forEach items="${matchingList}" var="m">
					<div class="objM">
						<div class="con" id="catBName">${m.bigCategory }</div>
						<div class="con" id="catSName">${m.midCategory }</div>
						<div class="con" id="mtTitle">${m.mTitle }</div>
						<div class="con" id="locName">${m.bigLocation } ${m.midLocation } ${m.smallCategory }</div>
						<div class="con" id="mtwriter">${m.mWriter }</div>
						<div class="con" id="mtTime">${m.mtime}</div>
						<div class="con" id="mpeople">${m.mPeoplenum }</div>
						<div class="con" id="mStatus">${m.mStatus}</div>
					</div>
				</c:forEach>
		</div>
	</div>
	<br />
	<br />
	<footer>
		<c:import url="../common/footer.jsp" />	
	</footer>
</body>
</html>