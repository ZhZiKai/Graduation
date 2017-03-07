$(function(){
	$("#wizard").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        stepsOrientation: "vertical",        
        onStepChanged : function(event, currentIndex, newIndex) {
        	var begin_time = $("#begin_time"+currentIndex).val();
        	var end_time = $("#end_time"+currentIndex).val();
        	$.post("insertTime",{"begin_time":begin_time, "end_time":end_time, "sdid" : currentIndex});
        },
        onFinishing : function (event, currentIndex)  {
        	var begin_time = $("#begin_time"+currentIndex).val();
        	var end_time = $("#end_time"+currentIndex).val();
        	$.post("insertTime",{"begin_time":begin_time, "end_time":end_time, "sdid" : currentIndex});
    		return true;
        	
        },
        onFinished: function (event, currentIndex) {
            $("#admin-wrapper").load("../admin/timeInfo");
        }
    });
	
	$('.input-group.date').datepicker({
		format: "yyyy-mm-dd",
	    orientation: "bottom left",
	    calendarWeeks: true,
	    autoclose: true,
	    todayHighlight: true,
	    calendarWeeks: false,
	});
})