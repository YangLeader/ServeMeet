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
	<title>비밀번호 찾기</title>
	<c:import url="../common/header.jsp"/>
	<style>
		.swal-overlay {
		  background-color: rgba(30, 30, 30, 0.45);
		}
		.swal-title {
		  font-size: 20px;
		}
		.swal-text {
		  font-size : 14px;
		}
		
		.swal-content__input{
		  font-size : 12px;
		}
	</style>
</head>
<body>



<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="get-in-touch">
          <h1 class="mb30">비밀번호 찾기</h1>
          <div class="row">
            <form name="searchIdFrm" id ="searchIdFrom" method="post">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- Text input-->
                <div class="row">
                  <div class="form-group">
                    <div class="col-md-3">
                      <label class=" control-label" for="id">아이디 :</label>
                    </div>
                    <div class="col-md-9">
                      <input id="userId" name="userId" type="text" class="form-control" placeholder="아이디를 입력하세요" required>
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
                  <button type ="button" id="sendbutton" name="sendbutton" class="btn-lg btn-default" onclick="sendBtn();"><b>비밀번호 찾기</b></button>
                </div>
              </div>
              <div>
              <hr>
              <br>
              <p align="center"><a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기 </a> | <a href="${pageContext.request.contextPath}/member/memberLoginView.do">로그인 </a> | <a href="${pageContext.request.contextPath}/member/memberEnroll.do">회원가입</a></p> 
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
		 $.ajax({
			url : "${pageContext.request.contextPath}/member/searchPwdCheck.do",
			data : { userId : $("#userId").val(),
					 email : $("#email").val()
				   },
		   success : function(data){
                console.log(data);
                if(data==1){ //viewName 방식
                	//swal("값이 일치합니다");
                	$.ajax({
                		url : "${pageContext.request.contextPath}/member/sendEmail.do",
                        data : { email : $("#email").val()},
                        success : function(data){
                             console.log("이메일전송결과 : " + data);
                             swal({
                  			   title : "입력하신 이메일로 인증번호를 전송하였습니다.",
               		   			text : "인증번호를 입력해주세요",
               		   			content : "input",
               		   			closeOnClickOutside: false
               		   			})
                               .then((value) => {
                            	   if(value==data){
                            		   swal({
                            			   title : "인증번호 확인이 완료되었습니다.",
                            		   		text : "비밀번호를 다시 설정해주세요",
                            		   		content: {
                            		   		    element: "input",
                            		   		    attributes: {
                            		   		      placeholder: "비밀번호는 6~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.",
                            		   		      type: "password",
                            		   		   	button : {
                        				    	   closeOnClickOutside: false,
                              		   		   	   closeModal : false   
                        				       	}
                            		   		    }
                            		   		}
                            		   })
                            		   .then((pwd) => {
                            			   var isPwd = /^[A-Za-z0-9_-]{6,18}$/;
                            			   if(!isPwd.test(pwd)){
                            				   swal({
                            					   text : "비밀번호 형식이 맞지 않습니다.",
                            				       icon : "error",
                            				       button : {
                            				    	   closeOnClickOutside: false
                            				       }
                            				       
                            				   })
                            			   }else{
                            			   $.ajax({
                            		            url  : "${pageContext.request.contextPath}/member/resetPwd.do",
                            		            data : {userId: $('#userId').val(),
                            		            		userPwd: pwd},
                            		            success : function(){
                            		            	 swal({
                            		            		 text : "비밀번호 변경이 완료되었습니다!",
                            		            	 	 icon : "success"
                            		            	 })
                            		            	 .then((value) => {
                                		            	 location.href="${pageContext.request.contextPath}/member/memberLoginView.do";
                            		            	 })
                            		            	 
                            		            }, error : function(jqxhr, textStatus, errorThrown){
                            		                console.log("ajax 처리 실패");
                            		                //에러로그
                            		                console.log(jqxhr);
                            		                console.log(textStatus);
                            		                console.log(errorThrown);
                            		            }
                            	        	});
                            			   }
                            		   });
                            	   }else {
                            		   swal({
                    					   text : "인증번호가 일치하지 않습니다.",
                    				       icon : "error",
                    				       button : {
                    				    	   closeOnClickOutside: false
                    				       }
                    				       
                    				   })
                            	   }
                               });
                             }, error : function(jqxhr, textStatus, errorThrown){
                                 console.log("ajax 처리 실패");
                                 //에러로그
                                 console.log(jqxhr);
                                 console.log(textStatus);
                                 console.log(errorThrown);
                             }
                     
                         
                     });

                } else {
                	swal({
                		title : '존재하지 않는 회원정보입니다.',
                		text : '아이디 혹은 이메일을 다시 확인해주세요',
                		icon : 'error'
                	})
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