<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ServeMeet</title>
<style>
.detailDiv{
	
	width: 95%;
	margin: auto;
}
.detailIn{
	background: white;
	padding-bottom: 30px;
	padding-top: 30px;
	padding-left: 30px;
	width: 80%;
	margin: auto;
}

.infoD{

	width: 80%;
	margin-top: 5px;
}
.infoM{
	display: inline-block;
	padding-top:30px;


	width: 40%;
	margin-left: 30px;
	
}
.infoC{

	display:inline-block;

	width: 54%;
	vertical-align: top;
	padding-top: 30px;
	
}
.mInfo{
	
	cursor: default;
	font-weight: bold;
	font-size: 20pt;
}
.detailC{

}
hr{

	width: 100px;
	border: 1px solid black;
}
.greyRule { 
	background: #CECECE; 
	width: 100%;	
	height: 1px; 
	padding: 0; 
	margin: 0; 
}
.mtitle{
	font-weight: bold;
	font-size: 20pt;
	cursor: default;
}
.uls{
	list-style: none;
	padding-left: 0px;
	padding-top: 10px;
}
.matchingLi{
	
}

.sb_btn{
		margin-top: 20px;
		width: 21%;
		color: #fff;
	    background: #5e73de;
	    font-size: 13pt;
	    font-weight:400;
	    margin-left: 0.3em;
	    padding: 0 8px;
	    height: 50px;
	    line-height: 34px;
	    border-radius: 0.3em;
	    border: 0;
	    text-align: center;
	  
	    
	}
.sb_btn:hover {
	background: #49BCE3;
}

.report{

	width: 100px; 
	float: right; 
	margin-right: 10px;
	color: red;
	text-align: right;
}
</style>
</head>
<body>

<header>
	<c:import url="../common/header.jsp" />
</header>
	<div class="detailDiv">
		<br /><br />
		<div class="detailIn">
			<div class="infoC">
				<span class="mInfo">상세정보</span>
				<div class="greyRule"></div>
				<br />
				<div class="detailC">
					${mDetail.mContent }
				</div>
			</div>
			
			<div class="infoM">
				<span class="mtitle">${mDetail.mTitle }</span>
				<div class="greyRule"></div>
				<ul class="uls">
					<li>모임 종류 : ${mDetail.bigCategory } - ${mDetail.midCategory }</li>
					<li class="matchingLi">날짜/시간 : ${mDetail.mtime }</li>
					<li class="matchingLi">모임 지역 : ${mDetail.bigLocation } ${mDetail.midLocation } ${mDetail.smallCategory }</li>
					<li class="matchingLi">모집 인원 : ${mDetail.mPeoplenum }명</li>
					<br /><br />
				</ul>
				<span class="mInfo">개설자 정보</span>
				<div class="greyRule"></div>
				<div class="infoD">
					<ul class="uls">
						<li>등록자 이름 : ${mDetail.mWriter}</li>
					</ul>
				</div>
				<div class="report">신고하기</div>
			</div>
			
			<br /><br />
			<center><button class="sb_btn"data-toggle="modal" data-target="#myModal">매칭 신청</button></center>
		</div>
	</div>
	
<br /><br />
<footer>
	<c:import url="../common/footer.jsp" />	
</footer>
<c:import url="../matching/matchingModal.jsp" />
<script>


</script>
</body>
</html>