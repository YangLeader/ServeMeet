<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- cnd방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- 부트스트랩적용 -->
<!-- Latest compiled and minified CSS -->
<meta charset="UTF-8">
<title>실시간 채팅</title>
<script>
	var msgCount=0;
	var page =0;
	var chatNo = ${chatNo};
	
	var chatName= "${chatName}";
	
	var myNo=${member.userNo};
	
	var memberName=new Array();
	memberName.push("${member.userName}");
	$(function() {
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/chatLogList.do/",
			data:{
				chatNo:chatNo,
				msgCount:msgCount,
				page:page
			},
		 	datatype:"json",
		 	success : function(data) {
				//console.log(data);
				for(var i in data){
					
					var message=data[i].chContent;
					var userName=data[i].userName;
					var today=new Date(data[i].chDate);
					amtoPm="am ";
					if(today.getHours()>12){
						amtoPm="pm "+ (today.getHours()-12);
					}else{
						amtoPm=amtoPm+today.getHours();
					}
					printDate=today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()+" "+amtoPm+":"+today.getMinutes()+":"+today.getSeconds();
					console.log("message="+message);
					console.log("userName="+userName);
					console.log("today="+printDate);
					
					if(data[i].userNo==myNo)
					{
						var printHTML="<div style='margin-left: 30%;margin-bottom: 10px;word-break:break-all;text-align: right;'>";
						printHTML+="<div >";
						printHTML+="<div class='myChatLog'>"+message+"</div><br/>";
						printHTML+="<sub>"+printDate+"</sub>";
						printHTML+="</div>";
						printHTML+="</div>";
						$('#chatdata').append(printHTML);
					}
					else{
						var printHTML="<div style='margin-right:30%;word-break:break-all;text-align: left;'>";
						printHTML+="<div ><div class='nameTag'>"+userName+"</div><br>";
						printHTML+="<div class='otherChatLog'>"+message+"</div><br/>";
						printHTML+="<sub>"+printDate+"</sub>";
						printHTML+="</div>";
						printHTML+="</div>";
						clientHeigth=$("#chatdata").height()+$("#chatdata").scrollTop()+13
						clientScrollHeigth=$("#chatdata")[0].scrollHeight
						$('#chatdata').append(printHTML);
						if(clientScrollHeigth==clientHeigth){
							console.log("같아요");
							$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
						}
					}
				} 
				$("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
			},
			error : function() {
				console.log("chatLog 에러");
			}
		 	
			
		});
	});
	$(function() {
		$(".outBtn").click(function() {
			if (confirm("채팅방을 나가시겠습니까?") == true){    //확인
				location.href="${pageContext.request.contextPath}/chat/chatOut.do/"+chatNo;
			}else{   //취소
			    return;
			}
			
		})
		
	})
	
	$(function() {
		$(".mSearch").click(function() {
			var keyword=$(".keyword").val();
			console.log(keyword);
			$.ajax({
				url:"${pageContext.request.contextPath }/member/memberSearch.do",
				data:{keyword:keyword},
				datatype:"json",
				success : function(data) {
					console.log(data);
					for(var i in data){
						$(".searchMember").append(
							$("<div>").append(
								$("<span>").append(data[i])		
							).attr("class","memberName")
							 .attr("value",data[i])
						);
					}
					
				},error: function() {
					console.log("에러");
				}
			});
		});
		$(document).on("click",".inMemberName",function() {
			var inUserName=$(this).attr("value");
			$(this).remove();
			var temp = new Array();
			for(var i in memberName){
				if(memberName[i]!=inUserName){
					temp.push(memberName[i]);
				}
			}
			memberName=temp;
			console.log("지운있는 회원");
			console.log(memberName);
		})
		$(document).on("click",".memberName",function() {
						var mName=$(this).attr("value");
						memberArray(mName);
						console.log(mName);
					})
		
	});
	function memberArray(userName) {
		if(!memberName.includes(userName)){
			memberName.push(userName);
			$(".inMember").append(
				$("<div>").append(
					$("<span>").append(userName)		
				).attr("class","inMemberName")
				 .attr("value",userName)
			);
		//	var printHTML="<div class='inMemberName'value='"+userName+"'>";
		//	printHTML+="<span>"+userName;
		//	printHTML+="</span>";
		//	printHTML+="</div>";
		//	$('.inMember').append(printHTML);
			
		}
		
		console.log(memberName);
	}
	function createChatRoom(){
		if(memberName.length>1){
			
			if($(".modal-body .chatName").val()!=null){
				createChatGroup();
			}else{
				 swal("방 이름을 입력해주세요");
			}
		}else{
			 swal("함께할 회원을 선택해주세요");
		}
	}
  	function createChatGroup(){
		var jArray=JSON.stringify(memberName);
		var cChatName = $(".modal-body .chatName").val();
		/* console.log("jArray+++");	
		console.log(jArray);	
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/insertChatRoom.do",
			data:{
				 memberName:jArray,
				 chatName:cChatName	},
			datatype:"json",
			type:"post"
			
			
			
		}); */
		 var form = document.createElement("form");

         form.setAttribute("method", "Post");  //Post 방식
         form.setAttribute("action", "${pageContext.request.contextPath}/chat/insertChatRoom.do"); //요청 보낼 주소

         var hiddenField = document.createElement("input");
         hiddenField.setAttribute("type", "hidden");
         hiddenField.setAttribute("name", "memberName");
         hiddenField.setAttribute("value", jArray);
         form.appendChild(hiddenField);

         hiddenField = document.createElement("input");
         hiddenField.setAttribute("type", "hidden");
         hiddenField.setAttribute("name", "chatName");
         hiddenField.setAttribute("value", cChatName);
         form.appendChild(hiddenField);

         document.body.appendChild(form);
         form.submit();

		}
  	$('html').click(function() {
  		$modal = $(".modal").css("display");
  		if($modal=='none'){
  			$(".inMember").children().remove();
  	  		$(".searchMember").children().remove();
  	  		memberName=new Array();
  	  		memberName.push("${member.userName}");
  	  		
  		}
	})

</script>
<style>

</style>
</head>
<body>
	<header>
		<c:import url="../common/header.jsp" />
	</header> 
<div class="chattingRoom">
	<div class = "chattingTop">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 myList" >
			<span data-toggle="modal" data-target="#createChat"><img class="plusBtn" alt="채팅방 만들기" src="${pageContext.request.contextPath}/resources/images/plus.png"></span>
		
		</div>
		<div  class= 'col-lg-8 col-md-8 col-sm-8 col-xs-8 chatName'>
			<h2>${chatName}</h2>
			<span><img class="outBtn" alt="채팅방 나가기" src="${pageContext.request.contextPath}/resources/images/out.png"></span> 
			
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 chatList scrollbar-primary" >
	</div>
	<div class= 'col-lg-8 col-md-8 col-sm-8 col-xs-8 form-group' style="">
		<!-- 메세지 작성부분 -->
		<!-- 대화내용이 출력되는 부분 -->
		<div class='panel panel-default'>
			<div id='chatdata' class='panel-body scrollbar-primary'></div>
		</div>
		<div id = "chatSend" >
			<input type="text"  name="chatTxt" id = "chatTxt"/><span class = "a"><button class="chatSendBtn"><img class="chatSendImg" src="${pageContext.request.contextPath}/resources/images/chatSend3.png"></button></span>
		</div>
		
	</div>
</div>
<section>
	<article>
		<c:import url="createChat.jsp"/>
	</article>
</section>	
	<footer>
		<c:import url="../common/footer.jsp" />
	</footer> 
</body>
</html>