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
	
		text-align: left;
	}
	
	.mtTb{
		/* border: 1px solid black; */
		width: 100%;
		margin-top: 30px;
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
		width: 30%;
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
		width: 35%;
		vertical-align: top;
	}
	
	hr{
		border: 1px solid black;
	}
	
	.sb_btn{
		margin-top: 20px;
		width: 21%;
		color: #fff;
	    background: #5e73de;
	    font-size: 13pt;
	    font-weight:400;
	    margin-left: 0.3em;
	    padding: 0 8px;
	    height: 50px;
	    line-height: 34px;
	    border-radius: 0.3em;
	    border: 0;
	    text-align: center;
	}
	
	.footer{
		margin-top: 200px;
	}
	
	#content{
		margin-top: 30px;
		resize: none;
		width: 100%;
		height: 400px;
		padding: 30px;
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
	<form name="mwrite" id="mwrite" action="${pageContext.request.contextPath}/matching/matchingInsert.ma" method="post" onsubmit="return arrCheck(this);" >
	<div class="insertDiv">
		<div class="titleDiv">
			<h2>매칭 제목</h2>
			<input type="text" name="mWriter" value="${member.userName}" />
			
			<br />
			<input type="text" class="form-control" name="mTitle" id="wr_subject" placeholder="매칭 제목을 작성해주세요."/>
		</div>
		<br /><br />
		<div class="detailDiv">
			<h2 style="float: left;">매칭 조건</h2>
			<span style=" margin-left: 20px">원하시는 조건을 입력해주세요</span>
			<br />
			<div style="border-top: 3px solid black; margin-top: 30px;">
			
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
							<select name="mPeoplenum" >
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
						<td><input type="text" class="form-control"  id="datePic" placeholder="년 - 월 - 일"/>
							<input type="text" class="form-control"  id="timePic" placeholder="시간">
						</td>
						
					</tr>
					
				</tbody>
			</table>
			<h2>세부내용</h2>
			<div style="border-top: 3px solid black; margin-top: 30px;">
				<textarea id="content" name="mContent" placeholder="세부내용을 작성해주세요."></textarea>
			</div>
			</div>
			<center><input type="submit" class="sb_btn" value="작성 완료"></button></center>
			<input type="number" name="categoryId" style="display: none;">
			<input type="text" name="locationId" style="display: none;" />
			<input type="text" name="mtime" style="display: none;" />
		</div>
	</div>
	</form>
	<c:import url="../common/footer.jsp" />
	
<!-- flat -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
	<!-- include summernote css/js -->
	
	<!-- <script src="lang/summernote-ko-KR.js"></script> -->
<script>
$(function(){

	// --------- flatpicker -------- //
	$("#datePic").flatpickr({
		  dateFormat: "Y-m-d",
		  minDate: "today"
	});
	
	$("#timePic").flatpickr({
		enableTime: true,
	    noCalendar: true,
	    dateFormat: "H:i",
	    
	});
	
/* 	// --------- summernute -------- //
	$('#summernote').summernote({
		placeholder: '추가 내용을 입력해주세요.',
		height: '300px',
		lang: 'ko-KR',
			  toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				  
				  ]
	}); */

	// --------- etc -------- //
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

function arrCheck() {
	var bigCat = $('#mtName').val();
	var midCat = $('#event').val();
	var categoryId = 0;
	
	var locCheck = new Object();
	
	locCheck.bigloCation = $('#bigLoc').val();
	locCheck.midloCation = $('#midLoc').val();
	locCheck.smallCategory = $('#smallLoc').val();
	
	var jsonData = JSON.stringify(locCheck);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/location/locationcheck.lc",
		type : "GET",
		traditional : true,
		async: false,
		data : {chkloc:jsonData},
		success : function (data) {
			$('input[name=locationId]').val(data);
			alert("data : " + data);
		},error : function (data) {
			alert("에러발생!");
		}
	})
	
	if(bigCat == '소모임'){
		categoryId = 100;
		if(midCat == '여행'){
			categoryId += 1;
		}else if(midCat == '공연'){
			categoryId += 2;
		}else if(midCat == '음악'){
			categoryId += 3;
		}else if(midCat == '영화'){
			categoryId += 4;
		}else if(midCat == '전시회'){
			categoryId += 5;
		}else if(midCat == '미팅'){
			categoryId += 6;
		}else if(midCat == '미술'){
			categoryId += 7;
		}else{
			categoryId += 0;
		}
	}else if(bigCat == '스포츠'){
		categoryId = 200;
		if(midCat == '농구'){
			categoryId += 1;
		}else if(midCat == '축구'){
			categoryId += 2;
		}else if(midCat == '풋살'){
			categoryId += 3;
		}else if(midCat == '야구'){
			categoryId += 4;
		}else if(midCat == '배구'){
			categoryId += 5;
		}else if(midCat == '탁구'){
			categoryId += 6;
		}else if(midCat == '배드민턴'){
			categoryId += 7;
		}else if(midCat == '볼링'){
			categoryId += 8;
		}else if(midCat == '당구'){
			categoryId += 9;
		}else if(midCat == '테니스'){
			categoryId += 10;
		}else{
			categoryId += 0;
		}
	}else{
		categoryId = 300;
		if(midCat == '리그오브레전드'){
			categoryId += 1;
		}else if(midCat == '피파온라인'){
			categoryId += 2;
		}else if(midCat == '배틀그라운드'){
			categoryId += 3;
		}else if(midCat == '오버워치'){
			categoryId += 4;
		}else if(midCat == '스타크래프트'){
			categoryId += 5;
		}else{
			categoryId += 0;
		}
	}

	$('input[name=categoryId]').val(categoryId);
	
	
	$('input[name=mtime]').val($('#datePic').val() + " " +  $('#timePic').val());

	
	return true;
	
}

</script>
</body>
</html>