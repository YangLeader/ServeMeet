<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 	<label for="ck1"><input type="checkbox" id="ck1" value="test">test</label>
	<label for="ck2"><input type="checkbox" id="ck2" value="test2">test2</label> -->

<div class="out">
	<div class="category">
		<div class="condition" id ="loc"><span>지역</span></div>
		<div class="condition" id = "cate"><span>모임</span></div>
		<div class="condition" id = "person"><span>인원</span></div>
		<div class="condition" id = "cal"><span>날짜</span></div>	
	</div>
	<div class="in scrollbar-primary scrollbar">
		<ul class="itemframe">
			<li class="item" id="서울특별시"><span class="sca">서울</span></li>
			<li class="item" id="경기도"><span class="sca">경기</span></li>
			<li class="item" id="인천광역시"><span class="sca">인천</span></li>
			<li class="item" id="대전광역시"><span class="sca">대전</span></li>

			<li class="item" id="세종특별자치시"><span class="sca">세종</span></li>
			<li class="item" id="충청남도"><span class="sca">충남</span></li>

			<li class="item" id="충청북도"><span class="sca">충북</span></li>
			<li class="item" id="광주광역시"><span class="sca">광주</span></li>

			<li class="item" id="전라남도"><span class="sca">전남</span></li>
			<li class="item" id="전라북도"><span class="sca">전북</span></li>
			<li class="item" id="대구광역시"><span class="sca">대구</span></li>
			<li class="item" id="경상북도"><span class="sca">경북</span></li>
			<li class="item" id="부산광역시"><span class="sca">부산</span></li>
			<li class="item" id="울산광역시"><span class="sca">울산</span></li>
			<li class="item" id="경상남도"><span class="sca">경남</span></li>
			<li class="item" id="강원도"><span class="sca">강원</span></li>
			<li class="item" id="제주특별자치도"><span class="sca">제주</span></li>
		</ul>
	</div>
	<div class="in scrollbar-primary scrollbar" id="midDiv">
		<br /> &nbsp; ← 지역을 선택해주세요.
	</div>
	<div class="in scrollbar-primary scrollbar" id="smallDiv"></div>
	<div class="in scrollbar-primary scrollbar" id="bottomDiv" style=""></div>
</div>



<script>
	var arr = new Array();
	//var compareArr = new Array();
	var cnt = 0;
	var locId = "";
	var fullName = "";
	var locName = "";
	$(function() {

		$(".sca")
				.click(
						function() {
							$("div #smallDiv").children().remove();
							var locId = $(this).parent().attr('id');

							locName = $(this).text();
							console.log("지역명:" + locName);
							$
									.ajax({
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
													html += "<span  class='sca'>"
															+ data[i]
															+ "</span>";
													html += "</li>";
												} else {
													html += "<li class='item'>";
													html += "<span  class='sca'>"
															+ data[i]
															+ "</span>";

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
		$("#midDiv")
				.children("ul")
				.children("li")
				.children(".sca")
				.click(
						function() {
							locId = $(this).text();
							console.log("midlocId : " + locId);
							//repleId = locId.replace(/ /g, '');
							//console.log("공백제거:"+ repleId);
							if (locId.match('전체')) {
								$('#smallDiv *').remove();

								$("a").remove(":contains(" + locName + ")");

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
														var compareStr = arr[j]
																.substr(
																		arr[j]
																				.lastIndexOf(" ") + 1,
																		7);
														var compareStr2 = arr[j]
																.substr(
																		arr[j]
																				.indexOf(" ") + 1,
																		15);
														var compareStr3 = compareStr2
																.substring(
																		0,
																		compareStr2
																				.lastIndexOf(" "));
														//console.log("compareStr : " + compareStr);
														var arrVal = arr[j];
														console
																.log("compareStr2 전: "
																		+ arrVal);
														console
																.log("compareStr2 후: "
																		+ compareStr2);
														console
																.log("compareStr3 :"
																		+ compareStr3);
														console.log("locId:"
																+ locId);
														//console.log("arrj" + arr[j]);
														var compareCkbx = $
																.inArray(
																		arr[j],
																		arr);

														if (compareCkbx != -1) {
															console
																	.log("이전에 체크된 적 있음 : "
																			+ compareStr2);
															//console.log($('.locCkbx[value="'+compareStr2+'"]'));
															if (compareStr2
																	.match('전체')) {
																console
																		.log("전체선택되있음");
																$(
																		'.locCkbx[value="'
																				+ compareStr3
																				+ ' 전체"]')
																		.prop(
																				'checked',
																				true);
																//$('input:contains("'+compareStr2+'")').css('background-color','red');
															} else {
																console
																		.log("전체선택안되있음");
																$(
																		'.locCkbx[value="'
																				+ compareStr2
																				+ '"]')
																		.prop(
																				'checked',
																				true);
															}
															console
																	.log("===============================")
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
							if ($(this).is(":checked")) {

								if ($(this).val() == (locId + " 전체")) {
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
									$('input[id="locAll"]').prop('checked',
											false);
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

		$("a").remove(":contains(" + delAtag + ")");
		arr.splice(arr.indexOf(delAtag), 1);

		var delCkbx = delAtag.substring(delAtag.indexOf(" ") + 1);
		console.log(delCkbx);

		$('.locCkbx[value="' + delCkbx + '"]').prop('checked', false);

	}
	/* 	function divClickEvent(){
	 $('#bottomDiv').children('a').each(function(obj, index){
	 $(this).off('click');
	 $(this).click(function(){
	 console.log($(this)+"has clicked!");
	 });
	 });
	 } */
</script>
