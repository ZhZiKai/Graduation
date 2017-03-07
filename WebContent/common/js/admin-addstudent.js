$(function () {
	$("#add-student").fileupload({
		autoUpload:true,
    	url:"../admin/add_students",
    	acceptFileTypes: /(\.|\/)(xls)$/,
    	done:function(){	
    		$("#admin-wrapper").load("../admin/studentInfo");
    	},
    	progressall:function(e,data){
		    // var progress=parseInt(data.loaded/data.total*100, 10);
		    // $("#add-commodity-photo-percentage").css("width",progress+"%");
		    // $("#add-commodity-photo-percentage").text(progress+"%");
    	}
    });
	$("#addStudent").click(function () {
		var name = $("input[name='name']").val();
		var account = $("input[name='account']").val();
		var password =  $("input[name='password']").val();
		if(name == "" || account == "" || password == "") {
			$(".input").addClass("has-error");
		}else {
			$.ajax({
				async : true,
				cache : false,
				type : 'POST',
				dataType:"json",
				data:$('#studentForm').serializeArray(),
				url : 'insertStudent',
				success : function (json) {
					if(json.statusCode == '200') {
						$("#admin-wrapper").load("../admin/studentInfo");
					}else if(json.statusCode == '301') {
						swal("错误", json.message, "error");
					}
				}
			})
		}
		
	});
})