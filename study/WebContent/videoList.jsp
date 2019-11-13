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
body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-size: cover;
	/* background: url('images/img_bg_1.jpg') no-repeat fixed;
	background-position: 50% 0; */
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
</style>
</head>
<body class="container-fluid">
	<form class="form-inline my-2 " action="querySingleTeacher" method="post" style="float: left;">
      <input class="form-control mr-sm-2" type="text" placeholder="请输入老师姓名" name="userinfo.userName" aria-label="Search">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
 </form>
<!--   <a href="addUserinfo.jsp" class="btn btn-danger" style="float: right;">添加老师</a>
 -->	<table class="table">
  <thead>
    <tr>
 <!--      <th scope="col">序号</th> -->
      <th scope="col">视频名称</th>
      <th scope="col">视频时长</th>
      <th scope="col">视频大小</th>
<!--       <th scope="col">上传教师</th> -->
      <th scope="col">视频状态</th>
      <!-- <th scope="col">用户状态</th>
      <th scope="col">用户头像</th> -->
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
		<s:iterator value="videos">
			<tr>
			   <%--  <td scope="row"><s:property value="u_id" /></td> --%>
				<td><s:property value="videoName" /></td>
				<td><s:property value="videoLength" /></td>
				<td><s:property value="videoSize" /></td>
				
				<%-- <td><s:property value="userinfo.userName" /></td> --%>
			<%-- 	<td><s:property value="userIntroduction" /></td> --%>
				<%-- <td><s:property value="userStatu" /></td> --%>
                <td>
				 <s:if test="videoStatu == 0">未审核</s:if>
                 <s:elseif test="videoStatu == 1">可用</s:elseif>
                 <s:elseif test="videoStatu == 2">禁用</s:elseif>
				</td>
				<%-- <td><s:property value="userImg" /></td> --%>
<!-- 				<div style="padding: 3px; border: solid 1px #cccccc; text-align: center">  -->
                <%--  <td><img src ="<s:property value ='userImg'/>" width="50px" height="50px" /></td> --%>
                <%--  <br /> 
                 <s:property value ="caption" />  --%>
               <!-- </div > -->
				<td>
			<%-- 	<s:if test="userStatu == 1"><a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">禁用</a></s:if>
                 <s:elseif test="userStatu == 2"><a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">可用</a></s:elseif> --%>
				<%-- <a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">删除</a> --%>
				<a href="queryVideoUpdateStatu.action?id=<s:property value='v_id'/>" class="btn btn-danger">修改状态</a>

			</tr>
		</s:iterator>
	</tbody>
</table>
</body>
</html>