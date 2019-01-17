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
#bo_v_con span{

	cursor : text;
}

#bo_v_con img{

	cursor : default;
}
</style>
</head>
<body>

<script>
		
	$(function(){
		$('[data-mytext=getNo]').on("click",function(){
			var mHistoryId = $(this).attr("id");
			console.log("mHistoryId="+mHistoryId);
			location.href = "${pageContext.request.contextPath}/matching/mHistorySelectOne.ma?no="+mHistoryId;
		});
		
	});
</script>

<div id="wrapper">

	<div class="container" style="background-color:white; border-radius: 20px;">
	<br />
<!-- 게시물 읽기 시작 { -->
<article id="bbs-view" style="width:auto;">

	<div class="bbs_title_wrap" style="">
		<a class="bbs_title" href="${pageContext.request.contextPath }/matching/mHistoryList.ma">배팅 게시판</a>
	</div>
	
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bbs-view-top-btn" class="bbs_view_btn_wrap">
		<div class="button_box">
		   
			<a href="${pageContext.request.contextPath }/matching/mHistoryList.ma" class="bbs_btn btn_list">
				<span class="glyphicon glyphicon-list-alt"></span> 목록
			</a>
			
		</div>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<div id="bbs-view-subject">
		<header>
			<h2 id="bbs-view-title" align="center">
								${matching.mTitle} 의 배팅	</h2>
		</header>

	</div>

    
    
    <section id="bo_v_atc">
        <div id="bo_v_img">
</div>
		
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        <pre style="background-color: white; white-space: pre-wrap; padding: 0px 10px;">
        	       
        </pre>
        <div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}%"><fmt:formatNumber value="${(batting.battingPNumA/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>% Complete (success)</div>


			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: ${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}%"><fmt:formatNumber value="${(batting.battingPNumB/(batting.battingPNumA + batting.battingPNumB))*100}" pattern=".00"/>% Complete (info)</div>
		</div>
		<div>
			A팀 대표 : ${matching.mWriter}
			B팀 대표 : ${matching.mGuest}
		</div>
		<div>
			<button class="sb_btn" onclick="popupOpen()">매칭 신청</button>
			<button class="sb_btn" onclick="popupOpen()">매칭 신청</button>
		</div>
        
        </div>
       
                <!-- } 본문 내용 끝 -->

        		
    </section>

	
    
    

</article>
<!-- } 게시판 읽기 끝 -->

<script>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

    // 추천, 비추천
    $("#good_button, #nogood_button").click(function() {
        var $tx;
        if(this.id == "good_button")
            $tx = $("#bo_v_act_good");
        else
            $tx = $("#bo_v_act_nogood");

        excute_good(this.href, $(this), $tx);
        return false;
    });
    
    $("#frm_comment").submit(function(){
    	if($(".cmt_list").length == 0){
    		$("#refCid").val(0);
    		$("#orderList").val(0);
    	}
    });

    // 이미지 리사이즈
    //$("#bo_v_atc").viewimageresize();
});

function excute_good(href, $el, $tx)
{
    $.post(
        href,
        { js: "on" },
        function(data) {
            if(data.error) {
                alert(data.error);
                return false;
            }

            if(data.count) {
                $el.find(".wr_count").text(number_format(String(data.count)));
				if($tx.attr("id").search("nogood") > -1) {
					alert("이 글을 비추천 하셨습니다.");
					/*
                    $tx.text("이 글을 비추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
					*/
                } else {
					alert("이 글을 추천 하셨습니다.");
					/*
                    $tx.text("이 글을 추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
					*/
                }
            }
        }, "json"
    );
}
</script>

<!-- } 게시글 읽기 끝 -->
<!-- 게시판 목록 시작 { -->
<div id="bbs-list-wrap">

	<div id="bbs-list-top">
		<!-- 게시판 타이틀 -->
		<div class="bbs_title_wrap">
			<a class="bbs_title" href="${pageContext.request.contextPath }/matching/mHistoryList.ma">매칭 후기 게시판</a>
		</div>
	</div>

	<div class="bbs-list">
		<ul id="bbs-list-ul">
							<li class="bbs_list_top">
								<span class="subject" > 
									<span class="subject_text"> 
										<span class="glyphicon"></span>매칭 후기 제목</span>
								</span> 
								<span class="dec">
									<span class="w45 wr_name" style="width:100px;"> 
										<span class="glyphicon"></span> 매칭인
									</span> 
									<span class="w45 wr_name" style="width:80px;"> 
										<span class="glyphicon"></span>인원수
									</span> 
									<span class="w45 wr_date" style="width:100px;"> 
										<span class="glyphicon"></span> 카테고리
										</span> 
									
									<span class="w45 wr_hit" style="width:230px;"> 
										<span class="glyphicon"></span> 지역
									</span> 
								</span>
							</li>
							<form id="chatting" method="post">
							<c:forEach items="${list}" var="m">
							<li class="bbs_list_basic">
								<span class="subject text" align="center">
									<a data-mytext="getNo" id="${m.MHISTORYID}">
										<b>${m.MTITLE }</b>
									</a>  
									<span class="w45 icon"> </span>
								</span> 
								<span class="dec"> 
								<span class="w45 wr_name" style="width:100px;"> 
										<span class="glyphicon"></span> ${m.MWRITER }
									</span> 
									<span class="w45 wr_name" style="width:80px;"> 
										<span class="glyphicon glyphicon-user"></span> ${m.MPEOPLENUM }
											
		         					</span> 
									<span class="w45 wr_date" style="width:100px;"> 
										<span class="glyphicon glyphicon-time"></span> 
											${m.MIDCATEGORY }
									</span> 
									<span class="w45 wr_hit" style="width:230px;"> 
										<span class="glyphicon glyphicon-eye-open"></span> 
											${m.BIGLOCATION } ${m.MIDLOCATION} ${m.SMALLCATEGORY }
									</span> 
								
								</span>
							
							</li>
							</c:forEach>
							</form>
						</ul>
	</div>

	
	<div class="bbs_action_box">
		<!-- 게시판 검색 시작 { -->
		<!-- <fieldset id="bbs_sch">
			<div class="bo_sch">

				<select name="sfl" id="sfl" class="form-control">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">글쓴이</option>					
				</select>
			
				<input type="text" name="stx" class="form-control value=" required id="stx" size="15" maxlength="15">

				<button type="button" id="searchsubmit" onclick="search();">
					<span class="glyphicon glyphicon-search"></span>
				</button>

			</div>

		</fieldset> -->
		<!-- } 게시판 검색 끝 -->

	</div>


	<div class="pager">
					<c:out value="${pageBar}" escapeXml="false"/>
				
				</div>

</div>


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
	</div><!-- .container -->
</div><!-- .wrapper -->
<c:import url="../common/footer.jsp" />

</body>
</html>