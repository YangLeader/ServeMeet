<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>

<style>
.orangered, i.orangered {
    color: #5e73de;
}

.count {
    font-size: 11px;
    font-weight: 700;
    font-family: verdana;
    letter-spacing: -1px;
    line-height: 16px;
    padding-right: 1px;
}
</style>

<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Paper Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


	<link href="${pageContext.request.contextPath}/resources/css/adminMember.css"
	rel="stylesheet">
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="${pageContext.request.contextPath}" class="simple-text">
                    ServeMeet
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/admin.do">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/adminMember.do">
                        <i class="ti-user"></i>
                        <p>회원 관리</p>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/reportList.do">
                        <i class="ti-view-list-alt"></i>
                        <p>신고 관리</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/adminMatching.do">
                        <i class="ti-text"></i>
                        <p>매칭 관리</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/adminPoint.do">
                        <i class="ti-pencil-alt2"></i>
                        <p>포인트 관리</p>
                    </a>
                </li>
                <!-- <li>
                    <a href="maps.html">
                        <i class="ti-map"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li> -->
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">신고 관리</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
						<li>
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-settings"></i>
									<p>setting</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a></li>
                              </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <!-- CONTENTS -->
		<div id="content" class="loginlist">
		<div class="c_header">
			<h2>게시글 신고 목록</h2>
			<p class="contxt">신고된 게시글을 블라인드 처리하세요.</p>
		</div>
				
		<ul class="tab_viewrecord" style="margin-bottom: -1px;">
		<!-- [D] 탭 링크 선택시 class 에 on" 추가 -->
			<li class="item1" style="margin-top:2px"><a href="#" class="on">신고 목록</a></li>
			<!-- <li class="item2"><a href="userLoginLog.nhn?m=viewRegistedDevice&token_help=2CLWbLy7InikIdx2" onClick="clickcr(this,'smg.device','','',event);">등록한 기기 목록</a></li> -->
		</ul>
		
		<div class="section">
	        <!-- <div class="all_logout"><a href="javascript:;" class="btn_model" onclick="logoutAll();"><span class="btn6">전체 로그아웃</span></a></div> -->
			<table border="1" class="tbl_row">
			<col width="95"><col width="89"><col width="95"><col width="89"><col width="*"><col width="103"><col width="92">
				<thead>
					<tr>
						<th scope="col" style="width:700px;">제목</th>
						<th scope="col" style="width:110px;">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col" style="width:70px;">조회수</th>
						<th scope="col" style="width:70px;">신고 횟수</th>
						<th scope="col">블라인드 처리</th>
					</tr>
				</thead>
				<tbody>
	        		<c:forEach items="${list}" var="b" >
	        		<c:if test="${b.reportCount ne 0 }">
					<tr id="row_1" style="display:">
						<td>${b.boardTitle }<c:if test="${b.commentCount ne 0 }"><span class="count orangered">&nbsp;&nbsp;+ ${b.commentCount  }</span></c:if></td>
						<td>${b.userName }</td>	
						<td>${b.boardDate }</td>
						<td>${b.boardCount }</td>	
						<td>${b.reportCount }</td>		
						<td><input type="button" name="blind" id="${b.boardNo }" value="블라인드" /></td>
					</tr>		
					</c:if>
					</c:forEach>
	        	</tbody> 
	    	</table> 
		</div> 

	</div>
        


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="http://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="http://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/paper-dashboard.js"></script>

	<script type="text/javascript">
	
    	$('input[name="blind"]').click(function(){
    		
    		var boardNo = $(this).attr("id");
    		
    		console.log(boardNo);
    		
    		var msg = boardNo+'번 글을 블라인드 처리 하시겠습니까?';
    		
    		if (confirm(msg)!=0) {
                 
    			 location.href="${pageContext.request.contextPath}/admin/blindBoard.do?boardNo="+boardNo;
    			 
    			 
    			
            } else {
                
            	return false;
            }
    		
    		 
    	});
    	
	</script>

</html>
