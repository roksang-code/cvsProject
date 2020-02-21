var str ="";
var cnt =1;
var check_member_no =0;

$(document).off("click").on("click", ".approval_list_tr", function(){
		
	var list_member_no = $(this).find(".list_member_no").text(); 
		function app_d_list(list_member_no) {
			
			$.getJSON("approval_detail_list?member_no="+list_member_no,
					
					function(data) {
						console.log(data);
						
						str="";
									
						str += "<table class='table table-bordered' id='approval_detail_list_table'>";						
						str += "<thead class='thead-light'>";
						str += "<tr>";
						str += "<th>바코드번호</th>";
						str += "<th>상품명</th>";
						str += "<th>원가</th>";
						str += "<th>정가</th>";
						str += "<th>수량</th>";			
						str += "<th>발주승인</th>";				
						str += "</tr>";
						str += "</thead>";
						
						$(data).each(function(index) {

							str += "<tr class='app_d_list_tr' id='app_d_list_tr"+(index+1)+"'>";
							str += "<td class='bar'>" + this.barcode_no + "</td>";
							str += "<td>" + this.md_name + "</td>";
							str += "<td>" + this.total_cost + "</td>";
							str += "<td>" + this.total_price + "</td>";
							str += "<td>" + this.order_ea + "</td>";
							str += "<td><button id='"+this.barcode_no+"' class='btn btn-light'>승인</button></td>";
							str += "<input id='hidden_no"+this.barcode_no+"' type='hidden' value="+list_member_no+">";
							str += "</tr>";
							
						});
						str += "</table>";

						$("#approval_detail_list_table").html(str);

					});
		}
		app_d_list(list_member_no);
		
		
});

$(document).on("click", ".approval_list_tr td button", function(){
	
	check_member_no = $(this).attr("id");

	$.ajax({

		type : "post",
		url : "order_approval_check",
		contentType : "application/json;charset=utf-8",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : "text",
		data : JSON.stringify({

			member_no : check_member_no
			
		
		}),

		success : function(data) {
			approval_list();
		},
		error : function(err) {

			alert("등록에 실패했습니다.");
		}
	});

});


$(document).on("click", ".app_d_list_tr td button", function(){
	
	var check_barcode_no = $(this).attr("id");
	check_member_no = $("#hidden_no"+check_barcode_no).val();


	$.ajax({

		type : "post",
		url : "order_approval_check",
		contentType : "application/json;charset=utf-8",
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : "int",
		data : JSON.stringify({
			barcode_no : check_barcode_no,
			member_no : check_member_no
			
		
		}),

		success : function(data) {
			app_d_list(check_member_no)
		},
		error : function(err) {

			alert("등록에 실패했습니다.");
		}


	});
});





$(document).ready(function() {
	
	$(document).on("change", ".custom-select", function(){


		
		var type= $("#hidden_type").val();
		var detail_type = $(".custom-select").val();
		var md_name = $(".form-control").val();
	 	console.log("type = "+type);
		
		orderList(member_no, type, detail_type, md_name);
	});
		
	 $("#mdsearch").on("click",function(){


			
			var type= $("#hidden_type").val();
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();

		 	console.log("type = "+type);

			orderList(member_no, type, detail_type, md_name);

			
		});
	 
	 $(document).on("click", "#order_button", function(){ //발주

		 if(cnt>1){

				for(var i =1;i<cnt;i++){		
				var barcode_no = $("#barcode_no"+i).text();
				var order_ea = $("#order_ea"+i+"").val();
				var count = $("#hidden_ea"+i).val();

				console.log("barcode_no = "+barcode_no);
				console.log("order_ea = "+order_ea);
				console.log("count = "+count);

				$.ajax({

					type : "post",
					url : "MDorder",
					contentType : "application/json;charset=utf-8",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						
						member_no : member_no,
						barcode_no : barcode_no,
						order_ea : order_ea,
						count : count,			
					}),

					success : function(data) {
					

					},
					error : function(err) {

						alert("등록에 실패했습니다.");
					}
		   
		
				});

				
				
			}//for문 끝
		 }
		
	 });
	
});