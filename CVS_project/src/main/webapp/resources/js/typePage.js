var str ="";
var cnt =1;
var type= $("#hidden_type").val();
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
		
		
		$(data).each(function() {

			str += "<tr id='detail"+cnt+"'>";
			str += "<td>" + this.barcode_no + "</td>";
			str += "<td>" + this.detail_type + "</td>";
			str += "<td>" + this.company + "</td>";
			str += "<td>" + this.md_name + "</td>";
			str += "<td>" + this.shelf_life + "</td>";
			str += "<td> <input type='text' id=order_ea"+cnt+" size='7px'></td>";
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
	
	 $(".custom-select").on("change",function(){
		 	alert(type);
		 	console.log("type = "+type);
		 	
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();
			
			orderList(type, detail_type, md_name);
		});
		
	 $(document).on("click", "#button-addon2" ,function(){


		 	
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();

			orderList(type, detail_type, md_name);

			
		});
	
});