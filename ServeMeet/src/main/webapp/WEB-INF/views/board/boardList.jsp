<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
<link rel="stylesheet" href="http://aq23r1gt.iwinv.net/css/bootstrap.css">
<link rel="stylesheet" href="http://aq23r1gt.iwinv.net/skin/board/_basic/style.css?ver=161020">
<link rel="stylesheet" href="http://aq23r1gt.iwinv.net/css/font-awesome.min.css">
<link rel="stylesheet" href="http://aq23r1gt.iwinv.net/css/bootstrap_custom.css">
<!--[if lte IE 8]>
<script src="http://aq23r1gt.iwinv.net/js/html5.js"></script>
<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://aq23r1gt.iwinv.net";
var g5_bbs_url   = "http://aq23r1gt.iwinv.net/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "funny";
var g5_sca       = "";
var g5_editor    = "smarteditor2";
var g5_cookie_domain = "";
</script>
<!--
<script src="http://aq23r1gt.iwinv.net/js/jquery-1.8.3.min.js"></script>
-->
<script src="http://aq23r1gt.iwinv.net/js/jquery-1.11.1.min.js"></script>
<script src="http://aq23r1gt.iwinv.net/js/jquery.menu.js?ver=161020"></script>
<script src="http://aq23r1gt.iwinv.net/js/common.js?ver=161020"></script>
<script src="http://aq23r1gt.iwinv.net/js/wrest.js?ver=161020"></script>
<script src="http://aq23r1gt.iwinv.net/js/bootstrap.min.js"></script>
<script src="http://aq23r1gt.iwinv.net/js/isotope.pkgd.min.js"></script>
<script src="http://aq23r1gt.iwinv.net/js/imagesloaded.pkgd.min.js"></script>
<script src="http://aq23r1gt.iwinv.net/js/custom.js"></script>

<c:import url="../common/header.jsp"/>
</head>
<body>



<!-- preloader (화면 전환 효과) -->

<div class="preloader"></div>

<script>
$(document).ready(function(){
	// 화면 전환 효과
	$('.preloader').fadeOut(500);
	
	$('.navbar-brand').width($('.navbar-brand > img').width());
	$(window).resize(function(){
		$('.navbar-brand').width($('.navbar-brand > img').width());
	});
});
</script>


<div id="wrapper">
	<div class="container">
		
		<!--
		<div class="row">	
			
			<div class="leftBox col-md-3">
				로그인 박스
			</div>
			

			<div class="rightBox col-md-9">
			-->
<!-- 게시판 목록 시작 { -->
<div id="bbs-list-wrap">

	<div id="bbs-list-top">
		<!-- 게시판 타이틀 -->
		<div class="bbs_title_wrap">
			<a class="bbs_title" href="./board.php?bo_table=funny">유머게시판</a>
		</div>

		<!-- 게시판 카테고리 시작 { -->
				
		
		<select class="bbs_cate_select form-control">
			<!--
			<a class="bbs_category  on" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny">
				<span class="glyphicon glyphicon-ok"></span> 전체
			</a>
			-->
			<option value="">분류 선택 &nbsp;</option>
						<!--
			<a class="bbs_category " href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=유머">
				<span class="glyphicon glyphicon-ok"></span> 유머			</a>
			-->
			<option value="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=유머" >[유머]</option>
						<!--
			<a class="bbs_category " href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=엽기">
				<span class="glyphicon glyphicon-ok"></span> 엽기			</a>
			-->
			<option value="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=엽기" >[엽기]</option>
						<!--
			<a class="bbs_category " href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=감동">
				<span class="glyphicon glyphicon-ok"></span> 감동			</a>
			-->
			<option value="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&sca=감동" >[감동]</option>
					</select>
		<!-- } 게시판 카테고리 끝 -->
		
		<div class="button_box">
								</div>
	</div>

	<form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
	<input type="hidden" name="bo_table" value="funny">
	<input type="hidden" name="sfl" value="">
	<input type="hidden" name="stx" value="">
	<input type="hidden" name="spt" value="">
	<input type="hidden" name="sca" value="">
	<input type="hidden" name="page" value="7">
	<input type="hidden" name="sw" value="">

	<div class="bbs-list">
		<ul id="bbs-list-ul">
			<li class="bbs_list_top">
				<span class="subject">
										<span class="subject_text">
						<span class="glyphicon glyphicon-tag"></span> 제목
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
										<span class="w45 wr_good gdtxt">
						<span class="glyphicon glyphicon-thumbs-up"></span> 추천
					</span>
									</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=65&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=65&amp;page=7">
						<b>코끼리 근황</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">감성흔녀</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 05-06					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 79					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=64&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=64&amp;page=7">
						<b>초이스..1번?2번?</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">강나묘</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 05-04					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 71					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=63&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=63&amp;page=7">
						<b>바늘에 실 꿰기.gif</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">강나묘</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 05-03					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 74					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=62&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=62&amp;page=7">
						<b>언제까지 어깨춤을 추게 할거야.gif</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">감성흔녀</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 05-02					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 90					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=27&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=27&amp;page=7">
						<b>유머게시판 테스트 테스트 유머게시판 테스트 테스트 유머게시판 테스트 테스트</b>					</a>

										<span class="cn">
						(3)
						<!--
						<span class="glyphicon glyphicon-comment"></span>3						-->
					</span>
					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_hot.gif" alt="인기글"><img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_file.gif" alt="첨부파일"><img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_img.gif" alt="첨부 이미지"><img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-10					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 153					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 3					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_file.gif" alt="첨부파일"><img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=26&amp;page=7');">
					
					
					
										<span class="category_text">[엽기]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=26&amp;page=7">
						<b>유머게시판 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_hot.gif" alt="인기글"><img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_img.gif" alt="첨부 이미지">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-10					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 105					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=25&amp;page=7');">
					
					
					
										<span class="category_text">[감동]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=25&amp;page=7">
						<b>유머게시판 테스트 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-10					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 79					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=24&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=24&amp;page=7">
						<b>유머게시판 테스트</b>					</a>

										<span class="cn">
						(8)
						<!--
						<span class="glyphicon glyphicon-comment"></span>8						-->
					</span>
					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_file.gif" alt="첨부파일">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-10					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 92					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 8					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_file.gif" alt="첨부파일">					</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=23&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=23&amp;page=7">
						<b>유머게시판 테스트 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 86					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=22&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=22&amp;page=7">
						<b>유머게시판 테스트</b>					</a>

										<span class="cn">
						(2)
						<!--
						<span class="glyphicon glyphicon-comment"></span>2						-->
					</span>
					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 79					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 2					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=21&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=21&amp;page=7">
						<b>유머게시판 테스트 테스트 유머게시판 테스트 테스트 유머게시판 테스트 테스트 유머게시판 테스트 테스트 유머게시…</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-08					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 80					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=20&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=20&amp;page=7">
						<b>유머게시판 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-08					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 79					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=19&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=19&amp;page=7">
						<b>유머게시판 테스트 테스트</b>					</a>

										<span class="cn">
						(1)
						<!--
						<span class="glyphicon glyphicon-comment"></span>1						-->
					</span>
					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-07					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 79					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 1					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=18&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=18&amp;page=7">
						<b>유머게시판 테스트</b>					</a>

										<span class="cn">
						(13)
						<!--
						<span class="glyphicon glyphicon-comment"></span>13						-->
					</span>
					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-07					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 86					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 13					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=17&amp;page=7');">
					
					
					
										<span class="category_text">[유머]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=funny&amp;wr_id=17&amp;page=7">
						<b>유머게시판 테스트 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-07					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 80					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
					</ul>
	</div>

	
	</form>
	
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
					<input type="text" name="stx" class="form-control value="" required id="stx" size="15" maxlength="15">

					<button type="submit" id="searchsubmit">
						<span class="glyphicon glyphicon-search"></span>
					</button>

				</div>
			</form>
		</fieldset>
		<!-- } 게시판 검색 끝 -->

	</div>

	<div class="button_box" style="float:unset;">
		
		
			</div>

	<div class="pager">
		<!-- <nav class="pg_wrap"><span class="pg"><a href="./board.php?bo_table=funny&amp;page=1" class="pg_page pg_start"></a>
<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page">1<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=5" class="pg_page">5<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=6" class="pg_page">6<span class="sound_only">페이지</span></a>
<span class="sound_only">열린</span><strong class="pg_current">7</strong><span class="sound_only">페이지</span>
<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page">8<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_end"></a>
</span></nav> -->
		<div class="pg_wrap_m"><a href="./board.php?bo_table=funny&amp;page=1" class="pg_page pg_start"></a>
<a href="./board.php?bo_table=funny&amp;page=6" class="pg_page pg_prev_m">이전페이지</a>
<span class="pg_info_m">7 / 8</span><a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_next_m">다음페이지</span></a>
<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_end"></a>
</div>	</div>

</div>


<script>

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

</body>
</html>

<!-- 사용스킨 : _basic -->
