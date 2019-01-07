$(document).ready(function(){
	
	$("#wrapper").css('min-height', $(window).innerHeight() - $(".hd").innerHeight() - $(".footer").innerHeight() - 2);

	$(window).resize(function(){
		$("#wrapper").css('min-height', $(window).innerHeight() - $(".hd").innerHeight() - $(".footer").innerHeight() - 2);
	});
});