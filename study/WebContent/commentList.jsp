<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="layui/layui.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<script
	src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"
	type="text/javascript"></script>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		
		
		
		$("input").click(function(){
			var text=$(this);
			var comment=$(".comment");
			text.hide();
			text.siblings(".text").hide();
			comment.prepend("<textarea rows='2' cols='60' placeholder='评论' autofocus='autofocus'></textarea>");
		})
		/* $(".media .media").css("background-color","red"); */
		/*  a:contains(评论) */
		$("a:contains(评论)").click(function() {
			alert("123")
			
			/*  $(".media .media .media").css("background-color","red"); */
		})
		/* $("a:contains(评论)").click(function(){//二级
					var media= $(".media .media");
					if(media.is(":hidden")){
						/* ul.show(500); */
		/* $("ul").slideUp(); */
		/*  media.slideDown(500);  //滑动显示
		$(".media .media .media").hide(); */
		/* ul.fadeTo(1000,1); *//*淡入 1000为淡入时间，1为透明度在0~1间 */
		/*  media.siblings(".media").slideDown(); *////滑动隐藏
		/* $("ul").hide(500); */

		/* }else{
			media.slideUp();
		}
		})   */

	})
	function hidden() {
		$(".media .media").hide();
		$(".media .media .media").hide();
	}
</script>
<style type="text/css">

.media {
	margin-top: 15px;
}

.media-heading {
	margin-bottom: 5px;
	font-size: large;
}



.pull-left {
	margin-right: 10px;
	padding-left: 2px;
	border-left: 2px solid blue;
}
p {
	font-size: small;
}
form {
    height: 60px;
    width: auto;
    border: 1px solid #000;
    vertical-align: middle;
    padding: 1em;
}
</style>
</head>
<body class="p-2">
	<div class="bs-docs-example">
		<ul class="media-list">
		<s:iterator value="commentForPages">
			<li class="media"><a class="pull-left" href="#"> <img
					class="media-object" src="<s:property value='comment1.userinfo.userImg'/>">
			</a>
				<div class="media-body">
				<!-- 一级评论的标题 -->
					<h4 class="media-heading"><s:property value="comment1.comment_title"/>
					</h4>
					<p><s:property value="comment1.comment_content"/>
					<s:property value="comment1.comment_time"/><a href="javascript:void(0)">评论</a></p>
					<form action="">
					<div class="comment">
					<input type="text" placeholder="评论">
				 <input type="submit" value="发表">
					</div>
					</form>
					<!-- 二级评论 -->
					<s:iterator value="commentForPages2">
					<div class="media">
						<a class="pull-left" href="#"> <img class="media-object"
							src="<s:property value='comment2.userinfo.userImg'/>">
						</a>
						<div class="media-body">
							<h4 class="media-heading"><s:property value="comment2.comment_title"/></h4>
							<p><s:property value="comment2.comment_content"/>
							<s:property value="comment2.comment_time"/>
							<a href="javascript:void(0)">评论</a></P>
							<!-- 三级评论 -->
							<s:iterator value="comments3">
							<div class="media">
								<a class="pull-left" href="#"> <img class="media-object rounded-circle"
								src="<s:property value='userinfo.userImg'/>">
								</a>
								<div class="media-body">
									<h4 class="media-heading"><s:property value="comment_title"/></h4>
									<P><s:property value="comment_content"/>
									<s:property value="comment_time"/>
									</P>
								</div>
							</div>
							</s:iterator>
						</div>
					</div>
					</s:iterator>
					<!-- Nested media object -->
					
				</div></li>
</s:iterator>
		</ul>
	</div>
</body>
</html>