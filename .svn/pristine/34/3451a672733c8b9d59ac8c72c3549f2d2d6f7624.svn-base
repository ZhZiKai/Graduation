$(function () {
	$("#student-submit-button").click(function() {
		$.ajax({
			async : true,
			cache : false,
			type : 'POST',
			dataType:"json",
			data:$('#studentForm').serializeArray(),
			url : 'comm/login_student',
			success : function (json) {
				if(json.statusCode == '200') {
					window.location = "/yy/student/index";
				}else if(json.statusCode == '301'){
					$('.form-group').addClass("has-error");
				}
			}
		});
	});
});