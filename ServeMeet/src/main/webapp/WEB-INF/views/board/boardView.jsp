<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="ko">
<head>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-109178580-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-109178580-1');
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board_style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap_custom.css">
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
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/wrest.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>
</head>
<body>

<c:import url="../common/header.jsp" />

<!-- preloader (화면 전환 효과) -->

<div class="preloader"></div>

<script>
$(document).ready(function(){
	// 화면 전환 효과
	$('.preloader').fadeOut(150);
	
	$('.navbar-brand').width($('.navbar-brand > img').width());
	$(window).resize(function(){
		$('.navbar-brand').width($('.navbar-brand > img').width());
	});
});
</script>


<!-- 게시물 읽기 시작 { -->
<article id="bbs-view">

	<div class="bbs_title_wrap" style="display:none;">
		<a class="bbs_title" href="./board.php?bo_table=free">자유게시판</a>
	</div>
	
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bbs-view-top-btn" class="bbs_view_btn_wrap">
		<div class="button_box">
		   
			<a href="${pageContext.request.contextPath }/board/boardList.bo" class="bbs_btn btn_list">
				<span class="glyphicon glyphicon-list-alt"></span> 목록
			</a>
			
			<div class="button_box_right">
								<a href="./password.php?w=u&amp;bo_table=free&amp;wr_id=111&amp;page=" class="bbs_btn">
					<span class="glyphicon glyphicon-edit"></span> 수정
				</a>
				
								<a href="./password.php?w=d&amp;bo_table=free&amp;wr_id=111&amp;page=" class="bbs_btn" onclick="del(this.href); return false;">
					<span class="glyphicon glyphicon-trash"></span> 삭제
				</a>
				

				
								<a href="./write.php?bo_table=free" class="bbs_btn">
					<span class="glyphicon glyphicon-pencil"></span> 글쓰기
				</a>
							</div>
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

    
    
         <!-- 관련링크 시작 { -->
			<div id="bo_v_link">
					</div>
	    <!-- } 관련링크 끝 -->
    
    <section id="bo_v_atc">
        <div id="bo_v_img">
</div>
		
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">${board.boardContent }</div>
                <!-- } 본문 내용 끝 -->

        		
		
		<!-- 스크랩 추천 비추천 시작 { -->
				<div id="bo_v_act">
		
						<a href="./good.php?bo_table=free&amp;wr_id=111&amp;good=good&amp;" id="good_button" class="btn_bg btn">
				<span class="glyphicon glyphicon-thumbs-up"></span> 추천 
				<span id="bo_v_act_good" class="wr_count wr_good_cnt">0</span>
			</a>
						
						
						<a href="./scrap_popin.php?bo_table=free&amp;wr_id=111" target="_blank" id="scrap" class="btn_bg btn btn-default" onclick="win_scrap(this.href); return false;" title="스크랩">
				<span class="glyphicon glyphicon-book"></span> 스크랩
			</a>
			
			<!--
			<a href="./scrap_popin.php?bo_table=free&amp;wr_id=111" target="_blank"  class="btn_bg" onclick="win_scrap(this.href); return false;" title="신고"><span class="glyphicon glyphicon-bell"></span> 신고</a>
			-->
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
		<div class="cmt_top_title">댓글 <span><strong>2</strong></span></div>
	</div>
	-->
	<div class="cmt_list" >
		<ul class="cmt_list_ul">
						<li id="c_112" >
				<div class="cmt_inner_wrap">

					<p style="z-index:3" class="cmt_mb_info">

						
						<font class="write_user">me5758</a></font>

						
						<span>
							<span class="glyphicon glyphicon-time"></span> <time datetime="2018-12-24T14:28:00+09:00">
							18-12-24 14:28</time>
						</span>

											</p>

					<!-- 댓글 출력 -->
					<p class="cmt_content">

						
						123					</p>

					<div class="cmt_button_box">
					
												<a class="btn_cmt btn btn-default btn-xs" href="./board.php?bo_table=free&amp;wr_id=111&amp;&amp;&amp;c_id=112&amp;w=c#bo_vc_w" onclick="comment_box('112', 'c'); return false;">
							<span class="glyphicon glyphicon-comment"></span> 답글쓰기
						</a>
						
						
						
										</div>

					<span id="edit_112" class="edit_cmt"></span><!-- 수정 -->
					<span id="reply_112" class="edit_reply"></span><!-- 답변 -->

					<input type="hidden" value="" id="secret_comment_112">

					<textarea id="save_comment_112" style="display:none">123</textarea>

				</div>
			</li>
						<li id="c_113" style="padding-left:15px" >
				<div class="cmt_inner_wrap">

					<p style="z-index:2" class="cmt_mb_info">

												<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_reply.gif" class="icon_reply" alt="댓글의 댓글">
						
						<font class="write_user">me5758</a></font>

						
						<span>
							<span class="glyphicon glyphicon-time"></span> <time datetime="2018-12-24T14:32:00+09:00">
							18-12-24 14:32</time>
						</span>

											</p>

					<!-- 댓글 출력 -->
					<p class="cmt_content">

						
						ㅎㅇ					</p>

					<div class="cmt_button_box">
					
												<a class="btn_cmt btn btn-default btn-xs" href="./board.php?bo_table=free&amp;wr_id=111&amp;&amp;&amp;c_id=113&amp;w=c#bo_vc_w" onclick="comment_box('113', 'c'); return false;">
							<span class="glyphicon glyphicon-comment"></span> 답글쓰기
						</a>
						
												<a class="btn_cmt btn btn-default btn-xs" href="./board.php?bo_table=free&amp;wr_id=111&amp;&amp;&amp;c_id=113&amp;w=cu#bo_vc_w" onclick="comment_box('113', 'cu'); return false;">
							<span class="glyphicon glyphicon-edit"></span> 수정
						</a>
						
												<a class="btn_cmt btn btn-default btn-xs" href="./delete_comment.php?bo_table=free&amp;comment_id=113&amp;token=15456295895c206f95f39e6&amp;page=" onclick="return comment_delete();">
							<span class="glyphicon glyphicon-trash"></span> 삭제</a>
						
										</div>

					<span id="edit_113" class="edit_cmt"></span><!-- 수정 -->
					<span id="reply_113" class="edit_reply"></span><!-- 답변 -->

					<input type="hidden" value="" id="secret_comment_113">

					<textarea id="save_comment_113" style="display:none">ㅎㅇ</textarea>

				</div>
			</li>
					</ul>
	</div>

</div>
<!-- } 댓글 끝 -->

<!-- 댓글 쓰기 시작 { -->
<div id="bo_vc_wrap">
	<aside id="bo_vc_w">
		<form name="fviewcomment" action="./write_comment_update.php" onsubmit="return fviewcomment_submit(this);" method="post" autocomplete="off">
		<input type="hidden" name="w" value="c" id="w">
		<input type="hidden" name="bo_table" value="free">
		<input type="hidden" name="wr_id" value="111">
		<input type="hidden" name="comment_id" value="" id="comment_id">
		<input type="hidden" name="sca" value="">
		<input type="hidden" name="sfl" value="">
		<input type="hidden" name="stx" value="">
		<input type="hidden" name="spt" value="">
		<input type="hidden" name="page" value="">
		<input type="hidden" name="is_good" value="">

		<div class="cmt_wr_wrap">
			
			<div class="cmt_wr_info">

				<div class="wr_option">
								<div class="cmt_wr_secret">
					<input type="checkbox" name="wr_secret" value="secret" id="wr_secret">
					<label for="wr_secret">비밀글</label>
				</div>
				
				<textarea id="wr_content" name="wr_content" class="form-control" title="내용"  rows="3" maxlength="10000" required></textarea>

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

function comment_box(comment_id, work)
{
    var el_id;
    // 댓글 아이디가 넘어오면 답변, 수정
    if (comment_id)
    {
        if (work == 'c')
            el_id = 'reply_' + comment_id;
        else
            el_id = 'edit_' + comment_id;
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
        // 댓글 수정
        if (work == 'cu')
        {
            document.getElementById('wr_content').value = document.getElementById('save_comment_' + comment_id).value;
            if (typeof char_count != 'undefined')
                check_byte('wr_content', 'char_count');
            if (document.getElementById('secret_comment_'+comment_id).value)
                document.getElementById('wr_secret').checked = true;
            else
				try
				{
                document.getElementById('wr_secret').checked = false;
				}
				catch (err)
				{

				}
        }

        document.getElementById('comment_id').value = comment_id;
        document.getElementById('w').value = work;

        if(save_before)
            $("#captcha_reload").trigger("click");

        save_before = el_id;
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

    // 이미지 리사이즈
    $("#bo_v_atc").viewimageresize();
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
			<a class="bbs_title" href="./board.php?bo_table=free">자유게시판</a>
		</div>

		<!-- 게시판 카테고리 시작 { -->
				
		
		<select class="bbs_cate_select form-control">
			<!--
			<a class="bbs_category  on" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free">
				<span class="glyphicon glyphicon-ok"></span> 전체
			</a>
			-->
			<option value="">분류 선택 &nbsp;</option>
						<!--
			<a class="bbs_category " href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&sca=잡담">
				<span class="glyphicon glyphicon-ok"></span> 잡담			</a>
			-->
			<option value="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&sca=잡담" >[잡담]</option>
						<!--
			<a class="bbs_category " href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&sca=질문">
				<span class="glyphicon glyphicon-ok"></span> 질문			</a>
			-->
			<option value="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&sca=질문" >[질문]</option>
					</select>
		<!-- } 게시판 카테고리 끝 -->
		
		<div class="button_box">
						<a href="./write.php?bo_table=free" class="bbs_btn btn_write">
				<span class="glyphicon glyphicon-pencil"></span> 글쓰기
			</a>
								</div>
	</div>

	<form name="fboardlist" id="fboardlist" action="./board_list_update.php" onsubmit="return fboardlist_submit(this);" method="post">
	<input type="hidden" name="bo_table" value="free">
	<input type="hidden" name="sfl" value="">
	<input type="hidden" name="stx" value="">
	<input type="hidden" name="spt" value="">
	<input type="hidden" name="sca" value="">
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="sw" value="">

	<div class="bbs-list">
		<ul id="bbs-list-ul">
			<li class="bbs_list_top">
				<span class="subject">
										<span class="subject_text">
						<span class="glyphicon glyphicon-tag"></span> 제목
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
										<span class="w45 wr_good gdtxt">
						<span class="glyphicon glyphicon-thumbs-up"></span> 추천
					</span>
									</span>
			</li>
						<li class="bbs_list_basic bbs-list-notice">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=74');">
					
					
					
										<span class="category_text">[공지]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=74">
						<b>자유게시판 공지사항입니다.</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 01-17					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 66					</span>

					
										<span class="w45 wr_good gdtxt">
												-
											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic bbs-list-current">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=111');">
					
										<span class="bbs_list_current_text">(열람중)</span>
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=111">
						<b>안녕</b>					</a>

										<span class="cn">
						(2)
						<!--
						<span class="glyphicon glyphicon-comment"></span>2						-->
					</span>
					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_guest">123</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 12-20					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 3					</span>

										<!--
					<span class="w45 wr_comment">
						<span class="glyphicon glyphicon-comment"></span> 2					</span>
					-->
					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=109');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=109">
						<b>테스트</b>					</a>

					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_guest">재회</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 08-20					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 40					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_link.gif" alt="관련링크">					</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=108');">
					
					
					
										<span class="category_text">[질문]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=108">
						<b>신기해서 글써봐요!!</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_guest">김종호</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 08-13					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 43					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=91');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=91">
						<b>네이버 로그인 글쓰기 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
					<img src="http://aq23r1gt.iwinv.net/skin/board/_basic/img/icon_hot.gif" alt="인기글">					</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">aq23</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-19					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 125					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=90');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=90">
						<b>카카오톡 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">edelburg</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 90					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=89');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=89">
						<b>페북 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">BurgEdel</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 66					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=88');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=88">
						<b>구글 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">purissSpirit</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 69					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=87');">
					
					
					
										<span class="category_text">[공지]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=87">
						<b>자유게시판 공지사항입니다.</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 01-17					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 65					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=86');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=86">
						<b>카카오톡 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">edelburg</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 71					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=85');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=85">
						<b>페북 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">BurgEdel</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 61					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=84');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=84">
						<b>구글 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">purissSpirit</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 69					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=83');">
					
					
					
										<span class="category_text">[공지]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=83">
						<b>자유게시판 공지사항입니다.</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">최고관리자</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 01-17					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 51					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=82');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=82">
						<b>카카오톡 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">edelburg</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 57					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
						<li class="bbs_list_basic">
				<span class="subject" onclick="view_link_type_m('http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=81');">
					
					
					
										<span class="category_text">[잡담]</span>
					
					<a class="subject_text" href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free&amp;wr_id=81">
						<b>페북 로그인 테스트</b>					</a>

					
										
										<span class="w45 icon"> 
										</span>
									</span>

				<span class="dec">

					<span class="w45 wr_name">
						<span class="glyphicon glyphicon-user"></span> <span class="sv_member">BurgEdel</span>					</span>

					<span class="w45 wr_date">
						<span class="glyphicon glyphicon-time"></span> 03-09					</span>

					<span class="w45 wr_hit">
						<span class="glyphicon glyphicon-eye-open"></span> 56					</span>

					
										<span class="w45 wr_good gdtxt">
												<span class="glyphicon glyphicon-thumbs-up"></span> 0											</span>
										
					<!--
					<span class="w45">
										</span>
					-->
				</span>
			</li>
					</ul>
	</div>

	
	</form>
	
	<div class="bbs_action_box">
		<!-- 게시판 검색 시작 { -->
		<fieldset id="bbs_sch">
			<form id="sch_frm" name="fsearch" method="get">
			<input type="hidden" name="bo_table" value="free">
			<input type="hidden" name="sca" value="">
			<input type="hidden" name="sop" value="and">
				<div class="bo_sch">

					<select name="sfl" id="sfl" class="form-control">
						<option value="wr_subject">제목</option>
						<option value="wr_content">내용</option>
						<option value="wr_subject||wr_content">제목+내용</option>
						<option value="mb_id,1">회원아이디</option>
						<option value="mb_id,0">회원아이디(코)</option>
						<option value="wr_name,1">글쓴이</option>
						<option value="wr_name,0">글쓴이(코)</option>
					</select>
					<input type="text" name="stx" class="form-control value="" required id="stx" size="15" maxlength="15">

					<button type="submit" id="searchsubmit">
						<span class="glyphicon glyphicon-search"></span>
					</button>

				</div>
			</form>
		</fieldset>
		<!-- } 게시판 검색 끝 -->

	</div>

	<div class="button_box" style="float:unset;">
		
				<a href="http://aq23r1gt.iwinv.net/bbs/board.php?bo_table=free" class="bbs_btn btn_write" style="float:left; margin-left:0;">
			<span class="glyphicon glyphicon-list-alt"></span> 목록
		</a>
		
				<a href="./write.php?bo_table=free" class="bbs_btn btn_write">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</a>
			</div>

	<div class="pager">
		<nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="./board.php?bo_table=free&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="./board.php?bo_table=free&amp;page=2" class="pg_page pg_end"></a>
</span></nav>
		<div class="pg_wrap_m"><span class="pg_info_m">1 / 2</span><a href="./board.php?bo_table=free&amp;page=2" class="pg_page pg_next_m">다음페이지</span></a>
<a href="./board.php?bo_table=free&amp;page=2" class="pg_page pg_end"></a>
</div>	</div>

</div>


<script>

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