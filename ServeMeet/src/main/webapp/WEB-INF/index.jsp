
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html >
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style Custom CSS -->
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <!-- Fontello CSS -->
    <link href="resources/css/fontello.css" rel="stylesheet">
    <!-- Style Custom CSS -->
    <link href="resources/css/style.css" rel="stylesheet">
    <!-- Font CSS -->
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<meta charset="UTF-8">
	<title>ServeMeet</title>
	<c:import url="views/common/header.jsp"/>
</head>


<body>
    <div class="hero-section">
        <div class=" ">
            <!-- navigation -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                        <div class="hero-caption">
                            <h1 class="hero-title">wanna eat delicious food?</h1>
                            <p class="hero-text">Looking for a epicure experience? We have it all here!</p>
                            <a href="menu.html" class="btn btn-default">Book Now</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>our menu</h1>
                        <h5>healthy & delicious cuisine</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="menu-block mb60">
                        <div class="menu-head"> <span class="menu-icon"><i class="icon-hamburger icon-4x icon-primary"></i></span>
                            <h2 class="menu-title">starters</h2>
                        </div>
                        <div class="menu-list">
                            <ul class="listnone">
                                <li>Aaloo Tikki....................................<span class="meta-price">$10</span></li>
                                <li>Corn Tikki.....................................<span class="meta-price">$12</span></li>
                                <li>heese Balls....................................<span class="meta-price">$15</span></li>
                                <li>Veg Crispy.....................................<span class="meta-price">$10</span></li>
                                <li>Corn Spring Roll...........................<span class="meta-price">$24</span></li>
                                <li>Harabhara Kabab..........................<span class="meta-price">$10</span></li>
                                <li>Veg Lolipop...................................<span class="meta-price">$18</span></li>
                                <li>Crispy Balls....................................<span class="meta-price">$10</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="menu-block mb60">
                        <div class="menu-head"> <span class="menu-icon"><i class="icon-salad-1 icon-4x icon-primary"></i></span>
                            <h2 class="menu-title">Salads</h2>
                        </div>
                        <div class="menu-list">
                            <ul class="listnone">
                                <li>Caesar Salad....................................<span class="meta-price">$6</span></li>
                                <li>Ton Salad.......................................<span class="meta-price">$10</span></li>
                                <li>Somon Salad..................................<span class="meta-price">$12</span></li>
                                <li>Akdeniz Salad................................<span class="meta-price">$16</span></li>
                                <li>Fresh Tuna Salad...........................<span class="meta-price">$20</span></li>
                                <li>Farro Salad....................................<span class="meta-price">$22</span></li>
                                <li>Sour-Cream Salad.........................<span class="meta-price">$10</span></li>
                                <li>Akdeniz Salad................................<span class="meta-price">$16</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="menu-block mb60">
                        <div class="menu-head"> <span class="menu-icon"><i class="icon-pancakes icon-4x icon-primary"></i></span>
                            <h2 class="menu-title">Dessert</h2>
                        </div>
                        <div class="menu-list">
                            <ul class="listnone">
                                <li>Pudding........................................<span class="meta-price">$15</span></li>
                                <li>Flavored Kulfi...............................<span class="meta-price">$10</span></li>
                                <li>Dry Sweet......................................<span class="meta-price">$12</span></li>
                                <li>Apple Pie........................................<span class="meta-price">$8</span></li>
                                <li>Custard........................................<span class="meta-price">$10</span></li>
                                <li>Sobert...........................................<span class="meta-price">$18</span></li>
                                <li>Panna Cotta.................................<span class="meta-price">$20</span></li>
                                <li>Black Forest..................................<span class="meta-price">$20</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center"><a href="menu.html" class="btn btn-default">view all menu</a></div>
            </div>
        </div>
    </div>
    <div class="space-medium bg-default">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>our Services</h1>
                        <h5>For all your occation</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block mb40">
                        <div class="service-img">
                            <a href="service-list.html" class="imghover"><img src="resources/images/service-1.jpg" class="img-responsive" alt=""></a>
                        </div>
                        <h2 class="service-title"> <a href="service-list.html" class="title">birthday parties</a> </h2>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block mb40">
                        <div class="service-img">
                            <a href="service-list.html" class="imghover"><img src="resources/images/service-2.jpg" class="img-responsive" alt=""></a>
                        </div>
                        <h2 class="service-title"> <a href="service-list.html" class="title">catering service</a> </h2>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="service-block mb40">
                        <div class="service-img">
                            <a href="service-list.html" class="imghover"><img src="resources/images/service-3.jpg" class="img-responsive" alt=""></a>
                        </div>
                        <h2 class="service-title"> <a href="service-list.html" class="title">wedding day</a> </h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="about-block">
                <div class="row">
                    <div class="col-md-2 col-sm-3 col-xs-4">
                        <div class="counter_block">
                            <div class="counter_box">
                                <h1 class="counter_number">7586</h1>
                                <span class="counter_text">Client serverd</span>
                            </div>
                            <div class="counter_box">
                                <h1 class="counter_number">40</h1>
                                <span class="counter_text">Cook & Waiters</span> </div>
                            <div class="counter_box">
                                <h1 class="counter_number">12</h1>
                                <span class="counter_text">Dishes in Menu</span> </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-8 col-xs-12">
                        <div class="about-img mb30"> <img src="resources/images/about-img.jpg" class="img-responsive" alt=""> </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                        <div class="section-title">
                            <h1>restaurant</h1>
                            <h5>for tradition cuisine</h5>
                        </div>
                        <div class="about-info">
                            <p>Dear Customer, you are welcomed at our Restaurant.We will serve you with the mouth watering dishes, have apleasent experience with us.</p>
                            <p>Vestibulum estortor ultrices nec dignissim landit ultrices metusuisnec pulvied covallis aliquet eratvel imperulla one blandit venenatis fringilled eget placerat quaonec tempor lacus eget laoreet sodales.</p>
                            <a href="#" class="btn btn-default">more about us</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium bg-default">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="section-title text-center">
                        <h1>customers review</h1>
                        <h5>Customer leaves us well feedback in a great mood!</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block pinside30 bg-white outline mb30">
                        <div class="testimonial-img"><img src="resources/images/testimonial-1.jpg" class="img-responsive img-circle" alt=""></div>
                        <div class="testimonial-text">
                            <p>“The secrect making to heathy food & make life, i am very happy with this restaurant services lorem”</p>
                        </div>
                        <div class="testimonial-name">Rimmi Tackle</div>
                        <div class="testimonial-meta">(customer)</div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block pinside30 bg-white outline mb30">
                        <div class="testimonial-img"><img src="resources/images/testimonial-2.jpg" class="img-responsive img-circle" alt=""></div>
                        <div class="testimonial-text">
                            <p>“Fermentum justoed porttitor id tortor sed mollis posuere dictum tempu Aliqu ollis sem at ex faucibus”</p>
                        </div>
                        <div class="testimonial-name">Gilbert Ibarra</div>
                        <div class="testimonial-meta">(customer)</div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="testimonial-block pinside30 bg-white outline mb30">
                        <div class="testimonial-img"><img src="resources/images/testimonial-3.jpg" class="img-responsive img-circle" alt=""></div>
                        <div class="testimonial-text">
                            <p>“ Vestibulum quis magna eu odio mattis efficitur varius nonMorbi sollici in nulla sit amet tempor vulputate.”</p>
                        </div>
                        <div class="testimonial-name">Santos Davis</div>
                        <div class="testimonial-meta">(customer)</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="post-holder mb40 main-slider">
                        <div class="post-img">
                            <a href="#"><img src="resources/images/blog-1.jpg" class="img-responsive" alt=""></a>
                        </div>
                        <div class="post-content pinside20">
                            <div class="post-meta">
                                <div class="row">
                                    <div class="col-lg-7 col-md-7"><span class="meta-author"><img src="resources/images/post-author-1.jpg" class="img-circle" alt=""> <a href="#" class="text-white">jon Miserd</a></span></div>
                                    <div class="col-lg-5 col-md-5"><span class="meta-date"><i class="fa fa-clock-o"></i>20 Dec, 2017</span></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <h1 class="post-title"><a href="#" class="text-white">Awesome classic musical nights in next sunday</a></h1>
                                    <p>Nam lacus risu imperdiet id pulvinar lobortis sed enimesti bulum cursus justo sit amet nisi sagittis vel rutrum magna mattis.</p>
                                    <a href="#" class="btn-link">read more</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="cta-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h1 class="cta-title">Wanna eat delicious food?</h1>
                    <p class="cta-text">Looking for a epicure experience? We have it all here!</p>
                    <a href="menu.html" class="btn btn-white">book now</a> </div>
            </div>
        </div>
        
    </div>
    <c:import url="views/common/footer.jsp"/>
    <!-- back to top icon -->
    <a href="#0" class="cd-top" title="Go to top">Top</a>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
    <!-- Sticky Header -->
    <script src="resources/js/jquery.sticky.js"></script>
    <script src="resources/js/sticky-header.js"></script>
    <!-- Menu Maker - Navigations -->
    <script src="resources/js/menumaker.js"></script>
    <!-- Back to top -->
    <script src="resources/js/back-to-top.js" type="text/javascript"></script>

	
</body>

</html>

