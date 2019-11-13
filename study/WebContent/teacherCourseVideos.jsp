<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered">
		<tr>
			<td>教师名字</td>
			<td>视频个数</td>
		</tr>
		<s:iterator value="teacherVideos">
			<tr>
				<td><s:property value="teacherName"/></td>
				<td><s:property value="teacherVideos"/></td>
			</tr>
		</s:iterator>
	</table>
	<table class="table table-bordered">
		<tr>
			<td>课程名字</td>
			<td>视频个数</td>
		</tr>
		<s:iterator value="courseVideos">
			<tr>
				<td><s:property value="courseName"/></td>
				<td><s:property value="courseVideos"/></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>