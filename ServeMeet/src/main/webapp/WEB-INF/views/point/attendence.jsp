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
		.title{
		margin-top : 10px;
		  height :200px;
		 padding : 20px;
		  width : 1000px;
		}
		.month{
		height : 90px;
		font-size : 50px;
		}
		.chkBtn{
		height : 90px;
		}
		.cal{
		height : 1200px;
		width : 1600px;
		margin-left : auto;
		margin-right : auto;
		}
		table{
		border : 1px solid #bcbcbc;
		width : 1000px;
		height : 800px; 
		}
		th{
		border : 1px solid #bcbcbc;
		width: 150px;
		height:30px;
		text-align : center;
		}
		
		td {
		border : 1px solid #bcbcbc;
		width: 150px;
		height:100px;
		text-align : center;
		}
	</style>
</head>
<body>
<form id = attendFrm method="post">


          <h2 class="page-title"> 출석체크</h2>
          <p> 출석체크를 위한 페이지 입니다. </p>

	<div class="cal" align = "center">
	  <div class="title"> 
	      <div class = "month">
		      <span >1월 출석체크</span>
		  </div>
		  <div class = "chkBtn">
		      <button class="btn-lg btn-default" onclick="attend(<%=today%>);">출석하기</button>
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
          <td></td>
          <td></td>
          <td id="date01">1</td>
          <td id="date02">2</td>
          <td id="date03">3</td>
          <td id="date04">4</td>
          <td id="date05">5</td>
        </tr>
        <tr>
          <td id="date06">6</td>
          <td id="date07">7</td>
          <td id="date08">8</td>
          <td id="date09">9</td>
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
          <td></td>
          <td></td>
        </tr>
      </tbody>
      
    </table>
     </div>

	<c:import url="../common/footer.jsp"/>
	</form>
	<script>
		var attFlag=false;
	
		function attend(today){
			/* if(){
				alert("로그인 후 이용해 주세요.");
				location.href="${pageContext.request.contextPath}/member/memberLoginView.do";
			}
			
			
			/* var url = "${pageContext.request.contextPath}/point/pointAttend.do?increasePoint=1";
			$("#attendFrm").attr("action",url).submit(); */
			
			$.ajax({
				url : "${pageContext.request.contextPath}/point/pointAttend.do",
				data : {increasePoint : 1,
						pContent : "출석체크 포인트"
						},
				success : function(data){
					console.log("data : " +data);
					if(data==1){
					$("#date"+today).html("<img src='${pageContext.request.contextPath}/resources/images/date-check.png'>");
					attFlag = true;
					}else{
						alert("이미 출석하셨습니다.");
					}
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
</body>
</html>