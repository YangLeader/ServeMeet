<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<c:forEach items="${list}" var="c">

	<div class = "chatName" style="border: solid 1px black" >
		<input  name="chatNo" class="chatNo" value="${c.chattingId }">
		<label class = "chatUser">${c.userName2 }</label>
	</div>
	<br><br><br>
</c:forEach>

<script type="text/javascript">
	$(".chatName").click(function() {
		//var chatNo = $(this).attr("value");
		var chatNo = $(this).children(".chatNo").val();
		console.log(chatNo);
		
	});
	
</script>
</body>
</html>