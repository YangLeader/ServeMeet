<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="pointList">
		  <div class="bbs-list">
						<ul id="bbs-list-ul">
							<li class="bbs_list_top">
								<span class="subject" > 
									<span class="subject_text"> 
										<span class="glyphicon glyphicon-tag"></span> 
											내용
									</span>
								</span> 
								<span class="dec" align="center"> 
									<span class="w45 wr_date" style="width:30%"> 
										<span class="glyphicon glyphicon-time"></span> 
											날짜
										</span> 
									<span class="w45 wr_hit" style="width:30%"> 
										<span class="glyphicon glyphicon-plus-sign"></span> 
											획득
									</span>
									<span class="w45 wr_hit" style="width:30%"> 
										<span class="glyphicon glyphicon-minus-sign"></span> 
											차감
									</span> 
								</span>
							</li>
							<c:forEach items="${list}" var="p">
							<li class="bbs_list_basic" align="center">
								<span class="subject text">
									<a data-mytext="getNo" id="pContent" >
										<b>${p.pContent } 왜 못불러와</b>
									</a>  
									<span class="w45 icon"> </span>
								</span> 
								<span class="dec"> 
									<span class="w45 wr_date" style="width:30%"> 
										<span class="glyphicon glyphicon-time"></span> 
											<c:set var = "time" value = "${p.pDate}" />
											<fmt:formatDate pattern = "yyyy-MM-dd" value = "${time}" />
											
									</span> 
									<span class="w45 wr_hit" id="increasePoint" style="width:30%"> 
										<span class="glyphicon glyphicon-plus-sign"></span>
										<c:set var="point" value="${p.increasePoint}" /> 
										<c:if test ="${point gt 0}">
											${p.increasePoint}
										</c:if>
									</span>
									<span class="w45 wr_hit" id="decreasePoint" style="width:30%"> 
										<span class="glyphicon glyphicon-minus-sign"></span> 
											<c:set var="point" value="${p.increasePoint}" /> 
										<c:if test ="${point lt 0}">
											${p.increasePoint}
										</c:if>
									</span> 
								</span>
							
							</li>
							</c:forEach>
						</ul>
					</div>
    </div>