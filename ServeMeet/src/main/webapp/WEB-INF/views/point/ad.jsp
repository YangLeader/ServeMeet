<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="contact-block">
		  <c:if test="${!empty member}">
          <img width="350" height="400" onclick="adClick();" src="${pageContext.request.contextPath}/resources/images/AllRight_AD.png">
          </c:if>
          <c:if test="${empty member}">
			 <img width="350" height="400"  src="${pageContext.request.contextPath}/resources/images/AllRight_AD.png">         
          </c:if>
    </div>
    
    <script>
    	function adClick(){
    		$.ajax({
				url : "${pageContext.request.contextPath}/point/updatePoint.do",
				data : {increasePoint : 1,
						pContent : "광고 시청 포인트"
						},
				success : function(){
					window.open("http://www.naver.net", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
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
