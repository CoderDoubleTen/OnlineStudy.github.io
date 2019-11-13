<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"></script>
</head>
<script type="text/javascript">

</script>
<body style="margin-left: 100px;">

	<table class="table">
  <thead>
    <tr>
     
      <th scope="col">课程图片</th>
      <th scope="col">课程名称</th>
      <th scope="col">课程介绍</th>
      <th scope="col">课程级别</th>
      
      <th scope="col">课程状态</th>
     
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
		<s:iterator value="courses">
			<tr>
			    
                 <td><img src ="<s:property value ='courseImg'/>" width="50px" height="50px" /></td>
              
				<td><s:property value="courseName" /></td>
				<td style=""><s:property value="courseIntroduction" /></td>
				<td><%-- <s:property value="userSex" /> --%>
				 <s:if test="courseLevel == 1">基础课程</s:if>
                 <s:elseif test="courseLevel==2">高级课程</s:elseif>
				</td>
				
				
				
			
			<td>
				 <s:if test="courseStatu == 0">禁用</s:if>
                 <s:elseif test="courseStatu==1">可用</s:elseif>
				</td>
				
				<td>
				<a href="deleteCourse.action?id=<s:property value='c_id'/>" class="btn btn-danger">修改</a>
				<a href="queryCourseById.action?id=<s:property value='c_id'/>" class="btn btn-success">详情</a></td>
			</tr>
		</s:iterator>
	</tbody>
</table>

</body>
</html>