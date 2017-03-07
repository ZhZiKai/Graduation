<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table class="table">
	<thead>
		<tr>
			<th>姓名</th>
			<th>班级</th>
			<th>联系方式</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.name }</td>
				<td>${item.classname }</td>
				<td>${item.tel }</td>
				<td>
					<button id="delete-color" class="btn btn-default btn-xs" type="submit" onclick="deleteDistributionStudent(${item.account})"><i class="fa fa-trash-o"></i> 移除</button>	
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	function deleteDistributionStudent(account) {
		$.ajax({
			data : "account="+account,
			type : "post",
			url : "deleteDistributionStudent",
			success : function() {
				$("#showMyStudent").modal("hide");
				$("#showMyStudent").on("hidden.bs.modal",function() {
					$("#admin-wrapper").load("showdistribution");
				});
			}
		})
	}
</script>