
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배팅 배팅 배팅</title>



<c:import url="../common/header.jsp" />

<c:set var = "pNumA">${batting.BATTINGPNUMA}</c:set>
<c:set var = "pNumB">${batting.BATTINGPNUMB}</c:set>

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div>
	<c:if test='${batting.BSTATUS eq "N" }'>
		<input type="button" onclick="btnBatting('A');" value="A팀" /> 
		<input type="button" onclick="btnBatting('B');" value="b팀" />
		</c:if>
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="<10></10>0"
				style="width: ${(pNumA/(pNumA + pNumB))*100}%"><fmt:formatNumber value="${(pNumA/(pNumA + pNumB))*100}" pattern=".00"/>% Complete (success)</div>





			<div class="progress-bar progress-bar-info" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: ${(pNumB/(pNumA + pNumB))*100}%"><fmt:formatNumber value="${(pNumB/(pNumA + pNumB))*100}" pattern=".00"/>% Complete (info)</div>
		</div>
	</div>
	
	<div>
		<c:if test='${batting.BSTATUS eq "N" }'>현재 배율</c:if><c:if test='${batting.BSTATUS eq "Y" }'>최종 배율</c:if> : A팀 : <fmt:formatNumber value="${(100-pNumA/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배 &nbsp;B팀 : <fmt:formatNumber value="${(100-pNumB/(pNumA + pNumB)*100)*15/1000 + 1}" pattern=".00"/>배
	</div>
	
	<br><br><br>

		<script>
				
		function btnBatting(battingType){
			swal({
				  title: "100포인트가 차감됩니다.",
				  text: "그래도 계속하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				}).then((willDelete) => {
					  if (willDelete) {
						  $.ajax({
	      					url : "${pageContext.request.contextPath}/point/getPoint.do",
	      					async : false,
	      					success : function(point){
	      						console.log("point : "+point);
	    						if(point <100){
	    							 swal("포인트가 모자랍니다.");
	    							 location.reload(true);
	    						 }else{
	    							 $("#scratchBtn").attr("style","display:none");
	    						 $.ajax({
	    								url : "${pageContext.request.contextPath}/batting/battingPick.ba",
	    								data : {battingId : "${batting.BATTINGID}",
	    										battingType : battingType,
	    										userName : "${member.userName}"
	    										},
	    								async : false,
	    								success : function(data){
	    									if(data == 'success'){
	    										
	    										// 여기 고쳐주세요
	    										// 팀이 선택되었습니다. 뜨고 바로 꺼져요
	    										
	    										location.href='${pageContext.request.contextPath}/point/updatePoint.do?increasePoint=-100&pContent=배팅 포인트 차감';
	    										swal(battingType+"팀이 선택되었습니다.");
	    										location.href='${pageContext.request.contextPath}/batting/battingInfo.ba?no=${batting.BATTINGID}';
	    									} else{
	    										swal("이미 선택한 배팅입니다.")
	    									}
	    									
	    					            }, error : function(jqxhr, textStatus, errorThrown){
	    					                console.log("배팅 ajax 처리 실패");
	    					                //에러로그
	    					                console.log(jqxhr);
	    					                console.log(textStatus);
	    					                console.log(errorThrown);
	    					                swal("이미 선택한 배팅입니다.")
	    					            }
	    							});
	    						 
	    							 
	    						 }

	      						
	      		            }, error : function(jqxhr, textStatus, errorThrown){
	      		                console.log("포인트 얻기ajax 처리 실패");
	      		                //에러로그
	      		                console.log(jqxhr);
	      		                console.log(textStatus);
	      		                console.log(errorThrown);
	      		            }
	      				});
						  } else {
						    return false;
						  }
						});
		}
	</script>
</body>
</html>