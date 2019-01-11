<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<c:import url="../common/header.jsp" />
<!-- Global site tag (gtag.js) - Google Analytics -->
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

<!-- Smart Editor -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 
 
<!-- Smart Editor -->
<script type="text/javascript">

var oEditors = [];
$(function(){
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "wr_content",
sSkinURI: "${pageContext.request.contextPath }/resources/se2/SmartEditor2Skin.html",
fCreator: "createSEditor2"
});
});
 
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["wr_content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("wr_content").value를 이용해서 처리한다.
  
    try {
        elClickedObj.form.submit();
    } catch(e) {
     
    }
}
 
// textArea에 이미지 첨부
function pasteHTML(filepath){
    var sHTML = '<img src="${pageContext.request.contextPath }/resources/upload/board/'+filepath+'">';
    oEditors.getById["wr_content"].exec("PASTE_HTML", [sHTML]);
}
 
</script>

<!--
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-2755471938797797",
    enable_page_level_ads: true
  });
</script>
-->

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!--
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-2755471938797797",
          enable_page_level_ads: true
     });
</script>
-->
<title>게시글 수정</title>

<!--[if lte IE 8]>
<script src="http://aq23r1gt.iwinv.net/js/html5.js"></script>
<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!--
<script src="http://aq23r1gt.iwinv.net/js/jquery-1.8.3.min.js"></script>
-->


</head>
<body>

	<!-- preloader (화면 전환 효과) -->

	<!-- <div class="preloader"></div>

	<script>
		$(document).ready(function() {
			// 화면 전환 효과
			$('.preloader').fadeOut(150);

			$('.navbar-brand').width($('.navbar-brand > img').width());
			$(window).resize(function() {
				$('.navbar-brand').width($('.navbar-brand > img').width());
			});
		});
	</script> -->

	<div id="wrapper">
		
		<div class="container" style="background-color:white; border-radius: 20px;">
		<br />
			<!--
		<div class="row">	
			
			<div class="leftBox col-md-3">
				로그인 박스
			</div>
			

			<div class="rightBox col-md-9">
			-->
			<!-- skin : _basic -->
			<form name="fwrite" id="fwrite" action="${pageContext.request.contextPath }/board/boardUpdate.do"
					 method="post" enctype="multipart/form-data">
				<!-- <input type="hidden" name="uid" value="18122113471404"> 
				<input type="hidden" name="w" value=""> 
				<input type="hidden" name="bo_table" value="funny"> 
				<input type="hidden" name="wr_id" value="0"> 
				<input type="hidden" name="sca" value=""> 
				<input type="hidden" name="sfl" value="">
				<input type="hidden" name="stx" value=""> 
				<input type="hidden" name="spt" value=""> 
				<input type="hidden" name="sst" value=""> 
				<input type="hidden" name="sod" value=""> 
				<input type="hidden" name="page" value="">
				<input type="hidden" value="html1" name="html"> -->
				<div class="bbs_title_wrap">
					<a class="bbs_title">게시글 수정 </a> 
					<!-- <span class="btn btn-default" onclick="history.back();" style="margin-left: 5px;">취소</span> -->
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
						<input type="hidden" class="form-control" name="boardNo" value="${board.boardNo}"/>
						<label>제목</label> 
						<input type="text" name="boardTitle" id="wr_subject" class="form-control" value="${board.boardTitle }" required maxlength="80" />
						<label>작성자</label>
						<input type="text" class="form-control" name="userName" value="${member.userName}" readonly required>
					</div>

					<div class="wr_option wr_content">
						<label>내용</label>
						<div>
							<textarea id="wr_content" name="boardContent"
							class="smarteditor2 form-control" maxlength="65536"
							style="width: 100%; height: 300px; resize: none;">${board.boardContent }</textarea>
								
						</div>
						
						<c:if test="${empty boardFileList }">
						<div class="wr_option">
							<label>첨부파일 1</label><input type="file" name="upFile"
								title="파일첨부 1 : 용량 1,048,576 바이트 이하만 업로드 가능">
						</div>
						<div class="wr_option">
							<label>첨부파일 2</label> <input type="file" name="upFile"
								title="파일첨부 2 : 용량 1,048,576 바이트 이하만 업로드 가능">
						</div>
						<div class="wr_option">
							<label>첨부파일 3</label> <input type="file" name="upFile"
								title="파일첨부 3 : 용량 1,048,576 바이트 이하만 업로드 가능">
						</div>
						</c:if>
						
						<c:if test="${!empty boardFileList }">
						<c:forEach items="${boardFileList}" var="bf" varStatus="vs">
						<div class="wr_option">
							<label>첨부파일 ${vs.count }</label> ${bf.originName }<input type="file" name="upFile"
								title="파일첨부  : 용량 1,048,576 바이트 이하만 업로드 가능">
						</div>
						</c:forEach>
						</c:if>

				</div>
				<div class="wr_submit">
					<input type="submit" class="btn btn-info" value="확인" />
					<a href="${pageContext.request.contextPath }/board/boardList.do" class="btn btn-default">취소</a>
				</div>
			</div>
				<br /><br /><br /><br />
			</form>

				<script>
				
					$('#fwrite').submit(function(){
						
						oEditors.getById["wr_content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
						
						var wr_content = $('#wr_content').val();
						
						console.log(wr_content);
	
						if( wr_content == ""  || wr_content == null || wr_content == '&nbsp;' || wr_content == '<p>&nbsp;</p>' || wr_content == '<br>')  {
					             alert("내용을 입력하세요.");
					             
					             oEditors.getById["wr_content"].exec("FOCUS"); //포커싱
						
						} else {
								$('#fwrite').submit();
						}
						
						return false;
					});
					
					
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


					/*
					$(document).ready(function(){
						
						// 모바일에서 스마트에디터2 width 자동조절
						var get_SE_innerElement = "";
						var chk_SE_count = 0;
						var chk_SE_innerElement = setInterval(function(){
							
							get_SE_innerElement = document.getElementsByTagName("iframe")[0].contentWindow.document.getElementById("smart_editor2");

							chk_SE_count++;

							if (get_SE_innerElement == null) {
								if (chk_SE_count == 100) {
									// 10초가 지나도 자동조절 안되면 새로고침 유도
									alert("자바스크립트 오류입니다. 새로고침 해주세요.");
								}
							}
							else {
								clearInterval(chk_SE_innerElement);
								// console.log("로딩완료");
								get_SE_innerElement.style.minWidth = "100%";
								// console.log(get_SE_innerElement);
							}
						}, 100);

					});
					 */
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