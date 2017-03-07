<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="row-fluid">
    <div>
        <h1 class="page-header">修改个人信息</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="panel-body">
		<form class="form-horizontal" action="${pageContext.request.contextPath}/yy/admin/updateInfo" method="post">
			<div class="form-group">
				<label for="account" class="col-sm-1 control-label">工号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control input" id="account"  name="account" value="${sessionScope.admin.account }">
				</div>
				<label for="name" class="col-sm-1 control-label">姓名</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update input" id="name" name="name"  value="${sessionScope.admin.name }">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-1 control-label">邮箱</label>
				<div class="col-sm-4">
					<input type="email" class="form-control update input" id="email"  name="email"  value="${sessionScope.admin.email }">
				</div>
				<label for="tel" class="col-sm-1 control-label">联系电话</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update input" id="tel" name="tel"  value="${sessionScope.admin.tel }">
				</div>
			</div>
			<div class="form-group">
				<label for="professional" class="col-sm-1 control-label">职称</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update input" id="professional"  name="professional"  value="${sessionScope.admin.professional }">
				</div>
				<label for="dept" class="col-sm-1 control-label">专业</label>
				<div class="col-sm-4">
					<input type="text" class="form-control update input" id="dept"  name="dept"  value="${sessionScope.admin.dept }">
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
<script type="text/javascript">
    $(".input").attr("disabled","disabled");
	function changeState(btn){
		var $btn = $(btn);
		var $submit_btn = $("#submit");
		$(".input").attr("disabled",false);
		$btn.attr("disabled",true);
		$submit_btn.attr("disabled",false);
		$(".update").attr("readonly",false);
	}
</script>
</body>
</html>