<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>
<c:import url="../common/header.jsp" />
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-109178580-1"></script>
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
<title>게시글 작성</title>

</head>
<body>


	<div id="wrapper">
		<div class="container">

			<form name="fwrite" id="fwrite" action="${pageContext.request.contextPath }/matching/matcingHistoryInsert.ma"
					method="post" enctype="multipart/form-data">
			
				<div class="bbs_title_wrap">
					<a class="bbs_title">게시글 작성 </a> 
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
						<input type="hidden" name="matchingId" value="${matching.matchingId}"/>
						<label>제목</label> 
						<input type="text" name="mTitle" id="wr_subject" class="form-control" value="${matching.mTitle}" readonly required maxlength="255" />
						<label>작성자</label>
						<input type="text" class="form-control" name="userName" value="${member.userName}" readonly required>
					</div>

					<div class="wr_option wr_content">
						<label>내용</label>
						<div>
							<textarea id="wr_content" name="mhContent"
							class="smarteditor2 form-control" maxlength="65536"
							style="width: 100%; height: 300px"></textarea>
								
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
					<input type="submit" class="btn btn-info" value="확인" />
					<%-- <a href="${pageContext.request.contextPath }/board/boardList.do" class="btn btn-default">취소</a> --%>
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
				<!--</div>-->
				<!-- .rightBox -->
				<!--</div>-->
				<!-- .row -->
		</div>
		<!-- .container -->
	</div>
	<!-- .wrapper -->
	
	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

<c:import url="../common/footer.jsp" />

</body>
</html>
