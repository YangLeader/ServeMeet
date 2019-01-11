<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- cal -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>


<!-- flat -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matching.css" type="text/css">

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
<body>
<div class = "hd">
	
	<div class="mid-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							alt=""></a>
						<div id = "search" >
							<input type="text"  name="search" id = "searchTxt"/><span class = "a"><button class="searchBtn"><img class="searchImg" src="${pageContext.request.contextPath}/resources/images/search2.png"></button></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function() {
	$(".searchBtn").hover(function() {
			$(".searchImg").attr("src","${pageContext.request.contextPath}/resources/images/search_hover.png");
		},
		function() {
			$(".searchImg").attr("src","${pageContext.request.contextPath}/resources/images/search2.png");
		}
	)
	$("#chat").hover(function() {
			$(".chatImg").attr("src","${pageContext.request.contextPath}/resources/images/chat_hover.png");
			$("#chat .badge").css({
			    "background-color": "#fff",
			    "color":"#777"
			});
			
		},
		function() {
			$(".chatImg").attr("src","${pageContext.request.contextPath}/resources/images/chat.png");
			$(".badge").css({
			    "background-color": "#777",
			    "color":"#fff"
			})
		}
	)
});
</script>
	
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
	                                       
	                                        <li><a href="${pageContext.request.contextPath }/matching/matchingList.ma?type=M"  title="소모임">소모임</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/matching/matchingList.ma?type=S" title="스포츠">스포츠</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/matching/matchingList.ma?type=E" title="E-스포츠">E-스포츠</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/matching/mHistoryList.ma" title="매칭후기">매칭후기</a></li>
		                                </ul>
									</li>


									<li><a
										href="${pageContext.request.contextPath }/chat/memberList.do"
										title="Blog"><span class="mainNav">채팅</a></li>
									<li><a
										href="${pageContext.request.contextPath }/board/boardList.do"
										title="Contact Us"><span class="mainNav">게시판</a>
									</li>
									
									<li><a
										href="${pageContext.request.contextPath }/admin/admin.do"
										title="Contact Us"><span class="mainNav">관리자페이지</a>
									</li>
									
		  							<li class="has-sub"><a href="${pageContext.request.contextPath }/point/point.do" title="batting"><span class="mainNav">이벤트<span></a>
		                                <ul>
	                                        <li><a href="${pageContext.request.contextPath }/point/attendence.do" title="출석체크">출석체크</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/point/scratch.do" title="스크래치 복권">스크래치 복권</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/point/roulette.do" title="룰렛">룰렛</a></li>
		                                </ul>
	                                </li>
		  							
	                                <li class="has-sub"><a href="${pageContext.request.contextPath }/batting/battingList.ba?type=I" title="배팅"><span class="mainNav">배팅<span></a>
		                                <ul>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingList.ba?type=I" title="진행중인 배팅">진행중인 배팅</a></li>
	                                        <li><a href="${pageContext.request.contextPath }/batting/battingList.ba?type=E" title="종료된 배팅">종료된 배팅</a></li>
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
										
										
										<li class="suvNav has-sub"><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}"
												title="내정보보기"><span class="mainNav">${member.userName}</span></a>
											<ul>
												<li><a href="${pageContext.request.contextPath}/member/memberInfo.do?userNo=${member.userNo}"
												title="내정보보기">내정보보기</a></li>
												<li><a href="${pageContext.request.contextPath}/" title="등록중인 매칭">내가 작성한 게시글</a></li>
												<%-- <li><a href="${pageContext.request.contextPath}/matching/myMatchingList.ma?userName=${member.userName}&type=P" title="등록중인 매칭">매칭 히스토리</a></li> --%>
												<li><a href="${pageContext.request.contextPath}/matching/myMatchingList.ma?userName=${member.userName}&type=P" title="매칭 히스토리">매칭 히스토리</a>
												<li><a href="${pageContext.request.contextPath}/batting/myBattingList.ba?userName=${member.userName}" title="배팅히스토리">배팅 히스토리</a>
												<li ><a href ="${pageContext.request.contextPath}/member/memberLogout.do">LOG
													OUT</a></li>
											</ul>		
										</li>
										<li  class= "suvNav">
											<span class="mainNav carea" id="chat">
												<span class = "a">
													<button class="chatBtn carea">
														<img class="chatImg carea" src="${pageContext.request.contextPath}/resources/images/chat.png">
													</button>
													
												</span>
												
											
											</span>
										
										<form id="chatGo" method="post">
											<div class="chatListBox">
												<div class="topImg" style="background-image: url('${pageContext.request.contextPath}/resources/images/chatTopTry.png');"></div>
												<div class="carea" style="width: 100%; height: 20px; background-color: #5e73de;padding: 5px 10px; ">
													<span style="font-size: 11px;float:left;color: #fff;" class="allchatList">모두보기</span>
													<span style="font-size: 11px;float:right; color: #fff;">채팅방 만들기</span>
												</div>
												<div class="chatList carea scrollbar scrollbar-primary">
													
												</div>
												
											</div>	
										</form>
										</li>
										
									</c:if>
		                         
		                         </ul>
	                           
	                        </div>
                   		</div>
                	</div>

            </div>
        </div>
    </div>
<!-- </div> -->
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script>
	$(function() {
		var member="${member.userId}";
		if(member!=""){
			console.log(member);
			sock=new SockJS("<c:url value='/echo'/>");
			sock.onmessage=onMessage;
			sock.onclose=onClose;
			
			/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
			
			var today=null;
			$(function(){
				chatListMin();
				//chatLog();
				$(".chatSendBtn").on("click",function(){
					console.log("send message.....");
					/* 채팅창에 작성한 메세지 전송 */			
						sendMessage();	
					/* 전송 후 작성창 초기화 */
					$("#chatTxt").val('');
				});
				$("#chatTxt").keydown(function(key) {
					if(key.keyCode==13){
						sendMessage();	
						$("#chatTxt").val('');
					}
				})
				$("#exitBtn").click(function(){
					console.log("exit message.....");
					/* 채팅창에 작성한 메세지 전송 */
					sock.onclose();
					
				});
			});
			function sendMessage(){
				/* 맵핑된 핸들러 객채의 handleTextMessage메소드가 실행 */
				if($("#chatTxt").val()!=""){
					sock.send($("#chatTxt").val());
				}
			};
			function onMessage(evt){
				
				var data=evt.data;//new text객체로 보내준 값을 받아옴.
				var host=null;//메세지를 보낸 사용자 ip저장
				var strArray=data.split("|");//데이터 파싱처리하기
				var userName=null;//대화명 저장
				
				var nCount = chatListMin();
				

				//전송된 데이터 출력해보기
				for(var i=0;i<strArray.length;i++)
				{
					console.log('str['+i+'] :' + strArray[i]);	 		
				}
				if(strArray[4]==chatNo){
					if(strArray.length>1)
					{
						sessionId=strArray[0];
						message=strArray[1];
						host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
						userName=strArray[3];
						today=new Date();
						amtoPm="am ";
						if(today.getHours()>12){
							amtoPm="pm "+ (today.getHours()-12);
						}else{
							amtoPm+=today.getHours();
						}
						printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+amtoPm+":"+today.getMinutes()+":"+today.getSeconds();
						
						console.log(today);
						var ck_host='${host}';
				
						console.log(sessionId);
						console.log(message);
						console.log('host : '+host);
						console.log('ck_host : '+ck_host);
						/* 서버에서 데이터를 전송할경우 분기 처리 */
						if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
						{
							var printHTML="<div style='margin-left: 30%;margin-bottom: 10px;word-break:break-all;text-align: right;'>";
							printHTML+="<div >";
							printHTML+="<div class='myChatLog'>"+message+"</div><br/>";
							printHTML+="<sub>"+printDate+"</sub>";
							printHTML+="</div>";
							printHTML+="</div>";
							$('#chatdata').append(printHTML);
							$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
						}
						else{
							var printHTML="<div style='margin-right:30%;word-break:break-all;text-align: left;'>";
							printHTML+="<div >";
							printHTML+="<div class='otherChatLog'>"+message+"</div><br/>";
							printHTML+="<sub>"+printDate+"</sub>";
							printHTML+="</div>";
							printHTML+="</div>";
							
							clientHeigth=$("#chatdata").height()+$("#chatdata").scrollTop()+13
							clientScrollHeigth=$("#chatdata")[0].scrollHeight
							
							console.log("현재 div 크기"+$("#chatdata").height());
							console.log("스크롤위치"+$("#chatdata").scrollTop());
							console.log("스크롤하는 div 크기"+$("#chatdata")[0].scrollHeight);
							
							$('#chatdata').append(printHTML);
							
							if(clientScrollHeigth==clientHeigth){
								console.log("같아요");
								$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
							}
							
							
							
						}
						//console.log('chatting data : '+data);
					}
					else
					{
						today=new Date();
						printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
						message=strArray[0];
						var printHTML="<div>";
						printHTML+="<div class='dangerLog'>";
						printHTML+=message+"<br/>";
						printHTML+="<sub>"+printDate+"</sub>";
						printHTML+="</div>";
						printHTML+="</div>";
						$('#chatdata').append(printHTML);	
						
					}
					updateStatus(chatNo);
				}
				
			};

			function onClose(evt){
				location.href='${pageContext.request.contextPath};';
			};
			
			
		}
		
		$("#chat").click(function() {
				var display = $('.chatListBox').css("display");
				console.log(display);
			$('.chatListBox').toggle();
			
				if(display=='none'){
					chatListMin();
				}
		});
		
	
		$('html').click(function(e) {
			
			if(!$(e.target).hasClass("carea")) { 
				console.log((e.target) );
				$(".chatListBox").hide();
			}
			
			
		})
	});
	function onEvent() {
		
	}
	function chatting(chatId) {
		
		var url = "${pageContext.request.contextPath }/chat/chatting.do/"+ chatId;
		console.log(url);
		
		$("#chatGo").attr("action",url).submit();

	}
	$(function() {
		$(".allchatList").click(function() {
			var url = "${pageContext.request.contextPath }/chat/allChatList.do";
			console.log(url);
			
			$("#chatGo").attr("action",url).submit();
		})
	})
	function updateStatus(chatNo) {
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/upStatus.do/"+chatNo,
			success: function() {
				chatListMin();
				console.log("업데이트 확인");
			} 
		});
	}
	function chatListMin() {
		var nCount=0;
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/chatListMin.do/",
			dataType : "json",
			async:false,
			success : function(data) {
				console.log(data);
				 $('.chatList').children(".chatBox").remove();
				  for(var i in data){	
					  nCount=nCount+data[i].nCount
												 
					var chatBox=$('<div/>').append($("<span>").text(data[i].chattingName))
							   .append($("<input>").attr("value",data[i].chattingName)
									  			  .attr("name","title")
									  			  .attr("hidden","hidden")
									  			)	  		
							  .attr("class","chatBox carea")
							  .attr("onclick","chatting("+data[i].chattingId+")")
							  .css({
								  "width" : "100%",
								  "height": "80px",
								  "border-bottom": "1px #64646429 solid"
							  }).append(
										$('<div/>').text(data[i].chContent)
												  .attr("class","chatBox carea")
												  .attr("value",data[i].chattingId)
												  .css({
													  "width" : "100%"
													 
												  })
								
							   );
								   
					  if(data[i].nCount>0){
						  chatBox.append($("<span>").text(data[i].nCount)
				   			  .attr("class","nCount badge"))  
				   		}
					   $('.chatList').append(chatBox);
					 
				  }
				
			
			},
			error : function(data){
				 console.log(data);
			}

		});
		console.log("nCount : "+nCount);
		$("#alamCount").remove();		
		
		if(nCount>0){
		$("#chat").append($("<span>").text(nCount)
									 .attr("id","alamCount")
									 .attr("class","badge"))
		}
		return nCount;
	}
</script>

</body>