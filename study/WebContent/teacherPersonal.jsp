<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" type="text/css">

<%-- <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"
	type="text/javascript"></script> --%>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#studentPassword").mouseover(function() {
			$(this).attr("type", "text");
		})
		$("#studentPassword").mouseout(function() {
			$(this).attr("type", "password");
		})
		$("#studentImg").change(
				function() {
					var filePath = $(this).val(), //获取到input的value，里面是文件的路径

					fileFormat = filePath.substring(filePath.lastIndexOf("."))
							.toLowerCase(), src = window.URL
							.createObjectURL(this.files[0]); //转成可以在本地预览的格式
					// 检查是否是图片
					if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
						error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
						return;
					} else {
						$('#img').css('display', 'block');
						$('#img').attr('src', src);
						$('#studentImgName').attr('value', filePath);
					}
				})
   $("#lastPassword").blur(function(){
	   var last=$(this);
	   if(last.val()!='${sessionScope.password}'){
		   last.css("border","1px solid red");
		   $("#message").append("<small style='color:red;'>旧密码错误</small>")
	   }else{
		   last.css("border","1px solid green");
		   $("#message").hide();
		   
	   }
   })
	})
</script>
<style type="text/css">
body, html {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-size: cover;
	background: url('images/img_bg_1.jpg') no-repeat fixed;
	background-position: 50% 0;
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
</style>
</head>
<body>
	<!-- <div class="overlay"></div> -->
	<div class="container px-2 py-1"
		style="background-color: #fff; height: 100%">
		<h2 class="mt-1">个人中心</h2>
		<hr>
		<div class="card-deck" style="margin: 0; filter: opacity(75%);">
			<div class="row" style="margin: 0 auto; width: 100%">

				<div class="col-md-4">
					<form action="updateImageByPersonal" method="post"
						enctype="multipart/form-data">
						<img id="img" alt="头像"
							src="<s:property value='userinfo.userImg'/>" width="300px"
							height="300px"> <input type="file" id="studentImg"
							name="myFile"><br> <input type="hidden"
							id="studentImgName" name="fileName"> <input
							type="submit" value="修改图片" id="alertImg">

					</form>
				</div>

				<div class="col-md-8">
				<button class="btn btn-primary float-right" data-toggle="modal"
						data-target="#myModal">修改密码</button>
					<form action="updateUserinfoDetail" method="post">
						<div class="form-group row">
							<label for="studentAccount" class="col-sm-2 col-form-label">账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext"
									name="userinfo.userAccount" id="studentAccount"
									value="<s:property value="userinfo.userAccount"/>" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="studentName" class="col-sm-2 col-form-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext"
									name="userinfo.userName" id="studentName"
									value="<s:property value="userinfo.userName"/>" disabled>
							</div>
						</div>
						<div class="form-group row">
							<label for="studentSex" class="col-sm-2 col-form-label">性别</label>
							<div class="col-sm-10 pt-2">
								<s:if test="userinfo.userSex==1">
									<input type="radio" name="userinfo.userSex" value="1" checked
										disabled>男
    <input type="radio" name="student.studentSex" value="0" disabled>女
    
    </s:if>
								<s:elseif test="userinfo.userSex==0">
									<input type="radio" name="userinfo.userSex" value="1"
										disabled>男
    <input type="radio" name="userinfo.userSex" value="0" checked
										disabled>女
    </s:elseif>

							</div>
						</div>
						<div class="form-group row">
							<label for="studentTel" class="col-sm-2 col-form-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control-plaintext"
									name="userinfo.userTel" id="studentTel"
									value="<s:property value="userinfo.userTel"/>">
							</div>
						</div>
						<div class="form-group row">
							<label for="userIntroduction" class="col-sm-2 col-form-label">介绍</label>
							<div class="col-sm-10">
							<textarea maxlength="150" class="form-control-plaintext" rows="3" cols="50" name="userinfo.userIntroduction" style="resize:none;"><s:property value="userinfo.userIntroduction"/></textarea>
				<%-- 				<input type="text" class="form-control-plaintext"
									name="userinfo.userIntroduction" id="userIntroduction"
									value="<s:property value="userinfo.userIntroduction"/>"> --%>
							</div>
						</div>
						<div class="form-group row">
							<label for="studentPassword" class="col-sm-2 col-form-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control-plaintext"
									name="userinfo.userPassword.password" id="studentPassword"
									value="<s:property value="userinfo.userPassword.password"/>">
							</div>

						</div>
						<input type="submit" class="btn btn-primary" value="修改信息">

					</form>
					
					<!-- 模态框（Modal） -->
					<div class="modal fade" id="myModal" tabindex="-1"
						data-backdrop="false" role="dialog" aria-labelledby="myModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title float-left" id="myModalLabel">修改密码
									</h4>
									<button type="button" class="close " data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<form action="updateUserinfoPassword" method="post">
									<div class="modal-body">
									<div class="form-group row">
										<label for="lastPassword" class="col-sm-3 col-form-label">旧密码</label>
										<div class="col-sm-9">
											<input id="lastPassword" type="password" placeholder="旧密码">
											<div id="message"></div>
										</div>
										</div>
										<div class="form-group row">
											<label for="newPassword" class="col-sm-3 col-form-label">新密码</label>
											<div class="col-sm-9">
												<input id="newPassword" type="password"
													name="userinfo.userPassword.password" placeholder="新密码">
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<input type="submit" class="btn btn-primary">
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>
				</div>

			</div>
		</div>
		<a href="userIndex.action" class="btn btn-primary mt-2 ml-3">返回</a>
	</div>
</body>
</html>