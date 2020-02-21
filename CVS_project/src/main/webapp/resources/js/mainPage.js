

$(document).ready(function() {
	
	$("#pospage").on("click",function(){
		
		$(location).attr('href', '../pos/posPayment'); 
		
	});
	
	$("#order").on("click",function(){
		
		$(location).attr('href', '../order/OrderMain'); 
		
	});
	
	$("#logout").on("click", function() {
		if($("#logout").text().trim() == "로그아웃"){
			$(location).attr('href', "../login/Logout");//로그아웃 컨트롤러		
		}else{
			$(location).attr('href', "../login/LoginpageGet");//로그인 컨트롤러
		}
	
	});
	
});