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
				<th>论文（${sessionScope.time.name }）</th>
				<th>提出意见</th>
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
							<c:if test="${item.title == ''}">未上传</c:if>
							<c:if test="${item.title  != ''}"><a href="${pageContext.request.contextPath}/yy/teacher/download_paper?filename=${item.filepath}"">${item.title}</a></c:if>
						</td>
						<td>
							<c:if test="${item.title  != ''}">
								<button type="button" class="btn btn-primary btn-xs" onclick="options({'sid': ${item.sid},'psid':${item.psid },'title': '${item.title}'})">提出意见</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="modal fade" id="give">
	<div class="modal-dialog">
		<div class="modal-content">
		<form class="form-horizontal" id="options">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">提出意见</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">论文标题</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="title" placeholder="Email" readonly="readonly">
						</div>
				</div>
				<div class="form-group">
					<label for="suggest" class="col-sm-2 control-label">我的意见</label>
					<div class="col-sm-10">
						<textarea name="content" id="content" class="form-control" rows="3" ></textarea>
					</div>
				</div>
			</div>
			<input type="hidden" name="sid"/>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="commit_option()">提交意见</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
	function options(data){
		$("#title").val(data["title"]);
		$("input[name='sid']").val(data["sid"])
		$("#give").modal("show");
	}
	function commit_option(){
		var content = $("#content").val();
		if(content == ""){
			swal("评论内容不能为空！","error","error");
		}else{
			$.ajax({
				url:'${pageContext.request.contextPath}/yy/teacher/commit_options',
				type:'post',
				dataType:"json",
				data:$('#options').serializeArray(),		
				success:function(data){
					if(data["statusCode"]=='200'){
						swal(data["message"], "success", "success");   
						$("#give").modal("hide");
					}else{
						swal(data["message"],"error","error");
					}
				},
			});	
		}
	}
</script>

