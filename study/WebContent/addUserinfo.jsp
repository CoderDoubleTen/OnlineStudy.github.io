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
												$('#userImgName').attr('value',fileFormat);
											}
										})
					})/* src="file:///C:\fakepath\u=1830022573,4033174239&fm=11&gp=0.jpg" */
</script>
<body>
<div class="container-fluid px-0" style="text-align: center;width: 800px;margin-top: 20px;">
<div class="card" >
		  <div class="card-header">
		    <h4>添加老师信息</h4>
		  </div>
		  <div class="card-body">
		  	<s:form action="addUserinfo" method="post" enctype ="multipart/form-data">
			  <div class="form-group row">
			    <label for="userAccount" class="col-sm-2 col-form-label">账户</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userAccount" name="userinfo.userAccount" placeholder="">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userName" class="col-sm-2 col-form-label">姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userName" name="userinfo.userName" placeholder="">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userSex" class="col-sm-2 col-form-label">性别</label>
			    <div class="col-sm-10">
<!-- 			      <input type="text" class="form-control" id="userSex" name="userinfo.userSex" placeholder="">
 -->			    <select name="userinfo.userSex">
                      <option value="1">男</option>
                      <option value="0">女</option>
                    </select>
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userTel" class="col-sm-2 col-form-label">电话</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userTel" name="userinfo.userTel" placeholder="">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="userIntroduction" class="col-sm-2 col-form-label">用户介绍</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userIntroduction" name="userinfo.userIntroduction" placeholder="">
			    </div>
			  </div>
			  <div class="form-group row">
			  <label for="userImg" class="col-sm-2 col-form-label">用户头像</label>
			         用户图片：<img id="img" alt="图片预览"
			    src="http://localhost:8080/study/image/zanwu.jpg" width="100px"
			    height="100px">
<%-- 			  <s:file class="form-control" name ="myFile"/>  --%>
			   <input type="file" id="userImg" name="myFile" ><br>
			  <input type="hidden" id="userImgName" name="fileName">
             <%--  <s:textfield name ="caption" label ="Caption" />  --%>       
              </div>
			  <!-- <div class="form-group row">
			    <label for="userpassword" class="col-sm-2 col-form-label">密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="userpassword" name="userinfo.userPassword.password" placeholder="">
			    </div>
			  </div> -->
			  <div class="d-flex justify-content-center">
				  <button type="submit" class="btn btn-info">添加</button>
				  <a onclick="returnlist()" href="javascript:void(0)" class="btn btn-outline-info ml-5">返回</a>
		  	  </div>
		  	  </s:form>
		  </div>
	</div>
	</div>
</body>
</html>