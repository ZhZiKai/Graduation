$(function () {
	$("#admin-submit-button").click(function () {
		var account = $("#admin-account-input").val();
		var password = $("#admin-password-input").val();
		if(account == "" || password == "") {
			$(".form-group").addClass("has-error");
		}
		$.ajax({
			async : true,
			cache : false,
			type : 'POST',
			dataType:"json",
			data:$('#admin-login').serializeArray(),
			url : 'checkLogin',
			success : function (json) {
				if(json.statusCode == '200') {
					window.location = '../../yy/admin/index';
				}else{
					$(".form-group").addClass("has-error");
				}
			}
		});
	});
});