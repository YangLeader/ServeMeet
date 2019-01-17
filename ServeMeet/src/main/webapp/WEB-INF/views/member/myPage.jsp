<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>

<title>마이페이지</title>
<meta charset="UTF-8" />
<style>
	.container {
	
		align : center;
	}
	.sm_group{
		height : 350px;
		width : 500px;
		min-height : 185px;
		margin : 16px 8px 0;
		padding : 50px 40px 50px;
		text-align : left;
		border: 1px solid #dadada;
		border-radius : 2px;
		background: #fff;
	}
	.section_home div{
		display : block;
	}
	
	#content.section_home {
	    line-height: 14px;
	    zoom: 1;
	    margin-left : 15%;
	    margin-right : 15%;
	    align : center;
	}
	
	#content {
	    position: relative;
	    padding: 32px 51px 95px;
	}
	
	.column{
		float : left;
		margin-left : 10px; 
		margin-right : 10px; 
		
	}
	
	.box {
		width : 500px;
	}
	
	.sm_lst {
	    position: relative;
	    min-height: 80px;
	    margin-top: 10px;
	    padding-bottom: 8px;
	}
	
	.contxt { 
		font-size : 13px;
		margin-top : 20px;
	}
	
	
	.btn_area{
		padding-top :50px;
		height : 40%;
	}
	.sm_header {
		height : 20%;
	}
	
	.sm_content {
		height : 40%;
	}
	.sb_btn {
	    color: #fff;
	    background: #5e73de;
	    font-size: 20px;
	    font-weight: 600;
	    padding: 5px 8px;
	    line-height: 34px;
	    border-radius: 0.3em;
	    border: 0;
	    text-align: center;
	     box-shadow:3px 3px 3px 1px #999;
	}
	
	.sm_content>.contxt {
	    font-size: 20px;
	    line-height: 19px;
	    letter-spacing: -1px;
	    color: #666;
	}
	
	.nick {
		width : 40%;
		margin-left : 50px;
		margin-top : 30px;
		margin-bottom : 30px;
	}
	.profile{
	
		width : 40%;
		margini-right : 20px;
		margin-top : 20px;
		margin-bottom : 20px;
	}
	
	.nick_tit{
		position: relative;
		width : 30%;
		
	}
	
	.nick_txt {
		margin-top : 10px;
		position: relative;
		width : 30%;
	}
	.section_home span {
		padding-top : 10px;
		padding-bottom : 10px;
	}
	.section_home .matchingCount{
	    top: 445px;
	    left: 314px;
	    padding:0px;
	}
	.matCnt{
		padding:3px 7px!important;
	}
	
</style>

<title>마이페이지</title>

</head>
<body>
<c:import url="../common/header.jsp" />
<div id="container">
	<div id="content" class="section_home">
		<div class="row">
		<div class ="column box">
			<div class="sm_group">
				<div class="sm_header">
					<h2>서브밋 프로필</h2>
				</div>
				<div class="sm_content">
					<div class="sm_1st row">
						<div class="profile column">
							<img src="https://static.nid.naver.com/images/web/user/default.png" width="80" height="80" alt="">							
						</div>
						<div class="nick column">
							<h3 class="nic_tit">
								<b>닉네임</b>
							</h3>
							<h4 class="nic_txt"> ${member.userName}</h4>
							<h4 style="color:#5e73de" ><span id="getPoint" class="counter"></span></h4>
							<a href="${pageContext.request.contextPath}/point/pointList.do">>포인트 내역</a>
						</div>
					</div>
				</div>
				<br>
				<div class="btn_area">
					<a href="${pageContext.request.contextPath}/member/memberInfo.do?userNo=${member.userNo}" class = "sb_btn">내 정보보기</a>
				</div>
			</div>
			<div class="sm_group">
				<div class="sm_header">
					<h2>매칭 히스토리<span class = "matchingCount"></span></h2>
				</div>
				<div class="sm_content">
					<p class="contxt">
					<span>매칭 히스토리를 보여줍니다.<br></span>
					<span>현재 진행중인 매칭과 종료된 매칭을 <br>확인하실 수 있습니다.</span>
					</p>
					<p class="contxt">
					</p>
				</div>
				<div class="btn_area">
					<a href="${pageContext.request.contextPath}/matching/myMatchingList.ma" class = "sb_btn" onclick="ingMatching();">조회하기</a>
				</div>
			</div>
		</div>
		<div class ="column box">
			<div class="sm_group">
				<div class="sm_header">
					<h2>내가 작성한 게시글</h2>
				</div>
				<div class="sm_content">
					<p class="contxt">
					게시판에 작성한 글을 보여줍니다.
					</p>
				</div>
				<div class="btn_area">
					<a href="${pageContext.request.contextPath}/board/myBoardList.do?userName=${member.userName}" class = "sb_btn">조회하기</a>
				</div>
			</div>
			<div class="sm_group">
				<div class="sm_header">
					<h2>배팅 히스토리</h2>
				</div>
				<div class="sm_content">
					<p class="contxt">
					회원님이 투자한 배팅 내역을 보여줍니다.
					</p>
				</div>
				<div class="btn_area">
					<a href="${pageContext.request.contextPath}/batting/myBattingList.ba?userName=${member.userName}" class = "sb_btn">조회하기</a>
				</div>
			</div>
		</div>
		
		</div>
		<br>
		<p>ServeMeet을 더이상 이용하지 않는다면? <a onclick="deleteUser();">회원 탈퇴하기</a></p>
		</div>
		
	
</div>


<c:import url="../common/footer.jsp"/>

<script>

	$(document).ready(function(){
		getPoint();
	})

	function deleteUser(){
		
		swal({
			  title: "더 이상 ServeMeet을 이용하실 수 없습니다.",
			  text: "이용내역은 사라지지 않습니다. 그래도 계속하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			  closeOnClickOutside: false
			}).then((willDelete) => {
				if(willDelete){
				location.href="${pageContext.request.contextPath}/member/memberDelete.do";
				}else {
				    return false;
				 }
			});
		
	}
	
	function getPoint(){
		$.ajax({
			url : "${pageContext.request.contextPath}/point/getPoint.do",
			success : function(point){
				console.log("포인트 : " + point);
				$("#getPoint").html(point+"p");
				
            }, error : function(jqxhr, textStatus, errorThrown){
                console.log("포인트 얻기ajax 처리 실패");
                //에러로그
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
            }
		});
	}
	
	
"${pageContext.request.contextPath}/member/memberDelete.do"
</script>

</body>
</html>