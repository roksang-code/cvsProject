<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="../resources/js/orderApproval.js?v=<%=System.currentTimeMillis()%>"></script>
<script	src="../resources/js/uploadwrite.js?v=<%=System.currentTimeMillis()%>"></script>

<script type="text/javascript" src="../resources/plugins/jQuery/jquery.form.min.js"></script> 
</head>
</head>
<body>
		<script type="text/javascript">
		function approval_list() {
			
			
			$.getJSON("approval_list",
					function(data) {
						console.log(data);
						
						var str ="";			
						str += "<table style='text-align: center;' class='table table-bordered' id='approval_list_table'>";						
						str += "<thead class='thead-light'>";
						str += "<tr>";
						str += "<th>매장번호</th>";
						str += "<th>수량</th>";
						str += "<th>원가 합계</th>";
						str += "<th>정가 합계</th>";
						str += "<th>전체 승인</th>";
						str += "</tr>";
						str += "</thead>";
						
						$(data).each(function(index) {

							str += "<tr class='approval_list_tr' id='app_tr"+(index+1)+"'>";
							str += "<td class='list_member_no'>" + this.member_no + "</td>";
							str += "<td>" + this.total_order_ea + "</td>";
							str += "<td>" + this.total_cost + "</td>";
							str += "<td>" + this.total_price + "</td>";
							str += "<td><button id='"+this.member_no+"' class='btn btn-secondary'>승인</button></td>";
							
							str += "</tr>";

						});
						str += "</table>";

						$("#approval_list_table").html(str);

			});
			}
				
	   	 	 		
	   			$(document).on("click", "#list-orderApproval-list", function(){
					
	   			
	   				approval_list();

	   			});
	   	 	 		
	   	 	 		
	   	</script>
	   	 	 	
<div class="container-fluid">

	<div class="row">
	  <div class="col-2">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-noticeAdd-list" data-toggle="list" href="#list-noticeAdd" role="tab" aria-controls="noticeAdd">공지사항</a>
	    
	      <a class="list-group-item list-group-item-action" id="list-addMD-list" data-toggle="list" href="#list-addMD" role="tab" aria-controls="addMD">상품등록</a>
	      <a class="list-group-item list-group-item-action" id="list-orderApproval-list" data-toggle="list" href="#list-orderApproval" role="tab" aria-controls="orderApproval">발주승인</a>
	      <a class="list-group-item list-group-item-action" id="list-logout-list" data-toggle="list" href="#list-logout" role="tab" aria-controls="logout">로그아웃</a>
	    </div>
	  </div>
	  
	  <div class="col-10">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-noticeAdd" role="tabpanel" aria-labelledby="list-noticeAdd-list">
	      			<c:choose>
					<c:when test="${type==null || type == 'list'}">
     					<c:import url="/admin/list"></c:import>
		 			</c:when>					 		
					<c:when test="${type=='detail'}">
     					<c:import url="detail.jsp"></c:import>
 					</c:when>		 	
 					
			 		<c:when test="${type=='write'}">
     					<c:import url="write.jsp"></c:import>
 					</c:when>
 					
 					
 							 	
		 		</c:choose>
	      </div>
	      
	      <div class="tab-pane fade" id="list-addMD" role="tabpanel" aria-labelledby="list-addMD-list">	    
	   	 	 	
	   	 	 		<jsp:include page="addMD.jsp"/>
		  			 	
	   	 	
		  </div>
	      
	      <div class="tab-pane fade" id="list-orderApproval" role="tabpanel" aria-labelledby="list-orderApproval-list">	    
	   	 	 	<jsp:include page="orderApproval.jsp"/>
		  </div>
		  
		  <div class="tab-pane fade" id="list-logout" role="tabpanel" aria-labelledby="list-logout-list">	    
	   	 		<script type="text/javascript">
				   	 	$("#list-logout-list").on("click", function() {
				   			$(location).attr('href', "../login/Logout");//로그아웃 컨트롤러
				   		});
				</script>
	   	 	 	
		  </div> 
		  
	    </div>
	  </div>
	</div>
</div>		

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>