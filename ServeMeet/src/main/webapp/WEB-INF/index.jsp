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
</head>
<body>
	<header>
		<c:import url="views/common/header.jsp" />
	</header>
	<section id="mainSec" style="margin-top: 50px; ">
		<article class="titleAt">
			<div class="mainTitle">
				<h1 style="color: #5e73de">
					<b>어떤 만남을 </b>
				</h1>&nbsp;
				<h2> 찾고 싶으세요?</h2>
			</div>
			<div style=" margin-bottom: 20px; border: 5px #5e73de solid; width: 100%; height: 50px; ">
				<input style=" border: 0px; width: 85%; height: 100%; font-size:x-large;padding-left: 10px;" placeholder="전하고 싶은 인삿말을 적어주세요."><div style="display: inline-block; width: /* 14.628% */15%; height: 100%; background-color:#5e73de;border: 0px;">
				검색
				</div>
			</div>
			<c:import url="views/matching/matching.jsp" />
		</article>
		<article class="subArt" >
			<div class="subContent">
				<div class="sContent matting col-lg-7 listSec">
					<div>
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>소개팅</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>
					<div>
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>e-스포츠</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>
					<div>
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>소모임</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>
					<div>
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>스포츠</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>
				</div><div class="col-lg-5 listSec contentList">
					<div class="sContent conList">
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>자유게시판</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>
					<div class="sContent conList" >
						<div class="midTitle">
							<a>
								<span class="midTitleName"><b>후기게시판</b></span>
								<span>+</span>
							</a>
						</div>
						<div class="sList">
						</div>
					</div>

				</div>
			</div>
		</article>
	</section>

	<footer>
		<c:import url="views/common/footer.jsp" />
	</footer>


</body>

</html>
