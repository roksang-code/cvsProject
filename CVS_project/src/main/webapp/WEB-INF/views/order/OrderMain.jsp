<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/select_MD_Type.css?v=<%=System.currentTimeMillis()%>"> -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script	src="../resources/js/select_MD_Type.js?v=<%=System.currentTimeMillis()%>"></script> -->

<script	src="../resources/js/typePage.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
<script type="text/javascript">

$(document).on("click", "#select_type_page", function(){
		
			var type = '상온식품';
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

$(document).on("click", "#main_page", function(){
	
	$(location).attr('href', "../login/mainPage");//메인페이지


});
</script>
<div class="container-fluid">

	<div class="row">
	  <div class="col-2">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">공지사항</a>
	      <a class="list-group-item list-group-item-action" id="select_type_page" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">상품발주</a>
	      <a class="list-group-item list-group-item-action" id="main_page" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">메인페이지</a>
	    </div>
	  </div>
	  <div class="col-10">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
		 		<c:choose>
					<c:when test="${type!='detail'}">
     					<c:import url="/order/notice"></c:import>
		 			</c:when>		
			 		
					<c:when test="${type=='detail'}">
     					<c:import url="notice_detail.jsp"></c:import>
 					</c:when>		 	
			 		
		 		</c:choose>
		 				 		
		  </div>
	      
	      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">	    
	   	  		<jsp:include page="select_MD_Type.jsp"/>
		  </div>
	   
	    </div>
	  </div>
	</div>
	
	
	
</div>		
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>