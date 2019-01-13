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
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.subArt .subContent .matting,.subArt{
height: 1000px!important;
}
</style>
</head>
<body>
<header>
		<c:import url="header.jsp" />
	</header>
<section>
	<article class="subArt" >
			<div class="subContent">
				<div class="sContent matting col-lg-8 col-md-8 col-sm-12 col-xs-12 listSec">
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
			            <a> <span class="midTitleName"><b>자유 게시판</b></span> <span>+</span>
			            </a>
			          </div>
			          <div class="sList">
			            <div class="sList" id="meeting">
			
			            </div>
			          </div>
			        </div>
			        <div>
			          <div class="midTitle">
			            <a> <span class="midTitleName"><b>후기 게시판</b></span> <span>+</span>
			            </a>
			          </div>
			          <div class="sList">
			            <div class="sList" id="meeting">
			
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 listSec contentList">
			      	<div class="sContent conList">
						<div >
							<a href="${pageContext.request.contextPath}/board/boardList.do">
								<span ><b>광고</b></span>
							</a>
						</div>
						
					</div>
			      </div>
				</div>
		</article>
</section>
<footer>
		<c:import url="footer.jsp" />
	</footer>
</body>
</html>