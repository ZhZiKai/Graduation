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
	<title>毕业论文后台管理系统</title>
	
	<!-- Bootstrap -->
	<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/common/images/favicon.ico">
	<link href="${pageContext.request.contextPath}/common/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/metisMenu.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/animate.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/teacher.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/font-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/jquery.fileupload.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/jquery.fileupload-ui.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/sweet-alert.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/common/css/admin-teacher.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<script src="${pageContext.request.contextPath}/common/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/metisMenu.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/sco.ajax.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/sweet-alert.min.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/common/js/admin-index.js"></script>
</head>
<body>
	<nav class="navbar  my-navbar">
	    <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<h2>毕业设计后台管理系统</h2>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
					    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-user"></i>${name}</a>
						<ul class="dropdown-menu">
							<li><a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/modifyInfo" data-target="#admin-wrapper">修改密码</a></li>
							<li><a href="${pageContext.request.contextPath}/yy/admin/quit">退出</a></li>
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
                         <a href="#"><i class="fa fa-users fa-fw"></i> 教师模块<span class="pull-right fa fa-chevron-down"></span></a>
                         <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/teacherInfo" data-target="#admin-wrapper">教师信息</a>
                             </li>
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/addTeacher" data-target="#admin-wrapper">新增教师</a>
                             </li>     
                         </ul>
                     </li>
                     <li>
                         <a href="#"><i class="fa fa-graduation-cap fa-fw"></i> 学生模块<span class="pull-right fa fa-chevron-down"></span></a>
                         <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/studentInfo" data-target="#admin-wrapper">学生信息</a>
                             </li>
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/addStudent" data-target="#admin-wrapper">新增学生</a>
                             </li>     
                         </ul>
                         <!-- /.nav-second-level -->
                     </li>
                     <li>
                         <a href="#"><i class="fa fa-calendar fa-fw"></i> 时间模块<span class="pull-right fa fa-chevron-down"></span></a>
                      	<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/timeInfo" data-target="#admin-wrapper">显示时间</a>
                             </li>
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/setTime" data-target="#admin-wrapper">设置时间</a>
                             </li>
                         </ul>
                     </li>
                     <li>
                        <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/showdistribution" data-target="#admin-wrapper"><i class="fa fa-random fa-fw"></i> 学生分配</a>
                     </li>
                     <li>
                         <a href="#"><i class="fa fa-sitemap fa-fw"></i> 分组考核<span class="pull-right fa fa-chevron-down"></span></a>
                         <ul class="nav nav-second-level collapse">
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/groupInfo" data-target="#admin-wrapper">显示分组</a>
                             </li>
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/insertGroup" data-target="#admin-wrapper">新增分组</a>
                             </li>
                         </ul>
                         <!-- /.nav-second-level -->
                     </li>
                     <li>
                         <a href="#"><i class="fa fa-wrench fa-fw"></i> 个人信息<span class="pull-right fa fa-chevron-down"></span></a>
                         <ul class="nav nav-second-level collapse">
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/adminInfo" data-target="#admin-wrapper">查看个人信息</a>
                             </li>
                             <li>
                                 <a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/modifyInfo" data-target="#admin-wrapper">修改个人信息</a>
                             </li>                                
                         </ul>
                         <!-- /.nav-second-level -->
                     </li>
                 </ul>
             </div>
             <!-- /.sidebar-collapse -->
         </div>
         <div id="admin-wrapper" class="container-fluid"></div>
     </div>
        
</body>
</html>