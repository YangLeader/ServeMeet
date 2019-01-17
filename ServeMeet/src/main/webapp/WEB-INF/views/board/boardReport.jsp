<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- Style Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Fontello CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/fontello.css"
	rel="stylesheet">
<!-- Style Custom CSS -->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<!-- category -->
<link href="${pageContext.request.contextPath}/resources/css/category.css"
	rel="stylesheet">
	<!-- scroll -->
<link href="${pageContext.request.contextPath}/resources/css/scroll.css"
	rel="stylesheet">
<!-- Font CSS -->
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
	<!-- board style -->
	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">
	
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/wrest.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>

<meta charset="UTF-8">
<title>신고 사유</title>
</head>
<body style="background-color:white;">
	<div style="margin-top:20px;" >
		<div>
			<h2 style="text-align:center;">신고 사유를 선택해주세요.</h1>
			<hr style="border-top:1px solid #222; margin-left:30px; margin-right:30px;"/>
		</div>
	
		<div style="background-color: #f3e7e745; padding: 20px;">
		<form id="report">
			<fieldset>
	    		<legend>신고 사유</legend>
	       	 	<input type="radio" name="category" value="영리목적/홍보"/> 영리목적 / 홍보성 게시글<br />
				<input type="radio" name="category" value="욕설/인신공격"/> 욕설 / 인신공격 게시글<br />
				<input type="radio" name="category" value="도배/무의미"/> 도배 / 무의미한 게시글<br />
				<input type="radio" name="category" value="음란성/선정성"/> 음란성 / 선정성 게시글<br />
				<input type="radio" name="category" value="기타"/> 기타<br /><br />
				<input type="hidden" name="boardNo" value="${boardNo }" />
				<input type="hidden" name="userName" value="${userName }" />
			
				<textarea class="form-control" name="reportContent" style="width:100%; resize:none; border: 1px solid black;" required></textarea>
				
				<button type="button" class="btn btn-info btn-sm" onclick="submitReport(); return false;">
					<span class="glyphicon glyphicon-bell"></span> 신고하기
				</button>
			
				<button type="button" class="btn btn-default btn-sm" onclick="javascript:self.close();">
					취소
				</button>
	    	</fieldset>
		</form>
		</div>
	
	</div>
	
	<script>
		(function () {
	    // 내용
	    	if("${msg}" == "이미 신고한 게시글 입니다."){
	    		
	    	document.addEventListener("DOMContentLoaded", function(event) {
	  		      swal("${msg}").then((close) => {
	  		    	window.close();
	  		      });
	  		});
	    		
	    		
	    	}
	    
		})()
	
		// 함수 실행 되는 것 확인 
		function submitReport(){
			
			
			var params = $('#report').serialize();
			
			var name = $('input[name="userName"]').val();
			
			$.ajax({
	
				url : '${pageContext.request.contextPath}/board/boardReport.do',
				data : params,
				success : function(data)
						{		
							
							
					  		      swal(name +"님, 신고 처리 됐습니다.").then((close) => {
					  		    	window.close();
					  		      });
					  		
						},
				error : function() {
	                         // 에러 발생시 처리할 부분 
						swal("신고 사유를 선택해주세요.");
	                         
						
					
	            }

				

			});
		}
	</script>
</body>
</html>