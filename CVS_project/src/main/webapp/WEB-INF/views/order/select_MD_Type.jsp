<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>

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
		var detail_type ="";
		var md_name = "";

			$.getJSON("typePage?type="+type,
					
					function (data) {
						
						console.log(data);
						var str = "<input id='hidden_type' type='hidden' value="+type+">";
						str += "<select class='custom-select' id='inputGroupSelect04'  aria-describedby='mdname' style='width: 130px'>";
						str += "<option value ='' selected>전체</option>";
						$(data).each(function() {

							str += "<option value='"+this.detail_type+"'>"+this.detail_type+"</option>";
							
						});
						str += "</select>";
						
						$(".a").html(str);
						
						str = "";
					});
			
			$.getJSON("orderList?type="+type +"&&detail_type=" + detail_type+"&&md_name="+md_name,
					
					function (data) {
						
						console.log(data);
						str += "<table  class='table table-bordered'  id='detailtypetable' style='width: 100%;'>";
						str += "<thead class='thead-light'>";
						str += "<tr>";
						str += "<th width=25%>바코드번호</th>";
						str +=	"<th width=15%>상품타입</th>";
						str +=	"<th width=15%>제조사</th>";
						str +=	"<th width=20%>상품명</th>";
						str +=	"<th width=15%>유통기한</th>";
						str +=	"<th width=10%>발주 수량</th>";
						str += "</tr>";
						
						
						$(data).each(function() {

							str += "<tr id='detail"+cnt+"'>";
							str += "<td id='barcode_no"+cnt+"'>" + this.barcode_no + "</td>";
							str += "<td>" + this.detail_type + "</td>";
							str += "<td>" + this.company + "</td>";
							str += "<td>" + this.md_name + "</td>";
							str += "<td>" + this.shelf_life + "</td>";
							str += "<td> <input type='text' value="+this.order_ea+" id=order_ea"+cnt+" size='7px'></td>";
							str += "</tr>";

							cnt++;
						});
						str += "</thead>";
						str += "</table>";
						
						$("#detailtypetable").html(str);
						str = "";
			});
			
	
	});
	
</script>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="ambient_food_d" role="tabpanel" aria-labelledby="ambient_food-tab">
		<jsp:include page="typePage.jsp"/>
  </div></div>

