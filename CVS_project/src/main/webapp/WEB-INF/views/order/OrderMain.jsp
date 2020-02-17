<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
<script type="text/javascript">

		$("#select_type_page").on("click",function(){
		
			var type = $.trim($(this).text());
				
		
				$.getJSON("typePage?type="+type,
						
						function (data) {
							
							console.log(data);
							var str = "<input id='hidden_type' type='hidden' value="+this.type+">";
							str += "<select class='custom-select' id='inputGroupSelect04'  aria-describedby='mdname'>";
							str += "<option value ='' selected>전체</option>";
							$(data).each(function() {
		
								str += "<option value="+this.detail_type+">"+this.detail_type+"</option>";
								
							});
							str += "</select>";
							
							$(".a").html(str);
							
							console.log(str);
							str = "";
						});
				
		
		});

</script>
<div class="container-fluid">

	<div class="row">
	  <div class="col-2">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">공지사항</a>
	      <a class="list-group-item list-group-item-action" id="select_type_page" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">상품발주</a>
	      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">메인페이지</a>
	    </div>
	  </div>
	  <div class="col-10">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">공지사항</div>
	      
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