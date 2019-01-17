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
		<div id="content" class="content">
		
                    
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
			<li class="item1" style="margin-top:2px"><a href="${pageContext.request.contextPath}/admin/adminAnnouncement.do">공지글 목록</a></li>
			<li class="item2" style="margin-top:2px"><a href="#" class="on">공지글 작성</a></li>
		</ul>
		
		<div class="section">
	        <div id="wrapper">
	
		<div class="container" style="background-color:white; border-radius: 20px;">
		<br />
			<!--
		<div class="row">	
			
			<div class="leftBox col-md-3">
				로그인 박스
			</div>
			

			<div class="rightBox col-md-9">
			-->
			<!-- skin : _basic -->
			<form name="fwrite" id="fwrite" action="${pageContext.request.contextPath }/admin/boardFormEnd.do"
					 method="post" enctype="multipart/form-data">
				<!-- <input type="hidden" name="uid" value="18122113471404"> 
				<input type="hidden" name="w" value=""> 
				<input type="hidden" name="bo_table" value="funny"> 
				<input type="hidden" name="wr_id" value="0"> 
				<input type="hidden" name="sca" value=""> 
				<input type="hidden" name="sfl" value="">
				<input type="hidden" name="stx" value=""> 
				<input type="hidden" name="spt" value=""> 
				<input type="hidden" name="sst" value=""> 
				<input type="hidden" name="sod" value=""> 
				<input type="hidden" name="page" value="">
				<input type="hidden" value="html1" name="html"> -->
				<div class="bbs_title_wrap">
					<a class="bbs_title">게시글 작성 </a> 
					<!-- <span class="btn btn-default" onclick="history.back();" style="margin-left: 5px;">취소</span> -->
				</div>

				<div class="bbs_write_content">

					<script>
					$(document).ready(function() {
						for (var i = 0; i < $('#ca_name option').size(); i++) {
							$('#ca_name option:eq('+ i + ')').html(
								$('#ca_name option:eq('+ i + ')').text() + "&nbsp;&nbsp;");
						}
					});
					</script>

					<div class="wr_option wr_subject">
						<label>제목</label> 
						<input type="text" name="boardTitle" id="wr_subject" class="form-control" value="[공지]" required maxlength="65" />
						<label>작성자</label>
						<input type="text" class="form-control" name="userName" value="${member.userName}" readonly required>
						
						<input type="hidden" class="form-control" name="isAnnounce" value="Y">
					</div>

					<div class="wr_option wr_content">
						<label>내용</label>
						<div>
							<textarea id="wr_content" name="boardContent"
							class="smarteditor2 form-control" maxlength="65536"
							style="width: 100%; height: 300px; resize: none;"></textarea>
								
						</div>

						<div class="wr_option">
							<label>첨부파일 1</label> <input type="file" name="upFile"
								title="파일첨부 1 : 용량 10MB 이하만 업로드 가능">
						</div>
						<div class="wr_option">
							<label>첨부파일 2</label> <input type="file" name="upFile"
								title="파일첨부 2 : 용량 10MB 이하만 업로드 가능">
						</div>
						<div class="wr_option">
							<label>첨부파일 3</label> <input type="file" name="upFile"
								title="파일첨부 3 : 용량 10MB 이하만 업로드 가능">
						</div>

					</div>
					<div class="wr_submit">
						<input type="submit" class="btn btn-info" name="submitButton" value="확인" />
						<a href="${pageContext.request.contextPath}/admin/adminAnnouncement.do" class="btn btn-default">취소</a>
					</div>
				</div>
				<br /><br /><br /><br />
			</form>

				<script>
					$('#fwrite').submit(function(){
						
						
						
						var wr_content = $('#wr_content').val();
						
						console.log(wr_content);

						if( wr_content == ""  || wr_content == null || wr_content == '&nbsp;' || wr_content == '<p>&nbsp;</p>' || wr_content == '<br>')  {
					             alert("내용을 입력하세요.");
					             
					             $('#wr_content').focus(); //포커싱
						
						}else {
							
							$('#fwrite').submit();
							
						}
						
						return false;
					});
					
					function html_auto_br(obj) {
						if (obj.checked) {
							result = confirm("자동 줄바꿈을 하시겠습니까?\n\n자동 줄바꿈은 게시물 내용중 줄바뀐 곳을<br>태그로 변환하는 기능입니다.");
							if (result)
								obj.value = "html2";
							else
								obj.value = "html1";
						} else
							obj.value = "";
					}


					/*
					$(document).ready(function(){
						
						// 모바일에서 스마트에디터2 width 자동조절
						var get_SE_innerElement = "";
						var chk_SE_count = 0;
						var chk_SE_innerElement = setInterval(function(){
							
							get_SE_innerElement = document.getElementsByTagName("iframe")[0].contentWindow.document.getElementById("smart_editor2");

							chk_SE_count++;

							if (get_SE_innerElement == null) {
								if (chk_SE_count == 100) {
									// 10초가 지나도 자동조절 안되면 새로고침 유도
									alert("자바스크립트 오류입니다. 새로고침 해주세요.");
								}
							}
							else {
								clearInterval(chk_SE_innerElement);
								// console.log("로딩완료");
								get_SE_innerElement.style.minWidth = "100%";
								// console.log(get_SE_innerElement);
							}
						}, 100);

					});
					 */
				</script>
				<!--</div>-->
				<!-- .rightBox -->
				<!--</div>-->
				<!-- .row -->
		</div>
		<!-- .container -->
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

	
	

</html>
