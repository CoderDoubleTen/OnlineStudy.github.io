<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"></script>
</head>
<script type="text/javascript">
	function returnlist(){
		window.history.go(-1)
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#studentImg").change(function() {
			var filePath = $(this).val(), //获取到input的value，里面是文件的路径
			fileFormat = filePath.substring(filePath.lastIndexOf("."))
				.toLowerCase(), src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
											// 检查是否是图片
											if (!fileFormat
													.match(/.png|.jpg|.jpeg/)) {
												error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
												return;
											} else {
												$('#img').css('display',
														'block');
												$('#img').attr('src', src);
												$('#studentImgName').attr('value',filePath);
											}
										})
					})/* src="file:///C:\fakepath\u=1830022573,4033174239&fm=11&gp=0.jpg" */
</script>
<body>
<div class="container-fluid px-0" style="text-align: center;width: 800px;margin-top: 20px;">
<div class="card" >
		  <div class="card-header">
		    <h4>修改学生信息</h4>
		  </div>
		  <div class="card-body">
		  
		  <form action="alertStudentImg" method="post" enctype ="multipart/form-data">
		       <div class="form-group row">
			     <label for="studentImg" class="col-sm-2 col-form-label">用户头像</label>
			                 <img id="img" alt="图片预览"
			       src ="<s:property value ='student.studentImg'/>" width="100px" height="100px">
			     <input type="file" id="studentImg" name="myFile" ><br>
			     <input type="hidden" id="studentImgName" name="myFileName">
			  </div>
			  <button type="submit" class="btn btn-info">修改</button>
		  </form>
		  
		  	<form action="updateUserinfo" method="post">
		  	<div class="form-group row">
			    <div class="col-sm-10">
			      <input type="hidden" name="student.u_id" value="<s:property value="student.u_id" />"/> 
			    </div>
			  </div>
			  
		  	<div class="form-group row">
			    <label for="studentAccount" class="col-sm-2 col-form-label">账户</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="studentAccount" name="student.studentAccount" value="<s:property value="student.studentAccount" />">
			    </div>
			  </div>
			 <div class="form-group row">
			    <label for="studentName" class="col-sm-2 col-form-label">姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="studentName" name="student.studentName" value="<s:property value="student.studentName" />">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="studentSex" class="col-sm-2 col-form-label">性别</label>
			    <div class="col-sm-10">
		           <select name="student.studentSex">
                      <option value="1">男</option>
                      <option value="0">女</option>
                    </select>
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="studentTel" class="col-sm-2 col-form-label">电话</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="studentTel" name="student.studentTel" value="<s:property value="student.studentTel" />">
			    </div>
			  </div>
			
			  <div class="form-group row">
			    <label for="studentStatu" class="col-sm-2 col-form-label">用户状态</label>
			    <div class="col-sm-10">
                 <select name="student.studentStatu">
                      <option value="1">可选</option>
                      <option value="0">禁用</option>
                    </select>
			    </div>
			  </div>
			 
			  <div class="form-group row">
			    <label for="studentpassword" class="col-sm-2 col-form-label">密码</label>
			    <div class="col-sm-10">
			      <%-- <input type="password" class="form-control" id="studentpassword" name="student.studentpassword.studentpassword" value="<s:property value="student.studentPassword.password" />"> --%>
			       <button type="button" class="btn btn-info"><a href="updateStudentPass.action?id=<s:property value='student.s_id'/>">重置密码</a></button>
			    </div>
			  </div>
			 <div class="d-flex justify-content-center">
				  <button type="submit" class="btn btn-info">修改</button>
				  <a onclick="returnlist()" href="javascript:void(0)" class="btn btn-outline-info ml-5">返回</a>
		  	  </div>
			  
		  	  </form>
		  </div>
	</div>
	</div>
	
</body>
</html>