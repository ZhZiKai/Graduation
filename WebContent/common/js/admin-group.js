$(function () {
	$("#wizard").steps({
		headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        onStepChanging : function(event, currentIndex, newIndex) {
        	var groupName = $("#groupName").val();
        	var ids = $("#ids").val();
        	if(currentIndex == 0) {
        		if(groupName == null || groupName == "") {
            		return false;
            	}else{
            		$.post("insertGroupName", {"groupName" : groupName});
            		return true;
            	}
        	}else if(currentIndex == 1){
        		if(ids == null || ids == "") {
        			return false;
        		}else {
        			$.post("insertGroupTeacher",{"groupName" : groupName , "ids" : ids});
        			return true;
        		}
        	}	
        },
        onFinishing : function (event, currentIndex)  {
        	var sids = $("#sids").val();
        	var groupName = $("#groupName").val();
        	if(sids == null || sids == "") {
        		return false;
        	}else {
        		$.ajax({
        			data : {"groupName" : groupName, "sids" : sids},
        			type : "post",
        			url : "insertGroupStudent",
        		});
        		return true;
        	}
        },
        onFinished: function (event, currentIndex) {
        	$.post("clearSession");
            $("#admin-wrapper").load("../admin/groupInfo");
        }
    });
 });