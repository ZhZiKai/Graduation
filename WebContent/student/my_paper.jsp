<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			${sessionScope.time.name }
		</h3>
	</div>
	<div class="panel-body">
			<div class="row ">
				<label for="title" class="col-sm-2 control-label">论文题目</label>
			    <div class="col-sm-9">
		        	${paper.title }
			    </div>
			</div>
			<div class="row ">
				<label for="input-id" class="col-sm-2 control-label">下载文件</label>
				<div class="col-sm-9">
					<a href="${pageContext.request.contextPath}/yy/student/download_title?filename=${paper.filepath}" class="btn btn-primary">下载文件</a>
				</div>  
			</div>
	</div>
</div>