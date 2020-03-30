<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script	src="../resources/js/Loginpage.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
	<style type="text/css">
		.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
		 
		#IDmodalLayer{display:none; position:relative;}
		#IDmodalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
		top:50%; z-index:11; background:#fff;}
		#IDmodalLayer .modalclose button{position:absolute; right:0; top:0; cursor:pointer;}
		
		#PWmodalLayer{display:none; position:relative;}
		#PWmodalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
		top:50%; z-index:11; background:#fff;}
		#PWmodalLayer .modalclose button{position:absolute; right:0; top:0; cursor:pointer;}
		
		
		 
			
	</style>
<body>
	<script type="text/javascript">

	if(${param.fail==0}){
		alert("아이디와 비밀번호를 다시 입력해주세요");
		$(location).attr('href', "../login/LoginpageGet");
	}
	</script>	

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
				<a href="#" id="search_PW">비밀번호 찾기</a>
			</div>
		</div>
</div>	
	<div id="IDmodalLayer">	<!-- ID 검색 모달창 -->
		<div class="modalContent">
			<div class="input-group-append" style="padding-bottom: 20px; padding-top: 20px;">
				<div class="modalclose"><button  class="btn btn-secondary" type="button" id="ID_close">X</button></div>
				
				<div id="ID_search_info">
				
							<div class="row no-gutters">
								<div class="col-3">	Email : </div>
								<div class="col-9"> <input type="text" class="form-control"  id="ID_search_email"></div>
							</div>
							
							<div class="row" style="padding-top: 20px;">
								<div class="col-2"></div>
								<div class="col-3"><button type="button" class="btn btn-primary" id="btn_ID_search">검색</button>	</div>
								<div class="col-4"><button  class="btn btn-primary" type="button" id="id_close">취소</button></div>
							</div>	
							
				</div>				
			</div>	
		</div>
	</div>
		
	<div id="PWmodalLayer">	<!-- PW 검색 모달창 -->
		<div class="modalContent">
				<div>
							<div class="input-group-append" style="padding-bottom: 20px; padding-top: 20px;">
							<div class="modalclose"><button  class="btn btn-secondary" type="button" id="PW_close">X</button></div>
							
								
							<div id="PW_search_info">
								
						
									<div class="row no-gutters">
									
										<div class="col-3">	ID : </div>
										<div class="col-9"> <input type="text" class="form-control"  id="PW_search_ID"></div>
									</div>
									
									<div class="row no-gutters">
										<div class="col-3">	Email : </div>
									
										<div class="col-9"> <input type="text" class="form-control"  id="PW_search_email"></div>
									
									</div>
									<div class="row" style="padding-top: 20px;">
										<div class="col-2"></div>
										<div class="col-3"><button type="button" class="btn btn-primary" id="btn_PW_search">검색</button>	</div>
										<div class="col-4"><button  class="btn btn-primary" type="button" id="pw_close">취소</button></div>
									</div>		
							</div>
						</div>
				</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	$(document).on("click", "#search_ID", function(){

				  keyno = $(this).attr("id");
				  var modalLayer = $("#IDmodalLayer");
				  var modalCont = $(".modalContent");
				  var marginLeft = modalCont.outerWidth()/2;
				  var marginTop = modalCont.outerHeight()/2; 

				    modalLayer.fadeIn("fast");
				    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
				    $(this).blur();
				    $(".modalContent #ID_search_email").focus(); 

				    
				  $("#ID_close").on("click",function(){
				
				    modalLayer.fadeOut("fast");
				    var str = "<div class='row no-gutters'>	<div class='col-3'>	Email : </div>"+
							  "<div class='col-9'> <input type='text' class='form-control' id='ID_search_email'></div></div>"+
							  "<div class='row' style='padding-top: 20px;'>	<div class='col-2'></div>"+
							  "<div class='col-3'><button type='button' class='btn btn-primary' id='btn_ID_search'>검색</button></div>"+
							  "<div class='col-4'><button class='btn btn-primary' type='button' id='id_close'>취소</button></div>	</div>";
					
					$("#ID_search_info").html(str);
					
					return false;

				  });//ID 찾기 모달창 닫기
				  $("#id_close").on("click",function(){
					  modalLayer.fadeOut("fast");
					    var str = "<div class='row no-gutters'>	<div class='col-3'>	Email : </div>"+
								  "<div class='col-9'> <input type='text' class='form-control' id='ID_search_email'></div></div>"+
								  "<div class='row' style='padding-top: 20px;'>	<div class='col-2'></div>"+
								  "<div class='col-3'><button type='button' class='btn btn-primary' id='btn_ID_search'>검색</button></div>"+
								  "<div class='col-4'><button class='btn btn-primary' type='button' id='id_close'>취소</button></div>	</div>";
						
						$("#ID_search_info").html(str);
						
						return false;	
					});//ID 찾기 모달창 닫기

		
	});	
	
	$(document).on("click", "#btn_ID_search", function(){
	
		var str ="";
		var email = $("#ID_search_email").val();
		

		$.getJSON("searchID?email=" + email,
				
				function(data) {
					
					console.log(data);
					$(data).each(function() {
						str += "<a> 고객님의 ID는 \"" + this.id+"\" 입니다.</a></br>";
				
					});
					$("#ID_search_info").html("");
					$("#ID_search_info").html(str);
		});
	
	});
	
	$(document).on("click", "#search_PW", function(){
		
					  keyno = $(this).attr("id");
					  var modalLayer = $("#PWmodalLayer");
					  var modalCont = $(".modalContent");
					  var marginLeft = modalCont.outerWidth()/2;
					  var marginTop = modalCont.outerHeight()/2; 
		
					    modalLayer.fadeIn("fast");
					    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
					    $(this).blur();
					    $(".modalContent #PW_search_ID").focus(); 
					    $(".modalContent #PW_search_email").focus(); 
						
					    
					  $("#PW_close").on("click",function(){
					
					    modalLayer.fadeOut("fast");
					    var str = 	"<div class='row no-gutters'><div class='col-3'>ID : </div>"+
									"<div class='col-9'> <input type='text' class='form-control'  id='PW_search_ID'></div></div>"+
									"<div class='row no-gutters'><div class='col-3'>Email : </div> <div class='col-9'>"+
									"<input type='text' class='form-control'  id='PW_search_email'></div></div>"+
									"<div class='row' style='padding-top: 20px;'><div class='col-2'></div>"+
									"<div class='col-3'><button type='button' class='btn btn-primary' id='btn_PW_search'>검색</button></div>"+
									"<div class='col-4'><button  class='btn btn-primary' type='button' id='pw_close'>취소</button></div></div>";
						
						$("#PW_search_info").html("");
						$("#PW_search_info").html(str);
						
						return false;
		
					  });//PW 찾기 모달창 닫기
					  $("#pw_close").on("click",function(){
							
						    modalLayer.fadeOut("fast");
						    var str = 	"<div class='row no-gutters'><div class='col-3'>ID : </div>"+
										"<div class='col-9'> <input type='text' class='form-control'  id='PW_search_ID'></div></div>"+
										"<div class='row no-gutters'><div class='col-3'>Email : </div> <div class='col-9'>"+
										"<input type='text' class='form-control'  id='PW_search_email'></div></div>"+
										"<div class='row' style='padding-top: 20px;'><div class='col-2'></div>"+
										"<div class='col-3'><button type='button' class='btn btn-primary' id='btn_PW_search'>검색</button></div>"+
										"<div class='col-4'><button  class='btn btn-primary' type='button' id='pw_close'>취소</button></div></div>";
							
							$("#PW_search_info").html("");
							$("#PW_search_info").html(str);
							
							return false;
			
						  });//PW 찾기 모달창 닫기
				
			
	});	
		
		$(document).on("click", "#btn_PW_search", function(){
		
			var str ="";
			var ID = $("#PW_search_ID").val();
			var email = $("#PW_search_email").val();
			
		
			$.getJSON("searchPW?id="+ID+"&email=" + email,
					
					function(data) {
						
						console.log(data.pw);
						$(data).each(function() {
							str += "<a> 고객님의 PW는 \"" + this.pw+"\" 입니다.</a></br>";
					
						});
						$("#PW_search_info").html("");
						$("#PW_search_info").html(str);
			});
		});
	</script>
	

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>