<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row-fluid">
    <div>
        <h1 class="page-header">教师信息</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="panel panel-default module-panel">
	<div id="panel-heading" class="panel-heading">
		<span>所有老师</span>
		<a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/addTeacher" data-target="#admin-wrapper" class="pull-right">添加教师 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>		 
	</div>
	<div class="panel-body">
		<div class="dataTable_wrapper">
	        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		        <div class="row-fluid">
			        <div class="col-sm-6">
				        <div class="dataTables_length" id="dataTables-example_length">
				        <label>
				        	每页 
					        <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
						        <option value="10">10</option>
						        <option value="25">25</option>
						        <option value="50">50</option>
						        <option value="100">100</option>
					        </select> 
					               条记录
				        </label>
				        </div>
				     </div>
			        <div class="col-sm-6">
				        <div id="dataTables-example_filter" class="pull-right dataTables_filter">
					        <label>查找:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example"></label>
				        </div>
			        </div>
			    </div>
		        <div class="row-fluid">
		        	<div class="col-sm-12" id="teacher-table">
			        	<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
				            <thead>
				                <tr role="row"> 
									<th>名字</th>
									<th>工号</th>
									<th>密码</th>
									<th>职称</th>
									<th>专业</th>
									<th>操作</th>				
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="item" items="${list }">
				            		<tr>
										<td>${item.name }</td>
										<td>${item.account }</td>
										<td>${item.password }</td>
										<td>${item.professional }</td>
										<td>${item.dept }</td>
										<td>
											<button id="modify-color" class="btn btn-default btn-xs" type="button" onclick="modifyTeacher(${item.account})"><i class="fa fa-pencil-square-o"></i> 编辑</button>
											<button id="delete-color" class="btn btn-default btn-xs" type="button" onclick="deleteTeacher(${item.tid})"><i class="fa fa-trash-o"></i> 删除</button>	
										</td>
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

<!-- 修改老师模态框 -->
<div class="modal fade" id="teacherModal" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">修改老师</h4>
      </div>
      <div class="modal-body">
	      <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="teacher-name" type="text" name="name" class="form-control"  placeholder="请输入姓名">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">工号：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="teacher-account" type="text" name="account" class="form-control"  placeholder="请输入工号">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">密码：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="teacher-password" type="text" name="password" class="form-control"  placeholder="请输入密码">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">职称：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="teacher-professional" type="text" name="professional" class="form-control"  placeholder="请输入职称">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">专业：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="teacher-dept" type="text" class="form-control" name="dept" placeholder="请输入专业">
	  		  </div>
		  </div>
		  <input type="hidden" name="tid" id="tid">
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="submit" class="btn btn-primary">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<script src="${pageContext.request.contextPath}/common/js/admin-teacher.js"></script>
<script>
function doPage(n) {		
	$.post("teacherInfo",{pageNow : n}, function(data) {
		$("#admin-wrapper").html(data);
	},"html").success(function() {
		$(".pageNo").each(function(){
			$(this).removeClass("active");	
		});
		$(".pageNo").eq(n-1).addClass("active");
	});
}
function modifyTeacher(account) {
	$.ajax({
		data : "account="+account,
		type : "post",
		url : "getTeacher",
		success : function(json) {
			$("#teacherModal").modal('show');
			$("#teacher-account").val(json.account);
			$("#teacher-name").val(json.name);
			$("#teacher-password").val(json.password);
			$("#teacher-professional").val(json.professional);
			$("#teacher-dept").val(json.dept);
			$("#tid").val(json.tid);
		}
		
	});
}

$("#submit").click(function() {	
	$.ajax({
		type : "post",
		data : {
			"account" : $("#teacher-account").val(),
			"name" : $("#teacher-name").val(),
			"password" : $("#teacher-password").val(),
			"professional" : $("#teacher-professional").val(),
			"dept" : $("#teacher-dept").val(),
			"tid" : $("#tid").val()			
		}, 
		url : "modifyTeacher",
		success : function(json) {
			if(json.statusCode == '301') {
				$(".input").addClass("has-error");
			}else{
				$("#teacherModal").modal("hide");
				$("#admin-wrapper").load("teacherInfo");
			}
		}
	})
});

function deleteTeacher(tid) {
	swal({   
		title: "确定删除？",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",   
		confirmButtonText: "确定",   
		cancelButtonText: "取消",   
		closeOnConfirm: false,   
	}, 
	function(isConfirm) {   
		if (isConfirm) { 
			$.ajax({
				data : "tid="+tid,
				type : "post",
				url : "deleteTeacher",
				success : function(json) {
					if(json.statusCode == 301) {
						swal("禁止", json.message, "error");
					}else if(json.statusCode == 200){
						swal("完成!", json.message, "success");
						$("#admin-wrapper").load("teacherInfo");
					}
					
				}
			});	   
		}
	});
	
	
}
</script>



