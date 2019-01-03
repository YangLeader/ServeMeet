<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>매칭등록</title>
<style>
	h1{
		text-align: center;
	}
	
	.insertDiv{
		margin: auto;
		text-align: center;
		/* border: 1px solid black; */
		width: 80%;
		height: 1000px;
	}
	
	.titleDiv{
		margin: auto;
		width: 95%;
		text-align: left;
		/* border:1px solid black; */
	}
	
	.detailDiv{
		margin: auto;
		width: 95%;
		/* border:1px solid black; */
		text-align: left;
	}
	
	.mtTb{
		/* border: 1px solid black; */
		width: 100%;
		border-top: 3px solid black;
	}
	
	.mtH{
		padding-left: 10px;
		vertical-align: top;
		width: 200px;
	}
	
	#wr_subject{
		height: 2.5em;
		font-size: 20px;
		color: black;
	}
	
	#mt_subject{
		height: 2.5em;
		font-size: 10px;
		color: black;
	}
	
	#datePic{
		display: inline-block;
		background: white;
		height: 2.5em;
		font-size: 12px;
		color: black;
		width: 20%;
		float: left;
	}
	#timePic{
		margin-left: 10px;
		display: inline-block;
		background: white;
		height: 2.5em;
		font-size: 12px;
		color: black;
		width: 20%;
	}
	#mtContent{
		background: white;
		height: 300px;
		font-size: 12px;
		color: black;
		width: 100%;
		resize: none;
	}
	tr{
		height: 80px;
	}
	
	td{
		vertical-align: top;
	}
	
	hr{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<header>
		<c:import url="../common/header.jsp" />
	</header>
	<br><br>
	<h1>매칭등록</h1>
	<br /><br />
	<div class="insertDiv">
		<div class="titleDiv">
			<h2>매칭 제목</h2>
			<br />
			<input type="text" class="form-control" name="mathingTitle" id="wr_subject" placeholder="매칭 제목을 작성해주세요."/>
		</div>
		<br /><br />
		<div class="detailDiv">
			<h2 style="float: left;">매칭 조건</h2>
			<span style=" margin-left: 20px">원하시는 조건을 입력해주세요</span>
			<br />
			<table class="mtTb">
				<tbody>
					<tr>
						<th class="mtH">매칭 종류</th>
						<td>
							<select name="mathingName" id="mtName">
								<option value="소모임">소모임</option>
								<option value="스포츠">스포츠</option>
								<option value="E스포츠">E-스포츠</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="mtH">분류</th>
						<td>
							<select name="mathingEvent" id="event">
								<option value="여행">여행</option>
								<option value="공연">공연</option>
								<option value="음악">음악</option>
								<option value="영화">영화</option>
								<option value="전시회">전시회</option>
								<option value="미팅">미팅</option>
								<option value="미술">미술</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="mtH">모집 인원</th>
						<td>
							<select name="mathingPerson" >
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
								<option value="7">7명</option>
								<option value="8">8명</option>
								<option value="9">9명</option>
								<option value="10">10명</option>
								<option value="11">11명</option>
								<option value="12">12명</option>
								<option value="13">13명</option>
								<option value="14">14명</option>
								<option value="15">15명</option>
								<option value="16">16명</option>
								<option value="17">17명</option>
								<option value="18">18명</option>
								<option value="19">19명</option>
								<option value="20">20명</option>
								<option value="21">21명</option>
								<option value="22">22명</option>
								<option value="23">23명</option>
								<option value="24">24명</option>
								<option value="25">25명</option>
								<option value="25">25명</option>
								<option value="26">26명</option>
								<option value="27">27명</option>
								<option value="28">28명</option>
								<option value="29">29명</option>
								<option value="30">30명</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="mtH">장소</th>
						<td>
							<select name="mathingBig" id="bigLoc">
								<option value="시도" selected="selected">시/도</option>
								<option value="서울특별시">서울특별시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="세종특별자치시">세종특별자치시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="경기도">경기도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
								<option value="전라남도">전라남도</option>
								<option value="전라북도">전라북도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
								<option value="강원도">강원도</option>
								<option value="제주특별자치도">제주특별자치도</option>
							</select>
							<select name="mathingMid" id="midLoc">
								<option value="시구군">시/구/군</option>
							</select>
							<select name="mathingSmall" id="smallLoc">
								<option value="읍면동">읍/면/동</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="mtH">날짜</th>
						<td><input type="text" class="form-control" id="datePic" placeholder="년-월-일"/>
							<input type="text" class="form-control" id="timePic" placeholder="시간">
						</td>
						
					</tr>
					<tr>
						<th class="mtH">세부 내용</th>
						<td>
							<textarea class="form-control" id="mtContent" placeholder="추가 내용을 입력해주세요."></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp" />
	<!-- flat -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
/* $("#datePic").datepicker({

	dateFormat: "yy-mm-dd",
	monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear : true,
    
   	onSelect: function (selected) {
		console.log(selected);
	}

});	 */


	$("#datePic").flatpickr({
		  dateFormat: "Y-m-d",
		  minDate: "today"
	});
	
	$("#timePic").flatpickr({
		enableTime: true,
	    noCalendar: true,
	    dateFormat: "H:i",
	    
	});
$(function () {	
	
	$('#mtName').change(function () {
		var mtN = $('#mtName option:selected').val();
		console.log(mtN);
		if(mtN == '소모임'){
			circleSelBox();
		}else if(mtN == '스포츠'){
			sportsSelBox();
		}else if(mtN == 'E스포츠'){
			eSportsSelBox();
		}
	});
	
	$('#bigLoc').change(function () {
		var bigLoc = $('#bigLoc option:selected').val();
		console.log(bigLoc);
		if(bigLoc == '시도'){
			$('#midLoc').empty();
			$('#midLoc').append("<option value='시구군'>시/구/군</option>");
		}else{		
			$.ajax({
				url : "${pageContext.request.contextPath}/location/midLocation.do",
				type : "GET",
				dataType : "JSON",
				data : { bloc : bigLoc},
				success : function (data) {
					console.log(data);
					
					$('#midLoc').empty();
					$('#midLoc').append("<option value='시구군'>시/구/군</option>");
					for(var i in data){
						
						$('#midLoc').append("<option value='"+data[i]+"'>"+data[i]+"</option>");
						
					}
					
					//smallSelBox();
				}, error : function (data) {
					console.log("에러발생");
				}
			})
		}
	});
	
	
});

$(function () {
	$('#midLoc').change(function () {
		var midLoc = $('#midLoc option:selected').val();
		console.log(midLoc);
		
		if(midLoc == '시구군'){

			$('#smallLoc').empty();
			$('#smallLoc').append('<option value="읍면동">읍/면/동</option>');
		}else{
			$.ajax({
				url : '${pageContext.request.contextPath}/location/smallLocaion.do',
				type : 'GET',
				dataType : 'JSON',
				data : {sloc:midLoc},
				success : function (data) {
					console.log(data);
					
					$('#smallLoc').empty();
					$('#smallLoc').append('<option value="읍면동">읍/면/동</option>');
					
					for(var i in data){
						$('#smallLoc').append("<option value='"+data[i]+"'>"+data[i]+"</option>");
					}
				},error : function (data) {
					console.log("에러발생2!");
				}
			})
		}
	});
});

function circleSelBox() {
	var circles = ["여행","공연","음악","영화","전시회","미팅","미술","기타"];
	$('#event').empty();
	for(var i in circles){		
		$('#event').append("<option value='"+circles[i]+"'>"+circles[i]+"</option>");
	}
}

function sportsSelBox() {
	var sprots = ["농구","축구","풋살","야구","배구","탁구","배드민턴","볼링","당구","테니스","기타"];
	$('#event').empty();
	for(var i in sprots){		
		$('#event').append("<option value='"+sprots[i]+"'>"+sprots[i]+"</option>");
	}
}

function eSportsSelBox() {
	var eSports = ["리그오브레전드","피파온라인","배틀그라운드","오버워치","스타크래프트","기타"];
	$('#event').empty();
	for(var i in eSports){		
		$('#event').append("<option value='"+eSports[i]+"'>"+eSports[i]+"</option>");
	}
}
</script>
</body>
</html>