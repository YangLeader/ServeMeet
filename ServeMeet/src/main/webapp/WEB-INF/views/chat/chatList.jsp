<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<form id="chattingRoom" method="post">
	<ul>
		<c:forEach items="${list}" var="c">
			<li>
				<div class="chatName" style="border: solid 1px black">
					<input name="chatNo" class="chatNo" value="${c.chattingId }" hidden>
					<div class="chatUser">
						<font class="userName">${c.userName2 }</font>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	</form>
	<script type="text/javascript">
		$(".chatName")
				.click(
						function() {
							//var chatNo = $(this).attr("value");
							var chatNo = $(this).children(".chatNo").val();
							var url = "${pageContext.request.contextPath }/chat/chatting.do/"+ chatNo;
							console.log(url);
							
							$("#chattingRoom").attr("action",url).submit();
						
							

						});
	</script>
</body>
</html>