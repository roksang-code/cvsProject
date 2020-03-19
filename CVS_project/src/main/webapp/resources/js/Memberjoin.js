$(document).ready(function() {
	

	$(document).on("click", "#idc", function(){
		
		var idc = $("#idtext").val();
		

		$.getJSON("checkID?id=" + idc,
				
		function(data) {
				console.log(data);
				if(data.length==0){
					alert("사용가능한 아이디 입니다.");		
					$("#hidc").val(1);

				}
				$(data).each(function() {

					console.log(this.id);
					if(this.id==idc){
						alert("중복된 아이디 입니다.");
					}

				});	
		});
	
	});

		
	$(document).on("keyup", "#selectemail", function(){

		var emailv = document.getElementById("selectemail").value;
		document.getElementById("emtext2").value = emailv;

	});
	$(document).on("keyup", "#pwtext", function(){
		var pwl = document.getElementById("pwtext").value.length;
		var pwtext2 = document.getElementById("pwtext2");

		if (7 < pwl && pwl < 13) {
			pwtext2.innerHTML = "사용가능한 비밀번호 입니다.";
		} else {
			pwtext2.innerHTML = "비밀번호는 8자 이상 12자 이하로 입력하셔야 합니다.";

		}
	});
$(document).on("click", "#emailc", function(){

		$("#email").val($("#emtext1").val()+"@"+$("#emtext2").val());
		var emailc = $("#email").val();
		

		$.getJSON("checkEmail?email=" + emailc,
				
				function(data) {
					
					console.log(data);
					if(data.length==0){
						alert("사용가능한 이메일 입니다.");		
						$("#hemailc").val(1);

					}
					$(data).each(function() {

					if(this.email==emailc){
						alert("중복된 이메일 입니다.");
					}
					
				});

		});
	
	});
	

	$(document).on("keyup", "#pwtext3", function(){
		var pwl = document.getElementById("pwtext").value;
		var pwl2 = document.getElementById("pwtext3").value;

		var pwtext4 = document.getElementById("pwtext4");

		if (pwl == pwl2) {

			pwtext4.innerHTML = "비밀번호 확인완료.";
		} else {
			pwtext4.innerHTML = "비밀번호를 다시 확인하세요.";

		}
	});
	
	
	$("#selectemail").on("change", function(){
		
		$("#emtext2").val($("#selectemail").val());
		
	});
	
	
	$("#join").on("mouseenter", function(){
		$("#email").val($("#emtext1").val()+"@"+$("#emtext2").val());
		$("#age").val($("#age1").val()+"-"+$("#age2").val());
	
		
	});
	

	
});
