<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>ServeMeet</title>
<style type="text/css">
.matchingBox {
	display:inline-block;
	padding: 10px;
	width: 180px;
	height: 150px;
	border: 1px #5e73de solid;
	margin: 10px 3px;
	box-shadow: 3px 3px 5px #aaaaaa; 
	 
}
.matchingBox div{
	width: 150px;
	height:30px;
	overflow: hidden;
    text-overflow: ellipsis;
}
.sList{
padding-left: 8px;
}
</style>
</head>
<body>
	<header>
		<c:import url="views/common/header.jsp" />
	</header>
	<section id="mainSec" style="margin-top: 50px;">
		<div class="ad" style="position: fixed; top: 10; left: 3">
			<c:import url="views/point/adSide.jsp" />
		</div>
		<article class="titleAt">
			<div class="mainTitle">
				<h1 style="color: #5e73de">
					<b>어떤 만남을 </b>
				</h1>
				&nbsp;
				<h2>찾고 싶으세요?</h2>
			</div>
			<c:import url="views/matching/matching.jsp" />
		</article>
		<article class="subArt">
			<div class="subContent">
				<div
					class="sContent matting col-lg-8 col-md-8 col-sm-12 col-xs-12 listSec">
					<div>
						<div class="midTitle">
							<a> <span class="midTitleName"><b>소모임</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList" id="meeting">
						
						</div>
					</div>
					<div>
						<div class="midTitle">
							<a> <span class="midTitleName"><b>e-스포츠</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList"></div>
					</div>
					<div>
						<div class="midTitle">
							<a> <span class="midTitleName"><b>배팅</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList"></div>
					</div>
					<div>
						<div class="midTitle">
							<a> <span class="midTitleName"><b>스포츠</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList"></div>
					</div>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 listSec contentList">
					<div class="sContent conList">
						<div class="midTitle">
							<a href="${pageContext.request.contextPath}/board/boardList.do">
								<span class="midTitleName"><b>자유게시판</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList">
							<div style="padding: 15px 0px;">
								<ul class="post-list"
									style="list-style: none; padding: 10px 0px;">


								</ul>
							</div>
						</div>
					</div>
					<div class="sContent conList">
						<div class="midTitle">
							<a> <span class="midTitleName"><b>후기게시판</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList"></div>
					</div>

				</div>
			</div>
		</article>
	</section>

	<footer>
		<c:import url="views/common/footer.jsp" />
	</footer>

	<script>
		$(function() {

			$
					.ajax({

						url : "${pageContext.request.contextPath}/ajax/boardTop7.do",
						type : "GET",
						dataType : "json",
						contentType : "application/json",
						success : function(data) {

							for ( var i in data) {

								var li = '<li class="ellipsis">'
										+ '<a href="${pageContext.request.contextPath}/board/boardView.do?no='
										+ data[i].boardNo
										+ '" id="inserttitle">'
										+ '<span class="pull-right gray font-12" id="spanname"><span class="count orangered">+'
										+ data[i].commentCount
										+ '</span>&nbsp;'
										+ data[i].boardDate
										+ '</span>'
										+ '<span class="wr-icon wr-new">'
										+ '<img src="${pageContext.request.contextPath }/resources/images/icon_new.png" class="icon_new">'
										+ '</span>&nbsp;' + data[i].boardTitle
										+ '</a>' + '</li>';

								$('.post-list').html(
										$('.post-list').html() + li);

								//$('#spanname').html();

								//$('#inserttitle').append();

							}

						},
						error : function(data) {

							console.log("top7 조회 실패!");
						}
					});

			$.ajax({
				url : "${pageContext.request.contextPath}/ajax/topMatchingList.do",
				type : "GET",
				data:{category:"1"},
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					for ( var i in data) {
						$("#meeting").prepend(
							$("<a>").append(
								$("<div>").append(
									$("<div>").text(data[i].midCategory))
									 .append($("<div>").text(data[i].mTitle))
									 .append($("<div>").text(data[i].bigLocation + " "+data[i].midLocation))
									 .append($("<div>").text(data[i].mtime))
									 .attr("class","matchingBox")
							).attr("href","${pageContext.request.contextPath}/matching/matchingDetail.md?matNum=" + data[i].matchingId)
						);
					}

				},
				error : function(data) {

					console.log("sports조회 실패!");
				}
			});
		});
	</script>

</body>

</html>
