<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			我的学生
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<th>姓名</th>
				<th>开题论文</th>
				<th>中期论文</th>
				<th>预答辩</th>
				<th>答辩论文</th>
				<th>最终确认</th>
			</thead>
			<tbody>
				<c:forEach  var="student"  items="${students }">
					<tr>
						<td>${student.name }</td>
						<c:forEach var="paper" items="${ student.ps }">
							<td><a href="${pageContext.request.contextPath}/yy/teacher/download_paper?filename=${paper.filepath}">${paper.title }</a></td>
						</c:forEach>
						<c:forEach var="i" begin="${fn:length(student.ps)+2}" end="6">
							  <td>未上传</td>
						</c:forEach>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
