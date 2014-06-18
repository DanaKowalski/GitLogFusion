$(document).ready(function(){
	$('#gitCount').load('gitCount.cfm');
	$('#gitLog').load('gitLog.cfm');

	$(".gitCntBtn").click(function(){
		var $this = $(this);
		var start = $this.attr('start');
		var end = $this.attr('end');
		$(".gitCntBtn").removeClass("btn-primary").addClass("btn-default");
		$this.removeClass("btn-default").addClass("btn-primary");
		$('#gitCount').load('gitCount.cfm?start=' + start + '&end=' + end);
	});

	$("#authorList").change(function(){
		var author = $("option:selected", this).val();

		$('#gitLog').html('Loading...');
		$('#gitLog').load('gitLog.cfm?author='+ encodeURIComponent(author));
	});
});