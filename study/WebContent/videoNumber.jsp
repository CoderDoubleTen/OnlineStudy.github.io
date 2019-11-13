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
	<table class="table">
		<tr>
			<td>课程名字</td>
		</tr>
		<s:iterator value="courses">
			<tr>
				<td><a href="queryVideoess.action?cid=<s:property value='c_id'/>"><s:property value="courseName" /></a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>