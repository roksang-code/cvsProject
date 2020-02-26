var str ="";
var cnt =1;

function orderList(member_no, type, detail_type, md_name) {
	
		
	$.getJSON("orderList?member_no="+member_no+"&&type="+type +"&&detail_type=" + detail_type+"&&md_name="+md_name,
			
			function (data) {
			
			console.log(data);
			str += "<table class='table table-bordered text-center'  id='detailtypetable' style='width: 100%; text-align: center;'>";
			str += "<thead class='thead-light'>";
			str += "<tr>";
			str += "<th width=10%>바코드번호</th>";
			str += "<th width=10%>사진</th>";
			str += "<th width=10%>상품타입</th>";
			str += "<th width=10%>제조사</th>";
			str += "<th width=10%>상품명</th>";
			str += "<th width=10%>원가</th>";
			str += "<th width=10%>정가</th>";
			str += "<th width=10%>유통기한</th>";
			str += "<th width=10%>예정 수량</th>";
			str += "<th width=10%>발주 수량</th>";
			str += "</tr>";
		 	cnt =1;

			
			$(data).each(function() {
				console.log("order = "+this.order_ea);

				str += "<tr id='detail"+cnt+"'>";
				str += "<td id='barcode_no"+cnt+"'>" + this.barcode_no + "</td>";
				str += "<td><img style='width: 100px; height: 100px;' src='"+ this.md_img + "'/></td>";
				str += "<td>" + this.detail_type + "</td>";
				str += "<td>" + this.company + "</td>";
				str += "<td>" + this.md_name + "</td>";
				str += "<td>" + this.cost + "</td>";
				str += "<td>" + this.price + "</td>";
				str += "<td>" + this.shelf_life + "</td>";
				str += "<td id=approval_ea"+cnt+" >" +this.approval_ea+"</td>";
				str += "<td> <input type='text' value="+this.order_ea+" id=order_ea"+cnt+" size='7px'></td>";
				str += "<input id='hidden_ea"+cnt+"' type='hidden' value="+this.order_ea+">";
				str += "</tr>";

				cnt++;
			});
			str += "</thead>";
			str += "</table>";
			
			$("#detailtypetable").html(str);
			str = "";
		});
	
	
	
	
}

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
			var md_name = $("#mdname").val();

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