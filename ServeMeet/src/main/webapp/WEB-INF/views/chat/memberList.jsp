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
	<form id="memberList" method="post">
		<ul>
			<c:forEach items="${list}" var="m">
				<li>
					<div class="member" style="border: solid 1px black">
						<input name="chatNo" class="userName" value="${m.userName }" hidden>
						<div class="memUser">
							<font>${m.userName }</font>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</form>
	<input type="button" value="내 채팅 방" onclick="location.href='${pageContext.request.contextPath }/chat/chatList.do'">
	<script type="text/javascript">
		$(".member")
				.click(
						function() {
							//var chatNo = $(this).attr("value");
							var userName = $(this).children(".userName").val();
							var url = "${pageContext.request.contextPath }/chat/chattingRoom.do/"
									+ userName;
							console.log(url);

							$("#memberList").attr("action", url).submit();

						});
	</script>
</body>
</html>