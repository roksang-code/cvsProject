<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/Loginpage.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
	<style type="text/css">
		.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
		 
		#modalLayer{display:none; position:relative;}
		#modalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
		top:50%; z-index:11; background:#fff;}
		#modalLayer .modalclose button{position:absolute; right:0; top:0; cursor:pointer;}
		
		#point_save_modal{display:none; position:relative;}
		#point_save_modal .save_modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
		top:50%; z-index:11; background:#fff;}
		#point_save_modal .modalclose button{position:absolute; right:0; top:0; cursor:pointer;}
		
		 
		#tel_dis_modal{display:none; position:relative;}
		#tel_dis_modal .tel_modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
		top:50%; z-index:11; background:#fff;}
		#tel_dis_modal .modalclose button{position:absolute; right:0; top:0; cursor:pointer;}
			
	</style>
<body>
<div class="container-fluid  my-3">
		<div class="col-md-4 offset-md-4">
		<form action="LoginpagePost" method="post">
	
			<h1 align="center" style="padding-top: 25%; padding-bottom: 5%">POS시스템 로그인</h1>
			<div class="row"> 
				<div class="col input-group input-group-lg">
					<input  class="form-control" placeholder="아이디" aria-label="아이디" type="text" name="id">
				</div>
			</div>
			
			<div class="row my-2"> 
				<div class="col input-group input-group-lg">
					<input class="form-control" placeholder="비밀번호" aria-label="비밀번호" type="password" name="pw">
				</div>
			</div>
			<div class="my-1">
					<button  class="btn btn-dark btn-lg btn-block" type="submit" style=" padding-right: 1%;">로그인</button>
			</div>
	</form>
			<div>
				<button  class="btn btn-light btn-lg btn-block" id="join">회원가입</button>
			</div>
			<div>
				<a href="mainPage"  class="btn btn-light btn-lg btn-block">메인페이지</a>
			</div>
			<div>
				<a href="#" id="search_ID">아이디 찾기</a> <a>|</a>
				<a href="#">비밀번호 찾기</a>
			</div>
		</div>
</div>	
	<div class="form-group form-group-sm" id="modalLayer">	<!-- 아이디 검색 모달창 -->
			<div class="modalContent">
				<div>
					<input type="text" class="form-control input-sm" id="member_search_data">
					<input type="submit" value="검색" class="form-control" id="member_search">
				</div>
				<div class="search_info"></div>
				
				<div class="modalclose"><button type="button" id="close">X</button></div>
			</div>
		</div>
		
	
	<script type="text/javascript">
	
	$(document).on("click", "#search_ID", function(){

				  keyno = $(this).attr("id");
				  var modalLayer = $("#modalLayer");
				  var modalCont = $(".modalContent");
				  var marginLeft = modalCont.outerWidth()/2;
				  var marginTop = modalCont.outerHeight()/2; 

				    modalLayer.fadeIn("fast");
				    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
				    $(this).blur();
				    $(".modalContent #member_search_data").focus(); 

				    
				  $("#close").on("click",function(){
				
				    modalLayer.fadeOut("fast");
					$(".search_info").html("");
					$("#member_search_data").val("");
					return false;

				  });//키설정 모달창
		
		
	});	
	
	
	</script>
	

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>