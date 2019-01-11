<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.applyBigDiv{

	width: 90%;
	height: 310px;
	margin: auto;
}
.applyContentDiv{


	width:100%;
	height: 280px;
	margin: auto;
}
.applybtnDiv{
	display: block;
	text-align: center;
	width:100%;
	height: 30px;
	margin: auto;
}
.applyWriter{

	width: 98%;
	height: 30px;
	margin: auto;
}
.applyGuest{
	
	width: 98%;
	height: 30px;
	margin: auto;
}
.writerN{
	display: inline-block;

	margin-top: 3px;
	font-size: 9pt;
}
.applyContent{

	width: 98%;
	height: 210px;
	margin: auto;
}
.sb_btn{
	width: 21%;
	color: black;
    background: white;
    font-size: 9pt;
    font-weight:900;
    margin: auto;
    height: 24px;
    border-radius: 0.2em;
    border: 1px solid #B3B8BA;
    text-align: center;  
}
.sb_btn:hover {
	cursor:pointer;
	background: #EDF1F2;
}
.sb_btn2{
	width: 21%;
	color: black;
    background: white;
    font-size: 9pt;
    font-weight:400;
    margin: auto;
    height: 25px;
    border-radius: 0.2em;
    border: 1px solid #B3B8BA;
    text-align: center;  
}
.sb_btn2:hover {
	cursor:pointer;
	background: #EDF1F2;
}
.greyRule { 
	background: #CECECE; 
	width: 100%;	
	height: 1px; 
	padding: 0; 
	margin: 0; 
}
</style>
<meta charset="UTF-8">
<title>매칭 신청</title>
</head>
<body>
<form name="mwrite" id="mwrite" action="${pageContext.request.contextPath}/matching/matchingRequest.ma" method="post" >
	<div class="applyBigDiv">
		<div class="applyContentDiv">
			<div class="applyWriter">
				<span class="writerN">
					<strong>등록자 : </strong> <a id="writerName"></a><input type="hidden" name="writerName" id="writerN" />
				</span>
				<span>
					<input type="hidden" name="matchingId" id="matchingId" />
				</span>
				<div class="greyRule"></div>
			</div>
			<div class="applyGuest">
				<span class="writerN" id="guestName">
					<strong>신청자 : </strong><a id="guestName">${member.userName }</a><input type="hidden" name="guestName" id="guestN" value="${member.userName }"/>
				</span>
				<div class="greyRule"></div>
			</div>
			<div class="applyContent">
				<textarea name="content" id="content" cols="57" rows="13" placeholder="신청 메세지를 작성해주세요" style="resize: none; font-size: 10pt"></textarea>
			</div>
		</div>
		<div class="applybtnDiv">
			<input type="button" class="sb_btn" id="requestMatching"value="매칭 신청"/>&nbsp;<button class="sb_btn2" id="cancle" >취소</button>
		</div>
	</div>
</form>
<script>
$(function () {
	var pValue = $("#liWriter", opener.document).text();
	var pId = $("#matchingId", opener.document).val();
	
	$('#writerN').val(pValue);
	$('#writerName').text(pValue);
	$('#matchingId').val(pId);
	
	$('#cancle').click(function () {
		self.close();
	});
});

function textCheck() {
	var content = $('#content').val();
	if(content.trim().length == 0){
		alert("신청 메세지를 입력해야 합니다.");
		return false;
	}
	return true;
}

$('#requestMatching').click(function(){
	var mId = $('#matchingId').val();
	var writer = $('#writerN').val();
	var guest = $('#guestN').val();
	var content = $('#content').val();
	
	console.log(mId);
	console.log(writer);
	console.log(guest);
	console.log(content);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/matching/matchingRequest.ma",
		type : "POST",
		data : { matchingId : mId,
				 writerName : writer,
				 guestName : guest,
				 content : content},
		success : function(data){
			console.log(data);
		}, error : function(data){
			alert("에러가 발생했습니다!");
			
			self.close();
		}
	});
	
});

</script>
</body>
</html>