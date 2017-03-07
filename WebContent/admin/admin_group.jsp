<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row-fluid">
    <div>
        <h1 class="page-header">组队信息</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div id="group" class="panel panel-default module-panel">
	<div id="panel-heading" class="panel-heading">
		<span>所有分组</span>
		<button id="freshGroup" type="button" class="btn btn-primary btn-xs pull-right" onclick="freshGroup();">重新分组</button>
		<button type="button" class="btn btn-success btn-xs pull-right">快速分组</button>
	</div>
	<div class="panel-body">
		<div class="dataTable_wrapper">
	        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		        <div class="row-fluid">
		        	<div class="col-sm-12" id="teacher-table">
			        	<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
				            <thead>
				                <tr role="row"> 
									<th>组名</th>
									<th>教师人数</th>
									<th>学生人数</th>
									<th>操作</th>				
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="item" items="${list }">
				            		<tr>
										<td>${item.name }</td>
										<td>
											<button class="btn btn-primary btn-xs" type="button" onclick="showTeacher(${item.gid})">
												<span class="badge">${item.count_teacher}</span>
											</button>
										</td>
										<td>
											<button class="btn btn-primary btn-xs" type="button" onclick="showStudent(${item.gid})">
												<span class="badge">${item.count_student}</span>
											</button>
										</td>
										<td>
											<button id="modify-color" class="btn btn-default btn-xs" type="button" onclick="addTeacherGroup('${item.name}');"><i class="fa fa-pencil-square-o"></i> 添加老师</button>
											<button id="modify-color" class="btn btn-default btn-xs" type="button" onclick="addStudentGroup('${item.name}');"><i class="fa fa-pencil-square-o"></i> 添加学生</button>
											<button id="delete-color" class="btn btn-default btn-xs" type="button" onclick="deleteGroup(${item.gid})"><i class="fa fa-trash-o"></i> 删除</button>	
										</td>
									</tr>
				            	</c:forEach>   
				            </tbody>
			        	</table>
		        	</div>
		        </div>
	       </div>
	    </div>
	</div>
</div>
<button id="confirm" type="button" class="btn btn-primary pull-right">确认</button>
<button id="return" type="button" class="btn btn-default pull-left">返回</button>

<!-- 查看老师或学生 -->
<div id="showGroup" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">所带学生</h4>
            </div>
	        <div id="container" class="modal-body">
	        </div>
	        <div class="modal-footer">
	            <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
	        </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	$("#confirm").css("display","none");
	$("#return").css("display","none");
	function showTeacher(gid) {
		$.post("showGroupTeacher",{"gid" : gid}, function(data) {
			$("#showGroup").modal('show');
			$("#container").html(data);
		})
	}	
	
	function showStudent(gid) {
		$.post("showGroupStudent", {"gid" : gid}, function(data) {
			$("#showGroup").modal('show');
			$("#container").html(data);
		})
	}
	
	function addTeacherGroup(name) {
		$.post("chooseTeacher",{"name" : name}, function(data) {
			$("#group").html(data);
			$("#confirm").css("display","block");
			$("#return").css("display","block");
		});
	}
	
	function addStudentGroup(name) {
		$.post("chooseStudent",{"name" : name}, function(data) {
			$("#group").html(data);
			$("#confirm").css("display","block");
			$("#return").css("display","block");
		})
	}
	
	function freshGroup() {
		$.post("freshGroup", function() {
			$("#admin-wrapper").load("groupInfo");
		});
	}
	
	function deleteGroup(gid) {
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
					data : "gid="+gid,
					type : "post",
					url : "deleteGroup",
					success : function(json) {
						swal("完成!", json.message, "success");
						$("#admin-wrapper").load("groupInfo");
					}
				});	   
			}
		});
	}
</script>