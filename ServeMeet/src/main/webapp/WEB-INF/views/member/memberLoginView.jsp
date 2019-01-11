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
	<title>회원가입</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>


<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="get-in-touch">
          <h1 class="mb30">로그인</h1>
          <div class="row">
            <form name="memberLoginFrm" id ="loginFrom" action="memberLogin.do" method="post">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="id">아이디 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="id" name="userId" type="text" class="form-control" placeholder="아이디를 입력하세요" required>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Text input-->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="pwd">비밀번호 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="pwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Button -->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group" align="center">
                <br>
                  <button type ="submit" id="sendbutton" name="sendbutton" class="btn-lg btn-default" onclick="sendBtn();"><b>Sign in</b></button>
                </div>
              </div>
              <hr>
              <br>
              <p align="center"><a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기 </a> | <a href="${pageContext.request.contextPath}/member/searchPwd.do">비밀번호 찾기</a> | <a href="${pageContext.request.contextPath}/member/memberEnroll.do">회원가입</a></p> 
            </form>
          </div>
        </div>
      </div>
      <div class="col-lg-offset-2 col-lg-4 col-md-offset-2 col-md-4 col-sm-6 col-xs-12">
        		<%-- <div class="contact-block">
          			<img width="500" height="500" onclick="adClick();" src="${pageContext.request.contextPath}/resources/images/AllRight_AD.png">
        		</div> --%>
        		<c:import url="../point/ad.jsp"/>
      </div>
    </div>
  </div>
</div>

<!-- back to top icon -->
<a href="#0" class="cd-top" title="Go to top">Top</a>



<script>
	function sendBtn(){
		$("#loginForm").submit();
		//location.href="${pageContext.request.contextPath}/member/memberEnrollEnd.do";
	}
	
	
	function adClick(){
		
	}
</script>

	
	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>