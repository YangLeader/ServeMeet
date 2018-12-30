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
</head>
<body>


          <h2 class="page-title"> 포인트 </h2>
          <p> 포인트를 얻을 수 있는 페이지 입니다. </p>
  
<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="${pageContext.request.contextPath}/point/attendence.do" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/sns_event_attent.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="${pageContext.request.contextPath}/point/attendence.do" class="title">출 석 체 크</a> </h2>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="${pageContext.request.contextPath}/point/attendence.do" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/service-2.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">catering service</a> </h2>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="service-detail.html" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/service-3.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">wedding day</a> </h2>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="service-detail.html" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/service-4.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">awesome location</a> </h2>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="service-detail.html" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/service-5.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">business events</a> </h2>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
        <div class="service-block mb40">
          <div class="service-img"> <a href="service-detail.html" class="imghover"><img src="${pageContext.request.contextPath}/resources/images/service-6.jpg" class="img-responsive" alt=""></a> </div>
          <h2 class="service-title"> <a href="service-detail.html" class="title">corporate events</a> </h2>
        </div>
      </div>
    </div>
  </div>
</div>

	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>