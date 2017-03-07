<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/common/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/common/js/bootstrap-datepicker.min.js"></script>
<div class="row-fluid">
    <div>
        <h1 class="page-header">时间信息</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="panel panel-default module-panel">
	<div id="panel-heading" class="panel-heading">
		<span>系统时间</span>
		<a data-trigger="ajax" href="${pageContext.request.contextPath}/yy/admin/setTime" data-target="#admin-wrapper" class="pull-right">设置时间 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>		 
	</div>
	<div class="panel-body">
		<div class="dataTable_wrapper">
	        <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
		        <div class="row-fluid">
		        	<div class="col-sm-12" id="teacher-table">
			        	<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
				            <thead>
				                <tr role="row"> 
									<th>系统阶段</th>
									<th>开始时间</th>
									<th>借书时间</th>
									<th>操作</th>				
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach var="item" items="${list }">
				            		<tr>
										<td>${item.name }</td>
										<td>${item.begin_time }</td>
										<td>${item.end_time }</td>
										<td>
											<button id="modify-color" class="btn btn-default btn-xs" type="submit" onclick="modifyTime(${item.sdid})"><i class="fa fa-pencil-square-o"></i> 编辑</button>
											<button id="delete-color" class="btn btn-default btn-xs" type="submit" onclick="clearTime(${item.sdid})"><i class="fa fa-trash-o"></i> 清空</button>	
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

<!-- 修改时间模态框 -->
<div class="modal fade" id="timeModal" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">修改时间</h4>
      </div>
      <div class="modal-body">
		  <div class="form-group" style="height: 24px;">
	          <label class="col-sm-4 control-label">开始时间</label>
	          <div class="input-group date col-sm-6">
	              <span class="input-group-addon" ><i class="glyphicon glyphicon-th"></i></span>
				  <input id="begin_time" name="begin_time" type="text" class="form-control begin_time"> 
			  </div>
		  </div>
		  <div class="form-group" style="height: 24px;">
	      	  <label class="col-sm-4 control-label">结束时间</label>
	          <div class="input-group date col-sm-6">
	              <span class="input-group-addon "><i class="glyphicon glyphicon-th"></i></span>
				  <input id="end_time" type="text" name="end_time" class="form-control end_time"> 
			  </div>
		  </div>
		  <input type="hidden" id="sdid" name="sdid">
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" id="submit" class="btn btn-primary">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>

<script>
	function modifyTime(sdid) {
		$.ajax({
			data : "sdid="+sdid,
			type : "post",
			url : "getTime",
			success : function(data) {
				$("#timeModal").modal("show");
				$("#begin_time").val(data.begin_time);
				$("#end_time").val(data.end_time);
				$("#sdid").val(data.sdid);
				$('#begin_time').datepicker({
					format: "yyyy-mm-dd",
				    orientation: "bottom left",
				    calendarWeeks: true,
				    autoclose: true,
				    startDate : data.begin_time,
				    calendarWeeks: false,
				});
				$('#end_time').datepicker({
					format: "yyyy-mm-dd",
				    orientation: "bottom left",
				    calendarWeeks: true,
				    autoclose: true,
				    startDate : data.end_time,
				    calendarWeeks: false,
				});
			}
		});
	}
	$("#submit").click(function() {
		var begin_time = $("#begin_time").val();
		var end_time = $("#end_time").val();
		var sdid = $("#sdid").val();
		$.ajax({
			data : {
				"begin_time" : begin_time,
				"end_time" : end_time,
				"sdid" : sdid
			},
			type : "post",
			url : "modifyTime",
			success : function() {
				$("#timeModal").modal('hide');
				$("#timeModal").on("hidden.bs.modal", function() {
					$("#admin-wrapper").load("timeInfo");
				})
			}
		})
	});
	
	function clearTime(sdid) {
		swal({   
			title: "确定清空?",   
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
					data : "sdid="+sdid,
					type : "post",
					url : "clearTime",
					success : function(json) {
						if(json.statusCode == 200){
							swal("完成!", json.message, "success");
							$("#admin-wrapper").load("timeInfo");
						}
						
					}
				});	   
			}
		});
	}
</script>



