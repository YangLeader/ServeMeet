<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" "%>
    

<%
	/* Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  Object level=session.getAttribute("level"); 
  	int ttc = (Integer) session.getAttribute("totalCount"); // 총 방문자 수 
	int tdc = (Integer) session.getAttribute("todayCount"); // 오늘 방문자 수
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int memberCount =(Integer) session.getAttribute("memberCount"); 
	String bo1 = (String)session.getAttribute("pop1Board");
	String bo2 = (String)session.getAttribute("pop2Board");
	String bo3 = (String)session.getAttribute("pop3Board");
	String bo4 = (String)session.getAttribute("pop4Board");
	String bo5 = (String)session.getAttribute("pop5Board");
	
	int pop1 = (Integer) session.getAttribute("pop1Count"); 
	int pop2 = (Integer) session.getAttribute("pop2Count");
	int pop3 = (Integer) session.getAttribute("pop3Count");
	int pop4 = (Integer) session.getAttribute("pop4Count");
	int pop5 = (Integer) session.getAttribute("pop5Count"); */
	

%>

<%-- 
<!DOCTYPE html>
<head>
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
    	<!-- CSS  -->
	<link href="/allRight/resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">

	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

	<!-- JQuery -->
  	<!-- <script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> -->   
	<script src="/allRight/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/superfish.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/owl.carousel.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/animate.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.BlackAndWhite.js"></script>
	<script src="/allRight/resources/js/myscript.js" type="text/javascript"></script>
	
	
	
	
</head>


</html>

 --%>
 
 
 <!doctype html>
<html lang="en">
<head>

	<meta charset="UTF-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>admin page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
  
    <!-- 구글 차트 -->
    <script type="text/javascript"
	  src="https://www.gstatic.com/charts/loader.js"></script>

    <script>
	  google.charts.load('current', {packages: ['corechart', 'bar']});
	  google.charts.setOnLoadCallback(drawBasic);

	  function drawBasic() {

	       var data = google.visualization.arrayToDataTable([
	          ['구분', '방문자 수'],
	          ['총 방문자', ],
	          ['오늘 방문자', ],
	        ]);

	        var options = {
	          title: '',
	          chartArea: {width: '80%'},
	         hAxis: {
	            title: '방문자 수',
	            minValue: 0
	          },
	          vAxis: {
	            title: ' '
	          }
	        };
  
	        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
  
	        chart.draw(data, options);
	      }
	  </script>
	  
	  <!-- 구글 원 차트  -->
	  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['게시판', '클릭수'],
          [],
          [],
          [],
          [],
          []
        ]);

        var options = {
          title: ' '
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>

	
	
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
    	<!-- LOGO -->
            <div class="logo">
                <a href="<%= request.getContextPath() %>/admin.jsp"  class="simple-text">
                <b>A L L</b> R I G H T 
                </a>
            </div><!-- //LOGO -->
           

            <ul class="nav">
                <li class="active">
                    <a href="<%= request.getContextPath() %>/admin.jsp">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                
                <li>
                    <a href="<%= request.getContextPath() %>/selectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>공지 게시판 수정</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/newsSelectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>뉴스 게시판 수정</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/bReportList.ad">
                        <i class="ti-face-sad"></i>
                        <p>신고된 글 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/commentList.co">
                        <i class="ti-face-sad"></i>
                        <p>신고된 댓글 관리</p>
                    </a>
                </li>
               <li>
                    <a href="<%= request.getContextPath() %>/views/admin/newLicense.jsp">
                        <i class="ti-plus"></i>
                        <p>자격증 추가</p>
                    </a>
                </li>
                <!-- 
                <li>
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
                </li> -->
				<li class="active-pro">
                   
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
                    <a class="navbar-brand" href="#">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="loginArea" >
	 <%-- <% if(m != null && m.getUserId().equals("admin")) {%> --%>
		
		<div style="float:left; width:250px;">
		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<div id="userInfo" style = "padding-top:23px;">
			<label><%-- <%= m.getUserName() %> --%>님의 방문을 환영합니다.</label><br>

		</div>
		
		</div>
		
		<div class="btns" style = "float:left; padding-right:15px;">
				<input type="button" class="btn btn-danger" value="로그아웃" onclick="logout()" />
			</div>
			
		</form>

	<%-- <% } else {
	request.setAttribute("msg","관계자 외에 접근이 불가능한 페이지입니다.");
	request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
} %> --%>
	
	</div>
                        
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-warning text-center">
                                            <i class="ti-user"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>회원 수</p>
                                          <%--  <%=memberCount%> --%>
                                          
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
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-success text-center">
                                            <i class="ti-mouse-alt"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>총 방문자 수</p>
                                            <%-- <%= ttc %> --%>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-timer"></i> In the last hour
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-danger text-center">
                                            <i class="ti-home"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>오늘 방문자 수</p>
                                          <%--   <%= tdc %> --%>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer">
                                    <hr />
                                    <div class="stats">
                                        <i class="ti-timer"></i> In the last hour
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="content">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="icon-big icon-info text-center">
                                            <i class="ti-agenda"></i>
                                        </div>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="numbers">
                                            <p>자격증 수</p>
                                            597
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

                    <div class="col-md-12" id="chart">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">방문자 통계</h4>
                                <p class="category">오늘 방문자 수</p>
                            </div>
                            <div class="content">
                                <div id="chart_div" style="width: 100%;"></div>
                                <hr>
                                <div class="stats">
                                   <i class="ti-reload"></i> Updated 3 minutes ago
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">인기 게시판 통계</h4>
                                <p class="category">Board Performance</p>
                            </div>
                            <div class="content">
                            
                            <div id="piechart" style="width: 100%; height: 335px;"></div>
                                <!-- <div id="chartPreferences" class="ct-chart ct-perfect-fourth">
                                
                                <table id="boardTop5" class="top5">
				<thead>
					<tr>
						
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
                                </div> -->

                                <div class="footer">
                                    
                                    <hr>
                                    <div class="stats">
                                        <i class="ti-timer"></i> Updated now
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title">ALLRIGHT</h4>
                                <p class="category">made by 양치는 목장</p>
                            </div>
                            <div class="content">
                                
								<img src="/allRight/resources/images/allright.png" style="width: 100%"/>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
               
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>



	
		<script>
			
		function logout(){
			location.href = "/allRight/mLogout.me";
		}
		
		 $(function(){
				
				$.ajax({
					
					url: '/allRight/cTop5.ca',
					dataType: "json",
					type : "get",
					success : function(data){
						
						$table = $('#boardTop5 tbody');
						
						$("#boardTop5").find("tr:gt(0)").remove();
						
						for(var i in data){
							
							console.log(data[i]);
							var $trBoard = $('<tr>');
							var $tdBoardTitle = $('<td>').text(data[i].ecount);
							
							$trBoard.append($tdBoardTitle);
							
							$table.append($trBoard);
						}
					}, error : function(data){
						
						console.log("top5 조회 실패!");
					}
					
				});
				
			});
		
		</script>


</html>