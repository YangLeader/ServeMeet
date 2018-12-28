<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
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
<!-- Font CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
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
				<div class="col-lg-10 col-md-5 col-sm-5 col-xs-5">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							alt=""></a>
							<div id = "search">
								<input type="text"  name="search"/>
								
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="container">
				
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- navigation -->
						<div class="navigation">
							<div id="navigation">						
								<ul>
									<li class="active"><a href="${pageContext.request.contextPath}/" title="Home"><span class="mainNav">Home</span></a></li>
									<li><a href="${pageContext.request.contextPath }/location/location.do" title="Menu"><span  class="mainNav">매칭</a></li>
									<!-- <li class="has-sub"><a href="service-list.html" title="Service List">Service List</a>
		
		                                    <ul>
		                                        <li><a href="service-list.html" title="Service List">Service List</a></li>
		                                        <li><a href="service-detail.html" title="Service Detail">Service Detail</a></li>
		                                    </ul>
		                                </li> -->
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
										<li id="chat" class= "carea suvNav"><span class="mainNav">채팅목록</span></li>
										
										<li class="suvNav has-sub"><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}"
												title="내정보보기"><span class="mainNav">${member.userName}</span></a>
											<ul>
												<li><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}"
												title="내정보보기">내정보보기</a></li>
												<li ><a href ="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">LOG
													OUT</a></li>
											</ul>		
										</li>
				
										
										<div class="chatList carea" 
											style="display:none; overflow-y: scroll; border: 1px #acacac solid; height: 550px; width: 400px; background-color: white; position: absolute; z-index: 9999; margin-top: 25px;" >
										</div>
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

			$('.chatList').toggle();
		
				if(display=='none'){
				$.ajax({
					url : "chat/chatListMin.do/",
					dataType : "json",
					success : function(data) {
						console.log(data);
						  for(var i in data){
							
							  $('.chatList').append(
									 
								$('<div>').text(data[i].chattingName)
										  .attr("class","chatBox carea")
										  .attr("onclick","chatting("+data[i].chattingId+");")
										  .css({
											  "width" : "400px",
											  "height": "100px"
											 
										  })
				  
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
				$(".chatList").hide();
				}
			

			
		})
	});
	
	function chatting(chatId) {
		console.log(chatId);
		
	}
</script>

</html>