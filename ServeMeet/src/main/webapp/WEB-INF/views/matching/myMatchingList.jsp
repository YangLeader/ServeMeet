<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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
<style type="text/css">
.listDiv #loc,#cate,#apply{
	width: 33%;
}
</style>
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
				<div class="condition on" id="loc">
					<span>진행중인 매칭</span>
				</div>
				<div class="condition" id="cate">
					<span>종료된 매칭</span>
				</div>
				<div class="condition" id="apply">
					<span>신청한 매칭</span>
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
	</div>
	<br />
	<br />
	<footer>
		<c:import url="../common/footer.jsp"/>
	</footer>

	<script>
	$(function() {
		MatchingList("ing");
		$("#loc").click(function() {
			MatchingList('ing');
			onController("#loc");
		});
		$("#cate").click(function() {
			MatchingList('end');
			onController("#cate");
		});
		$("#apply").click(function() {
			MatchingList('apply');
			onController("#apply");
		});
		function onController(ck) {
			$(".on").removeClass("on");
			$(ck).attr("class","condition on");
		}
		
		$(document).on("click",".con",function() {
			var matNum = $(this).siblings().last().val();
			location.href = "${pageContext.request.contextPath}/matching/matchingDetail.md?matNum="
					+ matNum;
		});
		
		function MatchingList(msts){
			var userName =  '${member.userName}';
			$(".objM").remove();
			$.ajax({
				url : "${pageContext.request.contextPath}/matching/myMatchingListType.do",
			 	data : { type : msts,
						userName :userName
				},
				type : "get",
				dataType : "json",
				success : function(data){
					console.log(data);
					
					for(var i in data){
						
						
						var divList = "<div class='objM'>";
						divList+= "<div class='con' id='catBName'>"+data[i].bigCategory+"</div>";
						divList+= "<div class='con' id='catSName'>"+data[i].midCategory+"</div>";
						divList+= "	<div class='con' id='mtTitle'>";
						divList+= "	<strong>"+data[i].mTitle+"</strong></div>";
						if(data[i].bigLocation=='지역없음'){
							divList+= "	<div class='con' id='locName'>"+data[i].bigLocation+"</div>";
						}else{
							divList+= "	<div class='con' id='locName'>"+data[i].bigLocation+" "+data[i].midLocation+" "+data[i].smallCategory+"</div>";
						}
						divList+= "	<div class='con' id='mtwriter'>"+data[i].mWriter+"</div>";
						divList+= "	<div class='con' id='mtTime'>"+data[i].mtime+"</div>";
						divList+= "	<div class='con' id='mpeople'>"+data[i].mPeoplenum+"명</div>";
						if(data[i].mStatus=="BEFORE"){
							divList+= "<div class='con cgr' id='mStatus'>● 매칭 대기</div>";
						}else if(data[i].mStatus=="ING"){
							divList+= "<div class='con cbl' id='mStatus'>매칭 중</div>";
						}else{
							divList+= "<div class='con crd' id='mStatus'>매칭 종료</div>";
						}
						divList+= "	<input type='hidden' id='mid' value='"+data[i].matchingId+"' /></div>";
						$(".listDetailDiv").append(divList);
					}
					console.log(divList);
					
				},
				error:function(){
					console.log("에러났대요");
				}
				
			});
		
		}
	})
	</script>
</body>
</html>