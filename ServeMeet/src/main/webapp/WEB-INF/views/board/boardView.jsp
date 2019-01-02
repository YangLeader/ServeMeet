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
<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-109178580-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-109178580-1');
</script> -->

<!--
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
  (adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-2755471938797797",
    enable_page_level_ads: true
  });
</script>
-->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<!--
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-2755471938797797",
          enable_page_level_ads: true
     });
</script>
-->
<title>자유게시판</title>

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

<script>
		
	$(function(){
		$("span.subject.text").on("click",function(){
			var boardNo = $(this).children().attr("id");
			console.log("bordNo="+boardNo);
			location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+boardNo;
		});
	});
</script>

<!-- preloader (화면 전환 효과) -->

<!-- <div class="preloader"></div>

<script>
$(document).ready(function(){
	// 화면 전환 효과
	$('.preloader').fadeOut(150);
	
	$('.navbar-brand').width($('.navbar-brand > img').width());
	$(window).resize(function(){
		$('.navbar-brand').width($('.navbar-brand > img').width());
	});
});
</script> -->

<div id="wrapper">
	<div class="container">

<!-- 게시물 읽기 시작 { -->
<article id="bbs-view" style="width:auto;">

	<div class="bbs_title_wrap" style="">
		<a class="bbs_title" href="${pageContext.request.contextPath }/board/boardList.do">자유게시판</a>
	</div>
	
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bbs-view-top-btn" class="bbs_view_btn_wrap">
		<div class="button_box">
		   
			<a href="${pageContext.request.contextPath }/board/boardList.do" class="bbs_btn btn_list">
				<span class="glyphicon glyphicon-list-alt"></span> 목록
			</a>
			
			<c:if test="${board.userName eq member.userName}">
			<div class="button_box_right">
								<a href="${pageContext.request.contextPath }/board/boardUpdateView.do?no=${board.boardNo }" class="bbs_btn">
					<span class="glyphicon glyphicon-edit" ></span> 수정
				</a>
				
								<a href="${pageContext.request.contextPath}/board/boardDelete.do?no=${board.boardNo}" class="bbs_btn">
					<span class="glyphicon glyphicon-trash"></span> 삭제
				</a>
			
			</div>
			</c:if>
		</div>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->

	<div id="bbs-view-subject">
		<header>
			<h2 id="bbs-view-title">
								${board.boardTitle }		</h2>
		</header>

		<section id="bbs-view-info">
			<span class="write_user"><span class="sv_guest">${board.userName }</span></span>
			<span></span>
			<span>
				<span class="glyphicon glyphicon-time"></span> ${board.boardDate }		</span>
			
			<span>
				<span class="glyphicon glyphicon-eye-open"></span> ${board.boardCount }			</span>
		</section>
	</div>

<%-- 		<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<button type="button" 
						class="btn btn-outline-success btn-block"
						onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
					첨부파일${vs.count} - ${a.originalFileName }
				</button>
			</c:forEach> --%>
    <!-- 첨부파일 시작 { -->
    <c:forEach items="${boardFileList}" var="bf">
    <div id="bo_v_file">
        <span>
			<a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" class="bo_v_ect" download>
				<span class="glyphicon glyphicon-save"></span>&nbsp;
				${bf.originName }
			</a>
		</span>
    </div>
    </c:forEach>
    <!-- } 첨부파일 끝 -->
    
    
    <section id="bo_v_atc">
        <div id="bo_v_img">
</div>
		
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        	<c:forEach items="${boardFileList}" var="bf">
        	<p>
        		<a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" onclick="window.open(this.href,'_blank','width=700,height=700');return false;">
        		<%-- <a href="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" target="_blank" class="view_image"> --%>
        			<img src="${pageContext.request.contextPath }/resources/upload/board/${bf.changeName}" alt="${bf.originName }" style="width: 70%;"/>
        			<br />
        		</a>
        		<br style="clear:both;" />
        	</p>
        	</c:forEach>
        	<p><br /></p>
        	<pre><p>${board.boardContent }</p></pre>
        	<p><br /></p>
        </div>
                <!-- } 본문 내용 끝 -->

        		
		
		<!-- 스크랩 추천 비추천 시작 { -->
				<div id="bo_v_act">
					<a href="./good.php?bo_table=free&amp;wr_id=111&amp;good=good&amp;" id="good_button" class="btn_bg btn">
						<span class="glyphicon glyphicon-thumbs-up"></span> 추천 지금은 안됨ㅋ
						<span id="bo_v_act_good" class="wr_count wr_good_cnt">0</span>
					</a>
					
					<a href="./scrap_popin.php?bo_table=free&amp;wr_id=111" target="_blank"  class="btn_bg" onclick="win_scrap(this.href); return false;" title="신고">
					<span class="glyphicon glyphicon-bell"></span> 신고 지금은 안됨ㅋ
					</a>
			
		</div>
				<!-- } 스크랩 추천 비추천 끝 -->
		
    </section>

	
    
    
<script>
// 글자수 제한
var char_min = parseInt(0); // 최소
var char_max = parseInt(0); // 최대
</script>

<!-- 댓글 시작 { -->
<div id="bo_vc">
	<!--
    <div class="cmt_top">
		<div class="cmt_top_title">댓글 <span><strong>4</strong></span></div>
	</div>
	-->

	<c:forEach items="${cList}" var="cl" varStatus="vs">
	
	<c:if test="${cl.refCid eq 0 }">
	
	<!-- 댓글 열고 닫고 위한 if -->
	<c:if test="${vs.count ne 1 }">
		</ul>
		</div>
	</c:if>
	
	<div class="cmt_list" >
		<ul class="cmt_list_ul">
			<li id="${ cl.commentId }" >
				<div class="cmt_inner_wrap">
					<p style="z-index:5" class="cmt_mb_info">

						
						<font class="write_user"><a>${cl.userName }</a></font>

						
						<span>
							<span class="glyphicon glyphicon-time"></span> ${cl.commentDate }
						</span>

					</p>

					<!-- 댓글 출력 -->
					<c:if test="${cl.commentStatus eq 'Y' }">
					<p class="cmt_content">${cl.commentCon }</p>
					</c:if>
					<c:if test="${cl.commentStatus ne 'Y' }">
					<p class="cmt_content" style="color:red;">삭제된 댓글 입니다.</p>
					</c:if>
					
					<div class="cmt_button_box">
						<a class="btn_cmt btn btn-default btn-xs"  onclick="comment_box(${cl.commentId}, 'c', ${ cl.orderList }, '${cl.userName }'); return false;">
							<span class="glyphicon glyphicon-comment"></span> 답글쓰기
						</a>
						
						<c:if test="${cl.userName eq member.userName and cl.commentStatus eq 'Y'}">
						<a class="btn_cmt btn btn-default btn-xs"  onclick="comment_box(${cl.commentId}, 'cu', ${ cl.orderList }, 1); return false;">
							<span class="glyphicon glyphicon-edit"></span> 수정
						</a>
						
						<a class="btn_cmt btn btn-default btn-xs" href="${pageContext.request.contextPath }/board/deleteComment.do?boardNo=${board.boardNo}&commentId=${cl.commentId}" onclick="return comment_delete();">
							<span class="glyphicon glyphicon-trash"></span> 삭제
						</a>
						</c:if>
					</div>

					<span id="edit_${cl.commentId }" class="edit_cmt" style="display:none"></span><!-- 수정 -->
					<span id="reply_${cl.commentId }" class="edit_reply" style="display:none"></span><!-- 답변 -->

					<textarea id="save_comment_${cl.commentId }" style="display:none"></textarea>

				</div>
			</li>
		<!-- </ul>
	</div> -->
	</c:if>
	
	<c:if test="${cl.refCid ne 0 }">
			<li id="${cl.commentId }" style="padding-left:15px" >
				<div class="cmt_inner_wrap">
					<p style="z-index:4" class="cmt_mb_info">
						<img src="${pageContext.request.contextPath }/resources/images/icon_reply.gif" class="icon_reply" alt="댓글의 댓글">
						
						<font class="write_user"><a>${cl.userName } ▶ <b style="color:red;">${cl.getName }</b></a></font>

						<span>
							<span class="glyphicon glyphicon-time"></span> ${cl.commentDate }
						</span>

					</p>

					<!-- 댓글 출력 -->
					<c:if test="${cl.commentStatus eq 'Y' }">
					<p class="cmt_content">${cl.commentCon }</p>
					</c:if>
					<c:if test="${cl.commentStatus ne 'Y' }">
					<p class="cmt_content" style="color:red;">삭제된 댓글 입니다.</p>
					</c:if>

					<div class="cmt_button_box">
						<a class="btn_cmt btn btn-default btn-xs"  onclick="comment_box(${cl.commentId}, 'c', ${ cl.orderList }, '${cl.userName }'); return false;">
							<span class="glyphicon glyphicon-comment"></span> 답글쓰기
						</a>
						
						<c:if test="${cl.userName eq member.userName and cl.commentStatus eq 'Y'}">
						<a class="btn_cmt btn btn-default btn-xs" onclick="comment_box(${cl.commentId}, 'cu', ${ cl.orderList }, 1); return false;">
							<span class="glyphicon glyphicon-edit"></span> 수정
						</a>
						
						<a class="btn_cmt btn btn-default btn-xs" href="${pageContext.request.contextPath }/board/deleteComment.do?boardNo=${board.boardNo}&commentId=${cl.commentId}" onclick="return comment_delete();">
							<span class="glyphicon glyphicon-trash"></span> 삭제
						</a>
						</c:if>
					</div>

					<span id="edit_${cl.commentId }" class="edit_cmt" style="display:none"></span><!-- 수정 -->
					<span id="reply_${cl.commentId }" class="edit_reply" style="display:none"></span><!-- 답변 -->

					<textarea id="save_comment_${cl.commentId }" style="display:none"></textarea>
					
				</div>
			</li>
	</c:if>
	</c:forEach>
</div>
<!-- } 댓글 끝 -->

<!-- 댓글 쓰기 시작 { -->
<div id="bo_vc_wrap">
	<aside id="bo_vc_w">
		<form id="frm_comment" name="fviewcomment" action="${pageContext.request.contextPath }/board/insertComment.do" method="post" autocomplete="off">
		<input type="hidden" name="w" value="c" id="w">
		<input type="hidden" name="refCid" value="" id="refCid">
		<input type="hidden" name="boardNo" value="${board.boardNo }">
		<input type="hidden" name="userName" value="${member.userName }">
		<input type="hidden" name="orderList" value="" id="orderList">
		

		<div class="cmt_wr_wrap">
			
			<div class="cmt_wr_info">

				<div class="wr_option">
					
				
				<textarea id="wr_content" name="commentCon" class="form-control" title="내용"  rows="3" maxlength="10000" required></textarea>

								</div>

				
			</div>

			<div class="cmt_wr_submit">
				<button type="submit" id="btn_submit" class="btn btn-info btn-sm" accesskey="s"><span class="glyphicon glyphicon-ok"></span> 댓글등록</button>
				<a id="btn_cancle" class="btn btn-default btn-sm"  onclick="comment_box(0, 'c'); return false;">취소</a>
			</div>
			
			<!--
			<div id="emo_box" class="dno">
				<img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_0.gif" onclick="c_inp_emo(0)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_1.gif" onclick="c_inp_emo(1)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_2.gif" onclick="c_inp_emo(2)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_3.gif" onclick="c_inp_emo(3)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_4.gif" onclick="c_inp_emo(4)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_5.gif" onclick="c_inp_emo(5)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_6.gif" onclick="c_inp_emo(6)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_7.gif" onclick="c_inp_emo(7)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_8.gif" onclick="c_inp_emo(8)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_9.gif" onclick="c_inp_emo(9)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_10.gif" onclick="c_inp_emo(10)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_11.gif" onclick="c_inp_emo(11)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_12.gif" onclick="c_inp_emo(12)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_13.gif" onclick="c_inp_emo(13)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_14.gif" onclick="c_inp_emo(14)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_15.gif" onclick="c_inp_emo(15)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_16.gif" onclick="c_inp_emo(16)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_17.gif" onclick="c_inp_emo(17)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_18.gif" onclick="c_inp_emo(18)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_19.gif" onclick="c_inp_emo(19)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_20.gif" onclick="c_inp_emo(20)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_21.gif" onclick="c_inp_emo(21)" /><img src="http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_22.gif" onclick="c_inp_emo(22)" />			</div>
			-->

		</div>
		</form>
	</aside>
</div>

<script>
var save_before = '';
var save_html = document.getElementById('bo_vc_w').innerHTML;

function good_and_write()
{
    var f = document.fviewcomment;
    if (fviewcomment_submit(f)) {
        f.is_good.value = 1;
        f.submit();
    } else {
        f.is_good.value = 0;
    }
}

function fviewcomment_submit(f)
{
    var pattern = /(^\s*)|(\s*$)/g; // \s 공백 문자

    f.is_good.value = 0;

    var subject = "";
    var content = "";
    $.ajax({
        url: g5_bbs_url+"/ajax.filter.php",
        type: "POST",
        data: {
            "subject": "",
            "content": f.wr_content.value
        },
        dataType: "json",
        async: false,
        cache: false,
        success: function(data, textStatus) {
            subject = data.subject;
            content = data.content;
        }
    });

    if (content) {
        alert("내용에 금지단어('"+content+"')가 포함되어있습니다");
        f.wr_content.focus();
        return false;
    }

    // 양쪽 공백 없애기
    var pattern = /(^\s*)|(\s*$)/g; // \s 공백 문자
    document.getElementById('wr_content').value = document.getElementById('wr_content').value.replace(pattern, "");
    if (char_min > 0 || char_max > 0)
    {
        check_byte('wr_content', 'char_count');
        var cnt = parseInt(document.getElementById('char_count').innerHTML);
        if (char_min > 0 && char_min > cnt)
        {
            alert("댓글은 "+char_min+"글자 이상 쓰셔야 합니다.");
            return false;
        } else if (char_max > 0 && char_max < cnt)
        {
            alert("댓글은 "+char_max+"글자 이하로 쓰셔야 합니다.");
            return false;
        }
    }
    else if (!document.getElementById('wr_content').value)
    {
        alert("댓글을 입력하여 주십시오.");
        return false;
    }

    if (typeof(f.wr_name) != 'undefined')
    {
        f.wr_name.value = f.wr_name.value.replace(pattern, "");
        if (f.wr_name.value == '')
        {
            alert('이름이 입력되지 않았습니다.');
            f.wr_name.focus();
            return false;
        }
    }

    if (typeof(f.wr_password) != 'undefined')
    {
        f.wr_password.value = f.wr_password.value.replace(pattern, "");
        if (f.wr_password.value == '')
        {
            alert('비밀번호가 입력되지 않았습니다.');
            f.wr_password.focus();
            return false;
        }
    }

    
	set_comment_token(f);

    document.getElementById("btn_submit").disabled = "disabled";

    return true;
}

function comment_box(commentId, work, orderList, isRecomment)
{
    var el_id;
    // 댓글 아이디가 넘어오면 답변, 수정
    if (commentId)
    {
        if (work == 'c')
            el_id = 'reply_' + commentId;
        else
            el_id = 'edit_' + commentId;
    }
    else
        el_id = 'bo_vc_w';

    if (save_before != el_id)
    {
        if (save_before)
        {
            document.getElementById(save_before).style.display = 'none';
            document.getElementById(save_before).innerHTML = '';
        }
        
        document.getElementById(el_id).style.display = '';
        document.getElementById(el_id).innerHTML = save_html;
        
        
        if(commentId == "" || commentId === 'undefined'  ||  isNaN(commentId) == true){
        
        	document.getElementById('refCid').value = 0;
        	document.getElementById('w').value = work;
        	
        } else {
        	
        	document.getElementById('refCid').value = commentId;
        	document.getElementById('w').value = work;
        }
        
        if(orderList == "" || orderList === 'undefined'  ||  isNaN(orderList) == true){
        	document.getElementById('orderList').value = 0;
			document.getElementById('w').value = work;
        } else {
        	document.getElementById('orderList').value = orderList;
        	document.getElementById('w').value = work;
        }
        

        if(save_before)
            $("#captcha_reload").trigger("click");

        save_before = el_id;
    }
    
    // 수정일때
	if(isRecomment === 1){
    	
    	$("#frm_comment").append('<input type="hidden" name="commentId" value="" id="commentId">');

    	
    	$("#frm_comment").attr("action", "updateComment.do");
    	
    	$("#frm_comment").submit(function(){
    		document.getElementById('commentId').value = commentId;
        });
    	
    } else {
    	
    	console.log(isRecomment);
    	
    	$("#frm_comment").append('<input type="hidden" name="getName" value="" id="getName">');
    	
    	document.getElementById('getName').value = isRecomment;
    }
		
	
	
}



function comment_delete()
{
    return confirm("이 댓글을 삭제하시겠습니까?");
}

comment_box('', 'c'); // 댓글 입력폼이 보이도록 처리하기위해서 추가 (root님)


/*
var emoarr = new Array("(ㅠ_ㅠ)","√(´∀`√)","(O_O)","(^3^)","(@_@)","(-_-;;)","(￣∇￣)∂","(X.X)","(ㅡㅡ)","(^_^)_b","(*｀Д´)/","(｀へ´)","s(─━┘Д└━─)z","ㄴ( ºДºㆀ)ㄱ","づºДº)つ","?(*￣ .￣)a","OTL","-(_\"_)-","(♥_♥)","(-ㅠ-)","(-_-)zz","(ㅡ,.ㅡ)","z(o_o)z");	
	
function c_inp_emo(i){
	var yzt = $("#wr_content");
	var val = yzt.val();
	val += emoarr[i];
	yzt.val(val);
}

$(document).ready(function () {
	$('p.cmt_content').each(function(h){
		var t = $(this);
		var html = t.html();
		console.log(html);
		var j = emoarr.length;
		for(var i = 0;i<j;i++){
			html = html.replaceAll(emoarr[i],"<img src='http://cfs.tistory.com/custom/blog/151/1510464/skin/images/em_"+i+".gif' alt='"+emoarr[i]+"' class='emoi' />");
		}
		t.html(html);
	});
});

if(!String.prototype.replaceAll) {
	String.prototype.replaceAll = function(source, target) {
		source = source.replace(new RegExp("(\\W)", "g"), "\\$1");
		target = target.replace(new RegExp("\\$", "g"), "$$$$");
		return this.replace(new RegExp(source, "gm"), target);
	}
}
*/
</script>
<!-- } 댓글 쓰기 끝 -->
    <!-- 링크 버튼 시작 { -->
	<!--
    <div id="bo_v_bot" class="bbs_view_btn_wrap">
            </div>
	-->
    <!-- } 링크 버튼 끝 -->

</article>
<!-- } 게시판 읽기 끝 -->

<script>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

    // 추천, 비추천
    $("#good_button, #nogood_button").click(function() {
        var $tx;
        if(this.id == "good_button")
            $tx = $("#bo_v_act_good");
        else
            $tx = $("#bo_v_act_nogood");

        excute_good(this.href, $(this), $tx);
        return false;
    });
    
    $("#frm_comment").submit(function(){
    	if($(".cmt_list").length == 0){
    		$("#refCid").val(0);
    		$("#orderList").val(0);
    	}
    });

    // 이미지 리사이즈
    //$("#bo_v_atc").viewimageresize();
});

function excute_good(href, $el, $tx)
{
    $.post(
        href,
        { js: "on" },
        function(data) {
            if(data.error) {
                alert(data.error);
                return false;
            }

            if(data.count) {
                $el.find(".wr_count").text(number_format(String(data.count)));
				if($tx.attr("id").search("nogood") > -1) {
					alert("이 글을 비추천 하셨습니다.");
					/*
                    $tx.text("이 글을 비추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
					*/
                } else {
					alert("이 글을 추천 하셨습니다.");
					/*
                    $tx.text("이 글을 추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
					*/
                }
            }
        }, "json"
    );
}
</script>

<!-- } 게시글 읽기 끝 -->
<!-- 게시판 목록 시작 { -->
<div id="bbs-list-wrap">

	<div id="bbs-list-top">
		<!-- 게시판 타이틀 -->
		<div class="bbs_title_wrap">
			<a class="bbs_title" href="${pageContext.request.contextPath }/board/boardList.do">자유게시판</a>
		</div>
	</div>

	<div class="bbs-list">
		<ul id="bbs-list-ul">
			<li class="bbs_list_top">
				<span class="subject"> 
					<span class="subject_text"> 
						<span class="glyphicon glyphicon-tag"></span> 
											제목
					</span>
				</span> 
				<span class="dec">
					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> 글쓴이
					</span>
					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 날짜
					</span>
					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 조회
					</span>
				</span>
			</li>
			<c:forEach items="${list}" var="b">
			<li class="bbs_list_basic">
				<span class="subject text">
					<a id="${b.boardNo }"><b>${b.boardTitle }</b></a> 
						<span class="w45 icon"> </span>
				</span> 
				<span class="dec"> 
					<span class="w45 wr_name"> 
						<span class="glyphicon glyphicon-user"></span> 
								${b.userName }
					</span> 
					<span class="w45 wr_date" style="width:6.5em"> 
						<span class="glyphicon glyphicon-time"></span> 
								${b.boardDate }
					</span> 
					<span class="w45 wr_hit"> 
						<span class="glyphicon glyphicon-eye-open"></span> 
								${b.boardCount }
					</span> 
									<!-- <span class="w45 wr_good gdtxt"> 
										<span class="glyphicon glyphicon-thumbs-up"></span> 
									 		추천수
									</span> -->
				</span>
							
			</li>
			</c:forEach>
		</ul>
	</div>

	
	<div class="bbs_action_box">
		<!-- 게시판 검색 시작 { -->
		<fieldset id="bbs_sch">
			<div class="bo_sch">

				<select name="sfl" id="sfl" class="form-control">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">글쓴이</option>					
				</select>
			
				<input type="text" name="stx" class="form-control value=" required id="stx" size="15" maxlength="15">

				<button type="button" id="searchsubmit" onclick="search();">
					<span class="glyphicon glyphicon-search"></span>
				</button>

			</div>

		</fieldset>
		<!-- } 게시판 검색 끝 -->

	</div>

	<div class="button_box" style="float:unset;">
		
				<a href="${pageContext.request.contextPath }/board/boardList.do" class="bbs_btn btn_write" style="float:left; margin-left:0;">
			<span class="glyphicon glyphicon-list-alt"></span> 목록
		</a>
		
				<a href="${pageContext.request.contextPath}/board/boardForm.do" class="bbs_btn btn_write">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</a>
			</div>

	<div class="pager">
					<c:out value="${pageBar}" escapeXml="false"/>
					<!-- <nav class="pg_wrap">
						<span class="pg">
							<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page pg_start"></a> 
							<a href="./board.php?bo_table=funny&amp;page=1" class="pg_page">1<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=3" class="pg_page">3<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=4" class="pg_page">4<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=5" class="pg_page">5<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=6" class="pg_page">6<span class="sound_only">페이지</span></a> 
								<span class="sound_only">열린</span><strong class="pg_current">7</strong>
								<span class="sound_only">페이지</span>
							<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page">8<span class="sound_only">페이지</span></a> 
							<a href="./board.php?bo_table=funny&amp;page=8" class="pg_page pg_end"></a> 
						</span>
					</nav> -->
				</div>

</div>


<script>

function search(){
	location.href="searchBoard.do?con="+$('#sfl').val()+"&keyword="+$('#stx').val();
}

function put_tags(a){
	$("#stx").val(a).focus();
	$("#sfl").val("wr_1");
}

$(function(){
	var stx = $('#stx');
	stx.focus(function(){
		$("#sfl").removeClass("dno");
	});
	
	bbs_list_width_fixed();

	setTimeout(function(){
		bbs_list_width_fixed();
	}, 100);
	
	$(window).resize(function(){
		bbs_list_width_fixed();
	});
	
	// 분류 변경시 페이지 이동
	$('.bbs_cate_select').change(function(){
		if ($(this).val() != "") {
			location.href = $(this).val();
		}
	});
});

// 리스트 제목 부분 width 자동조절
function bbs_list_width_fixed(){
	$('#bbs-list-ul .subject_text').css('max-width', $('#bbs-list-ul li').innerWidth() - $('#bbs-list-ul li .dec').innerWidth() - 170);

	if (($(window).innerWidth()+17) > 767) {
		$('.bbs_list_basic .subject').width($('#bbs-list-ul li').width() - $('#bbs-list-ul .dec').width() - 20);
	}
	else {
		$('.bbs_list_basic .subject').css('width', '100%');
	}

	$('.bbs_list_top .subject').css('width', ($('#bbs-list-ul li').innerWidth() - $('.bbs_list_top .dec').innerWidth()) / 2 + 20);
}

// 모바일 게시판 리스트에서 제목 부분 (넓은 영역) 터치시 글 읽기 활성화
function view_link_type_m(get_url){
	if (window.innerWidth < 768) {
		location.href = get_url;
	}
}
</script>
<!-- } 게시판 목록 끝 -->			<!--</div>--><!-- .rightBox -->
		<!--</div>--><!-- .row -->
	</div><!-- .container -->
</div><!-- .wrapper -->
<c:import url="../common/footer.jsp" />

</body>
</html>