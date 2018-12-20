<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Restaurant responsive website templates free download for personal and commerical. Download Free Website Template for your great projects.">
    <meta name="keywords" content="restaurant responsive website templates free download,online restaurant website templates,bootstrap restaurant templates free download,restaurant website templates free download html with css, catering website templates free download">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Restaurant Responsive Website Templates Free Download</title>
   
   
   <div class="top-header">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-12 col-md-10 col-sm-8">
                <div class="top-text">
	                <c:if test="${empty member}">
	                	<span class="text-block"  >
	                	    <a class = "btn-link" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberlogin.jsp'">Sign in</a>
	                	</span>
	                	<span class="text-block"  >
	                		<a class = "btn-link" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">Join us</a>
	                	</span>
	                </c:if>
	                <c:if test="${!empty member}">
	                	<span class = "text-block">
	                		<span><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}" title="내정보보기">${member.userName}</a> 님, 안녕하세요</span>
	                		&nbsp;
							<span>
								<a class = "btn-link" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberlogout.do'">LOG OUT</a>
							</span>
	                	</span>
	                </c:if>
                </div>
       
                	
                </div>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                    <div class="logo">
                        <a href="index.html"><img src="resources/images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <!-- navigation -->
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="index.html" title="Home">Home</a></li>
                                <li><a href="menu.html" title="Menu">Menu</a></li>
                                <li class="has-sub"><a href="service-list.html" title="Service List">Service List</a>
                                    <ul>
                                        <li><a href="service-list.html" title="Service List">Service List</a></li>
                                        <li><a href="service-detail.html" title="Service Detail">Service Detail</a></li>
                                    </ul>
                                </li>
                                <li class="has-sub"><a href="blog-default.html" title="Blog">News</a>
                                    <ul>
                                        <li><a href="blog-default.html" title="Blog" >Blog Default</a></li>
                                        <li><a href="blog-single.html" title="Blog Single" >Blog Single</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html" title="Contact Us">Contact</a> </li>
                                <li><a href="styleguide.html" title="Styleguide">styleguide</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</head>
</html>