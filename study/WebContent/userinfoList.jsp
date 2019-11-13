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
 <form class="form-inline my-2 " action="queryUserinfo" method="post" style="float: left;">
      <input class="form-control mr-sm-2" type="text" placeholder="请输入老师姓名" name="userinfo.userName" aria-label="Search">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
 </form>
  <a href="addUserinfo.jsp" class="btn btn-danger" style="float: right;">添加老师</a>
	<table class="table">
  <thead>
    <tr>
 <!--      <th scope="col">序号</th> -->
      <th scope="col">账户</th>
      <th scope="col">姓名</th>
      <th scope="col">性别</th>
      <th scope="col">电话</th>
      <th scope="col">用户介绍</th>
      <th scope="col">用户状态</th>
      <th scope="col">用户头像</th>
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
		<s:iterator value="userinfos">
			<tr>
			   <%--  <td scope="row"><s:property value="u_id" /></td> --%>
				<td><s:property value="userAccount" /></td>
				<td><s:property value="userName" /></td>
				<td><%-- <s:property value="userSex" /> --%>
				 <s:if test="userSex == 1">男</s:if>
                 <s:else>女</s:else>
				</td>
				<td><s:property value="userTel" /></td>
				<td><s:property value="userIntroduction" /></td>
				<%-- <td><s:property value="userStatu" /></td> --%>
                <td>
				 <s:if test="userStatu == 1">可用</s:if>
                 <s:elseif test="userStatu == 2">禁用</s:elseif>
				</td>
				<%-- <td><s:property value="userImg" /></td> --%>
<!-- 				<div style="padding: 3px; border: solid 1px #cccccc; text-align: center">  -->
                 <td><img src ="<s:property value ='userImg'/>" width="50px" height="50px" /></td>
                <%--  <br /> 
                 <s:property value ="caption" />  --%>
               <!-- </div > -->
				<td>
				<s:if test="userStatu == 1"><a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">禁用</a></s:if>
                 <s:elseif test="userStatu == 2"><a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">可用</a></s:elseif>
				<%-- <a href="deleteUserinfo.action?id=<s:property value='u_id'/>" class="btn btn-danger">删除</a> --%>
				<a href="queryUserinfoUpdate.action?id=<s:property value='u_id'/>" class="btn btn-success">修改</a></td>
			</tr>
		</s:iterator>
	</tbody>
</table>

</body>
</html>