<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 웹소켓</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/chat/chatList.do" method="post">
		시용자 이름1 : <input type="text" name = "userName1" id = "userName"> <br>
		시용자 이름2 : <input type="text" name = "userName2" id = "userName"> <br>
		<input type="submit" value="입장하기">
	</form>
</body>
</html>