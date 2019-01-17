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
	padding: 7px 12px;
	width: 180px;
	height: 130px;
	border: 1px #aaa solid;
	margin: 20px 3px;
	box-shadow: 3px 3px 5px #aaaaaa; 
	 
}
.matchingBox div{
	width: 160px;
	height:30px;
	overflow: hidden;
    text-overflow: ellipsis;
        white-space: nowrap;
}
.matchingBox .category{
font-size: 18px;
}
.matchingBox .mtitle{
	font-size: 25px;
	margin: 2px 0px;
}
.matchingBox .location{
	font-size: 15px;
	height:25px!important;
}
.matchingBox .time{
	font-size: 13px;
	height:20px!important;
}
.matting .sList{
	padding-left: 8px;
}

  @media screen and (max-width: 1650px) { .ad_side { display: none; } } 
  
</style>

</head>
<body>
	<header>
		<c:import url="views/common/header.jsp" />
	</header>

	<section id="mainSec" style="margin-top: 50px; ">
		<div class="ad_side" style="position:fixed; top:10; left:3">
			<c:import url="views/point/adSide.jsp"/>
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

		<article>
			<div class="ad_space" >
				<c:import url="views/point/adSpace.jsp"/>
			</div>
		</article>
		<article class="subArt" >
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
			          <div class="sList">
			            <div class="sList" id="e_sports">
			
			            </div>
			          </div>
			        </div>
			        <div>
			          <div class="midTitle">
			            <a> <span class="midTitleName"><b>스포츠</b></span> <span>+</span>
			            </a>
			          </div>
			          <div class="sList">
			            <div class="sList" id="sports">
			
			            </div>
			          </div>
			        </div>
			        <div>
			          <div class="midTitle">
			            <a> <span class="midTitleName"><b>배팅</b></span> <span>+</span>
			            </a>
			          </div>
			          <div class="sList">
			            <div class="sList" id="batting">
			
			            </div>
			          </div>
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
							<a href="${pageContext.request.contextPath}/matching/mHistoryList.ma"> 
								<span class="midTitleName"><b>후기게시판</b></span> <span>+</span>
							</a>
						</div>
						<div class="sList">
							<div style="padding: 15px 0px;">
								<ul class="mh-list" style = " list-style: none; padding: 10px 0px;">
								</ul>
						</div>
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
			topMatchingList("1");
			topMatchingList("2");
			topMatchingList("3");
			topBattingList();
			
					$.ajax({

						url : "${pageContext.request.contextPath}/ajax/boardTop7.do",
						type : "GET",
						dataType : "json",
						contentType : "application/json",
						success : function(data) {

							for ( var i in data) {
								
								if(data[i].isAnnounce == 'N'){
									
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
									
								}

								

								//$('#spanname').html();

								//$('#inserttitle').append();

							}

						},
						error : function(data) {

							console.log("top7 조회 실패!");
						}
					});

			
		});
		
		$(function() {
			
			$
					.ajax({

						url : "${pageContext.request.contextPath}/ajax/mhTop7.do",
						type : "GET",
						dataType : "json",
						contentType : "application/json",
						success : function(data) {

							for ( var i in data) {

								var li = '<li class="ellipsis">'
										+ '<a href="${pageContext.request.contextPath}/matching/mHistorySelectOne.ma?no='
										+ data[i].MHISTORYID
										+ '" id="inserttitle">'
										+ '<span class="pull-right gray font-12" id="spanname"><span class="count orangered">'
										+ '</span>&nbsp;'
										+ formatDate(new Date(data[i].MHDATE))
										+ '</span>'
										+ '<span class="wr-icon wr-new">'
										+ '<img src="${pageContext.request.contextPath }/resources/images/icon_new.png" class="icon_new">'
										+ '</span>&nbsp;' + data[i].MTITLE
										+ '</a>' + '</li>';

								$('.mh-list').html(
										$('.mh-list').html() + li);

								//$('#spanname').html();

								//$('#inserttitle').append();

							}

						},
						error : function(data) {

							console.log("top7 조회 실패!");
						}
					});

			
		});

		var bSize = $('body').width();
		
		$(window).resize(function() { 
		   
			if(bSize < 1650){
				$('.ad').hide();
			}   
		});
		function topMatchingList(category) {
			$.ajax({
				url : "${pageContext.request.contextPath}/ajax/topMatchingList.do",
				type : "GET",
				data:{category:category},
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					for ( var i in data) {
						var matchingBox= $("<a>").append(
											$("<div>").append(
												$("<div>").text("[ "+data[i].midCategory+" ]").attr("class","category"))
												 .append($("<div>").text(data[i].mTitle).attr("class","mtitle"))
												 .append($("<div>").text(data[i].midLocation).attr("class","location"))
												 .append($("<div>").text(data[i].mtime).attr("class","time"))
												 .attr("class","matchingBox")
										).attr("href","${pageContext.request.contextPath}/matching/matchingDetail.md?matNum=" + data[i].matchingId)
						if(category=="1"){							
							$("#meeting").prepend(matchingBox);
						}else if(category=="2"){
							$("#sports").prepend(matchingBox);
						}else if(category="3"){
							$("#e_sports").prepend(matchingBox);
							$("#e_sports").children("a").children(".matchingBox").children(".location").remove();
						}
					}
				},
				error : function(data) {
					console.log("sports조회 실패!");
				}
			});
		}
		
		function topBattingList(){
			$.ajax({
				url : "${pageContext.request.contextPath}/ajax/topBattingList.ba",
				type : "GET",
				dataType : "json",
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					for( var i in data) {
						var battingBox = $("<a>").append(
								$("<div>").append(
										$("<div>").text("[ "+data[i].MIDCATEGORY+" ]").attr("class","category"))
										 .append($("<div>").text(data[i].MTITLE).attr("class","mtitle"))
										 .append($("<div>").text("A팀  : "+data[i].BATTINGPNUMA +"명 / B팀 : " + data[i].BATTINGPNUMB+"명")).attr("class","location")
										 .append($("<div>").text(data[i].MTIME).attr("class","time"))
										 .attr("class","matchingBox")
								).attr("href","${pageContext.request.contextPath}/batting/battingInfo.ba?no=" + data[i].BATTINGID)
						$("#batting").append(battingBox);
						}
				},
					error : function(data) {
						console.log("batting조회 실패!");
					
					}
				});
			};
		
			function formatDate(date) {
			    var d = new Date(date),
			        month = '' + (d.getMonth() + 1),
			        day = '' + d.getDate(),
			        year = d.getFullYear();

			    if (month.length < 2) month = '0' + month;
			    if (day.length < 2) day = '0' + day;

			    return [year, month, day].join('-');
			}	
	</script>

</body>

</html>
