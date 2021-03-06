<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/common/css/jquery.step.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/common/css/main.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/common/js/jquery.steps.min.js"></script>
<script src="${pageContext.request.contextPath}/common/js/admin-group.js"></script>
<div id="wrapper">
	<ol class="breadcrumb">
	  <li><a href="#">Home</a></li>
	  <li><a href="#">Library</a></li>
	  <li class="active">Data</li>
	</ol>
	<div id="wizard">
	    <h2>设置组名</h2>
	    <section>
	        <legend>设置组名</legend>
	        <div class="form-group clearfix">
			    <label for="exampleInputPassword1" class="col-sm-3">组名</label>
			    <div class="col-sm-5">
			    	<input type="text" id="groupName" class="form-control col-sm-5 required" placeholder="请输入组名">
			    </div>
			    
		    </div>
	    </section>
	
	    <h2>选择老师</h2>
	    <section data-mode="async" data-url="${pageContext.request.contextPath}/yy/admin/chooseTeacher?name=''">
	    </section>
	
	    <h2>选择学生</h2>
	    <section data-mode="async" data-url="${pageContext.request.contextPath }/yy/admin/chooseStudent?name=''">
	    </section>
	</div>
</div>