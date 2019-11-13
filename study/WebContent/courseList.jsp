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

	
</script>
<style type="text/css">

body,html {
 width: 100%;
/* height: 100%;  */
	margin: 0;
	padding: 0;
	/* background-size: cover;
	background: url('images/img_bg_1.jpg') no-repeat fixed;
	background-position:50% 0;
	color: #828282; */
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
	.col-md-2{
	padding:0;
	margin: 1em;
	border: 1px solid gray;
	
	}
	.col-md-2:hover{
	border: 2px solid #000;
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
<div class="container-fluid">
	<%-- <div class="overlay"></div>
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
			<li class="nav-item "><a class="nav-link" href="studentIndex.jsp">首页
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="querySingleCourse" target="_self">我的课程</a></li>
			<li class="nav-item"><a class="nav-link" href="queryAllCourse" target="_self">全部课程</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Dropdown </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1" aria-disabled="true">Disabled</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav> --%>
	<h2>
	我的课程
	</h2>
	<hr>
	<div class="card-deck" style="margin: 0;">
		<div class="row" style="margin: 0 auto;width: 100%">
			<s:iterator value="courses">
				<div class="col-md-2" style="filter: opacity(85%);">
					<a href="queryVideosByCid.action?id=<s:property value='c_id' />">
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
</body>
</html>