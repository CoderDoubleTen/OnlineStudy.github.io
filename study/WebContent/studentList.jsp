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
 <form class="form-inline my-2 " action="queryStudentByAdmi" method="post" style="float: left;">
      <input class="form-control mr-sm-2" type="text" placeholder="请输入学生" name="student.studentName" aria-label="Search">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
 </form>
  <a href="addstudent.jsp" class="btn btn-danger" style="float: right;">添加学生</a>
	<table class="table">
  <thead>
    <tr>
   <!--    <th scope="col">序号</th> -->
      <th scope="col">账户</th>
      <th scope="col">姓名</th>
      <th scope="col">性别</th>
      <th scope="col">电话</th>
      <th scope="col">头像</th>
      
      <th scope="col">用户状态</th>
     
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
		<s:iterator value="students">
			<tr>
			    <%-- <td scope="row"><s:property value="s_id" /></td> --%>
				<td><s:property value="studentAccount" /></td>
				<td><s:property value="studentName" /></td>
				<td><%-- <s:property value="userSex" /> --%>
				 <s:if test="studentSex == 1">男</s:if>
                 <s:elseif test="studentSex==0">女</s:elseif>
				</td>
				<td><s:property value="studentTel" /></td>
				
			
                 <td><img src ="<s:property value ='studentImg'/>" width="50px" height="50px" /></td>
                <td>
			
				 <s:if test="studentStatu == 1">可用</s:if>
                 <s:elseif test="studentStatu==2">禁用</s:elseif>
				</td>
				
				<td><a href="updateStudentSu.action?id=<s:property value='s_id'/>" class="btn btn-danger">删除</a>
				<a href="queryStudentDetailById.action?id=<s:property value='s_id'/>" class="btn btn-success">修改</a></td>
			</tr>
		</s:iterator>
	</tbody>
</table>

</body>
</html>