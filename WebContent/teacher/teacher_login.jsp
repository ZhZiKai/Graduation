<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>毕业论文管理系统</title>
	
	<!-- Bootstrap -->
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/common/images/favicon.ico">
	<link href="${pageContext.request.contextPath}/common/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/flat-ui.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/login.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/common/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="wrap" class="container animated fadeInDown">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/common/images/logo.png">
		</div>
		<h4>毕业生论文管理系统</h4>
		<h4>教师登录</h4>
		<form id="teacher-login">
			<div class="form-group number">
				<input id="teacher-number-input"  name="account" type="text" class="form-control input-lg" placeholder="请输入账号">
			</div>
			<div class="form-group password">
				<input id="teacher-password-input" name="password"  type="password" class="form-control input-lg" placeholder="请输入密码">
			</div>
			<button id="teacher-submit-button" type="button"  class="btn btn-success btn-lg submit-button" onclick="loginTeacher()">登录</button>
			<a class="pull-right" href="${pageContext.request.contextPath}/user/admin/forward">管理员登录</a>
			<span id="gap" class="pull-right">|</span>
			<a class="pull-right" href="${pageContext.request.contextPath}/comm/student">学生登录</a>
		</form>
	</div>
	<script type="text/javascript">
			function loginTeacher(){
				var account = $("#teacher-account-input").val();
				var password = $("#teacher-password-input").val();
				if(account == "" || password == "") {
					$(".form-group").addClass("has-error");
				}
				$.ajax({
					async : true,
					cache : false,
					type : 'POST',
					dataType:"json",
					data:$('#teacher-login').serializeArray(),
					url : '${pageContext.request.contextPath}/comm/login_teacher',
					success : function (json) {
						if(json.statusCode == '200') {
							window.location = '${pageContext.request.contextPath}/yy/teacher/index';
						}else{
							$(".form-group").addClass("has-error");
						}
					}
				});
			}
	</script>
</body>
</html>