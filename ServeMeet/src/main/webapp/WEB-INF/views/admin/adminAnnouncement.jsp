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

.myBtn{
	cursor: pointer;
}

/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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

	<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">

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
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
                <li>
                    <a href="${pageContext.request.contextPath}/admin/reportList.do">
                        <i class="ti-view-list-alt"></i>
                        <p>신고 관리</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/adminPoint.do">
                        <i class="ti-money"></i>
                        <p>포인트 관리</p>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/adminAnnouncement.do">
                        <i class="ti-announcement"></i>
                        <p>공지 관리</p>
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
                    <a class="navbar-brand" href="#">공지 관리</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
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
		<div id="content" class="content">
		<div class="col-lg-3 col-sm-6" style="margin-left:auto; margin-right:auto;">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-danger text-center">
                                            <i class="ti-alert"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>공지글 수</p>
                                            	
                                            	<span id="totalUser">
                                            	<c:forEach items="${list}" var="b">
                                            	<c:if test="${b.isAnnounce eq 'Y'}" >
                                            	<c:set var="count" value="${count + 1 }"/>
                                            	</c:if>
                                            	</c:forEach>${count } 개
                                            	</span>
                                            	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <br /><br /><br /><br /><br />
                     
        
		<div class="col-md-12">
                        <div class="card">
				<div class="content">
		<div class="c_header">
			<h2>공지글 목록</h2>
			<p class="contxt">공지사항 리스트</p>
		</div>
		
		
		<ul class="tab_viewrecord" style="margin-bottom: -1px;">
		<!-- [D] 탭 링크 선택시 class 에 on" 추가 -->
			<li class="item1" style="margin-top:2px"><a href="#" class="on">공지글 목록</a></li>
			<li class="item2" style="margin-top:2px"><a href="${pageContext.request.contextPath}/admin/announcementForm.do">공지글 작성</a></li>
		</ul>
		
		<div class="section">
	        <!-- <div class="all_logout"><a href="javascript:;" class="btn_model" onclick="logoutAll();"><span class="btn6">전체 로그아웃</span></a></div> -->
			<table border="1" class="tbl_row">
			<col width="700"><col width="110"><col width="80"><col width="80"><col width="80"><col width="80"><col width="80">
				<thead>
					<tr>
						<th scope="col" class="ti-menu-alt"> 제목 (클릭시 내용 확인)</th>
						<th scope="col" class="ti-user"> 작성자</th>
						<th scope="col" class="ti-alarm-clock"> 작성일</th>
						<th scope="col" class="ti-eye"> 조회수</th>
						<th scope="col" class="ti-bell"> 신고 횟수</th>
						<th scope="col" class="ti-pencil-alt"> 공지글 수정</th>
						<th scope="col" class="ti-trash"> 공지글 삭제</th>
					</tr>
				</thead>
				<tbody>
	        		<c:forEach items="${list}" var="b" >
	        		<c:if test="${b.isAnnounce eq 'Y'}" >
					<tr >
						<td><a class="myBtn" name='${b.boardContent }'>${b.boardTitle }<c:if test="${b.commentCount ne 0 }"><span class="count orangered">&nbsp;&nbsp;+ ${b.commentCount  }</span></c:if></a></td>
						<td>${b.userName }</td>	
						<td>${b.boardDate }</td>
						<td>${b.boardCount }</td>	
						<td>${b.reportCount }</td>
						<td><button type="button" name="update" id="${b.boardNo }" class="btn btn-info btn-sm"><span class="ti-pencil-alt"></span> 수정</button></td>
						<td><button type="button" name="blind" id="${b.boardNo }" class="btn btn-info btn-sm"><span class="ti-trash"></span> 삭제</button></td>
					</tr>		
					
					<!-- The Modal -->
					    <div id="myModal" class="modal">
					 
					      <!-- Modal content -->
					      <div class="modal-content">
					        <span class="close">&times;</span>                                                 
					        <pre></pre>
					      </div>
					 
					    </div>
					   </c:if>
					</c:forEach>
	        	</tbody> 
	    	</table> 
		</div> 
		<div class="pager">
			<c:out value="${pageBar}" escapeXml="false"/>
					
		</div>
		
	</div>
	</div>
	
	</div>
	</div>
	
	
	
	
	
    
 
    
	
        


        <footer class="footer">
            
                
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="${pageContext.request.contextPath}">Serve Meet</a>
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

    <!--   Google Maps Plugin    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script> -->

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/paper-dashboard.js"></script>

	<script type="text/javascript">
	
    	$('button[name="blind"]').click(function(){
    		
    		var boardNo = $(this).attr("id");
    		
    		var msg ='공지글을 삭제 하시겠습니까?';
    		
    		swal({
  			  title: "공지글 삭제",
  			  text: msg,
  			  icon: "warning",
  			  buttons: true,
  			  dangerMode: true,
  			  closeOnClickOutside: false
  			}).then((willDelete) => {
  				if(willDelete){
  					location.href="${pageContext.request.contextPath}/admin/announceDelete.do?boardNo="+boardNo;
  				}else {
  				    return false;
  				 }
  			});
    		
    		
    	});
    	
    	$('button[name="update"]').click(function(){
    		
    		var boardNo = $(this).attr("id");
    		
    		location.href="${pageContext.request.contextPath}/admin/announceUpdateView.do?no="+boardNo;
    		
    	});
    	
    	// Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        $('.myBtn').click(function() {
        	
        	var content = $(this).attr('name');
        	
        	console.log(content);
        	
        	$('.modal-content pre').html(content);
        	
        	$('#myModal').addClass('animated fadeIn');
        	
            modal.style.display = "block";
        });
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        
		
	</script>

</html>
