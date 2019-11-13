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
/* 	window.onload= function(){
		Array.from(document.querySelectorAll("li a")).forEach((el)=>{
			el.addEventListener("click",function(){
				document.querySelector("#mainFrame").setAttribute("src",el.getAttribute("data-src"))
			})
		})
	} */


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
 body,html {
	width: 100%;
	height: 100%;
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
float:left;
	z-index: 0;
	width:100%;
	height:100%;
	position: fixed;
	background: rgba(0, 0, 0, 0.4);
}
.addCourse{
position: absolute;
right: -50px;
bottom:0;
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
		<div class="row mx-0 my-1 py-3"
			style="background-color: #FFF; filter: opacity(75%);">
			<div class="col-md-6 ml-4">
				<img alt="课程图片" src="${sessionScope.course.courseImg}" width="100%"
					height="100%">
			</div>
			<div class="col-md-5 text-dark" style="padding: 2em 1em 0 1em">
			
				<h2>${sessionScope.course.courseName}</h2>
				<h5>${sessionScope.course.courseIntroduction}</h5>
		
			
			
			
			
			
			</div>
		</div>

		<%-- <div class="row mx-0" style="background-color: #FFF;filter: opacity(75%);">
			<!-- margin: 0 auto; -->
			
			
			<s:iterator value="videos">
	
				<div class="col-md-2 " style="filter: opacity(85%);">
					<a href="queryVideoDetailByStu.action?id=<s:property value='v_id' />">
						<div class="card my-2">
								<img src="<s:property value='course.courseImg' />" class="card-img-top"
								alt="..." style="height: 140px;">
							<video src="<s:property value='videoUrl' />" class="card-img-top"
								style="height: 140px;padding:8px;"></video>
							<div class="card-body">
								<h5 class="card-title">
									<s:property value="courseName" />
								</h5>
								<p class="card-text"
									style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<b><s:property value="videoName" /></b>
								</p>
								<p class="card-text"
									style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<small class="text-muted">时长：<s:property
											value="videoLength" /></small> <small class="text-muted float-right"><s:property
											value="userinfo.userName" /></small>
								</p>
							</div>
						</div>
					</a>
				</div>
			</s:iterator>
			<!-- <p id="zanwu" class="pl-4 pt-2">暂无视频...</p> -->
		</div> --%>
	</div>



</body>
</html>