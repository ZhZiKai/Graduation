<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			论文评分
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<th>论文类型</th>
				<th>题目标题</th>
				<th>文件</th>
				<th>分数</th>
			</thead>
			<tbody>
				<c:forEach  var="item"  items="${paperscore }" >
					<tr>
						<td>${item.sysname}</td>
						<td>${item.title }</td>
						<td><a href="${pageContext.request.contextPath}/yy/student/download_title?filename=${item.filepath}">下载</a></td>
						<td>
							<c:if test="${item.score==''}">未评分</c:if>
							<c:if test="${item.score !='' }">${item.score }</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script>
function choose(pid) {
	swal({   
		title: "确定选择论题?",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",   
		confirmButtonText: "确定",   
		cancelButtonText: "取消",   
		closeOnConfirm: false,   
	}, 
	function(isConfirm) {   
		if (isConfirm) {     
			$.post("chooseThesis",{"pid" : pid}, function() {
				swal("完成!", "论题选择成功", "success");
				$("#student-content").load("${pageContext.request.contextPath}/yy/student/my_paper");
			});		   
		}
	});
}
</script>