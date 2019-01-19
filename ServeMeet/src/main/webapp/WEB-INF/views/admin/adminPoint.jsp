<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>

<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>ServeMeet Administrator</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


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
	<style>
	
		
	
		.pInput{
			padding-bottom :10px;
			z-index : 1;
		}
		
		.footer {
			z-index : 0;
			background-color : white;
		}
		
		.importContent {
			z-index : 1;
		}
	</style>
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
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin/adminPoint.do">
                        <i class="ti-money"></i>
                        <p>포인트 관리</p>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/adminAnnouncement.do">
                        <i class="ti-announcement"></i>
                        <p>공지 관리</p>
                    </a>
                </li>
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
                    <a class="navbar-brand" href="#">포인트 관리</a>
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


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-server"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>총 포인트</p>
                                            <span id="totalPoint" class="counter">P</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-success text-center">
                                            <i class="ti-plus"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>오늘 적립된 포인트</p>
                                            <span id="plusPoint" class="counter">P</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-calendar"></i> Updated now
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-info text-center">
                                            <i class="ti-minus"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>오늘 차감된 포인트</p>
                                            <span id="minusPoint" class="counter">P</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-12">
                        <div class="card" >
                            <div class="header">
                                <h4 class="title">포인트 내역 조회</h4>
                                <p class="category">전체 회원의 포인트 내역을 조회할 수 있습니다.</p>
                            </div>
                            <div class="content">
                            	<div class="importContent">
	                                <c:import url="/point/totalPointList.do"></c:import>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">포인트 적립</h4>
                                <p class="category">회원에게 포인트를 부여할 수 있습니다.</p>
                            </div>
                            <div name="plusPointFrm" id ="pPointForm" >
                            <div class="content">
								<div id="plusIdInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="pNo">회원번호 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<input id="pNo" name="pNo" type="text" class="form-control" placeholder="회원번호를 입력하세요" required>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div id="plusPointInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="pPoint">포인트 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<input id="pPoint" name="pPoint" type="text" class="form-control" placeholder="포인트를 입력하세요" required>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div id="plusMemoInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="pMemo">사유 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<textarea id="pMemo" name="pMemo" class="form-control" required></textarea>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div class="pointButton" align = "center">
	                            	<button id="pPoint" onclick="pButton()" > 확인</button>
	                            </div>
								
                                <div class="footer">
                                    <div class="chart-legend">
                                        
                                    </div>
                                    <hr>
                                    
                                </div>
                            </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title">포인트 회수</h4>
                                <p class="category">회원에게 포인트를 회수할 수 있습니다.</p>
                            </div>
                            <div name="minusPontFrm" id ="mPointForm">
                            <div class="content">
								<div id="minusIdInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="mNo">회원번호 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<input id="mNo" name="mNo" type="text" class="form-control" placeholder="회원번호를 입력하세요" required>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div id="minusPointInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="mPoint">포인트 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<input id="mPoint" name="mPoint" type="text" class="form-control" placeholder="회수할 포인트를 입력하세요" required>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div id="plusMemoInput" class="pInput col-lg-12 col-md-12 col-sm-12 col-xs-12">
								 <div class="row">
									<div class="col-md-2" align="center">
				                      <label class=" control-label" for="mMemo">사유 :</label>
				                    </div>
				                    <div class="col-md-9">
				                    	<div id="userId-container">
				                    		<textarea id="mMemo" name="mMemo" class="form-control" required></textarea>
				                    	</div>
				                    </div>
				                    </div>
								</div>
								<div class="pointButton" align = "center">
	                            	<button id="mPoint" onclick="mButton()" > 확인</button>
	                            </div>
                                <div class="footer">
                                    <div class="chart-legend">
                                        
                                    </div>
                                    <hr>
                                    
                                </div>
                            </div>
                            </div>
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
    	$(document).ready(function(){

    		totalPoint();
    		plusPoint();
    		minusPoint();
    		

        	
        	

    	});
    	
    	function totalPoint() {
    		
    		$.ajax({
	            url  : "${pageContext.request.contextPath}/point/totalPoint.do",
	            data : {},
	            success : function(data){
	            	console.log("point : " +data);
	                $("#totalPoint").html(data+"P");
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
        	});
    		
    	}
    	
		function plusPoint() {
		    		
		    		$.ajax({
			            url  : "${pageContext.request.contextPath}/point/todayPlusPoint.do",
			            data : {},
			            success : function(data){
			            	console.log("point : " +data);
			                $("#plusPoint").html(data+"P");
			            }, error : function(jqxhr, textStatus, errorThrown){
			                console.log("ajax 처리 실패");
			                //에러로그
			                console.log(jqxhr);
			                console.log(textStatus);
			                console.log(errorThrown);
			            }
		        	});
		    	} 
    	
		function minusPoint() {
			
			$.ajax({
		        url  : "${pageContext.request.contextPath}/point/todayMinusPoint.do",
		        data : {},
		        success : function(data){
		        	console.log("point : " +data);
		            $("#minusPoint").html(data+"P");
		        }, error : function(jqxhr, textStatus, errorThrown){
		            console.log("ajax 처리 실패");
		            //에러로그
		            console.log(jqxhr);
		            console.log(textStatus);
		            console.log(errorThrown);
		        }
			});
			
		} 
		
		function pButton(){
			$.ajax({
		        url  : "${pageContext.request.contextPath}/admin/plusPointAdmin.do",
		        data : { pNo : $('#pNo').val(),
		        		 pPoint : $('#pPoint').val(),
		        		 pMemo : $('#pMemo').val()
		        		},
		        success : function(data){
		        	swal("포인트 지급이 완료되었습니다.");
		        	$('#pNo').val("");
		        	$('#pPoint').val("");
		        	$('#pMemo').val("");
		        }, error : function(jqxhr, textStatus, errorThrown){
		            console.log("ajax 처리 실패");
		            //에러로그
		            console.log(jqxhr);
		            console.log(textStatus);
		            console.log(errorThrown);
		        }
			});
		}
		
		function mButton(){
			$.ajax({
		        url  : "${pageContext.request.contextPath}/admin/minusPointAdmin.do",
		        data : { mNo : $("#mNo").val(),
		        		 mPoint : $("#mPoint").val(),
		        		 mMemo : $("#mMemo").val()
		        		},
		        success : function(data){
		        	swal("포인트 차감이 완료되었습니다.");
		        	$("#mNo").val("");
		        	$("#mPoint").val("");
		        	$("#mMemo").val("");
		        }, error : function(jqxhr, textStatus, errorThrown){
		            console.log("ajax 처리 실패");
		            //에러로그
		            console.log(jqxhr);
		            console.log(textStatus);
		            console.log(errorThrown);
		        }
			});
		}
    	

	</script>

</html>
