<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row-fluid">
    <div>
        <h1 class="page-header">学生信息</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="panel panel-default module-panel">
	<div id="panel-heading" class="panel-heading">
		<span>所有学生</span>
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
									<th>学号</th>
									<th>密码</th>
									<th>专业</th>
									<th>班级</th>
									<th>操作</th>				
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="item" items="${list }">
				            		<tr>
										<td>${item.name }</td>
										<td>${item.account }</td>
										<td>${item.password }</td>
										<td>${item.dept }</td>
										<td>${item.classname }</td>
										<td>
											<button id="modify-color" class="btn btn-default btn-xs" type="submit" onclick="modifyStudent(${item.sid})"><i class="fa fa-pencil-square-o"></i> 编辑</button>
											<button id="delete-color" class="btn btn-default btn-xs" type="submit" onclick="deleteStudent(${item.sid})"><i class="fa fa-trash-o"></i> 删除</button>	
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

<div class="modal fade" id="studentModal" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">修改学生</h4>
      </div>
      <div class="modal-body">
	      <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="student-name" type="text" name="name" class="form-control"  placeholder="请输入姓名">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">学号：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="student-account" type="text" name="account" class="form-control"  placeholder="请输入学号">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">密码：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="student-password" type="text" name="password" class="form-control"  placeholder="请输入密码">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">专业：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="student-dept" type="text" name="dept" class="form-control"  placeholder="请输入专业">
	  		  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label for="inputEmail3" class="col-sm-2 control-label">班级：</label>
	     	  <div class="col-sm-10 input">
	      		  <input id="student-classname" type="text" class="form-control" name="classname" placeholder="请输入班级">
	  		  </div>
		  </div>
		  <input type="hidden" name="sid" id="sid">
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="submit" class="btn btn-primary">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>

<script src="${pageContext.request.contextPath}/common/js/admin-student.js"></script>
<script>
function doPage(n) {
	$.post("studentInfo",{pageNow : n},function(data) {
		$("#admin-wrapper").html(data);
	},"html").success(function(){
		$(".pageNo").each(function() {
			$(this).removeClass("active");
		})
		$(".pageNo").eq(n-1).addClass("active");
	});
}
function modifyStudent(sid) {
	$.ajax({
		data : "sid="+sid,
		type : "post",
		url : "getStudent",
		success : function(json) {
			$("#studentModal").modal('show');
			$("#student-name").val(json.name);
			$("#student-account").val(json.account);
			$("#student-password").val(json.password);
			$("#student-dept").val(json.dept);
			$("#student-classname").val(json.classname);
			$("#sid").val(json.sid);
		}
	});
}

$("#submit").click(function() {	
	$.ajax({
		type : "post",
		data : {
			"name" : $("#student-name").val(),
			"account" : $("#student-account").val(),
			"password" : $("#student-password").val(),
			"dept" : $("#student-dept").val(),
			"classname" : $("#student-classname").val(),
			"sid":$("#sid").val()
		}, 
		url : "modifyStudent",
		success : function() {
			$("#studentModal").modal("hide");
			$("#admin-wrapper").load("studentInfo");
		}
	})
});

function deleteStudent(sid) {
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
				data : "sid="+sid,
				type : "post",
				url : "deleteStudent",
				success : function(json) {					
						swal("完成!", json.message, "success");
						$("#studentModal").modal("hide");
						$("#admin-wrapper").load("studentInfo");					
				}
			});	   
		}
	});
}

</script>

