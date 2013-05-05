$(function(){
	$('.nav-tab').click(function() {
		var loc = $(this).attr('target');
		if (loc)
		{
			document.location.href = $(this).attr('target');
		}	  
	});
});

function getAnnotations(id){
	$.get('/annontations/' + id, function(data) {
		for(var i = 0; i < data.length; i++){
			var target = "#p_" + data[i]["paragraph"];
			var text = $(target).text().trim();
			var newHtml = $(target).html().trim();
			var total_chars = text.length;
			var s = data[i]["start_location"];
			var e = data[i]["end_location"];
			var beginning = text.slice(0,s);
			var middle = text.slice(s,e);
			var end = text.slice(e,total_chars);
			var htmlSpan ="<span title=\"" + data[i]["description"] + "\" style=\"background-color:blue\">" + middle + "</span>";
			newHtml = newHtml.replace(middle,htmlSpan);
			$(target).html(newHtml);
		}
	});
}