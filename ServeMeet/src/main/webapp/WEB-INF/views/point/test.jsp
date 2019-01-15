<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/adminMember.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board_style.css">
</head>
	<div class="section">
	        <!-- <div class="all_logout"><a href="javascript:;" class="btn_model" onclick="logoutAll();"><span class="btn6">전체 로그아웃</span></a></div> -->
			<table border="1" class="tbl_row">
			<col width="10%"><col width="40%"><col width="15%"><col width="15%"><col width="10%"><col width="10%">
				<thead>
					<tr>
						<th scope="col" class="ti-user"> 회원번호 </th>
						<th scope="col" class="ti-menu-alt"> 내용</th>
						<th scope="col" class="ti-alarm-clock"> 적립일</th>
						<th scope="col" class="ti-plus"> 획득포 인트</th>
						<th scope="col" class="ti-minus"> 차감 포인트</th>
					</tr>
				</thead>
				<tbody>
	        		<c:forEach items="${list}" var="p" >
					<tr>
						<td>${p.userNo }</td>
						<td>${p.pContent }</td>	
						<td>
							<c:set var = "time" value = "${p.pDate}" />
							<fmt:formatDate pattern = "yyyy-MM-dd" value = "${time}" />
						</td>
						<td>
							<c:set var="point" value="${p.increasePoint}" /> 
								<c:if test ="${point gt 0}">
									${p.increasePoint}
								</c:if>
						</td>	
						<td>
							<c:set var="point" value="${p.increasePoint}" /> 
								<c:if test ="${point lt 0}">
									${p.increasePoint}
								</c:if>
						</td>		
						
					</tr>
					</c:forEach>
	        	</tbody> 
	    	</table>
	    	
	    	<div class="pager">
				<c:out value="${pageBar}" escapeXml="false"/>
			</div> 
		</div> 