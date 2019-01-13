<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script>

if("${msg}" !="login"){
	if("${msg}" == "로그아웃 되었습니다."){
		document.addEventListener("DOMContentLoaded", function(event) {
		      swal("${msg}").then((logout) => {
		    	  location.href="${pageContext.request.contextPath}/";
		      });
		});
	}else if("${msg}" == "회원 정보가 수정되었습니다!"){
		document.addEventListener("DOMContentLoaded", function(event) {
		      swal({
		    	  text : "${msg}",
		    	  icon: "success" 
		      }).then((login) => {
		    	  location.href="${pageContext.request.contextPath}/member/memberView.do";
		      });
		    });
	}else if("${msg}" == "회원 가입 성공!"){
		document.addEventListener("DOMContentLoaded", function(event) {
		      swal({
		    	  text : "${msg}",
		    	  icon: "success" 
		      }).then((login) => {
		    	  location.href="${pageContext.request.contextPath}${loc}";
		      });
		    });
	}else if("${msg}" == "게시글 등록 성공!"){
		document.addEventListener("DOMContentLoaded", function(event) {
		      swal({
		    	  text : "${msg}",
		    	  icon: "success" 
		      }).then((doc) => {
		    	  location.href="${pageContext.request.contextPath}${loc}";
		      });
		    });
	}else{
		document.addEventListener("DOMContentLoaded", function(event) {
		      swal({
		    	  text : "${msg}",
		    	  icon: "warning" 
		      }).then((login) => {
		    	  location.href="${pageContext.request.contextPath}${loc}";
		      });
		    });
	}  
}else{
	location.href="${pageContext.request.contextPath}${loc}";
}
</script>