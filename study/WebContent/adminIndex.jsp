<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
</head>

<title>管理员首页</title>
</head>

<script type="text/javascript">
$(document).ready(function(){

 window.onload= function(){
	Array.from(document.querySelectorAll("li a")).forEach((el)=>{
		el.addEventListener("click",function(){
			document.querySelector("#mainFrame").setAttribute("src",el.getAttribute("data-src"))
		})
	})
} 
$("ul").hide();
$(".manager").click(function(){
	var ul= $(this).next();
	if(ul.is(":hidden")){
		/* ul.show(500); */
		/* $("ul").slideUp(); */
		ul.slideDown(); //滑动显示
		/* ul.fadeTo(1000,1); *//*淡入 1000为淡入时间，1为透明度在0~1间 */
		ul.siblings("ul").slideUp();//滑动隐藏
	/* $("ul").hide(500); */
	
	}else{
		ul.slideUp();
	}
})
/* $("ul li a").click(function(){
	var url=$(this).attr("data-src");
	  $("#right").load(url);
	}); */
})
</script>
<body style="height: 100%">

	<div class="container-fluid p-0"
		style="display: flex; min-height: 100vh; flex-direction: column;">
		<div class="row layui-bg-blue p-2 w-100 m-0">
			<!-- 内容 -->
			<!-- <div class="col-md-12  p-2 mr-0"> -->
			<div class="col-md-9 p-0">
				<a href="login.action">
					<!-- <img alt="" src="img/chaoshi.png"
					class="w-auto h-auto"> -->
					<h1>在线学习系统</h1>
				</a>
			</div>
			<!-- <div class="col-md-2 text-white text-right pt-5 mt-2" >
					123123123
					</div> -->
			<div class="col-md-3 text-white p-0 pt-5 text-right"
				style="margin-bottom: -5px;">
				<%-- <div class="text-right p-0 h7" style="margin-bottom: -3px;">
					${sessionScope.account}
					<s:iterator value="employees">
						<s:property value="account" />
						<s:if test="level==0">管理员</s:if>
						<s:elseif test="level==1">普通员工</s:elseif>	
					</s:iterator>
				</div>
				<div class="text-right p-0">
					<span id="xq">星期一</span>&nbsp; <span id="nian">2008</span> : <span
						id="yue">01</span> : <span id="riqi">01</span>&nbsp; <span
						id="shijian" class="h5">00:00:00</span>
				</div> --%>
                 <button type="button"><a href="login.jsp">退出</a></button>
			</div>
			<!-- </div> -->
		</div>
		<div class="row p-0 m-0" style="height: 43em;">
			<!-- 侧边导航 -->
			<div class="col-md-2 list-group p-0">
				<div class="manager list-group-item layui-bg-green">学生管理</div>
				<ul>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllStudent">学生列表</a></li>
					<!-- <li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryStudentByTeacher">教师评教</a></li> -->
				<!-- 	<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="addStudent.jsp">excel 批量导入</a></li> -->
				</ul>
				<div class="manager list-group-item layui-bg-green">视频管理</div>
				<ul>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllVideo">视频列表</a></li>
					
				</ul>


				<div class="manager list-group-item layui-bg-green">教师管理</div>
				<ul>
					<!-- 					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryOthTeacher">教师互评</a></li> -->
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllUserinfo">教师列表</a></li>

				</ul>
				<div class="manager list-group-item layui-bg-green">课程管理</div>
				<ul>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllCourseByAdmi">课程列表</a></li>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="addCourse.jsp">添加课程</a></li>

				</ul>
				<!-- <div class="manager list-group-item layui-bg-green">菜单管理</div>
				<ul>
						<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryOthTeacher">教师互评</a></li>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllTeacher">菜单列表</a></li>

				</ul> -->
				<div class="manager list-group-item layui-bg-green">统计</div>
				<ul>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryCourseAndNumber">任意课程选修人数</a></li>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryVideoAndNumber">任意视频观看人数</a></li>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryTeacherCourseNumber">任意教师课程人数</a></li>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryTeacherCourseVideos">视频数</a></li>

				</ul>

				<ul>
					<li><a class="nav-link list-group-item list-group-item-action"
						href="javascript:void(0)" data-src="queryAllVideo">所有</a></li>
					

				</ul>
			</div>
			<div
				class="col-md-10 w-100 embed-responsive embed-responsive-16by9 px-0"
				style="height: 100%; padding-bottom: 40.5%">
				<iframe class="embed-responsive-item m-0" src="indexlogo.jsp"
					id="mainFrame"></iframe>
			</div>
			<!-- <div class="col-md-10 px-0" id="right">
			</div> -->
		</div>

	</div>
</body>
</html>