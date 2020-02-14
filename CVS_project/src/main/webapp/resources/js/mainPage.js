

$(document).ready(function() {
	
	$("#pospage").on("click",function(){
		
		$(location).attr('href', '../pos/posPayment'); 
		
	});
	
	$("#order").on("click",function(){
		
		$(location).attr('href', '../order/OrderMain'); 
		
	});
	
	$("#logout").on("click", function() {
		$(location).attr('href', "../login/Logout");//로그아웃 컨트롤러
	});
	
});