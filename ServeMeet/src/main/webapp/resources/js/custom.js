$(document).ready(function(){
	
	$("#wrapper").css('min-height', $(window).innerHeight() - $("#header_wrap").innerHeight() - $("#footer_wrap").innerHeight() - 2);

	$(window).resize(function(){
		$("#wrapper").css('min-height', $(window).innerHeight() - $("#header_wrap").innerHeight() - $("#footer_wrap").innerHeight() - 2);
	});
});