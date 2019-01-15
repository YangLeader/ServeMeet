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



<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<title>게시글 작성</title>



</head>
<body>

	
	<div id="wrapper">
	
		<div class="container" style="background-color:white; border-radius: 20px;">
		<br />
		
			<form name="fwrite" id="fwrite" action="${pageContext.request.contextPath }/matching/matcingHistoryInsert.ma"
					 method="post" enctype="multipart/form-data">
				<div class="bbs_title_wrap">
					<a class="bbs_title">후기 글 작성 </a> 
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
						<label>제목</label> 
						<input type="hidden" name="matchingId" value="${matching.matchingId}"/>
						<input type="text" name="mTitle" id="wr_subject" class="form-control" value="${matching.mTitle} &nbsp; 의 후기" readonly required />
						<label>작성자</label>
						<input type="text" class="form-control" name="userName" value="${member.userName}" readonly required>
					</div>
					<c:if test="${matching.categoryId>300}">
						<div class="wr_option wr_content">
							<label>매칭승리 팀 : </label>&nbsp;&nbsp;&nbsp;&nbsp;
							<td>
								<label for="batTrue"><input type="radio" name="winnerChk" class="winner" value="A"/>A팀</label>
								<label for="batFalse"><input type="radio" name="winnerChk" class = "winner" value="B" checked="checked"/>B팀</label>
							</td>
						</div>
					</c:if> 
					<c:if test="${matching.categoryId<300}">
						<input type="hidden" name="winnerChk" value="N" />
					</c:if>
					<div class="wr_option wr_content">
						<label>내용</label>
						<div>
							<textarea id="wr_content" name="mhContent"
							class="smarteditor2 form-control" maxlength="65536"
							style="width: 100%; height: 300px; resize: none;"></textarea>
								
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
						<input type="submit" class="btn btn-info" name="submitButton" value="확인" />
						<a href="${pageContext.request.contextPath }/matching/mHistoryList.ma" class="btn btn-default">취소</a>
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
						
						}else {
							
							$('#fwrite').submit();
							
							$.ajax({
								url : "${pageContext.request.contextPath}/point/updatePoint.do",
								data : {increasePoint : 10,
										pContent : "후기글 작성 포인트"
										},
								success : function(){
									
									
									
					            }, error : function(jqxhr, textStatus, errorThrown){
					                console.log("ajax 처리 실패");
					                //에러로그
					                console.log(jqxhr);
					                console.log(textStatus);
					                console.log(errorThrown);
					            }
							});
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
				</script>
		</div>
	</div>
	
<c:import url="../common/footer.jsp" />

</body>
</html>
