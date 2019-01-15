<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container">
	<div class="modal fade" id="createChat" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content" style="border:0px;">
	        <div class="modal-header" style="background-color:#5e72ed">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" >채팅방 만들기</h4>
	        </div>
	        <div  style="width:100%;padding: 5px; border-bottom: 3px #5e73de solid;"> <input style="width:100%;border:none;padding: 0px 10px;" class="madal-chatName" placeholder="채팅방 제목을 정하세요"></div>
	        <div class="modal-body"style="height:400px;">
	       
	          <div class="col-lg-7" style="height:100%;border-right:1px #cdcdcd solid; padding-right: 15px;">
	          	<div style="width: 100%; height: 35px; border-bottom: 1px #cdcdcd solid;"><input class="keyword" id="mSearch" style="width: 100%;height:30px; border: none; "placeholder="회원 닉네임을 찾아 보세요"></div>
	          	<div>
	          		
	               <!--  <button class="mSearch">검색</button> -->
	            </div>
	            <div class="searchMember" style="padding: 10px 0px"></div>
	            
	          </div>
	          <div class="col-lg-5" style="height:100%;">
	          	<div style="width: 100%; height: 30px;"><div style="text-align: center;">회원</div></div>
	          	<div class="inMember"  style="padding: 10px 0px"></div>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" onclick="createChatRoom();" data-dismiss="modal">만들기</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	      
	    </div>
    </div>
</div>

