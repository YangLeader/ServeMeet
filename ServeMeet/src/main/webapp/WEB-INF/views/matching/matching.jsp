<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!-- 	<label for="ck1"><input type="checkbox" id="ck1" value="test">test</label>
	<label for="ck2"><input type="checkbox" id="ck2" value="test2">test2</label> -->



<div class="out">
	<!-- <div class="schDiv">
		<div class="schListDiv">
			<div class="schObj">
				<div class="schCat">소모임 - 여행</div>
				<div class="greyRule"></div>
				<div class="schTit">새로운 타이틀입니다~~~~</div>

				<div class="schLoc">경기도 고양시 덕양구 화정동</div>
				<div class="schTime">2019-01-01 12:00</div>
			</div>
			<div class="schObj">
				<div class="schCat">소모임 - 여행</div>
				<div class="greyRule"></div>
				<div class="schTit">새로운 타이틀입니다~~~~</div>

				<div class="schLoc">경기도 고양시 덕양구 화정동</div>
				<div class="schTime">2019-01-01 12:00</div>
			</div>
			<div class="schObj">
				<div class="schCat">소모임 - 여행</div>
				<div class="greyRule"></div>
				<div class="schTit">새로운 타이틀입니다~~~~</div>

				<div class="schLoc">경기도 고양시 덕양구 화정동</div>
				<div class="schTime">2019-01-01 12:00</div>
			</div>
			<div class="schObj">
				<div class="schCat">소모임 - 여행</div>
				<div class="greyRule"></div>
				<div class="schTit">새로운 타이틀입니다~~~~</div>

				<div class="schLoc">경기도 고양시 덕양구 화정동</div>
				<div class="schTime">2019-01-01 12:00</div>
			</div>
		</div>
		<div class="backDiv">
			<button class="backbtn">다른 조건으로 검색하기</button>
		
		</div>
	</div> -->
	<div class="category">
		<div class="condition on" id="loc" onclick="selectlocCategory()">
			<span>지역</span>
		</div>
		<div class="condition" id="cate" onclick="selectkindsCategory()">
			<span>매칭 종류</span>
		</div>
		<div class="condition" id="person" onclick="selectpersonCategory()">
			<span>인원</span>
		</div>
		<div class="condition" id="cal" onclick="selectdateCategory()">
			<span>날짜</span>
		</div>
		<input type="hidden" id="mName" value="${member.userName }"/>
		<a href="${pageContext.request.contextPath }/matching/matchingInsertView.ma"  class="submit_btn">+ 새 매칭등록</a>

	</div>
	<div class="in scrollbar-primary scrollbar" id="location" style="position: relative;">
	<div class="over" style="display: none">
		지역선택 불가
	</div>
		<ul class="itemframe">
			<li class="item" id="서울특별시"><span class="sca">서울특별시</span></li>
			<li class="item" id="경기도"><span class="sca">경기도</span></li>
			<li class="item" id="인천광역시"><span class="sca">인천광역시</span></li>
			<li class="item" id="대전광역시"><span class="sca">대전광역시</span></li>

			<li class="item" id="세종특별자치시"><span class="sca">세종특별자치시</span></li>
			<li class="item" id="충청남도"><span class="sca">충청남도</span></li>

			<li class="item" id="충청북도"><span class="sca">충청북도</span></li>
			<li class="item" id="광주광역시"><span class="sca">광주광역시</span></li>

			<li class="item" id="전라남도"><span class="sca">전라남도</span></li>
			<li class="item" id="전라북도"><span class="sca">전라북도</span></li>
			<li class="item" id="대구광역시"><span class="sca">대구광역시</span></li>
			<li class="item" id="경상북도"><span class="sca">경상북도</span></li>
			<li class="item" id="부산광역시"><span class="sca">부산광역시</span></li>
			<li class="item" id="울산광역시"><span class="sca">울산광역시</span></li>
			<li class="item" id="경상남도"><span class="sca">경상남도</span></li>
			<li class="item" id="강원도"><span class="sca">강원도</span></li>
			<li class="item" id="제주특별자치도"><span class="sca">제주특별자치도</span></li>
		</ul>
	</div>
	
	<div class="in scrollbar-primary scrollbar" id="midDiv">
		<br /> &nbsp; ← 지역을 선택해주세요.
	</div>
	<div class="in scrollbar-primary scrollbar" id="smallDiv"></div>
	<div class="in" id="kindsDiv" style="display: none">
		<ul class="itemframe2">
			<li class="item2"><label for='kd1'><input type="radio" name="kdra" class="kd" id="kd1" value="소모임" />소모임</label></li>
			<li class="item2"><label for='kd2'><input type="radio" name="kdra" class="kd" id="kd2" value="스포츠" />스포츠</label></li>
			<li class="item2"><label for='kd3'><input type="radio" name="kdra" class="kd" id="kd3" value="E-스포츠" />E-스포츠</label></li>
		</ul>
	</div>
	<div class="in" id="detailKindsDiv" style="display: none">
		<ul class="itemframe3" id="dekd1" >
			<li class="item2in1"><label for='dekd101'><input type="radio" name="dekdra" class="dekd" id="dekd101" value="여행" />여행</label></li>
			<li class="item2in1"><label for='dekd102'><input type="radio" name="dekdra" class="dekd" id="dekd102" value="공연" />공연</label></li>
			<li class="item2in1"><label for='dekd103'><input type="radio" name="dekdra" class="dekd" id="dekd103" value="음악" />음악</label></li>
			<li class="item2in1"><label for='dekd104'><input type="radio" name="dekdra" class="dekd" id="dekd104" value="영화" />영화</label></li>
			<li class="item2in1"><label for='dekd105'><input type="radio" name="dekdra" class="dekd" id="dekd105" value="전시회" />전시회</label></li>
			<li class="item2in1"><label for='dekd106'><input type="radio" name="dekdra" class="dekd" id="dekd106" value="미팅" />미팅</label></li>
			<li class="item2in1"><label for='dekd107'><input type="radio" name="dekdra" class="dekd" id="dekd107" value="미술" />미술</label></li>
			<li class="item2in1"><label for='dekd100'><input type="radio" name="dekdra" class="dekd" id="dekd100" value="기타" />기타</label></li>
		</ul>

		
		<ul class="itemframe3" id="dekd2" style="display: none">
			<li class="item2in1"><label for='dekd201'><input type="radio" name="dekdra" class="dekd" id="dekd201" value="농구" />농구</label></li>
			<li class="item2in1"><label for='dekd202'><input type="radio" name="dekdra" class="dekd" id="dekd202" value="축구" />축구</label></li>
			<li class="item2in1"><label for='dekd203'><input type="radio" name="dekdra" class="dekd" id="dekd203" value="풋살" />풋살</label></li>
			<li class="item2in1"><label for='dekd204'><input type="radio" name="dekdra" class="dekd" id="dekd204" value="야구" />야구</label></li>
			<li class="item2in1"><label for='dekd205'><input type="radio" name="dekdra" class="dekd" id="dekd205" value="배구" />배구</label></li>
			<li class="item2in1"><label for='dekd206'><input type="radio" name="dekdra" class="dekd" id="dekd206" value="탁구" />탁구</label></li>
			<li class="item2in1"><label for='dekd207'><input type="radio" name="dekdra" class="dekd" id="dekd207" value="배드민턴" />배드민턴</label></li>
			<li class="item2in1"><label for='dekd208'><input type="radio" name="dekdra" class="dekd" id="dekd208" value="볼링" />볼링</label></li>
			<li class="item2in1"><label for='dekd209'><input type="radio" name="dekdra" class="dekd" id="dekd208" value="당구" />당구</label></li>
			<li class="item2in1"><label for='dekd210'><input type="radio" name="dekdra" class="dekd" id="dekd210" value="테니스" />테니스</label></li>
			<li class="item2in1"><label for='dekd200'><input type="radio" name="dekdra" class="dekd" id="dekd200" value="기타" />기타</label></li>
		</ul>


		<ul class="itemframe3" id="dekd3" style="display: none">
			<li class="item2in1"><label for='dekd301'><input type="radio" name="dekdra" class="dekd" id="dekd301" value="리그오브레전드" />리그오브레전드</label></li>
			<li class="item2in1"><label for='dekd302'><input type="radio" name="dekdra" class="dekd" id="dekd302" value="피파온라인" />피파온라인</label></li>
			<li class="item2in1"><label for='dekd303'><input type="radio" name="dekdra" class="dekd" id="dekd303" value="배틀그라운드" />배틀그라운드</label></li>
			<li class="item2in1"><label for='dekd304'><input type="radio" name="dekdra" class="dekd" id="dekd304" value="오버워치" />오버워치</label></li>
			<li class="item2in1"><label for='dekd305'><input type="radio" name="dekdra" class="dekd" id="dekd305" value="스타크래프트" />스타크래프트</label></li>
			<li class="item2in1"><label for='dekd300'><input type="radio" name="dekdra" class="dekd" id="dekd300" value="기타" />기타</label></li>
		</ul>
	</div>
	<div class="in scrollbar-primary scrollbar" id="personDiv" style="display: none">
		<ul class="itemframe2">
			<li class="item3"><span class="ps">1~3명</span></li>
			<li class="item3"><span class="ps">4~6명</span></li>
			<li class="item3"><span class="ps">7~9명</span></li>
			<li class="item3"><span class="ps">10~12명</span></li>
			<li class="item3"><span class="ps">인원수 무관</span></li>
		</ul>
	</div>
	<div class="in scrollbar-primary scrollbar" id="dateDiv" style="display: none">
		<!-- <div id="mydate"></div> -->
		<input type="text" id="mydate" style="display: none"/>
		

	</div>
	<div class="in scrollbar-primary scrollbar" id="bottomDiv" style="">
		<div style=" width: 20%; height:100%; float: right; text-align: center; vertical-align: middle;">
			<input type="button" class="sb_btn" value="검색" onclick="searchMatching()" />
		</div>
	</div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
	var arr = new Array();
	//var compareArr = new Array();
	var arrkd = new Array();
	var cnt = 0;
	var locId = "";
	var fullName = "";
	var locName = "";
	var textkd = "소모임";
	var	textDetailkd = "";
	var textps = "";
	var date = "";
		$("#mydate").flatpickr({
			  
			  inline: true,	
			  mode: "range",
			  dateFormat: "Y-m-d",
			  minDate: "today",
			  onChange: function(selectedDates, dateStr, instance) {
			        //...
			        date = dateStr;
        			date = date.replace("to", "~");
        			$('#kindsDiv').show().css('border', '1px solid #DDE7EB');
        			$('#personDiv').show().css('border', '1px solid #DDE7EB');
        			$('#dateDiv').show().css('border', '1px solid black');
        			$('#cal').addClass('on');
        			$('#cal').siblings().removeClass('on');
			        $("a[id=dateStr]").remove();
			        $('div #bottomDiv').append("<a class='btn-xs btn-default' id='dateStr' onclick='check(this);'>"+ date + "<span class='delTag'></span></a>");
			  }
		
		}); 

		//
	
	$(function() {
	
		$(".item").click(function() {
			$(this).css({'color':'#5e73de', 'font-weight':'900'});
			$(this).css('background-color', '#e2f5fc');
			$(this).siblings().css({'color':'black', 'font-weight':'300'});
			$(this).siblings().css('background-color', 'white');
			$('#midDiv').show();
			$('#smallDiv').show();
			$('#kindsDiv').hide();
			$('#detailKindsDiv').hide();
			$('#personDiv').hide();
			$('#dateDiv').hide();
			$('#loc').addClass('on');
			$('#loc').siblings().removeClass('on');
			$("div #smallDiv").children().remove();
			
			var locId = $(this).attr('id');
			
			locName = $(this).text();
			console.log("지역명:" + locName);
			$.ajax({
				url : "${pageContext.request.contextPath }/location/midLocation.do",
				type : "GET",
				datatype : "JSON",
				data : {
					bloc : locId
				},
				async : false,
				success : function(data) {
					console.log(data);
					var html = "<ul class='itemframe'>";
					html += "<li class='item'>";
					html += "<span class='sca'>"
							+ locName + " 전체</span>";
					html += "</li>";
					html += "<br>";
					for ( var i in data) {
						if (i % 3 == 0 && i != 0) {
							html += "<br>";
							html += "<li class='item'>";
							html += "<span  class='sca'>"+ data[i]+ "</span>";
							html += "</li>";
						} else {
							html += "<li class='item'>";
							html += "<span  class='sca'>"+ data[i]+ "</span>";
							html += "</li>";
						}

					}
					html += "</ul>";

					$("#midDiv").html(html);

					midSelect();

				},
				error : function(data) {
					console.log("에러");
				}
			})

		});

	});

	function midSelect(obj) {
		$("#midDiv").children("ul").children("li").click(
			function() {
				$(this).css({'color':'#5e73de', 'font-weight':'900'});
				$(this).css('background-color', '#e2f5fc');
				$(this).siblings().css({'color':'black', 'font-weight':'300'});
				$(this).siblings().css('background-color', 'white');
			locId = $(this).text();
			console.log("midlocId : " + locId);
			//repleId = locId.replace(/ /g, '');
			//console.log("공백제거:"+ repleId);
			if (locId.match('전체')) {
				$('#smallDiv *').remove();

				$("a").remove(":contains(" + locName + ")");
				
				while(true){
					var search = arr.indexOf("지역없음");
					if(search != -1){
						arr.splice(search, 1);
					}else{
						break;
					}
				}
				var arr2 = arr.filter(function(n) {
					return n.match(locName);
				});

				for ( var i in arr2) {
					$("a").remove(":contains(" + arr2[i] + ")");
				}

				for (var i = 0; i < arr2.length; i++) {
					var arrlen = arr.length;
					for (var j = 0; j < arrlen; j++) {
						if (arr2[i] == arr[j]) {
							arr = arr.slice(0, j).concat(
									arr.slice(j + 1, arrlen));
						}
					}
				}

				$("div #bottomDiv")
						.append(
								"<a class='btn-xs btn-default' id='"
										+ locId
										+ "' onclick='check(this);'>"
										+ locId
										+ "<span class='delTag'></span></a>");
				//$("div #bottomDiv").append("<button class='btn-xs btn-default' type='button' onclick='check(this);' id='"+locId+"'>"+locId+"</button>");
				arr.push(locId);
				if (arr.indexOf())
					console.log("arr : " + arr);
				console.log("arr2 : " + arr2);

				//divClickEvent();

			} else {
				$
						.ajax({
							url : "${pageContext.request.contextPath }/location/smallLocaion.do",
							type : "GET",
							datatype : "JSON",
							data : {
								sloc : locId
							},
							async : false,
							success : function(data) {
								console.log(data);

								console.log("현재 arr에 들어있는 값 : "
										+ arr);

								if (data.length != 0) {
									var html = "<ul class='itemframe'>";
									html += "<li class='item'>";
									html += "<label for='locAll'><input type='checkbox' class='locCkbx' id='locAll' value='"+locId+" 전체'>"
											+ locId
											+ " 전체</label>";
									html += "</li>";
									html += "<br>";
									for ( var i in data) {

										if (i % 3 == 0
												&& i != 0) {
											html += "<br>";
											html += "<li class='item'>";
											html += "<label for='locCk"+i+"'><input type='checkbox' class='locCkbx' id='locCk"+i+"' value='"+locId+" "+data[i]+"'>"
													+ data[i]
													+ "</label>";
											html += "</li>";
										} else {
											html += "<li class='item'>";
											html += "<label for='locCk"+i+"'><input type='checkbox' class='locCkbx' id='locCk"+i+"' value='"+locId+" "+data[i]+"'>"
													+ data[i]
													+ "</label>";
											html += "</li>";
										}

									}
									html += "</ul>";
									$("#smallDiv").html(html);

									for ( var j in arr) {
										//console.log(j + " : " + arr[j]);
										var compareStr = arr[j].substr(arr[j].lastIndexOf(" ") + 1,7);
										var compareStr2 = arr[j].substr(arr[j].indexOf(" ") + 1,15);
										var compareStr3 = compareStr2.substring(0,compareStr2.lastIndexOf(" "));
										//console.log("compareStr : " + compareStr);
										var arrVal = arr[j];
										console.log("compareStr2 전: "+ arrVal);
										console.log("compareStr2 후: "+ compareStr2);
										console.log("compareStr3 :"+ compareStr3);
										console.log("locId:"+ locId);
										//console.log("arrj" + arr[j]);
										var compareCkbx = $.inArray(arr[j],arr);

										if (compareCkbx != -1) {
											console.log("이전에 체크된 적 있음 : "+ compareStr2);
											//console.log($('.locCkbx[value="'+compareStr2+'"]'));
											if (compareStr2.match('전체')) {
												console.log("전체선택되있음");
												$('.locCkbx[value="'+ compareStr3+ ' 전체"]').prop('checked',true);
												//$('input:contains("'+compareStr2+'")').css('background-color','red');
											} else {
												console.log("전체선택안되있음");
												$('.locCkbx[value="'+ compareStr2+ '"]').prop('checked',true);
											}
											console.log("===============================")
										}
									}

									lastSelect();

								}
							},
							error : function(data) {
								console.log("에러2");
							}
						})

			}
		});

	}

	function lastSelect(obj) {
	

			$(".locCkbx")
				.change(
						function() {
							
							fullName = locName + locId + $(this).val();
							console.log("디스:" + $(this).val());
							console.log("locId : " + locId);
							if(arr[0] == "지역없음"){
								arr.splice(0, 1);
								console.log("arr:" + arr);
							}	
							if ($(this).is(":checked")) {
								$(this).parent().css({'color':'#5e73de', 'font-weight':'900'});
								$(this).parent().parent().css('background-color', '#e2f5fc');

								if ($(this).val() == (locId + " 전체")) {
									$('input[id^="locCk"]').parent().css({'color':'black', 'font-weight':'300'});
									$('input[id^="locCk"]').parent().parent().css('background-color', 'transparent ');
									
									console.log("전체선택");
									console.log("1번 : " + $(this).val());
									console.log("locName : " + locName);
									$('input[id^="locCk"]').prop('checked',
											false);
									console.log("locId : " + locId);
									console.log("들어가는 값 : " + locName + " "
											+ locId);

									var arr2 = arr.filter(function(n) {
										return n.match(locName + " " + locId);
									});

									for ( var i in arr2) {
										console.log("arr2[i]?" + arr2[i]);
										$("a").remove(
												":contains(" + arr2[i] + ")");
									}

									for (var i = 0; i < arr2.length; i++) {
										var arrlen = arr.length;
										for (var j = 0; j < arrlen; j++) {
											if (arr2[i] == arr[j]) {
												arr = arr
														.slice(0, j)
														.concat(
																arr.slice(
																		j + 1,
																		arrlen));

											}
										}
									}
									arr.push(locName + " " + locId + " 전체");
									/* if((locName + ' 전체')){
									arr.splice(arr.indexOf(locName + ' 전체'), 1); 
									} */
									var test = locName + " 전체";
									console.log("Test : " + test);
									console.log(arr.indexOf(test));
									if (arr.indexOf(test) != -1) {
										arr.splice(arr.indexOf(test), 1);
										$('a')
												.remove(
														":contains(" + test
																+ ")");
									}
									console.log("수정후 arr: " + arr);

									$("div #bottomDiv")
											.append(
													"<a  href='javascript:void(0);' class='btn-xs btn-default' onclick='check(this);' id='"
															+ locId
															+ "'>"
															+ locName
															+ " "
															+ locId
															+ " 전체<span class='delTag'></span></a>");
									//$("div #bottomDiv").append("<button class='btn-xs btn-default' type='button' onclick='check(this);'  id='"+locId+"'>"+locName+" "+locId+" 전체</button>");
								} else {
									console.log("2번");
									console.log("2번 다음 :" + locId);
									console.log("locName:" + locName);
									console.log("$(this).val():"
											+ $(this).val());
									$('input[id="locAll"]').prop('checked',false);
									$('input[id="locAll"]').parent().css({'color':'black', 'font-weight':'300'});
									$('input[id="locAll"]').parent().parent().css('background-color', 'white');
									$("a[id='" + locId + "']").remove();
									console.log("locName : " + locName);
									$("a[id='" + locName + " 전체']").remove();
									arr.push(locName + " " + $(this).val());
									console.log(locName + " " + locId + " 전체");
									if ($.inArray(
											(locName + " " + locId + " 전체"),
											arr) != -1) {
										console.log(locName + " " + locId);
										//console.log("강남구 있음 위치 : " + test);
										arr.splice($.inArray((locName + " "
												+ locId + " 전체"), arr), 1);
									}

									if ($.inArray(locName + " 전체", arr) != -1) {
										arr.splice($.inArray(locName + " 전체",
												arr), 1);
									}
									//compareArr.push($(this).val());
									$("div #bottomDiv")
											.append(
													"<a class='btn-xs btn-default' onclick='check(this);'>"
															+ locName
															+ " "
															+ $(this).val()
															+ "<span class='delTag'></span></a>");
									//$("div #bottomDiv").append("<button class='btn-xs btn-default' type='button' onclick='check(this);'>"+locName+" "+locId+" "+$(this).val()+ "</button>");
								}

							} else {
								$(this).parent().css({'color':'black', 'font-weight':'300'});
								$(this).parent().parent().css('background-color', 'white');
								console.log("클릭해체한값 : " + $(this).val());
								console.log("현재 arr : " + arr);
								console.log("locName : " + locName);
								//var rmvLoc = arr.splice(arr.indexOf(locName + " " + locId + " " +$(this).val()), 1);
								console.log(locName + $(this).val());
								var rmvLoc = arr.splice(arr.indexOf(locName
										+ " " + $(this).val()), 1);
								console.log("rmvLoc : " + rmvLoc);
								$("a").remove(":contains(" + rmvLoc + ")");

							}
							console.log("arr:" + arr);
							console.log("arr2:" + arr2);

							//divClickEvent();
							
						});
		
	}

	// 내일 여기서부터 작업
	function check(obj) {
		var delAtag = $(obj).text();
		console.log("delAtag : " + delAtag)
		$("a").remove(":contains(" + delAtag + ")");
		
		arr.splice(arr.indexOf(delAtag), 1);

		var delCkbx = delAtag.substring(delAtag.indexOf(" ") + 1);
		
		console.log(delCkbx);

		$('.locCkbx[value="' + delCkbx + '"]').prop('checked', false);
		$('.locCkbx[value="' + delCkbx + '"]').parent().css({'color':'black', 'font-weight':'300'});
		$('.locCkbx[value="' + delCkbx + '"]').parent().parent().css('background-color', 'transparent ');

	}

	function selectlocCategory() {
		if(textkd == "E-스포츠"){
			swal({
				text : "E-스포츠는 지역을 선택하실 수 없습니다.",
				icon : "warning"
			});
		}else{
			$('#midDiv').show();
			$('#smallDiv').show();
			
			$('#kindsDiv').hide();
			$('#detailKindsDiv').hide();
			$('#personDiv').hide();
			$('#dateDiv').hide();
			
			$('#loc').addClass('on');
			$('#loc').siblings().removeClass('on');
			
			
		}
		
	}

	function selectkindsCategory() {
		
		$('#midDiv').hide();
		$('#smallDiv').hide();
		$('#kindsDiv').show();
		$('#kd1').parent().css({'color':'#5e73de', 'font-weight':'900'});
		$('#kd1').parent().parent().css('background-color', '#e2f5fc');
		
		$('#kindsDiv').css('border', '1px solid black');
	/* 	$('#detailKindsDiv').show().css('border', '1px solid #DDE7EB');
		$('#personDiv').show().css('border', '1px solid #DDE7EB');
		$('#dateDiv').show().css('border', '1px solid #DDE7EB');
		 */
		$('#detailKindsDiv').show().css('border', '1px solid #DDE7EB');
		$('#personDiv').hide();
		$('#dateDiv').hide();
		$('#cate').addClass('on');
		$('#cate').siblings().removeClass('on');

	}
	
	function selectDetailkindsCategory() {
		$('#midDiv').hide();
		$('#smallDiv').hide();
		$('#kindsDiv').show();
		
		$('#detailKindsDiv').show().css('border', '1px solid black');
		$('#kindsDiv').show().css('border', '1px solid #DDE7EB');
		$('#personDiv').show().css('border', '1px solid #DDE7EB');
		$('#dateDiv').show().css('border', '1px solid #DDE7EB');
		
		$('#cate').addClass('on');
		$('#cate').siblings().removeClass('on');
	}

	function selectpersonCategory() {
		$('#midDiv').hide();
		$('#smallDiv').hide();
		
		$('#personDiv').show().css('border', '1px solid black');
		$('#kindsDiv').show().css('border', '1px solid #DDE7EB');	
		$('#dateDiv').show().css('border', '1px solid #DDE7EB');
		$('#detailKindsDiv').hide();
		
		$('#person').addClass('on');
		$('#person').siblings().removeClass('on');
	}

	function selectdateCategory() {
		$('#midDiv').hide();
		$('#smallDiv').hide();
		$('#detailKindsDiv').hide();
		$('#kindsDiv').show().css('border', '1px solid #DDE7EB');
		$('#personDiv').show().css('border', '1px solid #DDE7EB');
		$('#dateDiv').show().css('border', '1px solid black');
		$('#cal').addClass('on');
		$('#cal').siblings().removeClass('on');
	}

	$(function() {
		$('.item2').click(function() {
			selectkindsCategory();
		 	textkd = $(this).find('.kd').val();
			
		 	console.log(textkd);
			
		 	if(textkd == "소모임"){
		 		$('#kd1').parent().css({'color':'#5e73de', 'font-weight':'900'});
				$('#kd1').parent().parent().css('background-color', '#e2f5fc');
				
				$('#kd2').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd2').parent().parent().css('background-color', 'white');
				$('#kd3').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd3').parent().parent().css('background-color', 'white');
				
		 		$('#dekd1').show();
		 		$('#dekd2').hide();
		 		$('#dekd3').hide();
		 		$('.over').hide();
		 	}else if(textkd == "스포츠"){
		 		$('#kd2').parent().css({'color':'#5e73de', 'font-weight':'900'});
				$('#kd2').parent().parent().css('background-color', '#e2f5fc');
				$('#kd2').parent().parent().siblings().css('background-color', 'white');
				$('#kd1').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd1').parent().parent().css('background-color', 'white');
				$('#kd3').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd3').parent().parent().css('background-color', 'white');
		 		$('#dekd1').hide();
		 		$('#dekd2').show();
		 		$('#dekd3').hide();
		 		$('.over').hide();
		 	}else{
		 		$('#kd3').parent().css({'color':'#5e73de', 'font-weight':'900'});
				$('#kd3').parent().parent().css('background-color', '#e2f5fc');
				$('#kd3').parent().parent().siblings().css('background-color', 'white');
				$('#kd1').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd1').parent().parent().css('background-color', 'white');
				$('#kd2').parent().css({'color':'black', 'font-weight':'300'});
				$('#kd2').parent().parent().css('background-color', 'white');
		 		$('#dekd1').hide();
		 		$('#dekd2').hide();
		 		$('#dekd3').show();
		 		$('.over').show();
		 		
		 		for ( var i in arr) {
					$("a").remove(":contains(" + arr[i] + ")");
				}
		 		arr.length = 0;
		 		arr[0] = "지역없음";
		 		console.log("arr : " +arr);
		 	}

			/* $("#bottomDiv").find('a').each(function () {
				if($(this).find('#ckkd')){
					$('#ckkd').remove();
				}
			});
			
			$('div #bottomDiv').append("<a class='btn-xs btn-default' id='ckkd' onclick='check(this);'>"+ textkd + "<span class='delTag'></span></a>"); */
		
		});
		
		$('.item2in1').click(function () {
			textDetailkd = $(this).find('.dekd').val();
			$('#detailKindsDiv').css("border", "1px solid black");
			$('#kindsDiv').show().css('border', '1px solid #DDE7EB');
			
			$(this).children().css({'color':'#5e73de', 'font-weight':'900'});
			$(this).siblings().children().css({'color':'black', 'font-weight':'300'});
			$(this).css('background-color', '#e2f5fc');
			$(this).siblings().css('background-color', 'white');
			
			console.log( textkd +" + " +textDetailkd);
			
			$("#bottomDiv").find('a').each(function () {
				if($(this).find('#ckkd')){
					$('#ckkd').remove();
				}
			});
			
			$('div #bottomDiv').append("<a class='btn-xs btn-default' id='ckkd' onclick='check(this);'>"+ textkd + " > " + textDetailkd + "<span class='delTag'></span></a>");
		});
		
		$('.item3').click(function() {
			selectpersonCategory();
		 	textps = $(this).find('.ps').text();
		 	
			$(this).children().css({'color':'#5e73de', 'font-weight':'600'});
			$(this).siblings().children().css({'color':'black', 'font-weight':'300'});
			$(this).css('background-color', '#e2f5fc');
			$(this).siblings().css('background-color', 'white');
		 	
			$("#bottomDiv").find('a').each(function () {
				if($(this).find('#ckps')){
					$('#ckps').remove();
				}
			});
			
			$('div #bottomDiv').append("<a class='btn-xs btn-default' id='ckps' onclick='check(this);'>"+ textps + "<span class='delTag'></span></a>");
		});
		
	});

 	function searchMatching() {
		
		var firstLoc = new Array();
		var middleLoc = new Array();
		var lastLoc = new Array();
		var fullLoc = new Array();
		if(arr.length != 0){
			for(var i=0; i<arr.length; i++){
				firstLoc[i] = arr[i].substring(0, arr[i].indexOf(" "));
				middleLoc[i] = arr[i].substring(arr[i].indexOf(" ")+1, arr[i].lastIndexOf(" "));
				lastLoc[i] = arr[i].substr(arr[i].lastIndexOf(" ")+1);
			}			
		}else{
			firstLoc = null;
			middleLoc = null;
			lastLoc = null;
		}
		
		if(textkd == "E-스포츠"){
			textkd = "E스포츠";
		}
		
/* 		alert("지역 : " + middleLoc);
		alert("인원수 : " + textps);
		alert("날짜 : " + date);
		alert("카테고리 : " + textDetailkd);
		 */
		/* <div class="schDiv">
		<div class="schListDiv">
			<div class="schObj">
				<div class="schCat">소모임 - 여행</div>
				<div class="greyRule"></div>
				<div class="schTit">새로운 타이틀입니다~~~~</div>

				<div class="schLoc">경기도 고양시 덕양구 화정동</div>
				<div class="schTime">2019-01-01 12:00</div>
			</div>
		</div>
		<div class="backDiv">
			<button class="backbtn">다른 조건으로 검색하기</button>
		
		</div>
	</div> */
		
		if(textps == ""){
			swal({
				text : "인원수를 선택해 주세요.",
				icon : "warning"
			});
		}else if(date == ""){
			swal({
				text : "날짜를 선택해 주세요",
				icon : "warning"
			});
		}else if(textDetailkd == ""){
			swal({
				text : "매칭 종류를 선택해 주세요",
				icon : "warning"
			})
		}else{
			$.ajax({
				url : "${pageContext.request.contextPath}/matching/searchMatching.do",
				type : "GET",
				traditional : true,
				data : {
					locArrOne : firstLoc,
					locArrTwo : lastLoc,
					locArrThree : middleLoc,
					firstCate : textkd,
					category : textDetailkd,
					people : textps,
					date : date
				},
				success : function(data) {
					$('.out').empty();
					var html = " <div class='schDiv'>";
					html += "<div class='schListDiv'>";
					$.each(data, function(idx, val) {
						console.log(idx + " " + val.mTitle);
						html += '<div class="schObj ">';
						html += '<div class="schCat">'+ val.bigCategory + ' - ' + val.midCategory +'</div>';
						html += '<div class="greyRule"></div>';
						html += '<input type="hidden" id="matId" value='+val.matchingId+'>';
						html += '<div class="schTit">'+ val.mTitle +'</div>';
						if(val.bigLocation != "지역없음"){
							html += '<div class="schLoc">'+ val.bigLocation + ' ' + val.midLocation + ' ' + val.smallCategory +'</div>';							
						}else{
							html += '<div class="schLoc">'+ val.bigLocation +'</div>';
						}
						html += '<div class="schTime">' + val.mtime + '</div>';
						html += '</div>';
					});
					html += '</div>';
					html += '<div class="backDiv">';
					html += '<button class="backbtn sb_btn">다른 조건으로 검색하기</button>';
					html += '</div>';
					html += '</div>';
					
					$('.out').html(html);
					
					backClick();
					// $('.out ').empty();
					/* var html = " <div class='schDiv'>";
					html += "<div class='schListDiv'>";
					html += '<div class="schObj">';
					html += '<div class="schCat">소모임 - 여행</div>'; */
					
				}, error : function(data) {
					swal("에러");
				}
			});
			
		}

	}
 	
 	function backClick(obj) {
		$('.backbtn').click(function () {

			 location.reload();
		});
		
		$('.schObj').click(function () {
			var matNum = $(this).find('#matId').val();
			location.href = "${pageContext.request.contextPath}/matching/matchingDetail.md?matNum=" + matNum;
		});
	}
 	
</script>
