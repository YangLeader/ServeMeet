<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<footer>
	<div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="footer-widget mb30">
                        <h2 class="footer-title">ServeMeet</h2>
                        <p>ServeMeet은 단순 매칭 시스템을 넘어 <br> 종합 라이프 컨설팅 기업으로 미래를 준비합니다.<br>
                        	ServeMeet은 고객과 소통을 이어나가며 합리적으로 <br> 매칭해주어 고객과 이해관계자가 함께 발전하는 <br> 새로운 비즈니스 모델을 만들었습니다.
                        </p>
                        <div class="footer-social mb60">
                            <ul class="listnone">
                                <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                    <div class="footer-widget mb30">
                        <h2 class="footer-title">qUICK LINKS</h2>
                        <ul class="listnone">
                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/">매칭</a></li>
                            <li><a href="${pageContext.request.contextPath }/chat/memberList.do">채팅</a></li>
                            <li><a href="${pageContext.request.contextPath }/board/boardList.do">커뮤니티</a></li>
                            <li><a href="${pageContext.request.contextPath}/point/point.do">이벤트</a></li>
                            <li><a href="${pageContext.request.contextPath }/batting/battingList.ba">배팅</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
                    <div class="footer-widget footer-contact mb30">
                        <h2 class="footer-title">Contact info</h2>
                        <ul class="listnone">
                            <li><i class="fa fa-map-marker"></i>
                                <p>서울특별시 강남구 테헤란로<br>14길 6 남도빌딩</p>
                            </li>
                            <li><i class="fa fa-phone"></i>
                                <p>1544-9970
                                </p>
                            </li>
                            <li><i class="fa fa-home"></i>
                                <p>http://www.iei.or.kr/</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="footer-widget mb30">
                        <h2 class="footer-title">Subscribe ServeMeet</h2>
                        <p>ServeMeet만의 특별한 이벤트와 소식을 받아보세요!</p>
                        <input type="text" placeholder="Your Email" class="form-control" id="emailBox">
                        <a onclick="sub();" class="btn btn-primary">Subscribe</a> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tiny-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p>Copyright © ServeMeet. All Rights Reserved. 2019 </p>
                </div>
            </div>
        </div>
    </div>
<!-- board js -->
<!-- cnd방식으로 sockjs불러오기 -->

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script
	src="${pageContext.request.contextPath }/resources/js/jquery.menu.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/wrest.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>
    
    <!-- back to top icon -->
    <a href="#0" class="cd-top" title="Go to top">Top</a>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

    <!-- Sticky Header -->
   <%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/sticky-header.js"></script> --%>
    <!-- Menu Maker - Navigations -->
    <script src="${pageContext.request.contextPath}/resources/js/menumaker.js"></script>
    <!-- Back to top -->
    <script src="${pageContext.request.contextPath}/resources/js/back-to-top.js" type="text/javascript"></script>
    
    <script>
    	function sub(){
    		if($("#emailBox").val() == ""){
    			swal("이메일주소를 입력해주세요");
    		}else{
    			swal("신청해주셔서 감사합니다.");	
    		}
    		
    	}
    </script>
   </footer>
