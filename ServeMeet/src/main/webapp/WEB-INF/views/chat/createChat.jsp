<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="modal fade" id="createChat" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content" style="border:0px;">
	        <div class="modal-header" style="background-color:#5e72ed">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" >채팅방 만들기</h4>
	        </div>
	        <div class="modal-body"style="height:400px;">
	        <input class="chatName">
	          <div class="col-lg-7" style="height:100%; border-right:1px #cdcdcd solid;">
	          	<div>
	          		<input class="keyword">
	                <button class="mSearch">검색</button>
	            </div>
	            <div class="searchMember"></div>
	            
	          </div>
	          <div class="col-lg-5" style="height:100%;">
	          	<div>추가된 회원</div>
	          	<div class="inMember"></div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" onclick="createChatGroup();" data-dismiss="modal">만들기</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	      
	    </div>
    </div>
</div>

<script >
	
</script>
</body>
</html>