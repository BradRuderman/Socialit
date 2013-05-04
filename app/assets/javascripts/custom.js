$(function(){
	$('.nav-tab').click(function() {
		var loc = $(this).attr('target');
		if (loc)
		{
			document.location.href = $(this).attr('target');
		}	  
	});
});