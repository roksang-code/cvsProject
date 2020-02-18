var str ="";
var cnt =1;

function orderList(type, detail_type, md_name) {
	
	
	$.getJSON("orderList?type="+type +"&&detail_type=" + detail_type+"&&md_name="+md_name,
	
	function (data) {
		
		console.log(data);
		str += "<table  class='table table-bordered'  id='detailtypetable' style='width: 100%;'>";
		str += "<thead class='thead-light'>";
		str += "<tr>";
		str += "<th width=25%>바코드번호</th>";
		str +=	"<th width=15%>상품타입</th>";
		str +=	"<th width=15%>제조사</th>";
		str +=	"<th width=20%>상품명</th>";
		str +=	"<th width=15%>유통기한</th>";
		str +=	"<th width=10%>발주 수량</th>";
		str += "</tr>";
	 	cnt =1;

		
		$(data).each(function() {
			console.log("order = "+this.order_ea);

			str += "<tr id='detail"+cnt+"'>";
			str += "<td id='barcode_no"+cnt+"'>" + this.barcode_no + "</td>";
			str += "<td>" + this.detail_type + "</td>";
			str += "<td>" + this.company + "</td>";
			str += "<td>" + this.md_name + "</td>";
			str += "<td>" + this.shelf_life + "</td>";
			str += "<td> <input type='text' value="+this.order_ea+" id=order_ea"+cnt+" size='7px'></td>";
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
		
		orderList(type, detail_type, md_name);
	});
		
	 $("#mdsearch").on("click",function(){

			var type= $("#hidden_type").val();
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();

		 	console.log("type = "+type);

			orderList(type, detail_type, md_name);

			
		});
	 
	 $(document).on("click", "#order_button", function(){
		 
		 if(cnt>1){

				for(var i =1;i<cnt;i++){
						
				var barcode_no = $("#barcode_no"+i).text();
				var order_ea = $("#order_ea"+i+"").val();
				console.log("barcode_no = "+barcode_no);
				console.log("order_ea = "+order_ea);
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
						barcode_no : barcode_no,
						order_ea : order_ea,
										
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