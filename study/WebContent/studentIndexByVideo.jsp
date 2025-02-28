<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learn &mdash; 在线学习系统</title>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" type="text/css">

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"
	type="text/javascript"></script>
<script
	src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"
	type="text/javascript"></script>
<script type="text/javascript">
	layui.use('form', function() {
		var form = layui.form;

		//各种基于事件的操作，下面会有进一步介绍
	});
$(function(){
	window.onload= function(){
		Array.from(document.querySelectorAll("li a")).forEach((el)=>{
			el.addEventListener("click",function(){
				document.querySelector("#mainFrame").setAttribute("src",el.getAttribute("data-src"))
			})
		})
	}
	$("ul li").ononmousemove(function(){
		alert("123")
/* 	  $(this).find("li").show(); */
	})
})

 
</script>
<style type="text/css">
body, html {
	width: 100%;
	/* height: 100%; */
	margin: 0;
	padding: 0;
	background-size: cover;
	background: url('images/img_bg_1.jpg') no-repeat fixed;
	background-position: 50% 0;
	color: #828282;
	position: relative;
	float: left;
}

.overlay {
	z-index: 0;
	position: absolute;
	bottom: 0;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.4);
}

.col-md-2 {
	margin: 1em 0;
}

#mainFrame {
	filter: opacity(75%);
}
/* 	.card{
	display:inline-block;
	max-width: 202px;
	} */
/* .row{
 max-width: 100%;
}
.card-img-top {
	width: auto;
	
} */
</style>
</head>
<body>
	<div class="overlay"></div>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
			class="navbar-brand" href="javascript:void(0)" target="">在校学习平台</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link"
					href="queryStuIndex.action" target="_self">首页 <span class="sr-only"></span>
				</a></li>
				<!-- <li class="nav-item "><a class="nav-link"
					href="queryStuAllCourse.action" data-src="queryStuAllCourse">全部课程</a></li>
				<li class="nav-item "><a class="nav-link"
					href="javascript:void(0)" data-src="querySingleCourse">我的课程</a></li> -->
					<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          课程
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="queryStuAllCourse.action">全部课程</a>
          <a class="dropdown-item" href="querySingleCourse.action">我的课程</a>
         <!--  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a> -->
        </div>
      </li>
					<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          视频
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="queryAllVideoByStu.action">全部视频</a>
          <a class="dropdown-item" href="querySingleVideo.action">我的视频</a>
         <!--  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a> -->
        </div>
      </li>
			</ul>

			<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
				<li class="nav-item dropdown"><a
					class="nav-item nav-link dropdown-toggle mr-md-2 media"
					href="javascript:void(0)" id="bd-versions" data-toggle="dropdown">
						<img class="media-object" src="${sessionScope.student.studentImg}"
						style="width: 40px; height: 40px; border-radius: 25px">
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						style="filter: opacity(85%);">
						<a class="dropdown-item active" href="/docs/4.3/">个人中心</a>
						<!-- aria-labelledby="bd-versions" -->
						<a class="dropdown-item" href="userEdit.action">退出登录</a>
					</div></li>
				
			</ul>
			

		</div>
		</nav>
		<div class="embed-responsive embed-responsive-16by9 w-100 mt-1">
			<iframe class="embed-responsive-item" id="mainFrame"
				src="queryStuAllCourse"></iframe>
		</div>
	</div>


</body>
</html>