<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>
<c:import url="../common/header.jsp" />
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />


<title>내가 한 배팅들</title>

</head>
<body>

	<script>	
		$(function(){
			$('[data-mytext=getNo]').on("click",function(){
				var battingId = $(this).attr("id");
				console.log("battingId="+battingId);
				location.href = "${pageContext.request.contextPath}/batting/battingInfo.ba?no="+battingId;
			});
		});
	</script>

	<div id="wrapper">
	
		<div class="container" style="background-color:white; border-radius: 20px;">
		<br />
			<!-- 게시판 목록 시작 { -->
			<div id="bbs-list-wrap">

				<div id="bbs-list-top">
					<!-- 게시판 타이틀 -->
					<div class="bbs_title_wrap">
						<a class="bbs_title" href="${pageContext.request.contextPath }/batting/myBattingList.ba?userName=${member.userName}">배팅 히스토리</a>
						<c:if test="${!empty totalContents }">
							<p>총 ${totalContents }개의 배팅기록이 있습니다.</p>
						</c:if>
					</div>



				</div>

					<div class="bbs-list">
						<ul id="bbs-list-ul">
							<li class="bbs_list_top">
								<span class="subject" style="padding-right: 13px;"> 
									<span class="subject_text"> 
										<span class="glyphicon"></span>배팅 제목</span>
								</span> 
								<span class="dec">
									<span class="w45 wr_name" style="width:100px;"> 
										<span class="glyphicon"></span>매칭유저
									</span> 
									<span class="w45 wr_name" style="width:80px;"> 
										<span class="glyphicon"></span>배당
									</span> 
									<span class="w45 wr_date" style="width:100px;"> 
										<span class="glyphicon"></span> 승리팀
										</span> 
									
									<span class="w45 wr_hit" style="width:130px;"> 
										<span class="glyphicon"></span> 배팅결과
									</span> 
								</span>
							</li>
							<form id="chatting" method="post">
							<c:forEach items="${list}" var="m">
							<li class="bbs_list_basic">
								<span class="subject text" align="center">
									<a data-mytext="getNo" id="${m.BATTINGID}">
										<b>${m.MTITLE}</b>
									</a>  
									<span class="w45 icon"> </span>
								</span> 
								<span class="dec"> 
								<span class="w45 wr_name" style="width:100px;"> 
										<span class="glyphicon"></span> ${m.MWRITER }
									</span> 
									
									<c:set var = "pNumA">${m.BATTINGPNUMA}</c:set>
									<c:set var = "pNumB">${m.BATTINGPNUMB}</c:set>
									<span class="w45 wr_name" style="width:80px;"> 
										<span class="glyphicon glyphicon-user"></span>
										<c:if test='${m.BATTINGSELECT eq "A"}'><fmt:formatNumber value="${(100-pNumA/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배</c:if>
										<c:if test='${m.BATTINGSELECT eq "B"}'><fmt:formatNumber value="${(100-pNumB/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배</c:if>
		         					</span> 
									<span class="w45 wr_date" style="width:100px;"> 
										<span class="glyphicon glyphicon-time"></span> 
											<c:choose>
												<c:when test='${m.WIN eq "N"}'>진행중</c:when>
												<c:otherwise>${m.WIN}</c:otherwise>
											</c:choose>
									</span> 
									<span class="w45 wr_hit" style="width:130px;"> 
										<span class="glyphicon glyphicon-eye-open"></span> 
											<c:choose>
												<c:when test='${m.WIN eq "N"}'>진행중</c:when>
												<c:when test="${m.WIN eq m.BATTINGSELECT}">승리</c:when>
												<c:otherwise>패배</c:otherwise>
											</c:choose>
									</span> 
								
								</span>
							
							</li>
							</c:forEach>
							</form>
						</ul>
					</div>




				<div class="pager">
					<c:out value="${pageBar}" escapeXml="false"/>
				</div>

			</div>


			<script>
			
			$('.drop').click(function(){
									
					/* $(this).children('#downlist').css('display', 'block'); */
					$(this).siblings('#downlist').toggle('fast');
					
				$('html').click(function(e) {
					
					if(!$(e.target).hasClass("drop")) { 
							
						$('.drop').siblings('#downlist').hide('fast');
					}
												
				})
														
			});
			
			function search(){
				
				if($('#stx').val() !== ''){
					location.href="searchBoard.do?con="+$('#sfl').val()+"&keyword="+$('#stx').val();
				} else {
					alert('내용입력');
				}
				
				
			}
			
			function chatting(userName){
				
				$('#chatting').attr('action', "/ServeMeet/chat/chattingRoom.do/"+userName);
				
				$('#chatting').submit();
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
			<!-- } 게시판 목록 끝 -->
		</div>
		<!-- .container -->
	</div>
	<!-- .wrapper -->


<c:import url="../common/footer.jsp"/>

</body>
</html>