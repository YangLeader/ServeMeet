
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>
<c:import url="../common/header.jsp" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<title>배팅 게시판</title>

<style>
.sb_btn2{
	width: 49%;
    height: 100%;
    color: #fff;
    background: #5e73de;
    font-size: 13pt;
    font-weight: 600;
    padding: 0 8px;
    line-height: 34px;
    border-radius: 0.3em;
    border: 0;
    text-align: center;
    box-shadow: 3px 3px 3px 1px #999;
    align-self: center;
}
#bo_v_con span{

	cursor : text;
}

#bo_v_con img{

	cursor : default;
}
</style>

<c:set var="type">
	<c:if test='${type eq "N" }'>'I'</c:if>
	<c:if test='${type eq "Y" }'>'E'</c:if>
</c:set>
</head>
<body>


<div id="wrapper">

	<div class="container" style="background-color:white; border-radius: 20px;">
	<br />
<!-- 게시물 읽기 시작 { -->
<article id="bbs-view" style="width:auto;">

	<div class="bbs_title_wrap" style="">
		<a class="bbs_title" href="${pageContext.request.contextPath }/batting/battingList.ma?type=I">배팅 게시판</a>
	</div>
	
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bbs-view-top-btn" class="bbs_view_btn_wrap">
		<div class="button_box">
		   
			<a href='${pageContext.request.contextPath }/batting/battingList.ma?type=I' class="bbs_btn btn_list">
				<span class="glyphicon glyphicon-list-alt"></span> 목록
			</a>
			
		</div>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<div id="bbs-view-subject">
		<header>
			<h2 id="bbs-view-title" align="center">
								${matching.MTITLE} 의 배팅	</h2>
		</header>

	</div>

    
    
    <section id="bo_v_atc">
        <div id="bo_v_img">
</div>
		
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        <pre style="background-color: white; white-space: pre-wrap; padding: 0px 10px;">
        	<h2 id="bbs-view-title">배팅 종목 : ${matching.MIDCATEGORY}</h2>
        	<h2 id="bbs-view-title">A팀 대표 : ${matching.MWRITER}</h2>
			<h2 id="bbs-view-title">B팀 대표 : ${matching.MGUEST}</h2> 
			<h2 id="bbs-view-title">A팀 배당 : <fmt:formatNumber value="${(100-batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>배                                       B팀 배당 : <fmt:formatNumber value="${(100-batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>배</h2>
        </pre>
         
        <c:if test="${batting.battingPNumA + batting.battingPNumB eq 0}">
        	<div>아무도 배팅을 걸지 않았습니다.</div>
        </c:if>
        <c:if test="${batting.battingPNumA + batting.battingPNumB ne 0}">
        <div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}%">A팀 선택률 : <fmt:formatNumber value="${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>%</div>

			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: ${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}%">B팀 선택률 : <fmt:formatNumber value="${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>%</div>
		</div>
		</c:if>
		<div>
			
		</div>
		<c:if test='${batting.bStatus eq "N" }'>
		<div>
			<input type="button" class="sb_btn2" onclick="btnBatting('A');" value="A팀 배팅(<fmt:formatNumber value="${(100-batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>)" /> 
			<input type="button" class="sb_btn2" onclick="btnBatting('B');" value="b팀 배팅(<fmt:formatNumber value="${(100-batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB)*100)*15/1000 + 1}" pattern=".00"/>)" />
		</div>
        </c:if>
        </div>

      </section>

	
    
    

</article>

<script>

function btnBatting(battingType){
	swal({
		  title: "100포인트가 차감됩니다.",
		  text: "그래도 계속하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		}).then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
  					url : "${pageContext.request.contextPath}/point/getPoint.do",
  					async : false,
  					success : function(point){
  						console.log("point : "+point);
						if(point <100){
							 swal("포인트가 모자랍니다.");
							 location.reload(true);
						 }else{
							 $("#scratchBtn").attr("style","display:none");
						 $.ajax({
								url : "${pageContext.request.contextPath}/batting/battingPick.ba",
								data : {battingId : "${batting.battingId}",
										battingType : battingType,
										userName : "${member.userName}"
										},
								async : false,
								success : function(data){
									if(data == 'success'){
															
										swal(battingType+"팀이 선택되었습니다.")
										.then((value) => {
											location.href='${pageContext.request.contextPath}/point/updatePoint.do?increasePoint=-100&pContent=배팅 포인트 차감';
											location.href='${pageContext.request.contextPath}/batting/battingInfo.ba?no=${batting.battingId}';
										});
										
										
									} else{
										swal("이미 선택한 배팅입니다.")
									}
									
					            }, error : function(jqxhr, textStatus, errorThrown){
					                console.log("배팅 ajax 처리 실패");
					                //에러로그
					                console.log(jqxhr);
					                console.log(textStatus);
					                console.log(errorThrown);
					                swal("이미 선택한 배팅입니다.")
					            }
							});
						 
							 
						 }

  						
  		            }, error : function(jqxhr, textStatus, errorThrown){
  		                console.log("포인트 얻기ajax 처리 실패");
  		                //에러로그
  		                console.log(jqxhr);
  		                console.log(textStatus);
  		                console.log(errorThrown);
  		            }
  				});
				  } else {
				    return false;
				  }
				});
}
</script>



<script>
$('.dropdown').click(function(){
	
	/* $(this).children('#downlist').css('display', 'block'); */
	$(this).children('#downlist').toggle('fast');										
	
$('html').click(function(e) {
	
	if(!$(e.target).hasClass("drop")) { 
			
		$('.dropdown').children('#downlist').css('display', 'none');
	}
								
})
										
});

function chatting(userName){
	$('#chatting').attr('action', "/ServeMeet/chat/chattingRoom.do/"+userName);
	
	$('#chatting').submit();
}

function search(){
	location.href="searchBoard.do?con="+$('#sfl').val()+"&keyword="+$('#stx').val();
}

function put_tags(a){
	$("#stx").val(a).focus();
	$("#sfl").val("wr_1");
}

$(function(){
	var stx = $('#stx');
	stx.focus(function(){
		$("#sfl").removeClass("dno");
	});
	
	bbs_list_width_fixed();

	setTimeout(function(){
		bbs_list_width_fixed();
	}, 100);
	
	$(window).resize(function(){
		bbs_list_width_fixed();
	});
	
	// 분류 변경시 페이지 이동
	$('.bbs_cate_select').change(function(){
		if ($(this).val() != "") {
			location.href = $(this).val();
		}
	});
});

// 리스트 제목 부분 width 자동조절
function bbs_list_width_fixed(){
	$('#bbs-list-ul .subject_text').css('max-width', $('#bbs-list-ul li').innerWidth() - $('#bbs-list-ul li .dec').innerWidth() - 170);

	if (($(window).innerWidth()+17) > 767) {
		$('.bbs_list_basic .subject').width($('#bbs-list-ul li').width() - $('#bbs-list-ul .dec').width() - 20);
	}
	else {
		$('.bbs_list_basic .subject').css('width', '100%');
	}

	$('.bbs_list_top .subject').css('width', ($('#bbs-list-ul li').innerWidth() - $('.bbs_list_top .dec').innerWidth()) / 2 + 20);
}

// 모바일 게시판 리스트에서 제목 부분 (넓은 영역) 터치시 글 읽기 활성화
function view_link_type_m(get_url){
	if (window.innerWidth < 768) {
		location.href = get_url;
	}
}
</script>
<c:import url="../common/footer.jsp" />

</body>

</html>