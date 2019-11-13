<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script
	src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.bundle.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function Commit() {
		var user = $("#account").val();
		var identity = $("#identity").val();
		var iden = escape(identity);
		setCookie("username", user, 7);
		setCookie("identity", iden, 7);
		if (identity == "2") {
			$("#form").attr("action", "studentLogin");
			$("#account").attr("name", "student.studentAccount");
			$("#password").attr("name", "student.studentPassword.password");
		} else {
			$("#form").attr("action", "userLogin");
			$("#account").attr("name", "userinfo.userAccount");
			$("#password").attr("name", "userinfo.userPassword.password");
			$("#identity").attr("name", "userinfo.userLevel");

		}
		var radio = $("input:checkbox[name='remember']");
		if ($("#autologin").is(':checked')) {
			checkCookie()
		} else {
			/* delCookie("identity"); */
			/* delCookie("username"); */
			delCookie("password");
		}
	}
	function delCookie(name) {//删除cookie
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval = getCookie(name);
		if (cval != null)
			document.cookie = name + "=" + cval + ";expires="
					+ exp.toGMTString() + ";path=/";
	}
	function setCookie(cname, cvalue, exdays) {//添加cookie
		var d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
	/* 上面这个函数的的参数是：cookie 的名字（cname），cookie 的值（cvalue），以及知道 cookie 过期的天数（exdays）。
	 通过把 cookie 名称、cookie 值和过期字符串相加，该函数就设置了 cookie。 */
	function getCookie(cname) {//查询cookie
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
	/* 把 cookie 作为参数（cname）。
	 创建变量（name）与要搜索的文本（CNAME”=”）。
	 解码 cookie 字符串，处理带有特殊字符的 cookie，例如 “$”。
	 用分号把 document.cookie 拆分到名为 ca（decodedCookie.split(';')）的数组中。
	 遍历 ca 数组（i = 0; i < ca.length; i++），然后读出每个值 c = ca[i]。
	 如果找到 cookie（c.indexOf(name) == 0），则返回该 cookie 的值（c.substring(name.length, c.length）。
	 如果未找到 cookie，则返回 ""。 */
	function checkCookie() {//添加到cookie
		var identity = getCookie("identity");
		var user = getCookie("username");
		iden = $("#identity").val();
		identity = escape(iden);
		user = $("#account").val();

		pwd = $("#password").val();

		if (identity != "" && identity != null) {
			setCookie("identity", identity, 7);
		}
		if (user != "" && user != null) {
			setCookie("username", user, 7);
		}
		if (pwd != "" && pwd != null) {
			setCookie("password", pwd, 7);
		}

	}
	function getname() {//拿到cookie
		var identity = getCookie("identity");
		var user = getCookie("username");
		var pass = getCookie("password");
		if (user != "") {
			$("#identity").prop("value", unescape(identity));
			$("#account").val(user);
			$("#password").focus();
		}
		if (pass != "") {
			/* $("#identity").attr("value",unescape(identity)); */
			$("#password").val(pass);
			$("#password").blur();
			$("#autologin").prop("checked", "true");
			/*   alert("Welcome again " + user); */
		}

	}
	/* 创建检查 cookie 是否设置的函数。
	 如果已设置 cookie，将显示一个问候。
	 如果未设置 cookie，会显示一个提示框，询问用户的名字，并存储用户名 cookie 365 天，通过调用 setCookie 函数： */
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
	background: rgba(0, 0, 0, 0.3);
}

#login {
	margin: 0 auto;
	height: 300px;
	width: 300px;
	padding: 0.5em;
	position: relative;
	top: 50%;
	background-color: #fff;
	transform: translateY(-50%);
	border-radius: 1em;
	filter: opacity(95%);
}
</style>
</head>
<body onload="getname()">
	<div class="overlay"></div>
	<div class="row w-75" style="height:0">
	<div class="col-md-6 float-left text-white">
	<a href="queryStuIndex.action">
		<h1>欢迎来到在线学习平台</h1>
		<small>Welcome to the online learning platform.</small>
		</a>
	</div>
	</div>
	<div id="login">
		<form id="form" method="post" class="form-signin" >
			<center>
				<h2>登录页面</h2>
			</center>
			<label for="identity" class="sr-only">Identity</label> <select
				class="form-control" id="identity"
				placeholder="Identity" required autofocus>
				<option value="2">学生</option>
				<option value="1">教师</option>
				<option value="0">管理员</option>
			</select> <label for="account" class="sr-only">账号</label> <input
				class="form-control" type="text" id="account" placeholder="账号"
				required> <label for="password" class="sr-only">密码</label><input
				class="form-control" placeholder="密码" type="password" id="password"
				required>
			<div class="checkbox">
				<label> <input type="checkbox" id="autologin" class="ml-3"
					name="remember" value="1" />记住密码
				</label>
			</div>
			<label style="display: block; width: 122px; margin: 0 auto">
				<input class="btn btn-primary" type="submit" value="登录"
				onclick="Commit()"> <input class="btn btn-primary"
				type="reset" value="重置">
			</label>
			<p class="ml-5 text-muted mt-3">&copy; Class 1700102, Group 4</p>
		</form>
	</div>
</body>
</html>