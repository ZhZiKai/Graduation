<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			个人信息
		</h3>
	</div>
	<div class="panel-body">
		<form class="form-horizontal" action="${pageContext.request.contextPath}/yy/teacher/update_info" method="post">
			<div class="form-group">
				<label for="account" class="col-sm-1 control-label">工号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="account"  name="account" readonly="true" value="${sessionScope.admin.account }">
				</div>
				<label for="name" class="col-sm-1 control-label">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="name" name="name" readonly="true" value="${sessionScope.admin.name }">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-1 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="email" class="form-control update" id="email"  name="email" readonly="true" value="${sessionScope.admin.email }">
				</div>
				<label for="tel" class="col-sm-1 control-label">联系电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="tel" name="tel" readonly="true" value="${sessionScope.admin.tel }">
				</div>
			</div>
			<div class="form-group">
				<label for="professional" class="col-sm-1 control-label">职称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="professional"  name="professional" readonly="true" value="${sessionScope.admin.professional }">
				</div>
				<label for="dept" class="col-sm-1 control-label">专业</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update" id="dept"  name="dept" readonly="true" value="${sessionScope.admin.dept }">
				</div>
			</div>
			<input type="hidden" name="tid" value="${sessionScope.admin.tid }">
			<div class="form-group">
				<span class="col-xs-8"></span>
				<div class="col-xs-1">
					<button type="button" class="btn btn-primary" onclick="changeState(this)">修改信息</button>
				</div>
				<div class="col-xs-1">
					<button id="submit" type="submit" class="btn btn-primary"   disabled>确认修改</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function changeState(btn){
		var $btn = $(btn);
		var $submit_btn = $("#submit");
		$btn.attr("disabled",true);
		$submit_btn.attr("disabled",false);
		$(".update").attr("readonly",false);
	}
</script>