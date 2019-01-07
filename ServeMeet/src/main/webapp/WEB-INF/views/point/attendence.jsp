<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.text.*"  %>
<%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd");
 String today = formatter.format(new java.util.Date());

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출석체크</title>
	<c:import url="../common/header.jsp"/>
	<style>
		.frame{
        	background-color : white;
        	margin-left : 15%;
        	margin-right : 15%;
        	height : 1600px;
        }
        
		.title{
		margin-top : 10px;
		  height :200px;
		 padding : 20px;
		  width : 100%;
		}
		
		.month{
		height : 90px;
		font-size : 50px;
		}
		
		.chkBtn{
		height : 90px;
		}
		
		.cal{
		height : 750px;
		width : 100%;
		margin-left : auto;
		margin-right : auto;
		}
		
		#checkImg{
		height : 80%;
		width : 80%;
		}
		
		table{
		border : 5px solid #265a88;
		width : 70%;
		height : 100%; 
		border-radius: 10px;
		}
		
		th{
		border : 1px solid #bcbcbc;
		width: 150px;
		height:30px;
		text-align : center;
		background-color : #337ab7;
		}
		
		td {
		border : 1px solid #bcbcbc;
		width: 150px;
		height:100px;
		text-align : center;
		/* background-color : #afc0f1; */
		}
		
		.blank{
		background-color : #F2F2F2;
		}
		
		.btn-primary{
		font-size : 25px;
		}
		
		p{
		font-size : 17px;
		}
		
		.msgBox{
         	width : 70%;
         	height : 170px;
         	border-radius:10px;
         	border : 1px solid #265a88;
         	padding :10px;
         	text-align : left;
         	background-color : #E0ECF8;
         }
		
	</style>
</head>
<body>
<div class="frame" >
<!-- <form id = attendFrm method="post" > -->

	<br>
	<br>
	<div class="cal" align = "center">
	  <div class="title"> 
      <div class = "month">
      <span>1월의 출석체크</span>
      <br><br>
      <p>매일매일 출석하고 포인트 받아가세요!</p>
      </div>
      <div class = "chkBtn">
      <a class="btn btn-primary" onclick="attend(<%=today%>);">출석하기</a>
      </div>
      </div>
      <table>
      <thead>
        <tr>
          <th>일</th>
          <th>월</th>
          <th>화</th>
          <th>수</th>
          <th>목</th>
          <th>금</th>
          <th>토</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td class="blank"></td>
          <td class="blank"></td>
          <td id="date1">1</td>
          <td id="date2">2</td>
          <td id="date3">3</td>
          <td id="date4">4</td>
          <td id="date5">5</td>
        </tr>
        <tr>
          <td id="date6">6</td>
          <td id="date7">7</td>
          <td id="date8">8</td>
          <td id="date9">9</td>
          <td id="date10">10</td>
          <td id="date11">11</td>
          <td id="date12">12</td>
        </tr>
        <tr>
          <td id="date13">13</td>
          <td id="date14">14</td>
          <td id="date15">15</td>
          <td id="date16">16</td>
          <td id="date17">17</td>
          <td id="date18">18</td>
          <td id="date19">19</td>
        </tr>
        <tr>
          <td id="date20">20</td>
          <td id="date21">21</td>
          <td id="date22">22</td>
          <td id="date23">23</td>
          <td id="date24">24</td>
          <td id="date25">25</td>
          <td id="date26">26</td>
        </tr>
        <tr>
          <td id="date27">27</td>
          <td id="date28">28</td>
          <td id="date29">29</td>
          <td id="date30">30</td>
          <td id="date31">31</td>
          <td class ="blank"></td>
          <td class ="blank"></td>
        </tr>
      </tbody>
      
    </table>
    	<br><br>
      <div class ="msgBox">
	  	<h3><b>&nbsp;꼭 확인하세요!</b></h3>
	  	<ul>
	  		<li>출석체크는 1일 1회 참여 가능합니다.</li>
	  		<li>당첨 포인트는 실시간으로 적립됩니다.</li>
	  		<li>포인트 적립은 마이페이지에서 확인하실 수 있습니다.</li>
	  		<li>포인트 적립은 운영방침에 따라서 매주 달라질 수 있습니다.</li>
	  	</ul>
	  </div>
     </div>
<br><br>
	
<!-- 	</form> -->
	</div>
	<c:import url="../common/footer.jsp"/>
	<script>
	var attFlag=false;
	
	$(document).ready(function(){
		var today = new Date();
		var dd = (today.getDate());
		$.ajax({
			
			url : "${pageContext.request.contextPath}/point/attStamp.do",
			data : {},
			success : function(data){
				console.log("data :" + data);
				console.log("today : " +dd);
				for(var i = 1; i<=data[0]; i++){
				$("#date"+data[i]).html("<img id='checkImg' src='${pageContext.request.contextPath}/resources/images/date-check.png'>");
				if(data[i]==dd){attFlag = true;}

				console.log("attFlag :" + attFlag);
				}
			}, error : function(jqxhr, textStatus, errorThrown){
                console.log("ajax 이거실패임? 처리 실패");
                //에러로그
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
            }
			
		});
		
	})
	
		
	
		function attend(today){
			if(attFlag==true){
				swal("이미 출석하셨습니다.");
			}else{
			
			$.ajax({
				url : "${pageContext.request.contextPath}/point/pointAttend.do",
				data : {increasePoint : 10,
						pContent : "출석체크 포인트"
						},
				success : function(data){
					console.log("data : " +data);
					$("#date"+today).html("<img id='checkImg' src='${pageContext.request.contextPath}/resources/images/date-check.png'> ");
					attFlag = true;
					swal("출석되었습니다.","내일도 출석해주세요!","success");
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            }
			});
			}
			}
		
	</script>
</body>
</html>