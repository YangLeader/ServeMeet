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

<div class="page-header">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="page-caption">
          <h2 class="page-title"> 출석체크</h2>
          <p> 출석체크를 위한 페이지 입니다. </p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="space-medium">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="eveDiaryInner">
        <style>
        
        </style>
             <ul> 
			<li class="date0"></li><li class="date0"></li><li class="date0"></li><li class="date0"></li><li class="date0"></li><li class="date0"></li><li class="reddate1" alt="1일"></li><li class="reddate2" alt="2일"></li><li class="date3" alt="3일"></li><li class="date4" alt="4일"></li><li class="date5" alt="5일"></li><li class="date6" alt="6일"></li><li class="date7" alt="7일"></li><li class="reddate8" alt="8일"></li><li class="reddate9" alt="9일"></li><li class="date10" alt="10일"></li><li class="date11" alt="11일"></li><li class="date12" alt="12일"></li><li class="date13" alt="13일"></li><li class="date14" alt="14일"></li><li class="reddate15" alt="15일"></li><li class="reddate16" alt="16일"></li><li class="date17" alt="17일"></li><li class="date18" alt="18일"></li><li class="date19" alt="19일"></li><li class="date20" alt="20일"></li><li class="date21" alt="21일"></li><li class="reddate22" alt="22일"></li><li class="reddate23" alt="23일"></li><li class="date24" alt="24일"></li><li class="date25" alt="25일"></li><li class="date26" id="liNowStamp" alt="26일"></li><li class="date27" alt="27일"></li><li class="date28" alt="28일"></li><li class="reddate29" alt="29일"></li><li class="reddate30" alt="30일"></li><li class="date31" alt="31일"></li> 
			</ul> 

			
		</div>
      </div>
    </div>
  </div>
</div>

	<c:import url="../common/footer.jsp"/>
	
	
</body>
</html>