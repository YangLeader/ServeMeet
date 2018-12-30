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
		<article class="titleAt" style="margin-bottom: 10px;">
			<div class="mainTitle">
				<h1>
					<b>어떤 만남을 </b>
				</h1>&nbsp;
				<h2> 찾고 싶으세요?</h2>
			</div>
			<c:import url="views/matching/matching.jsp" />
		</article>
		<article class="subArt" >
			<div class="subContent" style="position: relative; ">
				<div class="sContent" style="width: 595px; height: 800px; border: 1px black solid ; display: inline-block; margin-right: 10px">

				</div><div style="width: 595px; height: 800px;  display: inline-block;">
					<div class="sContent"  style="width: 100%; height: 395px; border: 1px black solid; margin-bottom: 10px;">
					
					</div>
					<div class="sContent" style="width: 100%; height: 395px; border: 1px black solid; ">
					
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
