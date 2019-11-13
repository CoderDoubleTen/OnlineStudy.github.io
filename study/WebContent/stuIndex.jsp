<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Learn &mdash; 在线学习系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />

<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../bootstrap/twitter-bootstrap-v2/js/bootstrap-modal.js"></script>

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<nav class="fh5co-nav" role="navigation">
		 
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-1">
							<div id="fh5co-logo">
								<a href="javascript:void(0)">Learn<span>.</span></a>
							</div>
						</div>
						<div class="col-xs-11 text-right menu-1">
							<ul>
								<li class="active"><a href="student.jsp" target="_self">首页</a></li>
								<!-- 							<li><a href="studentIndex.jsp" target="_self">我的课程</a></li>data-toggle="modal" data-target="#myModal"
 -->
								<li><a href="queryStuAllCourse" target="_self">课程</a></li>
								<li><a href="queryAllVideoByStu.action" target="_self">视频</a></li>
								<li><a href="queryStudentBySinger" target="_self">个人中心</a></li>
								<s:if test="students!=null">
									<li class="btn-cta" title="退出登录"><a href="userEdit.action"><%-- <img
											class="media-object" src="${sessionScope.student.studentImg}"
											style="width: 40px; height: 40px; border-radius: 25px; display: inline-block;"> --%>
											${sessionScope.student.studentName}
											</a></li>

								</s:if>
								<s:elseif test="students==null">

									<li class="btn-cta"><a href="login.jsp"><span>Login</span></a></li>
								</s:elseif>
								
							</ul>
						</div>
					</div>


				</div>
			</div>
		</nav>

		<header id="fh5co-header" class="fh5co-cover" role="banner"
			style="background-image: url(images/img_bg_1.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>欢迎来到在线学习平台</h1>
								<h2>Welcome to the online learning platform.</h2>
								<!-- 							<p><a class="btn btn-primary btn-lg btn-learn" href="#">免费课程</a> <a class="btn btn-primary btn-lg popup-vimeo btn-video" href="https://vimeo.com/channels/staffpicks/93951774"></i> 实战课程</a></p>
 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div id="fh5co-explore" class="fh5co-bg-section">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
						<h2>推荐课程</h2>
						<p>Recommended course</p>
					</div>
				</div>
			</div>
			<div class="fh5co-explore fh5co-explore1">
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-push-5 animate-box">
							<img class="img-responsive"
								src="${sessionScope.course.courseImg}" alt="work">
						</div>
						<div class="col-md-4 col-md-pull-8 animate-box">
							<div class="mt">
								<h3>${sessionScope.course.courseName}</h3>
								<p>${sessionScope.course.courseIntroduction}</p>
								<p>
									<a class="btn btn-primary btn-lg "
										href="queryVideosByCid.action?id=${sessionScope.course.c_id}"
										target="_self"><i class="icon-play"></i> 进入学习</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-project" style="padding-top:7em;padding-bottom: 0">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>热门课程</h2>
						<p>Hot Course</p>
					</div>
				</div>
			</div>
			<div class="container-fluid proj-bottom">
				<div class="row">
					<s:iterator value="courses">
						<div class="col-md-4 col-sm-6 fh5co-project animate-box"
							data-animate-effect="fadeIn">
							<a href="queryVideosByCid.action?id=<s:property value='c_id'/>"><img src="<s:property value='courseImg' />"
								alt="热门课程" class="img-responsive" style="min-height: 262px;
min-width: 419px;">
								<h3 class="show" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">
									<s:property value="courseName"/>
								</h3> <span class="show"
								style="display: inline-block; width: auto; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><s:property
										value='courseIntroduction' /></span> </a>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>


		<%-- <div id="fh5co-testimonial" class="fh5co-bg-section">轮播头像模块
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
					<h2>Testimonials</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="row animate-box">
						<div class="owl-carousel owl-carousel-fullwidth">
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="images/person_1.jpg" alt="user">
									</figure>
									<span>Jean Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="images/person_2.jpg" alt="user">
									</figure>
									<span>John Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="images/person_3.jpg" alt="user">
									</figure>
									<span>John Doe, via <a href="#" class="twitter">Twitter</a></span>
									<blockquote>
										<p>&ldquo;Far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>

		<div id="fh5co-blog">
			<!-- 热门视频 -->
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>热门视频</h2>
						<p>Hot Video</p>
					</div>
				</div>
				<div class="row">
					<s:iterator value="videos">
						<div class="col-lg-4 col-md-4">
							<div class="fh5co-blog animate-box">
								<a href="queryVideoDetailByStu.action?id=<s:property value='v_id' />"> <video class="img-responsive"
										src="<s:property value='videoUrl'/>"></video>
								</a>
								<div class="blog-text" style="width: 320px;height: 260px">
									<h3>
										<a href="queryVideoDetailByStu.action?id=<s:property value='v_id' />"><s:property value='videoName' /></a>
									</h3>
									<%-- <span class="posted_on">Nov. 15th</span> --%>
									<%-- <span class="comment"><a href="">21<i
											class="icon-speech-bubble"></i></a></span> --%>
									<p>
										时长：
										<s:property value='videoLength' />
									</p>
									<p>
										大小：
										<s:property value='videoSize' />
										MB
									</p>
									<%-- <p>时长：<s:property value='videoLength'/></p> --%>
									<a href="queryVideoDetailByStu.action?id=<s:property value='v_id' />" class="btn btn-primary">Watch Video</a>
								</div>
							</div>
						</div>
					</s:iterator>

				</div>
			</div>
		</div>


		<!-- <div id="fh5co-started" style="background-image:url(images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Lets Get Started</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center">
					<p><a href="#" class="btn btn-default btn-lg">Create A Free Course</a></p>
				</div>
			</div>
		</div>
	</div> -->

		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-3 fh5co-widget">
						<h4>About Learning</h4>
						<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
							mollitia reprehenderit. Eos cumque dicta adipisci architecto
							culpa amet.</p>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<h4>Learning</h4>
						<ul class="fh5co-footer-links">
							<li><a href="#">Course</a></li>
							<li><a href="#">Blog</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Terms</a></li>
							<li><a href="#">Meetups</a></li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<h4>Learn &amp; Grow</h4>
						<ul class="fh5co-footer-links">
							<li><a href="#">Blog</a></li>
							<li><a href="#">Privacy</a></li>
							<li><a href="#">Testimonials</a></li>
							<li><a href="#">Handbook</a></li>
							<li><a href="#">Held Desk</a></li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<h4>Engage us</h4>
						<ul class="fh5co-footer-links">
							<li><a href="#">Marketing</a></li>
							<li><a href="#">Visual Assistant</a></li>
							<li><a href="#">System Analysis</a></li>
							<li><a href="#">Advertise</a></li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<h4>Legal</h4>
						<ul class="fh5co-footer-links">
							<li><a href="#">Find Designers</a></li>
							<li><a href="#">Find Developers</a></li>
							<li><a href="#">Teams</a></li>
							<li><a href="#">Advertise</a></li>
							<li><a href="#">API</a></li>
						</ul>
					</div>
				</div>

				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; Online learning system&mdash;Class 1700102, Group 4
							</small>
						</p>
						<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
						</p>
					</div>
				</div>

			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>

