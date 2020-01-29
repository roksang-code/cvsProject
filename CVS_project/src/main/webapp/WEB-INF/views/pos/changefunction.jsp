<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<input type="text"><button class="search">검색</button>
	<div class="info"></div>
</div>	
	
<script type="text/javascript">
$(".search").on("click", function(){

	str ="";
	sale_date = $("#paymentdate").val();
	$.getJSON("selectPaymentList?sale_date=" + sale_date,
			
			function(data) {
		console.log(data);
		$(data).each(function() {
			
			str += "<a >" + this.md_name + "</a>";
		});
		
		$(".info").html(str);


	
	
	});//매출 확인 날짜 선택 
	
	
});
</script>
</body>
</html>