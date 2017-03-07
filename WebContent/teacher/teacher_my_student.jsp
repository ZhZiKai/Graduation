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
				<th>标号</th>
				<th>学号</th>
				<th>姓名</th>
				<th>专业</th>
				<th>班级</th>
				<th>论题</th>
				<th>联系电话</th>
				<th>qq</th>
				<th>邮箱</th>
			</thead>
			<tbody>
				<c:forEach  var="item"  items="${students }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.account }</td>
						<td>${item.name }</td>
						<td>${item.dept }</td>
						<td>${item.classname }</td>
						<td>
							<c:if test="${item.titleName == ''}">未选题</c:if>
							<c:if test="${item.titleName  != ''}">${item.titleName}</c:if>
						</td>
						<td>${item.tel }</td>
						<td>${item.qq }</td>
						<td>${item.email }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
