<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/mdOrder.css?v=<%=System.currentTimeMillis()%>"> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script	src="../resources/js/mdOrder.js?v=<%=System.currentTimeMillis()%>"></script>  -->

</head>
<body>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="ambient_food" data-toggle="tab" href="#ambient_food_d" role="tab" aria-controls="ambient_food_d" aria-selected="true">상온식품</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="cold_food" data-toggle="tab" href="#cold_food" role="tab" aria-controls="cold_food-d" aria-selected="false">냉장식품</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="freeze_food" data-toggle="tab" href="#freeze_food_d" role="tab" aria-controls="freeze_food_d" aria-selected="false">냉동식품</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="fresh_food" data-toggle="tab" href="#fresh_food_d" role="tab" aria-controls="fresh_food_d" aria-selected="false">신선식품</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="drink" data-toggle="tab" href="#drink_d" role="tab" aria-controls="drink_d" aria-selected="false">음료</a>
  </li>  
  <li class="nav-item">
    <a class="nav-link" id="alcohol_drink" data-toggle="tab" href="#alcohol_drink_d" role="tab" aria-controls="alcohol_drink_d" aria-selected="false">주류</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="office_supplies" data-toggle="tab" href="#office_supplies_d" role="tab" aria-controls="office_supplies_d" aria-selected="false">사무용품</a>
  </li>  
  <li class="nav-item">
    <a class="nav-link" id="cigarette" data-toggle="tab" href="#cigarette_d" role="tab" aria-controls="cigarette_d" aria-selected="false">담배</a>
  </li>
  
</ul>
<script type="text/javascript">
	
	$(".nav-item").on("click",function(){

		var type = $.trim($(this).text());
			

			$.getJSON("typePage?type="+type,
					
					function (data) {
						
						console.log(data);
						var str = "<input id='hidden_type' type='hidden' value="+this.type+">";
						str += "<select class='custom-select' id='inputGroupSelect04'  aria-describedby='mdname'>";
						str += "<option value ='' selected>전체</option>";
						$(data).each(function() {

							str += "<option value='"+this.detail_type+"'>"+this.detail_type+"</option>";
							
						});
						str += "</select>";
						
						$(".a").html(str);
						
						str = "";
					});
			
	
	});
	
</script>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="ambient_food_d" role="tabpanel" aria-labelledby="ambient_food-tab">
		<jsp:include page="typePage.jsp"/>
  </div></div>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>