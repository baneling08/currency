$(function(){
	var currency = "USDGBP";
	

	$("#form").submit( function(eventObj) {
			
			var sample = $("#currency option:selected").text();
      		$('<input />').attr('type', 'hidden')
          		.attr('name', 'text').val(sample)
          		.appendTo(this);
      		return true;
  		});
})