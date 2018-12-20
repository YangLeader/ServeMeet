<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Restaurant responsive website templates free download for personal and commerical. Download Free Website Template for your great projects.">
    <meta name="keywords" content="restaurant responsive website templates free download,online restaurant website templates,bootstrap restaurant templates free download,restaurant website templates free download html with css, catering website templates free download">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Restaurant Responsive Website Templates Free Download</title>
    <!-- Bootstrap -->
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
</head>

<body>
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                    <div class="top-social">
                        <ul class="listnone">
                            <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8  col-xs-6">
                    <div class="top-text">
                        <span class="text-block call-block"> 
                                <i class="icon-phone-call"></i>
                                <span class="call-no">1800-123-4562</span>
                        </span>
                        <span class="text-block mail-block hidden-xs hidden-sm"> <i class="icon-envelope-1"></i>
                                <span class="mail-text">info@restaurant.com</span>
                        </span>
                        <span class="text-block time-block"> <i class="icon-time"></i>
                                <span class="time-text">Mo-Fr 11:00-10:00, Sa-Su 10:00-11:00</span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                    <div class="logo">
                        <a href="index.html"><img src="resources/images/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <!-- navigation -->
                    <div class="navigation">
                        <div id="navigation">
                            <ul>
                                <li class="active"><a href="${pageContext.request.contextPath}/location/location.do" title="Home">Home</a></li>
                                <li><a href="menu.html" title="Menu">Menu</a></li>
                                <li class="has-sub"><a href="service-list.html" title="Service List">Service List</a>
                                    <ul>
                                        <li><a href="service-list.html" title="Service List">Service List</a></li>
                                        <li><a href="service-detail.html" title="Service Detail">Service Detail</a></li>
                                    </ul>
                                </li>
                                <li class="has-sub"><a href="blog-default.html" title="Blog">News</a>
                                    <ul>
                                        <li><a href="blog-default.html" title="Blog" >Blog Default</a></li>
                                        <li><a href="blog-single.html" title="Blog Single" >Blog Single</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html" title="Contact Us">Contact</a> </li>
                                <li><a href="styleguide.html" title="Styleguide">styleguide</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="footer-widget mb30">
                        <h2 class="footer-title">About restaurant</h2>
                        <p>Lorem ipsum dolor sit amet lorem is consectetur adipiscing eti mteleisede urna id, aliquam dignsim liburabitur tortor vitaecus tepor suscipit.</p>
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
                            <li><a href="index.html">Home</a></li>
                            <li><a href="menu.html">Menu</a></li>
                            <li><a href="service-list.html">Services</a></li>
                            <li><a href="blog-default.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
                    <div class="footer-widget footer-contact mb30">
                        <h2 class="footer-title">Contact info</h2>
                        <ul class="listnone">
                            <li><i class="fa fa-map-marker"></i>
                                <p>2426 Snowbird Lane Prague, NE 68050</p>
                            </li>
                            <li><i class="fa fa-phone"></i>
                                <p>800-123-4567
                                    <br> 800-123-8910
                                </p>
                            </li>
                            <li><i class="fa fa-envelope-o"></i>
                                <p>info@restaurant.com</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="footer-widget mb30">
                        <h2 class="footer-title">Subscribe here</h2>
                        <p>Stay update with the latest our menu special offers & restaurant events!</p>
                        <input type="text" placeholder="Your Email" class="form-control">
                        <a href="#" class="btn btn-primary">SUbscribe</a> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tiny-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p>Copyright © All Rights Reserved. 2017 </p>
                </div>
            </div>
        </div>
    </div>
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

