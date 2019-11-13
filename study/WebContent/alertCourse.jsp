<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
													.toLowerCase(), src = window.URL
													.createObjectURL(this.files[0]); //转成可以在本地预览的格式
											// 检查是否是图片
											if (!fileFormat
													.match(/.png|.jpg|.jpeg/)) {
												error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
												return;
											} else {
												$('#img').css('display',
														'block');
												$('#img').attr('src', src);
												$('#courseImgName').attr(
														'value', filePath);
											}
										})					
					})
</script>
<body>

	<form action="alertCourseImg" method="post"
		enctype="multipart/form-data">

		课程图片：<img id="img" alt="图片预览"
			src="<s:property value='course.courseImg'/>" width="100px"
			height="100px">


		<%-- <img alt="课程图片" src="upload/${course.courseImg}"> --%>
		<input type="file" id="courseImg" name="courseImg"><br> <input
			type="hidden" id="courseImgName" name="courseImgName">
			<input type="submit" value="修改图片" id="alertImg">
	</form> 
	<form action="alertCourse" method="post">
		课程名称： <input type="text" name="course.courseName" id="coursename"
			value="${sessionScope.course.courseName }"><br> 课程介绍：
		<textarea rows="5" cols="25" maxlength="80"
			name="course.courseIntroduction" style="resize: none"
			placeholder="123">${sessionScope.course.courseIntroduction }</textarea>
		<br> 课程级别：
		<s:if test="course.courseLevel==1">
			<input type="radio" value="1" name="course.courseLevel" checked>基础课程 <input
				type="radio" value="2" name="course.courseLevel">高级课程
		</s:if>
		<s:elseif test="course.courseLevel==2">
			<input type="radio" value="1" name="course.courseLevel">基础课程 <input
				type="radio" value="2" name="course.courseLevel" checked>高级课程
		</s:elseif>
		<!-- <input type="radio" value="1"
			name="course.courseLevel">基础课程 <input type="radio"
			value="2" name="course.courseLevel">高级课程 -->
		<br> <input type="submit" value="确定" id="submit">
			<input type="hidden" name="id" value="${sessionScope.course.c_id }">
	 <a href="javascript:history.go(-1)">取消</a>
	</form>
</body>
</html>