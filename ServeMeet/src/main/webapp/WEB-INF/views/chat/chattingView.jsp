<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<meta charset="UTF-8">
<title>실시간 채팅</title>
<script>
	/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
	var sock=new SockJS("<c:url value='/echo'/>");
	sock.onmessage=onMessage;
	sock.onclose=onClose;
	var today=null;
	$(function(){
		chatList();
		chatLog();
		$("#sendBtn").click(function(){
			console.log("send message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sendMessage();
			
			/* 전송 후 작성창 초기화 */
			$("#message").val('');
		});
		$("#exitBtn").click(function(){
			console.log("exit message.....");
			/* 채팅창에 작성한 메세지 전송 */
			sock.onclose();
		});
	});
	function sendMessage(){
		/* 맵핑된 핸들러 객채의 handleTextMessage메소드가 실행 */
		sock.send($("#message").val());
	
	};
	function onMessage(evt){
		var data=evt.data;//new text객체로 보내준 값을 받아옴.
		var host=null;//메세지를 보낸 사용자 ip저장
		var strArray=data.split("|");//데이터 파싱처리하기
		var userName=null;//대화명 저장
		

		//전송된 데이터 출력해보기
		for(var i=0;i<strArray.length;i++)
		{
			console.log('str['+i+'] :' + strArray[i]);	 		
		}
		if(strArray.length>1)
		{
			sessionId=strArray[0];
			message=strArray[1];
			host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
			userName=strArray[3];
			today=new Date();
			printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
			
			console.log(today);
			var ck_host='${host}';
	
			console.log(sessionId);
			console.log(message);
			console.log('host : '+host);
			console.log('ck_host : '+ck_host);
			/* 서버에서 데이터를 전송할경우 분기 처리 */
			if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
			{
				var printHTML="<div class='well' style='margin-left: 30%;'>";
				printHTML+="<div class='alert alert-info'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>["+userName+"] : "+message+"</strong>";
				printHTML+="</div>";
				printHTML+="</div>";
				$('#chatdata').append(printHTML);
			}
			else{
				var printHTML="<div class='well'  style='margin-left: -5%;margin-right:30%;'>";
				printHTML+="<div class='alert alert-warning'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>["+userName+"] : "+message+"</strong>";
				printHTML+="</div>";
				printHTML+="</div>";
				$('#chatdata').append(printHTML);
				
			}
			//console.log('chatting data : '+data);
		}
		else
		{
			today=new Date();
			printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
			message=strArray[0];
			var printHTML="<div class='well'  style='margin-left30%:'>";
			printHTML+="<div class='alert alert-danger'>";
			printHTML+="<sub>"+printDate+"</sub><br/>";
			printHTML+="<strong>[서버관리자] : "+message+"</strong>";
			printHTML+="</div>";
			printHTML+="</div>";
			$('#chatdata').append(printHTML);	
			
		}
		chatList();
	};

	function onClose(evt){
		location.href='${pageContext.request.contextPath};';
	};
	
	function chatList() {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/chatListMin.do/",
			
			dataType : "json",
			success : function(data) {
				console.log(data);
				 $('.chattingList').children().remove();
				  for(var i in data){	
					 
					  
					  $('.chattingList').append(							 
						$('<div>').text(data[i].chattingName)
								  .attr("class","chattingBox carea")
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
	function chatLog() {
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/chatLogList.do/",
		 	datatype:"json",
		 	success : function(data) {
				console.log(data);
			},
			error : function() {
				condole.log("chatLog 에러");
			}
		 	
			
		});
	}
</script>
<style>

</style>
</head>
<body>
<header>
		<c:import url="../common/header.jsp" />
	</header>
<div style="width: 1200px; height:800px; margin: 0 auto;">
	<div style="width: 100%;height: 70px;">
		<div class="col-lg-4"></div>
		<div  class= 'col-lg-8'></div>
	</div>
	<div class="col-lg-4 chattingList" style="height: 100%">
	</div>
	<div class= 'col-lg-8 form-group' style="height: 100%">
		
		<!-- 메세지 작성부분 -->
		<!-- 대화내용이 출력되는 부분 -->
		<div class='panel panel-default scrollbar-primary'  style="overflow: scroll;height: 600px;">
			<div id='chatdata' class='panel-body'></div>
		</div>
		<textarea rows="2" cols="50" name='message' id='message'></textarea>
		<button class='btn btn-primary'id='sendBtn'>전송</button>
		<button class='btn btn-primary'id='exitBtn'>나가기</button>
		
	</div>
</div>
	<footer>
		<c:import url="../common/footer.jsp" />
	</footer>
</body>
</html>