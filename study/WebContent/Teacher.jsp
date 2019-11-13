<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="layui/css/layui.css">
 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	
<title>Insert title here</title>
</head>
<script>

</script>
<style>
    body{
        background: #353f42;
    }
 
    *{
        padding: 0;
        margin: 0;
    }
 
    .main {
        margin: 0 auto;
        padding-left: 25px;
        padding-right: 25px;
        
        width: 400px;
        height: 350px;
        background: #FFFFFF;
        /*以下css用于让登录表单垂直居中在界面,可删除*/
        position: absolute;
        top: 50%;
        left: 50%;
       	margin-left: -175px;
    }
 
    .title {
        width: 100%;
        height: 40px;
        line-height: 40px;
    }
 
    .title span {
        font-size: 18px;
        color: #353f42;
    }
 
    .title-msg {
        width: 100%;
        height: 64px;
        line-height: 64px;
    }
 
    .title:hover{
        cursor: default	;
    }
 
    .title-msg:hover{
        cursor: default	;
    }
 
    .title-msg span {
        font-size: 12px;
        color: #707472;
    }
 
    .input-content {
        width: 100%;
        height: 120px;
    }
 
    .input-content input {
        width: 330px;
        height: 40px;
        border: 1px solid #dad9d6;
        background: #ffffff;
        padding-left: 10px;
        padding-right: 10px;
    }
 
    .enter-btn {
        width: 350px;
        height: 40px;
        color: #fff;
        background: #0bc5de;
        line-height: 40px;
        text-align: center;
        border: 0px;
    }
 
    .foor{
        width: 100%;
        height: auto;
        color: #9b9c98;
        font-size: 12px;
        margin-top: 20px;
    }
 
    .enter-btn:hover {
        cursor:pointer;
        background: #1db5c9;
    }
 
    .foor div:hover {
        cursor:pointer;
        color: #484847;
        font-weight: 600;
    }
 
    .left{
        float: left;
    }
    .right{
        float: right;
    }
 
</style>
 

<body class="layui-layout-body" style="height: 2000px;width: 2000px;">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"><h2 style=" font-variant: small-caps;">在线学习系统</h2></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="HomePage.jsp">返回首页</a></li>
      <li class="layui-nav-item"><a href="">菜单管理</a></li>
      <li class="layui-nav-item"><a href="">评论管理</a></li>
    </ul>
     <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          欢迎您，亲爱的管理员
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">修改个人资料</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出登录</a></li>
    </ul>
  </div>
  </div>
  <div class="layui-side layui-bg-black" style="margin-top: 80px;">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">申请课程</a>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">视频编辑</a>
        </li>
        <li class="layui-nav-item"><a href="javascript:;">学生管理</a></li>
        <li class="layui-nav-item"><a href="javascript:;">个人中心</a></li>
        <li class="layui-nav-item"><a href="javascript:;">统计分析</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">课程观看人数</a></dd>
            <dd><a href="javascript:;">课程选修人数</a></dd>
            <dd><a href="javascript:;">学生观看详情</a></dd>
            <dd><a href="javascript:;">学生课程详情</a></dd>
            
          </dl>
        </li>
      </ul>
     
    </div>
  </div>
 
  
  <div class="layui-container" style="margin-left: 190px;height: 200px;">
    <!-- 内容主体区域 -->
    <div>
<!-- 按钮：用于打开模态框 -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  点我登录
</button>
 
<!-- 模态框 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
 
 
      <!-- 模态框主体 -->
      <div class="modal-body">
    <div class="title-msg" style="text-align: center;">
        <span><h3>请输入登录账户和密码</h3></span>
    </div>
 
    <form class="login-form" method="post" novalidate  style="text-align: center;">
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
                <input type="text" autocomplete="off"
                       placeholder="用户名" name="userNameOrEmailAddress" required/>
            </div>
 
            <div style="margin-top: 16px">
                <input type="password"
                       autocomplete="off" placeholder="登录密码" name="password" required maxlength="32"/>
            </div>
        </div>
 
        <!--登入按钮-->
        <div style="text-align: center">
            <button type="submit" class="enter-btn" >登录</button>
        </div>
 
        <div class="foor">
            <div class="left"><span><h4>忘记密码 ?</h4></span></div>
 
            <div class="right"><span><h4>注册账户</h4></span></div>
        </div>
    </form>
    
 <div class="modal-footer" style="margin-top: 10px;margin-right: -100px;">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="text-align: center;">关闭</button>
      </div>
</div>


 
 
    </div>
  </div>
</div>
                  
</div></div>
<script src="layui/layui.all.js" charset="utf-8"></script>


</body>
</html>