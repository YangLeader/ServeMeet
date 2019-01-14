<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Fontello CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/fontello.css"
	rel="stylesheet">
<!-- Style Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<!-- category -->
<link href="${pageContext.request.contextPath}/resources/css/category.css"
	rel="stylesheet">
	<!-- scroll -->
<link href="${pageContext.request.contextPath}/resources/css/scroll.css"
	rel="stylesheet">
<!-- Font CSS -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
	<!-- board style -->
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">
<title>포인트 내역</title>

<style>
	#pContent {
		cursor : default;
		
	}
	
	#pContent:hover {
		color : gray;
	}
	
	.subject { 
		width : 60%; 
	}
	
	.dec {
		width : 40%;
	}
	
	.header {
			    border-bottom: 0px;
		}
		
	.footer {
			background-color : white;
		}
	.content {
		padding-left : 10px;
	}
</style>
</head>
<body>


	<div id="wrapper">
	
		<div class="container" style="background-color:white; border-radius: 20px;">
		
			<!-- 게시판 목록 시작 { -->
			<div id="bbs-list-wrap">

					
					<div class="bbs-list">
						<ul id="bbs-list-ul">
							<li class="bbs_list_top">
								<span class="subject" > 
									<span class="subject_text"> 
										<span class="glyphicon glyphicon-tag"></span> 
											내용
									</span>
								</span> 
								<span class="dec" align="center"> 
									<span class="w45 wr_date" style="width:30%"> 
										<span class="glyphicon glyphicon-time"></span> 
											날짜
										</span> 
									<span class="w45 wr_hit" style="width:30%"> 
										<span class="glyphicon glyphicon-plus-sign"></span> 
											획득
									</span>
									<span class="w45 wr_hit" style="width:30%"> 
										<span class="glyphicon glyphicon-minus-sign"></span> 
											차감
									</span> 
								</span>
							</li>
							<form id="chatting" method="post">
							<c:forEach items="${list}" var="p">
							<li class="bbs_list_basic" align="center">
								<span class="subject text">
									<a data-mytext="getNo" id="pContent" >
										<b>${p.pContent }</b>
									</a>  
									<span class="w45 icon"> </span>
								</span> 
								<span class="dec"> 
									<span class="w45 wr_date" style="width:30%"> 
										<span class="glyphicon glyphicon-time"></span> 
											<c:set var = "time" value = "${p.pDate}" />
											<fmt:formatDate pattern = "yyyy-MM-dd" value = "${time}" />
											
									</span> 
									<span class="w45 wr_hit" id="increasePoint" style="width:30%"> 
										<span class="glyphicon glyphicon-plus-sign"></span>
										<c:set var="point" value="${p.increasePoint}" /> 
										<c:if test ="${point gt 0}">
											${p.increasePoint}
										</c:if>
									</span>
									<span class="w45 wr_hit" id="decreasePoint" style="width:30%"> 
										<span class="glyphicon glyphicon-minus-sign"></span> 
											<c:set var="point" value="${p.increasePoint}" /> 
										<c:if test ="${point lt 0}">
											${p.increasePoint}
										</c:if>
									</span> 
								</span>
							
							</li>
							</c:forEach>
							</form>
						</ul>
					</div>

					<div class="bbs_action_box">
					<!--  게시판 검색 시작 { 
						<fieldset id="bbs_sch">
							<div class="bo_sch">

								<select name="sfl" id="sfl" class="form-control">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writer">글쓴이</option>					
								</select>
								
								<input type="text" name="stx" class="form-control" value="" required id="stx" size="15" maxlength="15" 
										onkeypress="if(event.keyCode==13) {search(); return false;}">

								<button type="button" id="searchsubmit" onclick="search();">
									<span class="glyphicon glyphicon-search"></span>
								</button>

							</div>

						</fieldset>
					} 게시판 검색 끝 -->

				</div>



				<div class="pager">
					<c:out value="${pageBar}" escapeXml="false"/>
				</div>

			</div>


			<script>
			
			
			function search(){
				
				if($('#stx').val() !== ''){
					location.href="searchBoard.do?con="+$('#sfl').val()+"&keyword="+$('#stx').val();
				} else {
					alert('내용입력');
				}
				
				
			}
			
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
			
		</div>
	</div>
	

</body>
</html>