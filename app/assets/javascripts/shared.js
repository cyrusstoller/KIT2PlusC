$(function(){
	$(".hover_to_x").hover(
		function(){
			$(this).addClass("back-red");
		},
		function(){
			$(this).removeClass("back-red");
		}
	);
	$(".hover_to_x").click(function(){
		$(this).siblings().html(".");
		$(this).siblings().removeClass("selected_x");
		$(this).html('<span class="red">X</span>');
		$(this).addClass("selected_x");
		$(this).parent().parent().parent().find(".mmline_value").val(
			$(this).data('value')
		);
	});
});