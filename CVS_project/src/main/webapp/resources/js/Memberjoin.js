$(document).ready(function() {
	
	
	function idch() {
		var idl = document.getElementById("idtext").value.length;
		var idtext2 = document.getElementById("idtext2");

		if (7 < idl && idl < 13) {
			idtext2.innerHTML = "사용가능한 id입니다.";
		} else {
			idtext2.innerHTML = "id는 8자 이상 12자 이하로 입력하셔야 합니다.";

		}
	}

	function selectedemail() {
		var emailv = document.getElementById("selectemail").value;
		document.getElementById("emtext1").value = emailv;

	}
	function pwch() {
		var pwl = document.getElementById("pwtext").value.length;
		var pwtext2 = document.getElementById("pwtext2");

		if (7 < pwl && pwl < 13) {
			pwtext2.innerHTML = "사용가능한 비밀번호 입니다.";
		} else {
			pwtext2.innerHTML = "비밀번호는 8자 이상 12자 이하로 입력하셔야 합니다.";

		}
	}

	function pwch2() {
		var pwl = document.getElementById("pwtext").value;
		var pwl2 = document.getElementById("pwtext3").value;

		var pwtext4 = document.getElementById("pwtext4");

		if (pwl == pwl2) {

			pwtext4.innerHTML = "비밀번호 확인완료.";
		} else {
			pwtext4.innerHTML = "비밀번호를 다시 확인하세요.";

		}
	}
	
	
	$("#selectemail").on("change", function(){
		
		$("#emtext2").val($("#selectemail").val());
		
	});
	
	
	$("#join").on("mouseenter", function(){
		$("#email").val($("#emtext1").val()+"@"+$("#emtext2").val());
		$("#age").val($("#age1").val()+"-"+$("#age2").val());
	});
	

	
});
