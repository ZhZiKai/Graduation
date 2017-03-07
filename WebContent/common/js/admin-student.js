$(function () {
	//初始化样式
	$(".pageNo").eq(0).addClass("active");
	$(".list-group a").click(function () {
		$(".list-group a").each(function (){
			$(this).removeClass("active");
		});
		$(this).addClass("active");
	});
});