$(function () {
	//初始化样式
	$(".pageNo").eq(0).addClass("active");
	$(".list-group a").click(function () {
		$(".list-group a").each(function (){
			$(this).removeClass("active");
		});
		$(this).addClass("active");
	});
	
	/*$("#submit-form").click(function () {
		$.ajax({
			async : true,
			cache : false,
			type : 'POST',
			dataType:"json",
			data:$('#add-admin-form').serializeArray(),
			url : 'addTeacher',
			success : function (json) {
				if(json.statusCode == '200') {
					$("#addTeacherModal").modal('hide');
					$("#addTeacherModal").on('hidden.bs.modal', function() {
						$("#teacher").click();
					});
				}else if(json.statusCode == '301') {
					$('.teacher').addClass("has-error");
				}
			}
		});
	});*/
	
	$("#add-teacher").click(function(){
		$.post("insertTeacher",function(data) {
			$("#admin-wrapper").html(data);
		},"html")
	})
});