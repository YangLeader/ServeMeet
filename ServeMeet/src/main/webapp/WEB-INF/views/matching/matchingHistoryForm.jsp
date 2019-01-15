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
		
		border-radius: 30px;
		margin: auto;
		width: 95%;
		text-align: center;
	}
	
	.listDetailDiv{
		
	}
	
	ul{
		list-style: none;
	}
	
	.objM{
		
		border-radius: 10px;
		margin: auto;
		width: 80%;
		height: 80px;
		margin-bottom: 10px;
		border: 1px solid #e0e0e0;	
		font-size: 9pt;
		cursor: pointer;
	}
	
	.objM:hover{
		border: 1px solid #DEEBFF;
		background: #DEEBFF;
	}
	
	.objTitle{
		font-size: 9pt;
		border: 1px solid #e0e0e0;
		padding-top: 10px;
		border-radius: 10px;
		margin: auto;
		width: 80%;
		height: 50px;
		margin-bottom: 10px;	
		background: #f9f9f9;
		font-weight: bold;
		
	}
	
	.con{
		vertical-align: middle;
		float: left;	
		height: 100%;
		padding-top: 25px;
		
	}
	
	.conTitle{
		vertical-align: middle;
		float: left;	
		height: 100%;
		
		
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
		padding-top: 15px;
		width: 7%;
	}
	
	#mpeople{
		
		width: 6%;
	}
	#mStatus{
		width: 10%;
	}
	
	
	#mTimeTitle{
		width: 7%;
	}
	
	.cgr{
		color: #45C21B;
	}
	
	.cbl{
		color: blue;
	}
	
	.crd{
		color: red;
	}
</style>
<meta charset="UTF-8">
<title>매칭 리스트</title>
</head>
<body style="background-color: white;">
	<header>
		<c:import url="../common/header.jsp" />
	</header>
	
	<div class="listDiv">
	<br /><br />
		<h1>${lName } 리스트</h1>
		<br /><br />
		<div class="listDetailDiv">
			<div class="objTitle">
				<div class="conTitle" id="catBName">매칭 종류</div>
				<div class="conTitle" id="catSName">분류</div>
				<div class="conTitle" id="mtTitle">제목</div>
				<div class="conTitle" id="locName">지역</div>
				<div class="conTitle" id="mtwriter">등록자</div>
				<div class="conTitle" id="mTimeTitle">날짜</div>
				<div class="conTitle" id="mpeople">모집 인원</div>
			</div>
				<c:forEach items="${matchingList}" var="m">
					<div class="objM" onclick="showMatching()">
						<div class="con" id="catBName">${m.BIGCATEGORY }</div>
						<div class="con" id="catSName">${m.MIDCATEGORY }</div>
						<div class="con" id="mtTitle"><strong>${m.MTITLE }</strong></div>
						<div class="con" id="locName">${m.BIGLOCATION } ${m.MIDLOCATION } ${m.SMALLCATEGORY }</div>
						<div class="con" id="mtwriter">${m.MWRITER }</div>
						<div class="con" id="mtTime">${m.MTIME}</div>
						<div class="con" id="mpeople">${m.MPEOPLENUM }명</div>
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
/* 	function showMatching() {
	 	var test = $(this).children('#mtTitle').text();
		alert(test); 
		 $('.objM').children('#catBName').css('border', '1px solid black');
		
		//
	}  */
	$('.con').click(function () {
		var matNum = $(this).siblings().last().val();
		
		location.href = "${pageContext.request.contextPath}/matching/matchingDetail.md?matNum=" + matNum;
	});
</script>
</body>
</html>