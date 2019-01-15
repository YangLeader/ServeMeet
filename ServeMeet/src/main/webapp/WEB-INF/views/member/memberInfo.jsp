<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/header.jsp" />
<title>내 정보보기</title>
<meta charset="UTF-8">

<style>
	.bbs_btn {
	    color: #fff;
	    background: #5e73de;
	    font-size: 9pt;
	    float: right;
	    height: 34px;
	    width : 80px;
	    text-align :center;
	    line-height: 34px;
	    border-radius: 0.3em;
	    border: 0;
		 z-index : 3;
	}
	
	.row{
		margin-right: 0;
    	margin-left: 0;
	}
	
	.email-input {
		width : 78%;
		 float: left;
		 z-index : 0;
	}
	.email-button{
		width : 15%;
		 float: right;
		 z-index : 1;
	}
	
	
	.txtDiv {
		padding-bottom : 12px;
	}
	
</style>
</head>
<body>

<div class="space-medium" >
  <div class="container" align="center"  style="margin-left:25%" >
    <div class="row" style="text-align:left" >
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="get-in-touch">
          <h1 class="mb40">개인정보관리</h1>
          <p>회원가입시 등록했던 기본 사항입니다. 변경사항이 있으면 수정해주세요.</p>
          <div class="row">
            <form name="memberEnrollFrm" id ="updateForm" action="memberUpdate.do" method="post">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row txtDiv">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="id">아이디 :</label>
                    </div>
                    <div class="col-md-9">
                    	<div id="userId-container txtdiv">
                    		<span class="txtSpan">&nbsp;${member.userId}</span>
                    	</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row txtDiv">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="name">닉네임 :</label>
                    </div>
                    <div class="col-md-9">
                      <div id="userName-container txtdiv">
                      		<span class="txtSpan">&nbsp;${member.userName}</span>
                      </div>
                    
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row txtDiv">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="name">보유 포인트 :</label>
                    </div>
                    <div class="col-md-9">
                      <div id="userName-container txtdiv">
                      		<span class="txtSpan" id="getPoint">&nbsp;</span>
                      </div>
                    
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
                    <div class="col-md-7 input_div">
                      <input id="pwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
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
                    <div class="col-md-7 input_div">
                      <input id="pwd2" name="userPwd2" type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요">
                      <span id="pwdMsg2" style="display:none; color:red">비밀번호가 일치하지 않습니다.</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Text input-->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row txtDiv">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="email">E-mail :</label>
                    </div>
                    <div class="col-md-9 email-container" id="email-container" style="display:">
                    	<div class="col-md-9 txtdiv">
                    	<span id="emailSpan txtSpan">&nbsp;${member.email}</span>
                    	</div>
                    	<div class="button_box col-md-3">
                    	<a class="bbs_btn btn_write" onclick="inputEmail();">
                    	<span class="glyphicon glyphicon-pencil"></span>
                    	<span>수정하기</span>
                    	</a>
                    	</div>
                    </div>
                    <div class="col-md-9 emailChange-container" id="emailChange-container" style="display:none">
                    	<div class="input_div email-input">
                    	<input id="email" name="email" type="email" class="form-control" value="${member.email}" >
                        <span id="emailMsg" style="display:none; color:red">이메일을 정확히 입력해주세요.</span>
                        </div>
                        <div class="button_box email-button">
	                    	<a class="bbs_btn btn_write" onclick="updateEmail();">
	                    	확인
	                    	</a>
                    	</div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Button -->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group" align="center">
                <br>
                <button onclick="cancel();" type="reset" id="cancelbutton" name="cancelbutton" class="btn btn-default">&nbsp;취소&nbsp;</button> 
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type ="submit" id="sendbutton" name="sendbutton" class="btn btn-default" onclick="sendBtn();">&nbsp;확인&nbsp;</button>
                </div>
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
		
	var pwdFlag1 = false;
	var pwdFlag2 = false;
	var emailFlag = false;
	
	$(document).ready(function(){
		getPoint();
        checkPswd1();
   
        checkPswd2();
    
        $("#email").on("keyup",function(){
        	checkEmail();
        });
    
	
	});

	function inputEmail(){
		$("#email-container").hide();
		$("#emailChange-container").show();
	}

	function updateEmail(){
		var email = $("#email").val();
		$("#emailSpan").html(email);
		$("#email-container").attr("style","display:");
		$("#emailChange-container").attr("style","display:none");
		
	}
	
	
	function sendBtn(){
		if(pwdFlag==false){
			swal("비밀번호를 다시 확인해주세요.");
		}else if(pwdFlag2==false){
			swal("비밀번호 확인이 일치하지 않습니다.");
		}else if(emailFlag==false){
			swal("이메일을 다시 확인해주세요.");
			$("#email").focus();
		}else{
			$("#updateForm").submit();
			location.href="${pageContext.request.contextPath}/member/memberUpdate.do";
		}
		
	}
	
	
	function checkPswd1(){
		$("#pwd").on("keyup",function(){
		var p1 = $("#pwd").val();
		
		var isPwd = /^[A-Za-z0-9_-]{6,18}$/; 
		if(p1==""){
			pwdFlag = true;
		}else{
			if((p1!="") || p1.length < 5 || !isPwd.test(p1)){
				$("#pwdMsg").show();
				pwdFlag = false;
			}else{
				$("#pwdMsg").hide();
				pwdFlag = true;
			}	
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
	
	function cancel(){
		location.href="${pageContext.request.contextPath}/member/memberView.do";
		
	}
	
	function getPoint(){
		$.ajax({
			url : "${pageContext.request.contextPath}/point/getPoint.do",
			success : function(point){
				console.log("포인트 : " + point);
				$("#getPoint").html(point+"p");
				
            }, error : function(jqxhr, textStatus, errorThrown){
                console.log("포인트 얻기ajax 처리 실패");
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