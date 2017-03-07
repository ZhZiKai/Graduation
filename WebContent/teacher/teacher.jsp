<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link href="${pageContext.request.contextPath}/common/css/metisMenu.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/fileinput.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/sweet-alert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/teacher.css" rel="stylesheet">
		<!--[if lt IE 9]>
	  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/common/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/metisMenu.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/sco.modal.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/sco.ajax.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/sweet-alert.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/fileinput.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/fileinput_locale_zh.js"></script>
</head>
<body>		
	<nav class="navbar  my-navbar">
	    <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<h2>毕业设计管理系统---${sessionScope.time.name }</h2>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#">通知 <span class="badge">13</span></a>
					</li>
					<li class="dropdown">
					    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-user"></i>${sessionScope.admin.name}</a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" data-target="#update-password">修改密码</a></li>
							<li><a href="${pageContext.request.contextPath}/yy/teacher/out">退出</a></li>
						</ul>
					</li>
				</ul>
            </div><!-- /.navbar-collapse -->
	    </div><!-- /.container-fluid -->
	</nav>
	<div class="clearfix" id="clearfix">
		<div class="navbar-default sidebar mysidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-leaf"></i>&nbsp;&nbsp;论文题目<span class="pull-right fa fa-chevron-down"></span></a>
                            <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                            	<li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/groupPaper" data-target="#teacher-content">组内论题</a>
                                </li> 
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/myPaper" data-target="#teacher-content">我的论题</a>
                                </li>     
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;任务管理<span class="pull-right fa fa-chevron-down"></span></a>
                            <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/myStudent2" data-target="#teacher-content">反馈学生</a>
                                </li>
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/group_student" data-target="#teacher-content">论文评分</a>
                                </li>  
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-education"></i>&nbsp;&nbsp;我的学生<span class="pull-right fa fa-chevron-down"></span></a>
                         	<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/myStudent" data-target="#teacher-content">学生信息</a>
                                </li>
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/myStudent_paper" data-target="#teacher-content">学生论文</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;个人信息<span class="pull-right fa fa-chevron-down"></span></a>
                         	<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/own_information" data-target="#teacher-content">修改个人信息</a>
                                </li>
                                <li>
                                    <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/teacher/own_information" data-target="#teacher-content">重要通知</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
            <div id="teacher-content" class="container-fluid"></div>     
	</div>
	<div id="update-password" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">修改密码</h4>
			</div>
			<form id="password-form" class="form-horizontal container-fluid" >
				<div class="modal-body">
					<div class="form-group ">
						<label for="password" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-10">
				        	<input name="password" type="password" class="form-control" id="password" placeholder="密码">
					    </div>
					</div>
					<div class="form-group ">
						<label for="password2" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
							<input type="hidden" name="account" value="${sessionScope.admin.account }"/>
							<input type="hidden" name="tid" value="${sessionScope.admin.tid }"/>
							<input name="password2" type="password" class="form-control" id="password2" placeholder="确认密码">
						</div>  
					</div> 
				</div>
				<div class="modal-footer ">
					<button type="reset" class="btn btn-default" >取消</button>
	        		<button type="button" class="btn btn-primary" onclick="updatePassword()">确认</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
</body>
<script type="text/javascript">
	$('#side-menu').metisMenu();
	function updatePassword(){
		var pass1 = $("#password").val();
		var pass2 = $("#password2").val();
		if(pass1 == pass2 && pass1 != '' && pass2 != ''){
			$.ajax({
				url:'${pageContext.request.contextPath}/yy/teacher/update_pass',
				type:'post',
				data:$('#password-form').serializeArray(),		
				success:function(){
					swal("修改成功！", "", "success");   
					$("#update-password").modal("hide");
				},
				error:function(){
					swal("修改失败！", "", "error");   
					$("#update-password").modal("hide");
				}
			});
		}else{
			swal("密码不能为空或两次输入不同！", "", "error");   
		}
	}
</script>
</html>