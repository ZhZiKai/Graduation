<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">
			组内论题
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-hover">
			<thead>
				<th>标号</th>
				<th>题目标题</th>
				<th>文件</th>
				<th>教师</th>
				<th>评分</th>
			</thead>
			<tbody>
				<c:forEach  var="item"  items="${papers }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${item.title }</td>
						<td><a href="${pageContext.request.contextPath}/yy/teacher/download_paper?filename=${item.filepath}">下载</a></td>
						<td>${item.tname }</td>
						<td>
							<c:if test="${item.score =='' }">
								<button id="tscore-button-${item.pid }" type="button" class="btn btn-primary btn-xs" onclick="score({'pid': '${item.pid}','title': '${item.title}'})">给予评分</button>
							</c:if>
							<c:if test="${item.score !='' }">
								${item.score }
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="modal fade" id="tscore">
	<div class="modal-dialog">
		<div class="modal-content">
		<form class="form-horizontal" id="score-form">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">提出意见</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">论文标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" placeholder="Email" readonly="readonly">
						</div>
				</div>
				<div class="form-group">
					<label for="suggest" class="col-sm-2 control-label">我的评分</label>
					<div class="col-sm-10">
						<input id="score-input" type="number" class="form-control" name="score" placeholder="0" >
					</div>
				</div>
			</div>
			<input type="hidden" name="pid"/>
			<input type="hidden" name="tid" value="${sessionScope.admin.tid }"/>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" onclick="commit_score()">提交评分</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
	$(".paper-score").click(function(){
		var id = $(this).attr("id").split("-")[1];
		$.ajax({
					url:"${pageContext.request.contextPath}/yy/teacher/comment_paper",
					type:'get',
					data:$("#paper-score-"+id).serializeArray(),
					async : true,
					cache : false,
					success:function(){
					}
			}
		); 
	});
	function score(data){
		$("#title").val(data["title"]);
		$("input[name='pid']").val(data["pid"]);
		$("#tscore").modal("show");
	}
	function commit_score(){
		var $score_button = $("#tscore-button-"+$('#score-form').serializeArray()[1].value);
		var content = Number($("#score-input").val(),10);
		if(content <= 0 || (content >10)){
			swal("输入分数不符合要求！","error","error");
		}else{
			 $.ajax({
				url:"${pageContext.request.contextPath}/yy/teacher/comment_paper",
				type:'post',
				dataType:"json",
				data:$('#score-form').serializeArray(),		
				success:function(data){
					if(data["statusCode"]=='200'){
						swal(data["message"], "success", "success");   
						$("#tscore").modal("hide");
						$score_button.hide();
						$score_button.parent().text($('#score-form').serializeArray()[0].value);
					}else{
						swal(data["message"],"error","error");
					}
				},
			});	 
		}
	}
</script>
</script>
