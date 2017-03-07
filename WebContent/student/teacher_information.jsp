<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			教师信息
		</h3>
	</div>
	<div class="panel-body">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="account" class="col-sm-1 control-label">工号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="account"  name="account" readonly="true" value="${teacher.account }">
				</div>
				<label for="name" class="col-sm-1 control-label">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="name" name="name" readonly="true" value="${teacher.name }">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-1 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="email" class="form-control update" id="email"  name="email" readonly="true" value="${teacher.email }">
				</div>
				<label for="tel" class="col-sm-1 control-label">联系电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="tel" name="tel" readonly="true" value="${teacher.tel }">
				</div>
			</div>
			<div class="form-group">
				<label for="professional" class="col-sm-1 control-label">职称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="professional"  name="professional" readonly="true" value="${teacher.professional }">
				</div>
				<label for="dept" class="col-sm-1 control-label">专业</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="dept"  name="dept" readonly="true" value="${teacher.dept }">
				</div>
			</div>
		</form>
	</div>
</div>