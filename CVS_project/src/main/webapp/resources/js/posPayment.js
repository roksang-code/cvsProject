var keyno="";

$(document).ready(function() {

	
	
	$(".mainpage").on("click", function() {
		$(location).attr('href', "../login/mainPage");//로그아웃 컨트롤러
	});
	
	$("#md_update").on("click", function() {
	  barcode_no = $("#barcode_no").val();

	  
	  appendMD(barcode_no);
	  
	});//바코드 입력으로 상품 등록
	
	
	
	$(".listInputPr").on("keyup", function() {
		
		var inputPr = parseInt($(this).val());
		
		if($(".listInputPr").val()==""){
			inputPr = 0;
		}
		console.log("inputPr = "+inputPr);
		var totalPr = parseInt($(".listTotalPr").text());	//합계
		var salePr = parseInt($(".listSalePr").text());		//할인
		
		if(inputPr>= totalPr-salePr){	//받은금액 > 받을금액
			$(".listOutputPr").text(inputPr-parseInt($(".listPaymentPr").text()));	//거스름돈 - 합계
			
			$(".listPaymentPr").text(0);	//받을 금액

		}else if(totalPr-salePr > inputPr){	//받은금액 < 받을금액
			$(".listOutputPr").text(0);	//거스름돈 = 받은돈 - 합계
			if(isNaN(inputPr)==false)
			$(".listPaymentPr").text((totalPr-salePr)-inputPr);	//받을 금액

		}
	
		
	});
			
		$(document).off("click").on("click", ".functiontable tr td", function(){
			if($(this).text() != "키설정" && $(this).text() != "〈" && $(this).text() != "〉" && $(".functiontable tr td").css("backgroundColor") == "rgb(135, 206, 235)"){

					  keyno = $(this).attr("id");
					  var modalLayer = $("#modalLayer");
					  var modalCont = $(".modalContent");
					  var marginLeft = modalCont.outerWidth()/2;
					  var marginTop = modalCont.outerHeight()/2; 

					    modalLayer.fadeIn("fast");
					    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
					    $(this).blur();
					    $(".modalContent .md_search_data").focus(); 

					    
					  $(".close").on("click",function(){
					
					    modalLayer.fadeOut("fast");
						$(".search_info").html("");
						$(".md_search_data").val("");
						return false;

					  });//키설정 모달창
			
			}

			
		});	
	
	$(document).on("click", ".functiontable tr td", function(){
		var click_key = $(this).text();
			console.log(click_key);

		if(click_key == "키설정" && $(".functiontable tr td").css("backgroundColor") == "rgba(0, 0, 0, 0)"){
			click_key="";

			$(".functiontable tr td").css( "backgroundColor", "rgb(135, 206, 235)" );
			$(".igkey td").css( "backgroundColor", "rgba(0, 0, 0, 0)" );
			
			
			


		}else if(click_key == "키설정" && $(".functiontable tr td").css("backgroundColor") == "rgb(135, 206, 235)"){
			console.log("click_key = "+click_key);

			click_key="";
			$(".functiontable tr td").css( "backgroundColor", "rgba(0, 0, 0, 0)" );
			$("#modalLayer").fadeOut("fast");
			$(".modalLink").focus();
			$(".search_info").html("");
			$(".md_search_data").val("");
			
			$(".functiontable tr td").off("click");

		}else if(click_key == "〈"){
			pageNum = 1;
			color = $(".functiontable tr td").css("backgroundColor");
			$("#modalLayer").fadeOut("fast");
			$(".modalLink").focus();
			$(".search_info").html("");
			$(".md_search_data").val("");
			
			functionkey(pageNum, color);
		}else if(click_key == "〉"){
			pageNum = 2;
			color = $(".functiontable tr td").css("backgroundColor");
			$("#modalLayer").fadeOut("fast");
			$(".modalLink").focus();
			$(".search_info").html("");
			$(".md_search_data").val("");
			
			functionkey(pageNum, color);
		}
		
		
		else if($(".functiontable tr td").css("backgroundColor") == "rgba(0, 0, 0, 0)"){
		barcode_no =  ($(this).attr("class")).substr(2,($(this).attr("class")).length);
	    var pm_info_list = new Array();

		console.log("bar = "+barcode_no);
			
		appendMD(barcode_no);//단축키로 상품등록
	
		
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
				str += "<a class ="+this.barcode_no+">" + this.md_name + "</a></br>";
			});
				
			$(".search_info").html(str);

		});//단축키 상품 검색 
		

		$(document).on("click", ".search_info a", function(){
			
			str ="";
			var md_name = $(this).text();
			var barcode_no = $(this).attr("class");
			var key_no =keyno;
			
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
						$(".search_info").html("");
						$(".md_search_data").val("");



					},
					error : function(err) {

						alert("등록에 실패했습니다.");
					}


				});

				
		 });//검색 후 출력된 상품 클릭 

	});
	
	
	
		
	

	
	 $(document).on("click", ".listtable tbody tr", function(){
		trid="";
		trid =  $(this).attr("id");
		eaid =  $("#"+trid+" .md_ea a").attr("id");

		trlength = parseInt($(".listtable tbody tr").length);
		
		var tr_no =parseInt($("#"+trid).find(".cnt").text());//리스트번호
        var tr_bar = $("#"+trid).find("#bar"+tr_no).text(); //바코드 번호
		var tr_ea =parseInt($("#"+trid).find(".md_ea").text());//리스트번호
		var tr_pr =parseInt($("#"+trid).find(".price").text());//상품 정가


		
		if($("#"+trid).css( "backgroundColor" ) == "rgb(46, 154, 254)"){
			
			$("#"+trid).css( "backgroundColor", "white" );
			$("#"+trid).css( "color", "black" );

			  $(".eaplus").off("click");
			  $(".numkey tr td").off("click");
			trid="";

			
		}else{	
			$("#"+trid).css( "backgroundColor", "rgb(46, 154, 254)" );
			$("#"+trid).css( "color", "white" );
			var ignore = parseInt($("#"+trid).text())


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
		if(trid!="" && $("#"+trid).css( "backgroundColor" ) == "rgb(46, 154, 254)" ){
				
			$(".numkey tr td").off("click").on("click",function(){

				var inputKey = "";
					console.log($(this).text());			
					if(isNaN( $(this).text())==false&&$(this).text()>0){
						inputKey = $(this).text();


							$(".changeEA").off("click").on("click",function(){
								 var list_no = pm_info_list.findIndex(pm_info_list => pm_info_list.barcode_no == tr_bar);

										
				                   var add_list =pm_info_list[list_no];
				                   var re_pm_info_list = new Array();
				                    

								$("#"+eaid).text(inputKey);
								$("#"+trid).find(".price").text(pm_info_list[list_no].price*inputKey);
								$("#"+trid).find(".a_trtotal_price").text(pm_info_list[list_no].price*inputKey);
								
								
								pm_info_list = pm_info_list.filter(pm_info_list => pm_info_list.barcode_no != tr_bar);
			                 
								for(var i =0;i<inputKey;i++){
									console.log("add_list =");
									console.log(add_list);

									pm_info_list.splice(list_no, 0, add_list);
			                    }

			                    console.log("list_no = ");	
								console.log(pm_info_list);	
									
								appendMD_sale(pm_info_list, 1);//상품할인 적용
							
								appendMD_total_pay();
								console.log("trid ="+trid);

							});
					}
				

			});//수량변경
	
		
		$(".eaplus").off("click").on("click",function(){
			
			barcode_no = tr_bar;
			appendMD(barcode_no);//단축키로 상품등록

			  
		});//수량 증가 버튼
		
		
		$(".deletemd").off("click").on("click",function(){
			if(trid!=""){
		
			startnum = parseInt($("#"+trid).text())
			
			
				$("#"+trid).remove();
			pm_info_list = pm_info_list.filter(pm_info_list => pm_info_list.barcode_no != tr_bar);
				

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
            console.log("pm_info_list = ");
            console.log(pm_info_list);

			appendMD_sale(pm_info_list, 1);//상품할인 적용

			}
			trid="";

		});//삭제 버튼
	    
	  }//tr선택에만 이벤트 발생
	 	
		

	});// 리스트상품 선택 함수
	 
	 $(document).on("click", ".point_save", function(){
			
		 	var now = new Date();
			var year = now.getFullYear();
		    var month = now.getMonth() + 1; 
		    var date = now.getDate();  
			var sale_date = year+"-"+month+"-"+date;
			
		
	 });//포인트 적립
	 
	 $(document).on("click", "#tel_discount", function(){
		 
		 if($(this).text() == "통신사 할인"){
		  var modalLayer = $("#tel_dis_modal");
		  var modalCont = $(".tel_modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 

		    modalLayer.fadeIn("fast");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".tel_modalContent .tel_membership_no_data").focus(); 

		    
		  $(".close").on("click",function(){
		
		    modalLayer.fadeOut("fast");
		  $(".tel_membership_no_data").val("");
		  $(".tel_membership_info").html("");
			
		  	return false;

		  });//통신사 할인 모달창
		 }else{
			  tel_grade="";
		      tel_sale=0;
			  $("#tel_discount").text("통신사 할인");
			  appendMD_total_pay();

		 }
		
			
	 });//통신사 할인
	 $(".tel_search").on("click",function(){

			
			str ="";
			var phone_no = $(".tel_membership_no_data").val();
			var tel_company = $(".tel_com").val();


			$.getJSON("searchTEL?phone_no=" + phone_no+"&&tel_company="+tel_company,
			
			function(data) {
				
				console.log(data);
				$(data).each(function() {
					str += "<a>" + this.user_name +" - " + this.tel_grade+ "</a></br>";
					tel_grade = this.tel_grade;
			
				});

				$(".tel_membership_info").html(str);
		          console.log("tel_grade = "+tel_grade);

			});//통신사 번호 조회 
			
				$(document).on("click", ".tel_membership_info a", function(){
					  
					  $("#tel_dis_modal").fadeOut("fast");
					  $(".tel_membership_info").html("");
					  $(".tel_membership_no_data").val("");
			          console.log("tel_grade = "+tel_grade);

					  
					  if(tel_grade == "gold"){
						  tel_sale = 0.1;
					  }else if(tel_grade == "silver"){
						  tel_sale = 0.05;
					  }
					  
					  appendMD_sale(pm_info_list, 1);
					  
					  $("#tel_discount").text("할인 취소");
					
				});// 조회 내역 클릭 
	 
	 });//통신사 할인 조회 클릭 		
	 
	 
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
	
		console.log(paymentType);
		if(cnt>1){

			for(var i =1;i<cnt;i++){
					
			var barcode_no = $("#bar"+i+"").text();
			
			var md_ea = $("#ea"+i+"").text();
			var sale_price = $("#no"+i).find(".sale").text();
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
					pos_no : 1,
					barcode_no : barcode_no,
					md_ea : md_ea,
					sale_price : sale_price,
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