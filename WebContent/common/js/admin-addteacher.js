$(function () {
	$("#addTeacher").click(function () {
		var name = $("input[name='name']").val();
		var account = $("input[name='account']").val();
		var password =  $("input[name='password']").val();
		var professional =  $("input[name='professional']").val();
		if(name == "" || account == "" || password == "" || professional == "") {
			$(".input").addClass("has-error");
		}else {
			$.ajax({
				async : true,
				cache : false,
				type : 'POST',
				data:$('#teacherForm').serializeArray(),
				url : 'insertTeacher',
				success : function (json) {
					if(json.statusCode == '301') {
						swal("错误", json.message, "error");
					}else if(json.statusCode == '200') {
						$("#admin-wrapper").load("../admin/teacherInfo");
					}
				}
			});
		}
		
	});
})