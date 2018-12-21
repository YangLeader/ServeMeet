<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>
<c:import url="../common/header.jsp" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-2755471938797797",
          enable_page_level_ads: true
     });
</script>
-->

<title>자유 게시판</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap_custom.css">
<!--[if lte IE 8]>
<script src="http://aq23r1gt.iwinv.net/js/html5.js"></script>
<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--
<script src="http://aq23r1gt.iwinv.net/js/jquery-1.8.3.min.js"></script>
-->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/wrest.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>


</head>
<body>

	<!-- preloader (화면 전환 효과) -->

	<div class="preloader"></div>

	<script>
		$(document).ready(function() {
			// 화면 전환 효과
			$('.preloader').fadeOut(150);

			$('.navbar-brand').width($('.navbar-brand > img').width());
			$(window).resize(function() {
				$('.navbar-brand').width($('.navbar-brand > img').width());
			});
		});
	</script>


	<div id="wrapper">
		<div class="container">

			<!-- 게시판 목록 시작 { -->
			<div id="bbs-list-wrap">

				<div id="bbs-list-top">
					<!-- 게시판 타이틀 -->
					<div class="bbs_title_wrap">
						<a class="bbs_title" href="./board.php?bo_table=funny">자유 게시판</a>
					</div>

					<div class="button_box">
						<a href="${pageContext.request.contextPath }/board/boardForm.bo" class="bbs_btn btn_write">
							<span class="glyphicon glyphicon-pencil"></span> 글쓰기
						</a>
					</div>


				</div>

				<!-- <form name="fboardlist" id="fboardlist" action="./board_list_update.php"
					onsubmit="return fboardlist_submit(this);" method="post">
					<input type="hidden" name="bo_table" value="funny"> 
					<input type="hidden" name="sfl" value=""> 
					<input type="hidden" name="stx" value=""> 
					<input type="hidden" name="spt" value=""> 
					<input type="hidden" name="sca" value="">
					<input type="hidden" name="page" value="7"> 
					<input type="hidden" name="sw" value=""> -->

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
										<span class="glyphicon glyphicon-user"></span> 
											글쓴이
									</span> 
									<span class="w45 wr_date"> 
										<span class="glyphicon glyphicon-time"></span> 
											날짜
										</span> 
									<span class="w45 wr_hit"> 
										<span class="glyphicon glyphicon-eye-open"></span> 
											조회
									</span> 
									<span class="w45 wr_good gdtxt"> 
										<span class="glyphicon glyphicon-thumbs-up"></span> 
											추천
									</span>
								</span>
							</li>
							<li class="bbs_list_basic">
								<span class="subject">
									<a class="subject_text" ><b>제목</b></a> 
									<span class="w45 icon"> </span>
								</span> 
								<span class="dec"> 
									<span class="w45 wr_name"> 
										<span class="glyphicon glyphicon-user"></span> 
										<span class="sv_member">작성자</span>
									</span> 
									<span class="w45 wr_date"> 
										<span class="glyphicon glyphicon-time"></span> 
											작성일자 
									</span> 
									<span class="w45 wr_hit"> 
										<span class="glyphicon glyphicon-eye-open"></span> 
											조회수
									</span> 
									<span class="w45 wr_good gdtxt"> 
										<span class="glyphicon glyphicon-thumbs-up"></span> 
									 		추천수
									</span> 
								</span>
							</li>
						</ul>
					</div>

				<div class="bbs_action_box">
					<!-- 게시판 검색 시작 { -->
					<fieldset id="bbs_sch">
						<form id="sch_frm" name="fsearch" method="get">
							<input type="hidden" name="bo_table" value="funny"> 
							<input type="hidden" name="sca" value=""> 
							<input type="hidden" name="sop" value="and">
								
								<div class="bo_sch">

									<select name="sfl" id="sfl" class="form-control">
										<option value="wr_subject">제목</option>
										<option value="wr_content">내용</option>
										<option value="wr_subject||wr_content">제목+내용</option>
										<option value="mb_id,1">회원아이디</option>
										<option value="mb_id,0">회원아이디(코)</option>
										<option value="wr_name,1">글쓴이</option>
										<option value="wr_name,0">글쓴이(코)</option>
									</select> 
									<input type="text" name="stx" class="form-control value="
									 required id="stx" size="15" maxlength="15">

									<button type="submit" id="searchsubmit">
										<span class="glyphicon glyphicon-search"></span>
									</button>

								</div>
						</form>
					</fieldset>
					<!-- } 게시판 검색 끝 -->

					<div class="button_box" style="float: unset;">
						<a href="${pageContext.request.contextPath }/board/boardForm.bo" class="bbs_btn btn_write">
							<span class="glyphicon glyphicon-pencil"></span> 글쓰기
						</a>
					</div>

				</div>



				<div class="pager">
					<nav class="pg_wrap">
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
					</nav>
					<div class="pg_wrap_m">
						<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page pg_start"></a> 
						<a href="./board.php?bo_table=funny&amp;page=6" class="pg_page pg_prev_m">이전페이지</a> 
							<span class="pg_info_m">7 / 8</span>
						<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_next_m">다음페이지</a> 
						<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_end"></a>
					</div>
				</div>

			</div>


			<script>
				function put_tags(a) {
					$("#stx").val(a).focus();
					$("#sfl").val("wr_1");
				}

				$(function() {
					var stx = $('#stx');
					stx.focus(function() {
						$("#sfl").removeClass("dno");
					});

					bbs_list_width_fixed();

					setTimeout(function() {
						bbs_list_width_fixed();
					}, 100);

					$(window).resize(function() {
						bbs_list_width_fixed();
					});

					// 분류 변경시 페이지 이동
					$('.bbs_cate_select').change(function() {
						if ($(this).val() != "") {
							location.href = $(this).val();
						}
					});
				});

				// 리스트 제목 부분 width 자동조절
				function bbs_list_width_fixed() {
					$('#bbs-list-ul .subject_text').css(
							'max-width',
							$('#bbs-list-ul li').innerWidth()
									- $('#bbs-list-ul li .dec').innerWidth()
									- 170);

					if (($(window).innerWidth() + 17) > 767) {
						$('.bbs_list_basic .subject').width(
								$('#bbs-list-ul li').width()
										- $('#bbs-list-ul .dec').width() - 20);
					} else {
						$('.bbs_list_basic .subject').css('width', '100%');
					}

					$('.bbs_list_top .subject')
							.css(
									'width',
									($('#bbs-list-ul li').innerWidth() - $(
											'.bbs_list_top .dec').innerWidth()) / 2 + 20);
				}

				// 모바일 게시판 리스트에서 제목 부분 (넓은 영역) 터치시 글 읽기 활성화
				function view_link_type_m(get_url) {
					if (window.innerWidth < 768) {
						location.href = get_url;
					}
				}
			</script>
			<!-- } 게시판 목록 끝 -->
			<!--</div>-->
			<!-- .rightBox -->
			<!--</div>-->
			<!-- .row -->
		</div>
		<!-- .container -->
	</div>
	<!-- .wrapper -->



	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

<c:import url="../common/footer.jsp" />

</body>
</html>