<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="ckplayer/ckplayer.js"></script>
<div class="video" style="width: 1000px;height: 600px;"></div>
<script type="text/javascript">
    var videoObject = {
        container: '.video',//“#”代表容器的ID，“.”或“”代表容器的class
        variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
        autoplay:true,//自动播放
        live:true,//直播视频形式
        video:'uploadCourseVideo/20191018111502.mp4'//视频地址
    };
    var player=new ckplayer(videoObject);
</script>
</body>
</html>