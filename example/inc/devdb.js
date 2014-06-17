
$(document).ready(function(){
	$('#gitCount').load('gitCount.cfm');
	$('#gitLog').load('gitLog.cfm');
	
	$(".gitCntBtn").click(function(){
			var rangeFilter = this.id;
			$(".gitCntBtn").removeClass("btn-primary");
			$(".gitCntBtn").addClass("btn-default");
			$(this).removeClass("btn-default").addClass("btn-primary");
			$('#gitCount').load('gitCount.cfm?range='+rangeFilter);
		});
	
	$("#authorList").change(function(){
		var author = $("option:selected", this).val();

		$('#gitLog').html('Loading...');
		$('#gitLog').load('gitLog.cfm?author='+ encodeURIComponent(author));
	});
});
