<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#courseImg").change(function() {
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
												$('#courseImgName').attr('value',filePath);
											}
										})
					})/* src="file:///C:\fakepath\u=1830022573,4033174239&fm=11&gp=0.jpg" */
</script>

<body>
	<form action="saveCourse" method="post" enctype="multipart/form-data">
		
		课程图片：<img id="img" alt="图片预览"
			src="http://localhost:8080/study/images/zanwu.jpg" width="100px"
			height="100px">
			
		<%-- <img alt="课程图片" src="upload/${course.courseImg}"> --%>
		<input type="file" id="courseImg" name="courseImg" accept=".jpg, .jpeg, .png"><br>
		<input type="hidden" id="courseImgName" name="courseImgName">
		课程名称： <input type="text" name="course.courseName" id="coursename"><br>
		课程介绍：
		<textarea rows="5" cols="25" name="course.courseIntroduction"
			style="resize: none" maxlength="80" placeholder="123"></textarea>
		<br> 课程级别： <input type="radio" value="1"
			name="course.courseLevel">基础课程 <input type="radio"
			value="2" name="course.courseLevel">高级课程<br> <input
			type="submit" value="提交" id="submit"> <input type="reset"
			value="重置">
	</form>
</body>
</html>