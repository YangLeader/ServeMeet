<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>

	
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">



<!-- Style Custom CSS -->
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
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="Restaurant responsive website templates free download for personal and commerical. Download Free Website Template for your great projects.">
<meta name="keywords"
	content="restaurant responsive website templates free download,online restaurant website templates,bootstrap restaurant templates free download,restaurant website templates free download html with css, catering website templates free download">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<style type="text/css">

.chatBox{
float: right;
}
</style>
</head>
<div class = "hd">
	
	<div class="mid-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							alt=""></a>
						<div id = "search" style="position: relative;">
							<input type="text"  name="search" id = "searchTxt"/><span id = "a"><button class="searchBtn"><img class="searchImg" src="${pageContext.request.contextPath}/resources/images/search.png"></button></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<div class="header">
		<div class="container">
				
					<div class="col-lg-12">
					<!-- navigation -->
						<div class="navigation">
							<div id="navigation">						
								<ul>
									<li class="active"><a href="${pageContext.request.contextPath}/" title="Home"><span class="mainNav">Home</span></a></li>
									<li class="has-sub"><a title="매칭"><span  class="mainNav">매칭</a>
										<ul>
	                                        <li><a href="${pageContext.request.contextPath }/matching/matchingInsertView.ma" title="소개팅">소개팅</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingHistory.ba" title="소모임">소모임</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingHistory.ba" title="스포츠">스포츠</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingHistory.ba" title="E-스포츠">E-스포츠</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/matching/matchingHistoryForm.ma" title="매칭후기">매칭후기</a></li>
		                                </ul>
									</li>


									<li><a
										href="${pageContext.request.contextPath }/chat/memberList.do"
										title="Blog"><span class="mainNav">채팅</a></li>
									<li><a
										href="${pageContext.request.contextPath }/board/boardList.do"
										title="Contact Us"><span class="mainNav">게시판</a>
									</li>
		  							<li><a href="${pageContext.request.contextPath}/point/point.do"><span class="mainNav">포인트<span></a> </li>
		  							
	                                <li class="has-sub"><a href="${pageContext.request.contextPath }/batting/battingList.ba" title="batting"><span class="mainNav">배팅<span></a>
		                                <ul>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingList.ba" title="battingList">진행중인 배팅</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingHistory.ba" title="battingHistory">종료된 배팅</a></li>
		                                </ul>
	                                </li>
		                         
		                         	<c:if test="${empty member}">
										<li class="suvNav"><a class="btn-link" type="button"
											onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'"><span class="mainNav">Join
												us</span></a></li>
										<li class="suvNav"><a class="btn-link" type="button"
											onclick="location.href='${pageContext.request.contextPath}/member/memberLoginView.do'"><span class="mainNav">Sign
												in</span></a></li>
									</c:if>
									<c:if test="${!empty member}">
										<li id="chat" class= "suvNav"><span class="carea mainNav">채팅목록</span>
										<div>
											<div style="background-image: url('${pageContext.request.contextPath}/resources/images/chatTop.png');height: 10px;width: 20px;"></div>
										</div>
										<form id="chatGo" method="post">
											<div class="chatList carea scrollbar scrollbar-primary">
											</div>
										</form>
										</li>
										
										<li class="suvNav has-sub"><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}"
												title="내정보보기"><span class="mainNav">${member.userName}</span></a>
											<ul>
												<li><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}"
												title="내정보보기">내정보보기</a></li>
												<li><a href="${pageContext.request.contextPath}/matching/myMatchingList.ma?userName=${member.userName}+&type=P" title="등록중인 매칭">등록중인 매칭</a></li>
												<li><a href="${pageContext.request.contextPath}/matching/myMatchingList.ma?userName=${member.userName}+&type=E" title="종료된 매칭">종료된 매칭</a>
												<li ><a href ="${pageContext.request.contextPath}/member/memberLogout.do">LOG
													OUT</a></li>
											</ul>		
										</li>
										
									</c:if>
		                         
		                         </ul>
	                           
	                        </div>
                   		</div>
                	</div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(function() {
		$("#chat").click(function() {
				var display = $('.chatList').css("display");
				console.log(display);
			$('.chatList').show();
			
				if(display=='none'){
					$.ajax({
						url : "${pageContext.request.contextPath}/chat/chatListMin.do/",
						dataType : "json",
						success : function(data) {
							console.log(data);
							 $('.chatList').children().remove();
							  for(var i in data){	
								 
								  
								  $('.chatList').append(							 
									$('<div>').text(data[i].chattingName)
											  .attr("class","chatBox carea")
											  .attr("onclick","chatting("+data[i].chattingId+");")
											  .css({
												  "width" : "100%",
												  "height": "80px",
												  "border-bottom": "1px #64646429 solid"
											  }).append(
														$('<div>').text(data[i].chContent)
																  .attr("class","carea")
																  .css({
																	  "padding":"15px 10px"
																  })
												
											   )
								  
								  );
							  }
						
						},
						error : function(data){
							 console.log(data);
						}
	
					});
				}
		});
		
		$('html').click(function(e) {
			if(!$(e.target).hasClass("carea")) { 
				console.log(e.target);
				$(".chatList").hide();
				}
			
			
		})
	});
	
	function chatting(chatId) {
		
		var url = "${pageContext.request.contextPath }/chat/chatting.do/"+ chatId;
		console.log(url);
		
		$("#chatGo").attr("action",url).submit();

	}
</script>

