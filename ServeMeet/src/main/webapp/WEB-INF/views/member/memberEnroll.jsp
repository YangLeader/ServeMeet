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
          <h1 class="mb30">회원가입</h1>
          <div class="row">
            <form name="memberEnrollFrm" id ="enrollForm" action="memberEnrollEnd.do" method="post">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="id">아이디 :</label>
                    </div>
                    <div class="col-md-9">
                    	<div id="userId-container">
                    		<input id="id" name="userId" type="text" class="form-control" placeholder="아이디를 입력하세요" required>
                      <span class="guide ok" style="display:none; color:green">사용 가능한 아이디 입니다.</span>
            		  <span class="guide error" style="display:none;color:red">이미 사용중인 아이디 입니다.</span>
            		  <span class="guide invalid" style="display:none; color:red">아이디는5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</span>
                    	</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="name">닉네임 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="name" name="userName" type="text" class="form-control" placeholder="이름을 입력하세요" maxlength="7" required>
                      <span id="nameOk" style="display:none; color:green">사용가능한 닉네임입니다.</span>
                      <span id="nameErr" style="display:none; color:red">사용할 수 없는 닉네임입니다.</span>
                      <span id="nameInvalid" style="display:none; color:red">최소 3글자 이상 입력해주세요.</span>
                    
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
                    	<span id = "pwdMsg" style="display:none; color:red">비밀번호는 6~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Text input-->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="pwd2">비밀번호 확인 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="pwd2" name="userPwd2" type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요" required>
                      <span id="pwdMsg2" style="display:none; color:red">비밀번호가 일치하지 않습니다.</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Text input-->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="email">E-mail :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="email" name="email" type="email" class="form-control" placeholder="이메일 주소를 입력해주세요." required>
                      <span id="emailMsg" style="display:none; color:red">이메일을 정확히 입력해주세요.</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Button -->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group" align="center">
                <br>
                  <button type="reset" id="cancelbutton" name="cancelbutton" class="btn btn-default">Cancel</button> 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" id="sendbutton" class="btn btn-default" onclick="sendBtn();">Sign up</button>
                </div>
              </div>
            </form>
            <div>
              <p align="center">이미 가입된 아이디가 있으신가요?&nbsp; <a href="${pageContext.request.contextPath}/member/memberLoginView.do" style="color:blue"> 로그인</a>하기</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 map" id="googleMap"></div>
  </div>
</div>

<!-- back to top icon -->
<a href="#0" class="cd-top" title="Go to top">Top</a>



<script>
	var idFlag = false;
	var pwdFlag1 = false;
	var pwdFlag2 = false;
	var nameFlag = false;
	var emailFlag = false;
	
	$(document).ready(function(){
		
			idCheck();
     
            checkPswd1();
       
            checkPswd2();
        
            checkName();
        
            
            $("#email").on("keyup",function(){
            	checkEmail();
            });
        
		
	});
	
	function sendBtn(){
		
		if(idFlag==false){
			swal("아이디를 다시 확인해주세요.");
			return false;
		}else if(pwdFlag1==false){
			swal("비밀번호를 다시 확인해주세요.");
			return false;
		}else if(pwdFlag2==false){
			swal("비밀번호 확인이 일치하지 않습니다.");
			return false;
		}else if(nameFlag==false){
			swal("이름을 다시 확인해주세요.");
			$("name").focus();
			return false;
		}else if(emailFlag==false){
			swal("이메일을 다시 확인해주세요.");
			$("#email").focus();
			return false;
		}else{
			$("#enrollForm").submit();
		}
		
	}
	
	function idCheck(){
		$("#id").on("keyup",function(){
			var userId = $(this).val().trim();
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
			if(!isID.test(userId)){
				$(".guide.error").hide();
	        	$(".guide.ok").hide();
	        	$(".guide.invalid").show();
	        	idFlag=false;
				return;
			}else{
				$.ajax({
		            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		            data : {userId:userId},
		            dataType: "json",
		            success : function(data){
		                console.log(data);
		                // if(data=="true") //stream 방식
		                if(data.isUsable==true){ //viewName 방식
		                	$(".guide.error").hide();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").show();
		                    $("#idDuplicateCheck").val(1);
		                    idFlag=true;
		                } else {
		                	$(".guide.error").show();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").hide();
		                    $("#idDuplicateCheck").val(0);
		                    idFlag=false;
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
		})
	}
	
	
	function checkPswd1(){
		$("#pwd").on("keyup",function(){
		var p1 = $("#pwd").val();
		
		var isPwd = /^[A-Za-z0-9_-]{6,18}$/; 
		if(p1.length < 5 || !isPwd.test(p1)){
			$("#pwdMsg").show();
			pwdFlag1 = false;
		}else{
			$("#pwdMsg").hide();
			pwdFlag1 = true;
		}
	});
	}
	
	function checkPswd2(){
		$("#pwd2").on("keyup",function(){
		var p1 = $("#pwd").val();
		var p2 = $("#pwd2").val();
		
		if(p1 != p2){
			$("#pwdMsg2").show();
			pwdFlag2 = false;
		}else{
			$("#pwdMsg2").hide();
			pwdFlag2 = true;
		}
	});
	}
	
	function checkName(){
		$("#name").on("keyup",function(){
			var userName = $(this).val();
			
			if(userName.length<3|| userName.length>7){
				$("#nameErr").hide();
	        	$("#nameOk").hide();
	        	$("#nameInvalid").show();
	        	nameFlag=false;
				return;
			}else{
				$.ajax({
		            url  : "${pageContext.request.contextPath}/member/checkNameDuplicate.do",
		            data : {userName:userName},
		            dataType: "json",
		            success : function(data){
		                console.log(data);
		                if(data.isUsable==true){ 
		                	$("#nameErr").hide();
		                    $("#nameInvalid").hide();
		                    $("#nameOk").show();
		                    nameFlag=true;
		                } else {
		                	$("#nameErr").show();
		                    $("#nameInvalid").hide();
		                    $("#nameOk").hide();
		                    nameFlag=false;
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
		})
	}
	
	function checkEmail(){
		
		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	     var isHan = /[ㄱ-ㅎ가-힣]/g;
		var email = $("#email").val();
		if(!isEmail.test(email) || isHan.test(email)){
			$("#emailMsg").show();
			emailFlag = false;
		}else{
			$("#emailMsg").hide();
			emailFlag = true;
		}
		
	}

    </script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?&callback=initMap" async defer></script> -->

	
	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>