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
	<section style="margin-top: 50px; ">
		<article class="titleAt">
			<div class="mainTitle">
				<h1 style="color: #5e73de">
					<b>어떤 만남을 </b>
				</h1>&nbsp;
				<h2> 찾고 싶으세요?</h2>
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
