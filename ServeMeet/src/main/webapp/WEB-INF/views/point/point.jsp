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
	<title>포인트</title>
	<c:import url="../common/header.jsp"/>
	
<style>
	.column {
		margin-left : 10px;
		margin-right : 10px;
	}
	
	.container {
	
		align : center;
	}
</style>
</head>
<body>


  
<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-sm-8 col-xs-12">
        <div class="service-block mb40 column">
          <div class="service-img"> <a href="${pageContext.request.contextPath}/point/attendence.do" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/sns_event_attent.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="${pageContext.request.contextPath}/point/attendence.do" class="title">출 석 체 크</a> </h2>
        </div>
      </div>
      <div class="col-md-4 col-sm-8 col-xs-12">
        <div class="service-block mb40 column">
          <div class="service-img"> <a href="${pageContext.request.contextPath}/point/scratch.do" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/scratch.png" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">스크래치 복권</a> </h2>
        </div>
      </div>
      <div class="col-md-4 col-sm-8 col-xs-12">
        <div class="service-block mb40 column">
          <div class="service-img"> <a href="${pageContext.request.contextPath}/point/roulette.do" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/roulette.png" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">포인트 룰렛</a> </h2>
        </div>
      </div>
      </div>
    </div>
  </div>

	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>