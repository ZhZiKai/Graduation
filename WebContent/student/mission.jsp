<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			${sessionScope.time.name }
		</h3>
	</div>
	<div class="panel-body">
		<form id="title-form" class="form-horizontal container-fluid" enctype="multipart/form-data" >
			<div class="form-group ">
				<label for="title" class="col-sm-2 control-label">论文题目</label>
			    <div class="col-sm-9">
		        	<input name="title" type="text" class="form-control" value="${sessionScope.admin.titleName }" >
			    </div>
			</div>
			<div class="form-group ">
				<label for="input-id" class="col-sm-2 control-label">上传文件</label>
				<div class="col-sm-9">
					<input id="student-upload" name="file"  type="file" class="file"  data-preview-file-type="text" >
				</div>  
			</div>
			<div class="form-group ">
				<button type="button" id="upload-paper" class="btn btn-success  col-sm-offset-10"  data-loading-text="提交中" >提交</button> 
			</div> 
		</form>
	</div>
</div>
<script>
	$("#student-upload").fileinput({
	
		showPreview : false,
		
		showUpload:false
	});
	$("#upload-paper").click(function(){
        var formData = new FormData($("#title-form")[0]);
        var $btn = $(this).button('loading');
        $.ajax({

            url : '${pageContext.request.contextPath}/yy/student/upload_paper',

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
            	}else{
            		$btn.button("reset");
            		swal("上传成功！","success", "success");
            	}
            },

            error : function() {
            }
        });
	});
</script>