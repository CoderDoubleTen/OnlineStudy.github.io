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
		$("#userImg").change(function() {
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
												$('#userImgName').attr('value',filePath);
											}
										})
					})/* src="file:///C:\fakepath\u=1830022573,4033174239&fm=11&gp=0.jpg" */
</script>
<body>
<div class="container-fluid px-0" style="text-align: center;width: 800px;margin-top: 20px;">
<div class="card" >
		  <div class="card-header">
		    <h4>修改老师信息</h4>
		  </div>
		  <div class="card-body">
		  
		  <form action="updateImage" method="post" enctype ="multipart/form-data">
		       <div class="form-group row">
			     <label for="userImg" class="col-sm-2 col-form-label">用户头像</label>
			                 <img id="img" alt="图片预览"
			       src ="<s:property value ='userinfo.userImg'/>" width="100px" height="100px">
			     <input type="file" id="userImg" name="myFile" ><br>
			     <input type="hidden" id="userImgName" name="fileName">
			  </div>
			  <button type="submit" class="btn btn-info">修改</button>
		  </form>
		  
		  	<form action="updateUserinfo" method="post">
		  	<div class="form-group row">
			    <div class="col-sm-10">
			      <input type="hidden" name="userinfo.u_id" value="<s:property value="userinfo.u_id" />"/> 
			    </div>
			  </div>
			  
		  	<div class="form-group row">
			    <label for="userAccount" class="col-sm-2 col-form-label">账户</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userAccount" name="userinfo.userAccount" value="<s:property value="userinfo.userAccount" />">
			    </div>
			  </div>
			 <div class="form-group row">
			    <label for="userName" class="col-sm-2 col-form-label">姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userName" name="userinfo.userName" value="<s:property value="userinfo.userName" />">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userSex" class="col-sm-2 col-form-label">性别</label>
			    <div class="col-sm-10">
		           <select name="userinfo.userSex">
                      <option value="1">男</option>
                      <option value="0">女</option>
                    </select>
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userTel" class="col-sm-2 col-form-label">电话</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userTel" name="userinfo.userTel" value="<s:property value="userinfo.userTel" />">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userIntroduction" class="col-sm-2 col-form-label">用户介绍</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userIntroduction" name="userinfo.userIntroduction" value="<s:property value="userinfo.userIntroduction" />">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userStatu" class="col-sm-2 col-form-label">用户状态</label>
			    <div class="col-sm-10">
                 <select name="userinfo.userStatu">
                      <option value="1">可选</option>
                      <option value="0">禁用</option>
                    </select>
			    </div>
			  </div>
			 
			  <div class="form-group row">
			    <label for="userpassword" class="col-sm-2 col-form-label">密码</label>
			    <div class="col-sm-10">
<%-- 			      <input type="text" class="form-control" id="userpassword" name="userinfo.userpassword.userpassword" value="<s:property value="userinfo.userpassword.userpassword" />">
 --%>				  <button type="button" class="btn btn-info"><a href="updateUserPass.action?id=<s:property value='userinfo.u_id'/>">重置密码</a></button>
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