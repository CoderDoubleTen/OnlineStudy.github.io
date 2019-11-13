<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Learn &mdash; 在线学习系统</title>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<%-- <!-- 必须导入dwr引擎js,必须放在前面 -->
<script type="text/javascript" src="dwr/engine.js"></script>
<!-- userAction.js由dwr引擎自动生成 -->
<script type="text/javascript" src="dwr/interface/videoAction.js"></script> --%>
<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" type="text/css">

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"
	type="text/javascript"></script>
<script
	src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"
	type="text/javascript"></script>
<link href="css/video-js.min.css" rel="stylesheet" type="text/css">
<script src="js/video.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/ckplayer.js"></script>
<script type="text/javascript" src="js/offlights.js"></script>
<script type="text/javascript">
	layui.use('form', function() {
		var form = layui.form;

		//各种基于事件的操作，下面会有进一步介绍
	});
$(function(){
/* 	var name=getCookie(${sessionScope.vid}+"videoTime");
	if(name != "" && name != null){
	var r=confirm("从上次观看结束时间开始播放")
	  if (r==true){
	getname();
} else {
	 var myVid=document.getElementById("my-video_html5_api");	
	  myVid.currentTime=0;
	   
	    } 
	}*/
	
/* 	if(${sessionScope.videoSelection.isWatchEnd}==1){
		$("#no").hide();
		$("#yes").show();
	}else{
		$("#yes").hide();
		$("#no").show();
	} */
	$("#yidenglu").hide();
	$("#weidenglu").hide();
	
if('${sessionScope.userName}'==""){
		
		$("#yidenglu").hide();
		$("#weidenglu").show();
	}else{
		
		$("#weidenglu").hide();
		$("#yidenglu").show();
	}
		
/* 	window.onload= function(){
		Array.from(document.querySelectorAll("li a")).forEach((el)=>{
			el.addEventListener("click",function(){
				document.querySelector("#mainFrame").setAttribute("src",el.getAttribute("data-src"))
			})
		})
	} */
	 $("#title").focus(function(){
		$("#content").show(500);
	})
		$("#title").blur(function(){
			var title=$(this).val();
			 if(title!=""){ 
				$("#content").show();
			}else{
				$("#content").hide(500);
				} 
		
		})
	$("#content").hide(); 
	 $("#restComment").click(function(){
	$("#content").hide(500); 
	 })
})
	/*   var options = {
	    };
	    var player = videojs('my-video_html5_api', options, function onPlayerReady() {
	        var time1;
	        var t1 = 0;
	        function aa() {
	            t1 +=1;
	            document.getElementById('aa').value = t1;
	            /* console.log('aa-' + t1); 
	        }*/
	        //开始播放视频时，设置一个定时器，每250毫秒调用一次aa(),观看时长加2.5秒
	      /*   this.on('play', function () {
	           /*  console.log('开始播放'); 
	            time1 = setInterval(function () {
	                aa();
	            }, 1000)
	        }); */
	        //结束和暂时时清除定时器，并向后台发送数据
	      /*   this.on('ended', function () {
	          /*   console.log('结束播放'); 
	            window.clearInterval(time1);
	            checkCookie();
	            countTime();    //向后台发数据
	        }); */
	        /* this.on('pause', function () {
	         /*    console.log('暂停播放'); */
	         /*    window.clearInterval(time1); */
	            /* $("#aa").val(0); *
	            checkCookie();
	          /*    countTime();   * //向后台发数据
	        });
	    }); */
	    //直接关闭页面，并向后台发送数据
	  /*   if(window.addEventListener){
	        window.addEventListener("beforeunload",checkCookie,false);
	        window.addEventListener("beforeunload",countTime,false);
	    }else{
	        window.attachEvent("onbeforeunload",checkCookie);
	        window.attachEvent("onbeforeunload",countTime);
	    }
	}) */
	  /*   function countTime() {
	var sTime = $("#aa").val();
	$.ajax({
	    url : "updateVideoSelectionTime.action",
	    type : "POST",
	    dataType : 'json',
	    data : {'videoTime':sTime,'_token':"{{ csrf_token() }}"},
	    success:function (data) {
	     console.log(data);
	    }
	})
}

  function getCookie(cname) {//查询cookie
	    var name = cname + "=";
	    var ca = document.cookie.split(';');
	    for(var i = 0; i < ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	         }
	        if (c.indexOf(name)  == 0) {
	            return c.substring(name.length, c.length);
	         }
	    }
	    return "";
	}
  function setCookie(cname, cvalue, exdays) {//添加cookie
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	    var expires = "expires="+d.toUTCString();
	    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}  */
/*   function checkCookie() {//添加到cookie
	  var myVid=document.getElementById("my-video_html5_api");
  var videoTime=myVid.currentTime;
	    var time = getCookie("videoTime");
	    time=videoTime;
	        if (time != "" && time != null) {
	            setCookie(${sessionScope.vid}+"videoTime", time, 7);
	        }
	} */
/*   function getname(){//拿到cookie
		var time=getCookie(${sessionScope.vid}+"videoTime");
		 var myVid=document.getElementById("my-video_html5_api");
	    if(time!=""){	    	
		  myVid.currentTime=time;
	    }	 
	} */

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
	color: #828282;
	position: relative;
	float: left;
}

.overlay {
	float: left;
	z-index: 0;
	width: 100%;
	height: 100%;
	position: fixed;
	/* bottom: 0;
	top: 0;
	left: 0;
	right: 0; */
	background: rgba(0, 0, 0, 0.4);
}

#my-video {
	width: 100%;
	height: 40em;
}
</style>
</head>
<body>
	<div class="overlay"></div>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
			class="navbar-brand" href="javascript:void(0)" target="">在校学习平台</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link"
					href="userinfoIndex.jsp" target="_self">首页 <span class="sr-only"></span>
				</a></li>
				<li class="nav-item "><a class="nav-link"
					href="queryTeaAllCourse.action" target="_self">全部课程 <span class="sr-only"></span>
				</a></li>
				<li class="nav-item "><a class="nav-link"
					href="queryAllVideoByTid.action" target="_self">我的视频<span class="sr-only"></span>
				</a></li>		
			</ul>

			<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
			<li class="nav-item " id="weidenglu"><a
					class="nav-item nav-link"
					href="login.jsp">
						登录
				</a>
				</li>
				<li class="nav-item dropdown" id="yidenglu"><a
					class="nav-item nav-link dropdown-toggle mr-md-2 media"
					href="javascript:void(0)" id="bd-versions" data-toggle="dropdown">
						<img class="media-object" src="${sessionScope.userinfo.userImg}"
						style="width: 40px; height: 40px; border-radius: 25px">
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						style="filter: opacity(85%);">
						<a class="dropdown-item active" href="querySingleTeacher">个人中心</a>
						<!-- aria-labelledby="bd-versions" -->
						<a class="dropdown-item" href="userEdit.action">退出登录</a>
					</div></li>
				
			</ul>
			

		</div>
		</nav>
		<div class="row mx-0 my-1 py-3"
			style="background-color: #FFF; filter: opacity(95%);">
			<div class="col-md-10" style="margin: 0 auto;">
				<!-- <div id="flashcontent"></div> -->
				<video id="my-video" class="video-js" controls preload="meta"
					data-setup="{}" style="width: 100%;height: 40em"> <source
					src="${sessionScope.video.videoUrl}" type="video/mp4"> <source
					src="${sessionScope.video.videoUrl}" type="video/webm"> <source
					src="${sessionScope.video.videoUrl}" type="video/ogg">
				<p class="vjs-no-js">
					To view this video please enable JavaScript, and consider upgrading
					to a web browser that <a
						href="http://videojs.com/html5-video-support/" target="_blank">supports
						HTML5 video</a>
				</p></video>
	
				<input type="hidden" id="aa" value="0">
				
				<small class="float-right">温馨提示：拖动进度条观看会导致记录观看时长出错</small>
				
			</div>
			<div class="col-md-10 text-dark mt-1" style="margin: 0 auto">
				<h4>
					视频名称:${sessionScope.video.videoName} <%-- <span
						class="badge badge-success" id="yes">已看完</span> <span
						class="badge bg-danger" id="no">未看完</span>
					 --%>
				</h4>
				<h5>
					所属课程:<a
						href="queryVideosByCid.action?id=${sessionScope.video.cid}">${sessionScope.course.courseName}</a>
				</h5>
			
			</div>
		</div>

		<div class="row mx-0"
			style="background-color: #FFF; filter: opacity(95%);">
			<div class="col-md-10" style="margin: 0 auto">
				<h4 class="mt-2">评论区</h4>
				<hr>
				<ul class="media-list">
					<form action="addCommentByStu" method="post">
						<li><input type="hidden" name="comment.comment_index"
							value="0"> <!-- 评论所属index --> <input type="hidden"
							name="comment.student.s_id" value="${sessionScope.studentID}">
							<!-- 学生id --> <input type="hidden" name="comment.userinfo.u_id"
							value="${sessionScope.video.uid}"> <!-- 视频所属用户的id -->
							<input type="hidden" name="comment.video.v_id"
							value="${sessionScope.video.v_id}"> <!-- 视频id --> <span>
								标题：</span> <input id="title" class="w-75" type="text"
							name="comment.comment_title" maxlength="20"
							placeholder="先填标题(20字以内)"> <!-- 评论标题 --></li>
						<li class="mt-2" id="content" style="position: relative;"><span
							style="vertical-align: top;"> 内容：</span> <textarea class="w-75"
								rows="3" name="comment.comment_content" cols="100"
								maxLength="150" placeholder="最多只能评论150个字..."
								style="resize: none;"></textarea> <!-- 评论内容 --> <input
							id="restComment" type="reset" value="取消评论"
							style="position: absolute; top: 2.7em; right: 14em"> <input
							type="submit" value="发表"
							style="position: absolute; top: 2.7em; right: 11em"></li>
					</form>
					<s:iterator value="commentForPages">
						<li class="media"><a class="pull-left" href="#"> <img
								class="media-object"
								src="<s:property value='comment1.student.studentImg'/>" width="35" height="35">
						</a>
							<div class="media-body">
								<!-- 一级评论的标题 -->
								<h4 class="media-heading">
									<s:property value="comment1.comment_title" />
								</h4>
								<p>
									<s:property value="comment1.comment_content" />
									<s:property value="comment1.comment_time" />
									<a href="javascript:void(0)">评论</a>
								</p>
							

							</div></li>
					</s:iterator>
					<li>
						<div
							style="background: #fff; text-align: center; margin: 0 auto; margin-bottom: -1.8em; width: 120px; position: relative;">我也是有底线的</div>
						<hr />
					</li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
			//设置中文
			videojs
					.addLanguage(
							'zh-CN',
							{
								"Play" : "播放",
								"Pause" : "暂停",
								"Current Time" : "当前时间",
								"Duration" : "时长",
								"Remaining Time" : "剩余时间",
								"Stream Type" : "媒体流类型",
								"LIVE" : "直播",
								"Loaded" : "加载完毕",
								"Progress" : "进度",
								"Fullscreen" : "全屏",
								"Non-Fullscreen" : "退出全屏",
								"Mute" : "静音",
								"Unmute" : "取消静音",
								"Playback Rate" : "播放速度",
								"Subtitles" : "字幕",
								"subtitles off" : "关闭字幕",
								"Captions" : "内嵌字幕",
								"captions off" : "关闭内嵌字幕",
								"Chapters" : "节目段落",
								"Close Modal Dialog" : "关闭弹窗",
								"Descriptions" : "描述",
								"descriptions off" : "关闭描述",
								"Audio Track" : "音轨",
								"You aborted the media playback" : "视频播放被终止",
								"A network error caused the media download to fail part-way." : "网络错误导致视频下载中途失败。",
								"The media could not be loaded, either because the server or network failed or because the format is not supported." : "视频因格式不支持或者服务器或网络的问题无法加载。",
								"The media playback was aborted due to a corruption problem or because the media used features your browser did not support." : "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
								"No compatible source was found for this media." : "无法找到此视频兼容的源。",
								"The media is encrypted and we do not have the keys to decrypt it." : "视频已加密，无法解密。",
								"Play Video" : "播放视频",
								"Close" : "关闭",
								"Modal Window" : "弹窗",
								"This is a modal window" : "这是一个弹窗",
								"This modal can be closed by pressing the Escape key or activating the close button." : "可以按ESC按键或启用关闭按钮来关闭此弹窗。",
								", opens captions settings dialog" : ", 开启标题设置弹窗",
								", opens subtitles settings dialog" : ", 开启字幕设置弹窗",
								", opens descriptions settings dialog" : ", 开启描述设置弹窗",
								", selected" : ", 选择",
								"captions settings" : "字幕设定",
								"Audio Player" : "音频播放器",
								"Video Player" : "视频播放器",
								"Replay" : "重播",
								"Progress Bar" : "进度小节",
								"Volume Level" : "音量",
								"subtitles settings" : "字幕设定",
								"descriptions settings" : "描述设定",
								"Text" : "文字",
								"White" : "白",
								"Black" : "黑",
								"Red" : "红",
								"Green" : "绿",
								"Blue" : "蓝",
								"Yellow" : "黄",
								"Magenta" : "紫红",
								"Cyan" : "青",
								"Background" : "背景",
								"Window" : "视窗",
								"Transparent" : "透明",
								"Semi-Transparent" : "半透明",
								"Opaque" : "不透明",
								"Font Size" : "字体尺寸",
								"Text Edge Style" : "字体边缘样式",
								"None" : "无",
								"Raised" : "浮雕",
								"Depressed" : "压低",
								"Uniform" : "均匀",
								"Dropshadow" : "下阴影",
								"Font Family" : "字体库",
								"Proportional Sans-Serif" : "比例无细体",
								"Monospace Sans-Serif" : "单间隔无细体",
								"Proportional Serif" : "比例细体",
								"Monospace Serif" : "单间隔细体",
								"Casual" : "舒适",
								"Script" : "手写体",
								"Small Caps" : "小型大写字体",
								"Reset" : "重启",
								"restore all settings to the default values" : "恢复全部设定至预设值",
								"Done" : "完成",
								"Caption Settings Dialog" : "字幕设定视窗",
								"Beginning of dialog window. Escape will cancel and close the window." : "开始对话视窗。离开会取消及关闭视窗",
								"End of dialog window." : "结束对话视窗"
							})
var myPlayer = videojs('my-video');
			videojs("my-video").ready(function(){
				var myPlayer = this;
				myPlayer.play();
				this.on('ended',function(){
		            
		              this.play();
		             
		        })
			})
			
		</script>

</body>
</html>