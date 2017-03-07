<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="chooseStudent">	
	<div id="panel-heading" class="panel-heading">
		<span>所有学生</span>
	</div>
	<div class="panel-body">
		<div class="dataTable_wrapper">
	        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		        <div class="row-fluid">
		        	<div class="col-sm-12" id="teacher-table">
			        	<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
				            <thead>
				                <tr role="row"> 
				                	<th></th>
									<th>名字</th>
									<th>学号</th>
									<th>密码</th>
									<th>专业</th>
									<th>班级</th>		
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="item" items="${list }">
				            		<tr>
				            			<td><input id="${item.sid }" type="checkbox" name="student" class="required" onclick="getId(${item.sid})"/></td>
										<td>${item.name }</td>
										<td>${item.account }</td>
										<td>${item.password }</td>
										<td>${item.dept }</td>
										<td>${item.classname }</td>
									</tr>
				            	</c:forEach>   
				            </tbody>
			        	</table>
		        	</div>
		        </div>
		        <div class="row-fluid">
		        	<div class="col-sm-12 center">
		        		<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
		        			<ul class="pagination">
		        				<c:if test="${page.pageNow eq 1 }">
		        					<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			        					<a href="#">上一页</a>
			        				</li>
		        				</c:if>
		        				<c:if test="${page.pageNow ne 1 }">
		        					<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			        					<a href="javascript:doPage(${page.pageNow - 1 })" >上一页</a>
			        				</li>
		        				</c:if>
		        				<c:forEach begin="1" end="${page.totalPageCount }" var="items">
		        					<li class="paginate_button pageNo" aria-controls="dataTables-example" tabindex="0">
			        					<a href="javascript:doPage(${items})">${items}</a>
			        				</li>
		  						</c:forEach>
		        				<c:if test="${page.pageNow eq page.totalPageCount }">
		        					<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			        					<a href="#">下一页</a>
			        				</li>
		        				</c:if>
		        				<c:if test="${page.pageNow ne page.totalPageCount }">
		        					<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			        					<a href="javascript:doPage(${page.pageNow + 1 })">下一页</a>
			        				</li>
		        				</c:if>
		        			</ul>
		        		</div>
		        	</div>
		        </div>
	       </div>
	    </div>
	</div>
	
</div>
<input type="hidden" id="sids" name="sids" value="${sids }">
<c:if test="${not empty name}">
<input type="hidden" id="name" name="groupName" value="${name }">
</c:if>
<script>
aa();
$(".pageNo").eq(1).addClass("active");
function doPage(n) {
	$.post("chooseStudent",{pageNow : n},function(data) {
		$("#chooseStudent").html(data);
	},"html").success(function(){
		$(".pageNo").each(function() {
			$(this).removeClass("active");
		})
		$(".pageNo").eq(n).addClass("active");	
	});
}


function getId(id) {
	var a = 1;
	if($("#"+id).is(":checked")) {
		a = 1;
	}else {
		a = 0;
	}
	var b = 0;
	$.ajax({
		async : false,
		type : 'post',
		url : 'studentSaveBox',
		data : "id="+id+"&done="+a,
		success : function(data) {
			$("#sids").val(data);
			b = 1;
		}
	});
}
function aa(){
	var idd = document.getElementsByName("student");
	var ids = document.getElementById("sids").value;//隐藏域里的所有选中的id，字符串
	var arr = ids.split(",");
	for(var i = 0; i < idd.length; i++) {
		for(var j = 0; j < ids.length; j++) {
			if(idd[i].id==arr[j]){
				idd[i].checked = true;
			}
		}
	}
}

$("#confirm").click(function() {
	$.ajax({
		async : true,
		cache : false,
		type : "post",
		data : "groupName="+$("#name").val()+"&sids="+$("#sids").val(),
		url : "insertGroupStudent",		
		success : function() {
			$.post("clearSession");
			$("#admin-wrapper").load("../admin/groupInfo");
		}
	})
});

$("#return").click(function() {
	$("#admin-wrapper").load("../admin/groupInfo");
})
</script>