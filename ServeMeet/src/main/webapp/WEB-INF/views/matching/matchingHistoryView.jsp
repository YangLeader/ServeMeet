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

<title>매칭 후기</title>

</head>
<body>

<script>
		
	$(function(){
		$("span.subject.text").on("click",function(){
			var mHistoryId = $(this).children().attr("id");
			console.log("mHistoryId="+mHistoryId);
			location.href = "${pageContext.request.contextPath}/matching/mHistorySelectOne.ma?no="+mHistoryId;
		});
	});
</script>

<div id="wrapper">
	<div class="container">

<!-- 게시물 읽기 시작 { -->
<article id="bbs-view" style="width:auto;">

	<div class="bbs_title_wrap" style="">
		<a class="bbs_title" href="${pageContext.request.contextPath }/matching/myMatchingList.ma">매칭 후기</a>
	</div>
	
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bbs-view-top-btn" class="bbs_view_btn_wrap">
		<div class="button_box">
		   
			<a href="${pageContext.request.contextPath }/matcinh/myMatchingList.do" class="bbs_btn btn_list">
				<span class="glyphicon glyphicon-list-alt"></span> 목록
			</a>
			
			<c:if test="${board.userName eq member.userName}">
			<div class="button_box_right">
								<a href="${pageContext.request.contextPath }/board/boardUpdateView.do?no=${board.boardNo }" class="bbs_btn">
					<span class="glyphicon glyphicon-edit" ></span> 수정
				</a>
				
								<a href="${pageContext.request.contextPath}/board/boardDelete.do?no=${board.boardNo}" class="bbs_btn">
					<span class="glyphicon glyphicon-trash"></span> 삭제
				</a>
			
			</div>
			</c:if>
		</div>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<div id="bbs-view-subject">
		<header>
			<h2 id="bbs-view-title">
								${board.boardTitle }		</h2>
		</header>

		<section id="bbs-view-info">
			<span class="write_user"><span class="sv_guest">${board.userName }</span></span>
			<span></span>
			<span>
				<span class="glyphicon glyphicon-time"></span> ${board.boardDate }		</span>
			
			<span>
				<span class="glyphicon glyphicon-eye-open"></span> ${board.boardCount }			</span>
		</section>
	</div>

    <!-- 첨부파일 시작 { -->
    <c:forEach items="${boardFileList}" var="bf">
    <div id="bo_v_file">
        <span>
			<a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" class="bo_v_ect" download>
				<span class="glyphicon glyphicon-save"></span>&nbsp;
				${bf.originName }
			</a>
		</span>
    </div>
    </c:forEach>
    <!-- } 첨부파일 끝 -->
    
    
    <section id="bo_v_atc">
        <div id="bo_v_img">
</div>
		
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        	<c:forEach items="${boardFileList}" var="bf">
        	<p>
        		<a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" onclick="window.open(this.href,'_blank','width=700,height=700');return false;">
        		<%-- <a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" target="_blank" class="view_image"> --%>
        			<img src="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" alt="${bf.originName }" style="width: 70%;"/>
        			<br />
        		</a>
        		<br style="clear:both;" />
        	</p>
        	</c:forEach>
        	<p><br /></p>
        	<pre><p>${board.boardContent }</p></pre>
        	<p><br /></p>
        </div>
                <!-- } 본문 내용 끝 -->

        		
		
		<!-- 스크랩 추천 비추천 시작 { -->
				<div id="bo_v_act">
					<a href="./good.php?bo_table=free&amp;wr_id=111&amp;good=good&amp;" id="good_button" class="btn_bg btn">
						<span class="glyphicon glyphicon-thumbs-up"></span> 추천 지금은 안됨ㅋ
						<span id="bo_v_act_good" class="wr_count wr_good_cnt">0</span>
					</a>
					
					<a href="./scrap_popin.php?bo_table=free&amp;wr_id=111" target="_blank"  class="btn_bg" onclick="win_scrap(this.href); return false;" title="신고">
					<span class="glyphicon glyphicon-bell"></span> 신고 지금은 안됨ㅋ
					</a>
			
		</div>
				<!-- } 스크랩 추천 비추천 끝 -->
		
    </section>

	
    
    
<script>
// 글자수 제한
var char_min = parseInt(0); // 최소
var char_max = parseInt(0); // 최대
</script>

<script>
var save_before = '';
var save_html = document.getElementById('bo_vc_w').innerHTML;

function good_and_write()
{
    var f = document.fviewcomment;
    if (fviewcomment_submit(f)) {
        f.is_good.value = 1;
        f.submit();
    } else {
        f.is_good.value = 0;
    }
}

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
			<a class="bbs_title" href="${pageContext.request.contextPath }/board/boardList.do">자유게시판</a>
		</div>
	</div>

	<div class="bbs-list">
		<ul id="bbs-list-ul">
			<li class="bbs_list_top">
				<span class="subject"> 
					<span class="subject_text"> 
						<span class="glyphicon glyphicon-tag"></span> 
											제목
					</span>
				</span> 
				<span class="dec">
					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> 글쓴이
					</span>
					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 날짜
					</span>
					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 조회
					</span>
				</span>
			</li>
			<c:forEach items="${list}" var="b">
			<li class="bbs_list_basic">
				<span class="subject text">
					<a id="${b.boardNo }"><b>${b.boardTitle }</b></a> 
						<span class="w45 icon"> </span>
				</span> 
				<span class="dec"> 
					<span class="w45 wr_name"> 
						<span class="glyphicon glyphicon-user"></span> 
								${b.userName }
					</span> 
					<span class="w45 wr_date" style="width:6.5em"> 
						<span class="glyphicon glyphicon-time"></span> 
								${b.boardDate }
					</span> 
					<span class="w45 wr_hit"> 
						<span class="glyphicon glyphicon-eye-open"></span> 
								${b.boardCount }
					</span> 
									<!-- <span class="w45 wr_good gdtxt"> 
										<span class="glyphicon glyphicon-thumbs-up"></span> 
									 		추천수
									</span> -->
				</span>
							
			</li>
			</c:forEach>
		</ul>
	</div>

	
	<div class="bbs_action_box">
		<!-- 게시판 검색 시작 { -->
		<fieldset id="bbs_sch">
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

		</fieldset>
		<!-- } 게시판 검색 끝 -->

	</div>

	<div class="button_box" style="float:unset;">
		
				<a href="${pageContext.request.contextPath }/board/boardList.do" class="bbs_btn btn_write" style="float:left; margin-left:0;">
			<span class="glyphicon glyphicon-list-alt"></span> 목록
		</a>
		
				<a href="${pageContext.request.contextPath}/board/boardForm.do" class="bbs_btn btn_write">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</a>
			</div>

	<div class="pager">
					<c:out value="${pageBar}" escapeXml="false"/>
					<!-- <nav class="pg_wrap">
						<span class="pg">
							<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page pg_start"></a> 
							<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page">1<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=5" class="pg_page">5<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=6" class="pg_page">6<span class="sound_only">페이지</span></a> 
								<span class="sound_only">열린</span><strong class="pg_current">7</strong>
								<span class="sound_only">페이지</span>
							<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page">8<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_end"></a> 
						</span>
					</nav> -->
				</div>

</div>


<script>

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
<!-- } 게시판 목록 끝 -->			<!--</div>--><!-- .rightBox -->
		<!--</div>--><!-- .row -->
	</div><!-- .container -->
</div><!-- .wrapper -->
<c:import url="../common/footer.jsp" />

</body>
</html>