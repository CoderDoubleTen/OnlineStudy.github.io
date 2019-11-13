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
	<table  class="table">
		<tr>
			<td>课程</td>
			<td>学生</td>
			
		</tr>
		<s:iterator value="course_students">
			<tr>

				<td><s:property value="courseName" /></td>
				<td><s:property value="studentNum" /></td>
				
			</tr>
		</s:iterator>
	</table>
</body>
</html>