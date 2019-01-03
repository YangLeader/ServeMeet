<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-109178580-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-109178580-1');
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<title>매칭 등록</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<br><br><br>
	<hr>
	<div id="wrapper">
		<div class="container">

			<form name="fwrite" id="fwrite" action="${pageContext.request.contextPath }/board/boardFormEnd.do"
					onsubmit="return fwrite_submit(this);" method="post" enctype="multipart/form-data">
		
				<div class="bbs_title_wrap">
					<a class="bbs_title">매칭 등록 </a> 
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
					
					<div class="form-group">
				<label class="col-sm-3 control-label" for="userId">지역정보</label>
				<div id="selectDiv">
					<script>
						$.ajax({
							url : "${pageContext.request.contextPath }/location/bigLocation.do",
							type : "GET",
							dataType : 'JSON',
							success : function(data) {
								console.log(data);
								console.log(data.list)
								selectOption(data);
							},
							async : false,
							success : function(data){
								console.log(data);
								var html = "<ul class='itemframe'>";
								html += "<li class='item'>";
								html += "<span class='sca'>"
							},
							error : function() {
								alert("실패");
							}
						});
						function selectOption(data) { /* selectOption 시작 */
							$('#selectDiv')
									.append(
											'<select name="selectCategory" id="selectCategory">'
													+ '<option value="">선택하세요</option>'
													+ '</select> <select name="licenseName" id="licenseName">'
													+ '<option value="">선택하세요</option>'
													+ '</select><button id="add" type="button">추가</button><br>')
									.append(
											'<select name="selectCategory1" id="selectCategory1" style="display:none">'
													+ '<option value="">선택하세요</option>'
													+ '</select> <select name="licenseName1" id="licenseName1" style="display:none>'
													+ '<option value="">선택하세요</option>'
													+ '</select>');
							var list = data.lArray;
							var l = data.list;
							for (var i = 0; i < l.length; i++) {
								$('#selectCategory').append(
										"<option>" + l[i].bigLocation
												+ "</option>");
							}
							$('#add').on(
									'click',
									function() {
										$('#selectCategory1').removeAttr(
												"style");
										$('#licenseName1').removeAttr("style");
										for (var i = 0; i < l.length; i++) {
											$('#selectCategory1').append(
													"<option>" + l[i].midLocation
															+ "</option>");
										}
									}); /* }); */
							$('#selectCategory').change(sCategory);
							function sCategory() {
								$('#licenseName').children().remove();
								for (var i = 0; i < list.length; i++) {
									var value = $('option:selected').val();
									console.log("1목록 : " + value);
									if (list[i].category == value) {
										$('#licenseName').append(
												"<option value="+list[i].locationId+">"
														+ list[i].midLocation
														+ "</option>");
									}
								}
							}
							$('#selectCategory1').change(sCategory1);
							function sCategory1() {
								$('#licenseName1').children().remove();
								for (var i = 0; i < list.length; i++) {
									var value = $(
											'#selectCategory1 option:selected')
											.val();
									console.log("2목록 :" + value);
									if (list[i].category == value) {
										$('#licenseName1').append(
												"<option value="+list[i].lno+">"
														+ list[i].name
														+ "</option>");
									}
								}
							}
							$('#licenseName').change(lCategory);
							$('#licenseName1').change(lCategory1);
							function lCategory() {
								var value = $('#licenseName option:selected')
										.val();
								console.log("!값" + value);
							}
							function lCategory1() {
								var value = $('#licenseName1 option:selected')
										.val();
								console.log("2값" + value);
							}
						}/*selectOption 끝  */
					</script>
					

					<div class="wr_option wr_subject">
						<label>제목</label> 
						<input type="text" name="boardTitle" id="wr_subject" class="form-control" value="" required maxlength="255" />
						<label>작성자</label>
						<input type="text" class="form-control" name="userName" value="${member.userName}" readonly required>
					</div>

					<div class="wr_option wr_content">
						<label>내용</label>
						<div>
							<textarea id="wr_content" name="boardContent"
							class="smarteditor2 form-control" maxlength="65536"
							style="width: 100%; height: 300px"></textarea>
								
						</div>	

				</div>
				<div class="wr_submit">
					<input type="submit" class="btn btn-info" value="확인" />
					<a href="${pageContext.request.contextPath }/board/boardList.do" class="btn btn-default">취소</a>
				</div>
				<br /><br /><br /><br /><br /><br />
			</form>

				<script>
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

					function fwrite_submit(f) {
						var wr_content_editor_data = oEditors.getById['wr_content']
								.getIR();
						oEditors.getById['wr_content'].exec(
								'UPDATE_CONTENTS_FIELD', []);
						if (jQuery.inArray(document
								.getElementById('wr_content').value
								.toLowerCase().replace(/^\s*|\s*$/g, ''), [
								'&nbsp;', '<p>&nbsp;</p>', '<p><br></p>',
								'<div><br></div>', '<p></p>', '<br>', '' ]) != -1) {
							document.getElementById('wr_content').value = '';
						}
						if (!wr_content_editor_data
								|| jQuery.inArray(wr_content_editor_data
										.toLowerCase(), [ '&nbsp;',
										'<p>&nbsp;</p>', '<p><br></p>',
										'<p></p>', '<br>' ]) != -1) {
							alert("내용을 입력해 주십시오.");
							oEditors.getById['wr_content'].exec('FOCUS');
							return false;
						}

						var subject = "";
						var content = "";
						$.ajax({
							url : g5_bbs_url + "/ajax.filter.php",
							type : "POST",
							data : {
								"subject" : f.wr_subject.value,
								"content" : f.wr_content.value
							},
							dataType : "json",
							async : false,
							cache : false,
							success : function(data, textStatus) {
								subject = data.subject;
								content = data.content;
							}
						});

						if (subject) {
							alert("제목에 금지단어('" + subject + "')가 포함되어있습니다");
							f.wr_subject.focus();
							return false;
						}

						if (content) {
							alert("내용에 금지단어('" + content + "')가 포함되어있습니다");
							if (typeof (ed_wr_content) != "undefined")
								ed_wr_content.returnFalse();
							else
								f.wr_content.focus();
							return false;
						}

						if (document.getElementById("char_count")) {
							if (char_min > 0 || char_max > 0) {
								var cnt = parseInt(check_byte("wr_content",
										"char_count"));
								if (char_min > 0 && char_min > cnt) {
									alert("내용은 " + char_min + "글자 이상 쓰셔야 합니다.");
									return false;
								} else if (char_max > 0 && char_max < cnt) {
									alert("내용은 " + char_max + "글자 이하로 쓰셔야 합니다.");
									return false;
								}
							}
						}

						document.getElementById("btn_submit").disabled = "disabled";

						return true;
					}

				</script>
				
		</div>
		
	</div>

<c:import url="../common/footer.jsp" />
	
	
</body>
</html>