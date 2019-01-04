<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	var chatNo = ${chatNo};
	console.log("chatNo : "+chatNo);
	
	
	
	
	function chatLog() {
		$.ajax({
			url:"${pageContext.request.contextPath}/chat/chatLogList.do/",
		 	datatype:"json",
		 	success : function(data) {
				console.log(data);
			},
			error : function() {
				console.log("chatLog 에러");
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
<div class="chattingRoom">
	<div style="width: 100%;height: 70px;">
		<div class="col-lg-4"></div><input hidden="hidden">
		<div  class= 'col-lg-8'>${chatName} </div>
	</div>
	<div class="col-lg-4 chatList scrollbar-primary" >
	</div>
	<div class= 'col-lg-8 form-group' style="height:730px;">
		
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