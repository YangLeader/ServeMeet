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
	padding: 30px;

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
.sb_btn_cmp{
background-color: gray!important;
}
.sb_btn_cmp:hover{
background-color: gray!important;
}
.mh_btn{
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
.mHistory{
	align-items : right;
	}
.conList{
border: 1px #5e73de solid;
border-radius: 5px;
display: flex;
width: 100%; height: 100px; margin-bottom: 10px;
}
.cdOne{
display: inline-block;

}
.cdTitle{
flex-basis: 200px;
height: 100%;
text-align: center;
padding: 10px 0px;

}
.cdBody{
    word-break: break-word;
	flex-basis: 1000px;
	height: 100%;
	padding: 5px 0px;
}
.cdComfirm{
    display: inline-block;
    width: 40px;
    height: 40px;
}
.cdAccept{
	background-image: url("${pageContext.request.contextPath }/resources/images/check2.png");
	background-size:40px;
}
.cdCancel{
	background-image: url("${pageContext.request.contextPath }/resources/images/cancle2.png");
	background-size:40px;
}
.acceptIcon{
font-family: 'Sunflower', sans-serif;
padding-top: 15px; 
color: #5e73de;
}
.cancelIcon{
font-family: 'Sunflower', sans-serif;
padding-top: 15px; 
color: red;
}

</style>
<c:set var = "pNumA">${batting.BATTINGPNUMA}</c:set>
<c:set var = "pNumB">${batting.BATTINGPNUMB}</c:set>
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
					<li class="matchingLi"><input type="hidden" id="matchingId" value="${mDetail.matchingId}"/></li>
					<br /><br />
				</ul>
				<span class="mInfo">개설자 정보</span>
				<div class="greyRule"></div>
				<div class="infoD">
					<ul class="uls">
						<li>등록자 이름 : <a id="liWriter">${mDetail.mWriter}</a></li>
					</ul>
				</div>
				<div class="report"></div>
			</div>
		
			<br /><br />
			<c:choose>
				<c:when test="${mDetail.mStatus eq 'AFTER' }">
					<c:choose>
						<c:when test="${mDetail.mApplicant eq member.userName}">
							<c:choose>
								<c:when test="${mDetail.mApplicant eq mDetail.mGuest }">
									<center><button class="sb_btn sb_btn_cmp" disabled="disabled">승락되었습니다.</button></center>	
								</c:when>
								<c:otherwise>
									<center><button class="sb_btn sb_btn_cmp" disabled="disabled">거절되었습니다.</button></center>	
								</c:otherwise>
							</c:choose>
						 </c:when>	
						 <c:otherwise>
							<center><button class="sb_btn sb_btn_cmp" disabled="disabled">매칭 종료</button></center>	
						 </c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${mDetail.mWriter eq member.userName}">
							<c:when test="${mDetail.mStatus eq 'AFTER' }">
								<button class="mh_btn" onclick='javascript:location.href="${pageContext.request.contextPath }/matching/matchingHistoryForm.ma?matchingId=${mDetail.matchingId}"'> 매칭 후기 쓰기</button>
							</c:when>
						</c:when>
						<c:when test="${mDetail.mWriter eq member.userName}">
							<center><button class="sb_btn sb_btn_cmp" onclick="popupOpen()" disabled="disabled">매칭 신청</button></center>
						
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${mDetail.mApplicant eq member.userName}">
									<center><button class="sb_btn sb_btn_cmp" onclick="popupOpen()" disabled="disabled">신청 완료</button></center>
								</c:when>
								<c:otherwise>
									<center><button class="sb_btn" onclick="popupOpen()">매칭 신청</button></center>		
								</c:otherwise>
							</c:choose>	
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<div class="conditions" style="padding: 30px;">
				<c:if test="${mDetail.mWriter eq member.userName}">
					<form method="post" id = "accChatRoom">
					<c:forEach items="${mConditions}" var="item">
						<div class="conList">
							<div class = "cdOne cdTitle"><span>${item.mguest }</span></div>
							<div class = "cdOne cdBody"><span>${item.mmsg }</span></div>
							<div class="cdOne" style="flex-basis: 100px; padding: 3px 5px;">
								<c:choose>
								
									<c:when test="${item.mstatus eq '3ACCECPT'}">							
										<h2 class="acceptIcon"><b>매칭<br>완료</b></h2>
									</c:when>
									<c:when test="${item.mstatus eq '2DECLINE'}">
										<h2 class="cancelIcon"><b>매칭<br>거절</b></h2>
									</c:when>
									<c:otherwise>
										<span class="cdComfirm cdAccept"id ="cdAccept${item.mconid }" onclick="cdAccept(${item.matchingid},${item.mconid },'${item.mguest }');"></span>
										<span class="cdComfirm cdCancel" id="cdCancel${item.mconid }" onclick="cdDecline(${item.mconid });"></span>
									</c:otherwise>
								</c:choose>
							</div>	
						</div>
					</c:forEach>
					</form>
				</c:if>
			</div>
		</div>
		
	</div>
	
<br /><br />
<footer>
	<c:import url="../common/footer.jsp" />	
</footer>
<c:import url="../matching/matchingModal.jsp" />
<script>
var openwin; 
function popupOpen(){
	var pWidth=window.screen.width;
	var pHeight=window.screen.height;
	
	var popUrl = "${pageContext.request.contextPath}/matching/matchingApply.ma";	//팝업창에 출력될 페이지 URL
	var popupX = ( pWidth/ 2) - (500 / 2);
	var popupY= (	pHeight /2) - (360 / 2);
	
	var popOption = "width=500, height=360, left="+popupX+", top="+popupY+", screenX="+ popupX + ", screenY= "+ popupY+",resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

	openwin = window.open(popUrl,"",popOption);
	
}

function cdAccept(matchingId,conId,userName) {
	swal({
		  title: "매칭 상대를 정하시겠습니까?",
		  text: "채팅방으로 이동합니다.",
		  icon: "success",
		  buttons: ["취소", "확인"],
		 
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url:"${pageContext.request.contextPath}/matching/matchingAccept.ma",
					data:{
							conId:conId,
							matchingId: matchingId
					},
					type:"post",
					success:function(data) {
						accChatRoom(userName);
					},
					error:function(){
						console.log("승락 실패");
					}
				});  
		  }
		});
/* 	*/
}
function cdDecline(conId) {
	
	var $cancleConId = "#cdCancel"+conId;
	var $acceptConId = "#cdAccept"+conId;
	swal({
		  title: "신청을 거절하시겠습니까?",
		  icon: "warning",
		  buttons: ["취소", "확인"],
		 
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url:"${pageContext.request.contextPath}/matching/matchingDecline.ma",
					data:{conId:conId},
					type:"post",
					success:function(data) {
						$($cancleConId).removeClass("cdComfirm cdCancel").remove("id",$cancleConId).attr("class","cancelIcon");
						$($acceptConId).remove();
						matchingConCnt();
						
					},
					error:function(){
						console.log("승락 실패");
					}
				});
		  }
		});

}
function accChatRoom(userName) {

	$('#accChatRoom').attr('action', "${pageContext.request.contextPath}/chat/chattingRoom.do/"+userName);
	$('#accChatRoom').submit();
}

</script>
</body>
</html>