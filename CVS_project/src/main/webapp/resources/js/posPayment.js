
$(document).ready(function() {

	
	
	$(".logout").on("click", function() {
		$(location).attr('href', "../login/Logout");//로그아웃 컨트롤러
	});
	
	$("#md_update").on("click", function() {
	  barcode_no = $("#barcode_no").val();

	  
	  appendMD(barcode_no);
	});
	$(".listInputPr").on("keyup", function() {
		
		var inputPr = parseInt($(".listInputPr").val());
		
		var totalPr = parseInt($(".listTotalPr").html());

		console.log(inputPr);	
		console.log(totalPr);	
		
		if(inputPr>totalPr){
			$(".listOutputPr").html(inputPr-totalPr);	//받은돈 - 합계
			$(".listPaymentPr").html(0);	//받을 금액


			console.log(inputPr-totalPr);	
			
			

		}else{
			$(".listOutputPr").html(0);	//거스름돈 = 받은돈 - 합계
			if(isNaN(inputPr)==false)
			$(".listPaymentPr").html(totalPr-inputPr);	//받을 금액

		}
		
	});

	$(document).off("click").on("click", ".functiontable tr td", function(){
		var click_key = $(this).text();
			console.log(click_key);

		if(click_key == "키설정" && $(".functiontable tr td").css("backgroundColor") == "rgba(0, 0, 0, 0)"){


			$(".functiontable tr td").css( "backgroundColor", "rgb(135, 206, 235)" );
			$(".igkey td").css( "backgroundColor", "rgba(0, 0, 0, 0)" );
			
			
			$(".functiontable tr td").on("click", function(){
				if($(this).text() != "키설정"){
						  
						  keyno = $(this).attr("id");
						  var modalLayer = $("#modalLayer");
						  var modalLink = $(".modalLink");
						  var modalCont = $(".modalContent");
						  var marginLeft = modalCont.outerWidth()/2;
						  var marginTop = modalCont.outerHeight()/2; 

						    modalLayer.fadeIn("fast");
						    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
						    $(this).blur();
						    $(".modalContent .md_search_data").focus(); 

						    
						  $(".close").on("click",function(){
						
						    modalLayer.fadeOut("fast");
						    modalLink.focus();
							return false;

						  });//키설정 모달창
				
				}

				$(".functiontable tr td").off("click");
				
			});	
					

		}else if(click_key == "키설정" && $(".functiontable tr td").css("backgroundColor") == "rgb(135, 206, 235)"){
			$(".functiontable tr td").css( "backgroundColor", "rgba(0, 0, 0, 0)" );

		}else if(click_key == "〈"){
			pageNum = 1;

			functionkey(pageNum);
		}else if(click_key == "〉"){
			pageNum = 2;

			functionkey(pageNum);
		}
		
		
		else if($(".functiontable tr td").css("backgroundColor") == "rgba(0, 0, 0, 0)"){
		barcode_no =  ($(this).attr("class")).substr(2,($(this).attr("class")).length);
		
		console.log("bar = "+barcode_no);

		appendMD(barcode_no);
		

		}
		
		
		
	
	});//단축키
	

	$(".md_search").on("click",function(){

		
		str ="";
		var md_name = $(".md_search_data").val();

		console.log("key_no="+keyno);

		$.getJSON("searchMD?md_name=" + md_name,
		
				function(data) {
			
			console.log(data);
			$(data).each(function() {
				str += "<a class ="+this.barcode_no+">" + this.md_name + "</a>";
			});

			$(".search_info").html(str);

		});//단축키 상품 검색 
		

		$(document).on("click", ".search_info a", function(){
			
			str ="";
			var md_name = $(this).text();
			var barcode_no = $(this).attr("class");
			var key_no =keyno;
			console.log(md_name);
			console.log(barcode_no);

				$.ajax({

					type : "post",
					url : "SelectsearchMD",
					contentType : "application/json;charset=utf-8",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						barcode_no : barcode_no,
						md_name : md_name,
						key_no : keyno
				
				
					}),

					success : function(data) {
					 
						$("#modalLayer").fadeOut("fast");
						$(".modalLink").focus();

						$("#"+key_no).text(md_name);
						$("#"+key_no).attr("class","fk"+barcode_no); 
					    


					},
					error : function(err) {

						alert("등록에 실패했습니다.");
					}


				});

				
				keyno="";
		 });//검색 후 출력된 상품 클릭 

	});
	
	
	
		
	

	
	 $(document).on("click", ".listtable tbody tr", function(){
	
		trid =  $(this).attr("id");
		
		eaid =  $("#"+trid+" .md_ea a").attr("id");
		trlength = parseInt($(".listtable tbody tr").length);
		var ignore = parseInt($("#"+trid).text())
		

		console.log("eaid ="+eaid);
		
		if($("#"+trid).css( "backgroundColor" ) == "rgb(46, 154, 254)"){
			
			$("#"+trid).css( "backgroundColor", "white" );
			$("#"+trid).css( "color", "black" );

			  $(".eaplus").off("click");
			  $(".numkey tr td").off("click");
				
			
		}else{	
			$("#"+trid).css( "backgroundColor", "rgb(46, 154, 254)" );
			$("#"+trid).css( "color", "white" );
			
		}
		for(i=1; i<cnt;i++){
			if(i!=ignore){
				$("#no"+i).css( "backgroundColor", "white" );	
				$("#no"+i).css( "color", "black" );

			}
		}
		
		
		
		
		tpid = $("#"+eaid+"xPrice").attr("id");
	 	eav = parseInt($("#"+eaid).text());
	 	tpv = parseInt($("#"+tpid).text());
	 	pr = tpv/eav;
	
	 	
		idname = "";
	  if($("#"+trid).css( "backgroundColor" ) == "rgb(46, 154, 254)"){
				
		$(".numkey tr td").on("click",function(){

			 var inputKey = "";
			 console.log($(this).text());

				if(isNaN( $(this).text())==false&&$(this).text()>0){
					 inputKey = $(this).text();
				

					 	$(".changeEA").on("click",function(){
						

					 	$("#"+eaid).text(inputKey);
					 	$("#"+tpid).text(inputKey*pr);

						//$(".numkey tr td").off("click");
					 });
				}
				

		});//수량변경
	
		
		$(".eaplus").off("click").on("click",function(){
			
		 	eav = parseInt($("#"+eaid).text());
			$("#"+eaid).text(eav+1);
		 	
			$("#"+tpid).text((eav+1)*pr);
	
			 console.log("trid = "+$("#"+trid).css( "backgroundColor"));

			  
		});//수량 증가 버튼
		
		
		$(".deletemd").on("click",function(){

			startnum = parseInt($("#"+trid).text())
			
			$("#"+trid).remove();
			
			for(i=startnum; i<cnt;i++){
					$("#cnt"+i).text(parseInt($("#cnt"+i).text())-1);
					
					$("#cnt"+i).attr("id","cnt"+(i-1)); 
					$("#no"+i).attr("id","no"+(i-1)); 
					$("#bar"+i).attr("id","bar"+(i-1)); 
					$("#ea"+i).attr("id","ea"+(i-1)); 
					$("#tdea"+i).attr("id","tdea"+(i-1)); 
					$("#ea"+i+"xPrice").attr("id","ea"+(i-1)+"xPrice"); 

		
			}
			cnt--;

			 
		});//삭제 버튼
	  
	  }//tr선택에만 이벤트 발생
	 	
		
		
	});// 리스트상품 선택 함수
	
	
				
	 
	 
	 $(document).on("click", ".paymentList", function(){

			var now = new Date();
			var year = now.getFullYear();
		    var month = now.getMonth() + 1; 
		    var date = now.getDate();  
			var sale_date = year+"-"+month+"-"+date;
					
		$(location).attr('href', 'posPaymentList?sale_date='+sale_date);//매출리스트로 이동


		
	 });//판매내역
	
	$("input[type=text]").on("focus",function(){
		 
		idname = $(this).attr("id");
		console.log(idname);	
		
	});//포커스 값 받아오기


$(document).on("click", ".numkey tr td", function(){
	 var inputKey = "";
	 
	if(isNaN( $(this).text())==false){
		 inputKey = $(this).text();
	}else if( $(this).text()=="천원"){
		inputKey = 1000;
	}else if( $(this).text()=="오천원"){
		inputKey = 5000;
	}else if( $(this).text()=="만원"){
		inputKey = 10000;
	}else if( $(this).text()=="취소"){
		inputKey = "취소";
	}
	
	if(idname != ""){
	 var txtArea = document.getElementById(""+idname+"");
		console.log(txtArea);	

	 
	 var txtValue = txtArea.value;
	 var selectPos = txtArea.selectionStart; // 커서 위치 지정
	 if( inputKey=="취소"){
			selectPos=selectPos-1;
			inputKey="";
	 }
	 var beforeTxt = txtValue.substring(0, selectPos);  // 기존텍스트 ~ 커서시작점 까지의 문자
	 var afterTxt = txtValue.substring(txtArea.selectionEnd, txtValue.length);   // 커서끝지점 ~ 기존텍스트 까지의 문자
	 var addTxt = inputKey; // 추가 입력 할 텍스트
	
	 
	 
	 txtArea.value = beforeTxt + addTxt + afterTxt;

	 selectPos = selectPos + addTxt.length;
	 txtArea.selectionStart = selectPos; // 커서 시작점을 추가 삽입된 텍스트 이후로 지정
	 txtArea.selectionEnd = selectPos; // 커서 끝지점을 추가 삽입된 텍스트 이후로 지정
	}

	
 });//가상키 입력


	$(document).on("click", ".payment td", function(){
		var paymentType = $(this).text();
		if(cnt>1){

			for(var i =1;i<cnt;i++){
					
			var barcode_no = $("#bar"+i+"").text();
			
			var md_ea = $("#ea"+i+"").text();
			
			$.ajax({

				type : "post",
				url : "Payment",
				contentType : "application/json;charset=utf-8",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					barcode_no : barcode_no,
					md_ea : md_ea,
					type : paymentType
				
				
				}),

				success : function(data) {
				

				},
				error : function(err) {

					alert("등록에 실패했습니다.");
				}
	   
	
			});

			
			
		}//for문 끝
			
		$.ajax({

			type : "post",
			url : "Auto_increment",
			contentType : "application/json;charset=utf-8",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				list_no : 1
			
			
			}),

			success : function(data) {
				$(location).attr('href', 'posPayment');

			},
			error : function(err) {

				alert("등록에 실패했습니다.");
			}
   

		});
		
	  }
		
	 });//결제
	
	
	
});