<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>

<div class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="page-caption">
          <h2 class="page-title"> 아이디 찾기</h2>
          <p> 아이디 찾기를 위한 페이지 입니다.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="get-in-touch">
          <h1 class="mb30">아이디 찾기</h1>
          <div class="row">
            <form name="searchIdFrm" id ="searchIdFrom" method="post">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="id">닉네임 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="name" name="userName" type="text" class="form-control" placeholder="닉네임을 입력하세요" required>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Text input-->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="pwd">이메일 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="email" name="email" type="email" class="form-control" placeholder="이메일을 입력하세요" required>
                    </div>
                  </div>
                </div>
              </div>
              
              <!-- Button -->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group" align="center">
                <br>
                  <button type ="button" id="sendbutton" name="sendbutton" class="btn-lg btn-default" onclick="sendBtn();"><b>아이디 찾기</b></button>
                </div>
              </div>
              <div id="checkId" align="center">
              	<span id="noId" style="display:none">존재하지 않는 아이디 입니다.</span>
              	<span id="showId" style="display:none"></span>
              </div>
              <div>
              <hr>
              <br>
              <p align="center"><a href="${pageContext.request.contextPath}/member/memberLoginView.do">로그인 </a> | <a href="${pageContext.request.contextPath}/member/memberEnroll.do">회원가입</a></p> 
             </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

	<c:import url="../common/footer.jsp"/>
	
	<script>
	
		function sendBtn(){
			searchIdConfirm();
		}
		
		function searchIdConfirm(){
			$.ajax({
	            url  : "${pageContext.request.contextPath}/member/searchIdConfirm.do",
	            data : {userName: $('#name').val(),
	            		email:$('#email').val()},
	            success : function(data){
	                console.log(data);
	                if(data==""){ //viewName 방식
	                	$("#showId").hide();
	                	$("#noId").show();
	                } else {
	                	$("#showId").html("해당 회원정보의 아이디는" + data + "입니다.");
	                	$("#showId").show();
	                	$("#noId").hide();
	                }
	                
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
		}
	
	</script>
	
</body>
</html>