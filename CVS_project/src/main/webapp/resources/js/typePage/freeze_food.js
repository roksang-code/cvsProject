var str ="";
var cnt =1;

function orderList(type, detail_type, md_name) {
	
	
	$.getJSON("orderList?type="+type +"&&detail_type=" + detail_type+"&&md_name="+md_name,
	
	function (data) {
		
		console.log(data);
		str += "<table border='1' id='detailtypetable'>";
		str += "<tr>";
		str += "<th width=30%>바코드번호</th>";
		str +=	"<th width=15%>상품타입</th>";
		str +=	"<th width=15%>제조사</th>";
		str +=	"<th width=15%>상품명</th>";
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
			str += "<td> <input type='text' id=order_ea"+cnt+"></td>";
			str += "</tr>";

			cnt++;
		});
		str += "</table>";
		
		$("#detailtypetable").html(str);
		str = "";
	});
}

$(document).ready(function() {

	 $(".custom-select").on("change",function(){

		 	var type = "냉동식품";
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();
			
			orderList(type, detail_type, md_name);
		});
		
	 $("#button-addon2").on("click",function(){


		 	var type = "냉동식품";
			var detail_type = $(".custom-select").val();
			var md_name = $(".form-control").val();

			orderList(type, detail_type, md_name);

			
		});
	
});