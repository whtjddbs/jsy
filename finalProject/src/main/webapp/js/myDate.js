//json Date to YYYY-MM-DD
function jsonDateFormat(date) {
	var year = date.getYear()+1900;
	var month = date.getMonth()+1;
	var day = date.getDate();
	return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
}

function setThisMonth() {
	var now = new Date();
	var startDate = new Date(now.getYear()+1900, now.getMonth(), 1);
	var endDate = new Date(now.getYear()+1900, now.getMonth()+1, 0);
	
	$("[name='startDate']").val(jsonDateFormat(startDate));
	$("[name='endDate']").val(jsonDateFormat(endDate));
}