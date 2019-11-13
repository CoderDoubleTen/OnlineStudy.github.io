<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="js/video.min.js"></script>
<link rel="stylesheet" href="css/video-js.min.css">
<style>
#v {
	width: 400px;
	height: 300px
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var v=$("#v");
})
    function getDuration() {
        if (!isNaN(v.duration)) {
            clearInterval(timer);
            var time=$("#time");
            var a=$("#video").val();
            time.attr("value",v.duration)
            $('#fileName').attr('value',a);
        }
        else {
            tryTime++;
            //超过获取视频长度最大重试次数
            if (tryTime >= maxTry) { clearInterval(timer); alert('无法获取视频长度！');}
        }
    }
    var timer,tryTime,maxTry=5,delay=500;
    function setVideoSrc(f) {
        clearInterval(timer);
        var url = URL.createObjectURL(f.files[0]);
        tryTime = 0;
        v.src=url;
        timer = setInterval(getDuration, delay);//直接获取不到duration，会NaN，计时器来获取
    }
    
</script>
</head>
<body>
	 <form action="insertVideo" method="post" enctype="multipart/form-data">
		<video id="v" class="video-js" controls controlslist="nodownload"></video>
		<br /> 
		视频名称：<input type="text" name="video.videoName" maxlength="15" />
		<input type="file" name="myFile" id="video"
			onchange="setVideoSrc(this)" accept="video/*" />
		<s:select name="video.cid" list="courses" listKey="c_id"
			listValue="courseName" headerKey="0" headerValue="--请选择课程--"></s:select>
		<input type="hidden" id="time" name="shijian"> 
		<input type="hidden" id="fileName" name="fileName">
		 <input type="hidden" name="video.uid"
			value="${sessionScope.userinfo.u_id}">
		 <input type="submit" value="提交">

	</form> 
</body>
</html>