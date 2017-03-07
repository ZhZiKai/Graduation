<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			我的论题
			<c:if test="${sessionScope.time.name eq '上传论题' }">
				<button type="button" class="btn btn-success btn-xs" style="float:right;" data-toggle="modal" data-target="#add-paper"><i class="glyphicon glyphicon-plus"></i>新增题目</button>
			</c:if>
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<th>标号</th>
				<th>题目标题</th>
				<th>评分（当前）</th>
				<th>文件</th>
				<c:if test="${sessionScope.time.name eq '上传论题' }">
					<th>操作</th>
				</c:if>
			</thead>
			<tbody>
				<c:forEach  var="item"  items="${papers }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.title }</td>
						<td>
							<c:if test="${item.state == 1 }">未评分</c:if>
							<c:if test="${item.state == 2 }">未通过</c:if>
							<c:if test="${item.state == 3 }">通过</c:if>
						</td>
						<td><a href="${pageContext.request.contextPath}/yy/teacher/download_paper?filename=${item.filepath}">下载</a></td>
						<c:if test="${sessionScope.time.name eq '上传论题' }">
							<td>
								<c:if test="${item.state != 3 }">
									<a href="${pageContext.request.contextPath}/yy/teacher/delete_paper?pid=${item.pid}&filepath=${item.filepath}" onclick="confirm_delete(this);return false;">删除</a>
								</c:if>
								<c:if test="${item.state == 3 }">
									已通过
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div id="add-paper" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">上传题目</h4>
			</div>
			<div class="modal-body">
				<form id="title-form" class="form-horizontal container-fluid" enctype="multipart/form-data" >
					<div class="form-group ">
						<label for="title" class="col-sm-2 control-label">论文题目</label>
					    <div class="col-sm-10">
				        	<input name="paper-name" type="text" class="form-control" id="title" placeholder="请输入论文题目">
					    </div>
					</div>
					<div class="form-group ">
						<label for="input-id" class="col-sm-2 control-label">上传文件</label>
						<div class="col-sm-10">
							<input id="input-id" name="file"  type="file" class="file"  data-preview-file-type="text" >
						</div>  
					</div> 
				</form>
			</div>
			<div class="modal-footer contailer-fluid">
				  <div class="row">
						<span class="col-md-1"></span>
						<button id="submit-title" type="button"  data-loading-text="提交中" class="btn btn-primary col-md-10" onclick="submit(this)">提交</button>
						<span class="col-md-1"></span>
					</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<script type="text/javascript">
$("#input-id").fileinput({

    showPreview : false,
    
    showUpload:false
    });
	function confirm_delete(a){
		swal({   
			title: "你确定要删除么?",
			type: "warning",  
			showCancelButton: true,  
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "确定",   
			cancelButtonText: "取消",   
			closeOnConfirm: false,   
			closeOnCancel: false 
			}, 
			function(isConfirm){   
				if (isConfirm) {
					$.ajax({
						url:a.href,
						type:'get',
						async : true,
						cache : false,
						success : function () {
							swal("你已删除！","", "success");
							$('#teacher-content').load("${pageContext.request.contextPath}/yy/teacher/myPaper");
						},
						error:function(){
							swal("删除失败！", "", "error");   
						}
					});
				}else{
					swal("操作已取消！","", "success");
				}
			}
		);
	}
	function submit(btn){
        var formData = new FormData($("#title-form")[0]);
        var $btn = $(btn).button('loading');
        $.ajax({

            url : '${pageContext.request.contextPath}/yy/teacher/add_paper',

            type : 'POST',

            data : formData,
            
            async: true, 
            
            cache: false,

            contentType : false, 

            processData : false,

            success : function(data) {
            	if(data["result"] != "success"){
            		swal("上传失败！","Failed", "error");
            		$btn.button("reset");
	               	 $('#add-paper').modal('hide');
            	}else{
            		$btn.button("reset");
	               	 $('#add-paper').modal('hide');
	               	 $('#teacher-content').load("${pageContext.request.contextPath}/yy/teacher/myPaper");
            	}
            },

            error : function() {
            }
        });
	}
</script>
