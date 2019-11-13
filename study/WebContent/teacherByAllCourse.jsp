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
	$("#yidenglu").hide();
	$("#weidenglu").hide();
	
	if('${sessionScope.userName}'==""){
		
		$("#yidenglu").hide();
		$("#weidenglu").show();
	}else{
		
		$("#weidenglu").hide();
		$("#yidenglu").show();
	}
})

</script>
<style type="text/css">
body, html {
	width: 100%;
	 height:atuo; 
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
					href="userIndex.action" target="_self">首页 <span class="sr-only"></span>
				</a></li>
				<li class="nav-item "><a class="nav-link"
					href="queryTeaAllCourse.action" target="_self">全部课程 <span class="sr-only"></span>
				</a></li>
				<li class="nav-item "><a class="nav-link"
					href="queryAllVideoByTid.action" target="_self">我的视频<span class="sr-only"></span>
				</a></li>		
			</ul>

			<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
			<li class="nav-item " id="weidenglu"><a
					class="nav-item nav-link"
					href="login.jsp">
						登录
				</a>
				</li>
				<li class="nav-item dropdown" id="yidenglu"><a
					class="nav-item nav-link dropdown-toggle mr-md-2 media"
					href="javascript:void(0)" id="bd-versions" data-toggle="dropdown">
						<img class="media-object" src="${sessionScope.userinfo.userImg}"
						style="width: 40px; height: 40px; border-radius: 25px">
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						style="filter: opacity(85%);">
						<a class="dropdown-item active" href="querySingleTeacher">个人中心</a>
						<!-- aria-labelledby="bd-versions" -->
						<a class="dropdown-item" href="userEdit.action">退出登录</a>
					</div></li>
				
			</ul>
			

		</div>
		</nav>
		
		<div class="container mt-1" style="height: -webkit-fill-available;background-color: #fff;z-index: 1">
	<div class="row">
	<div class="col-md-3">
	<h2 class="mt-1" style="color: #fff">
	全部课程
	</h2>
	
	</div>
	<div class="col-md-9">
	<form class="p-2 form-inline my-2 my-lg-0 float-right" action="queryCourseByTea" method="post">
						<input class="form-control mr-sm-2" type="search"
							placeholder="课程名称" aria-label="Search" name="course.courseName">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
	</div>
	</div>
	<hr class="m-0">
	<div class="card-deck" style="margin: 0;">
		<div class="row" style="margin: 0 auto;width: 100%">
			<s:iterator value="courses">
				<div class="col-md-2" style="filter: opacity(85%);">
					<a href="queryCourseDetailByTea.action?id=<s:property value='c_id' />">
						<div class="card" style="border: none;margin: 0">
							<img src="<s:property value='courseImg' />" class="card-img-top"
								alt="..." style="height: 140px;">
							<div class="card-body">
								<%-- <h5 class="card-title">
									<s:property value="courseName" />
								</h5> --%>
								<p class="card-text"
									style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<b><s:property value="courseName" /></b>
								</p>
								<p class="card-text" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<small class="text-muted"><s:property
											value="courseIntroduction" /></small>
								</p>
							</div>
						</div>
					</a>
				</div>
			</s:iterator>
		</div>
	</div>
	</div>
		<!-- <div class="embed-responsive embed-responsive-16by9 w-100 mt-1">
			<iframe class="embed-responsive-item" id="mainFrame"
				src="queryStuAllCourse"></iframe>
		</div> -->
</div>


</body>
</html>