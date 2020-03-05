var trid ="";
var list_no = 0;
var sale_date = $("#paymentdate").val();
function detailreset() {
	console.log("reset");
	str="";
	str += "<table border='1' class='detaillisttable' style='table-layout: fixed'>";						
	str += "<tr>";
	str += "<th width=50%>상품명</th>";
	str += "<th width=10%>수량</th>";
	str += "<th width=10%>금액</th>";
	str += "<th width=10%>할인</th>";
	str += "</tr>";							
	$(".detaillisttable").html(str);
	str="";
}



$(document).ready(function() {

	$(".pospage").on("click", function(){

		$(location).attr('href', 'posPayment');
	});
	
			$("#paymentdate").val(
					$.datepicker.formatDate('yy-mm-dd', new Date()));

			$("#paymentdate").datepicker(
					{
						changeMonth : true,
						changeYear : true,
						nextText : '다음 달',
						prevText : '이전 달',
						dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
								'토요일' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dateFormat : "yy-mm-dd",
						maxDate : 0 // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
					
												

					}).on("change",function(){
						
						
						
				var str = "";
				$(".detaillist").html(str);
				
				
				getPaymentList();

		
		});
			$(document).off("click").on("click", ".mainlisttable tr", function(){
				
				trid =  $(this).attr("id");
				
				list_no =  $("#"+trid+" .list_no").text();
				trlength = parseInt($(".mainlisttable tr").length);
				

				console.log("list_no ="+list_no);
				
				if($("#"+trid).css( "background-color" ) == "rgb(46, 154, 254)"){
					$("#"+trid).css( "background-color", "white" );
					$("#"+trid).css( "color", "black" );

					
					detailreset();
					
					
					
					
					
				}else{	
					$("#"+trid).css( "background-color", "rgb(46, 154, 254)" );
					$("#"+trid).css( "color", "white" );
					
				}
				for(i=1; i<trlength;i++){
					if("no"+i!=trid){
						$("#no"+i).css( "background-color", "white" );	
						$("#no"+i).css( "color", "black" );

					}
				}
				
				$(document).off("click", ".refund").on("click", ".refund", function(){
					if($("#"+trid).css( "background-color" ) == "rgb(46, 154, 254)"){

					$.ajax({

						type : "DELETE",
						url : "refund/"+list_no,
					
						success : function() {
							getPaymentList();
						
							detailreset();

						},
						error : function(err) {

							alert("등록에 실패했습니다.");
						}
			   

					});
					

					}
					
				});//refund 버튼 클릭 시
				
				
			
			list_no = $(this).children(".list_no").text();
			var str = "";
			console.log(list_no);
			
			
			
			function getDetail(){
				
				$.getJSON("DetailPaymentList?member_no="+member_no+"&list_no=" + list_no,
						function(data) {
							console.log(data);
							
							
							str += "<table border='1' class='detaillisttable' style='table-layout: fixed'>";						
							str += "<tr>";
							str += "<th width=50%>상품명</th>";
							str += "<th width=10%>수량</th>";
							str += "<th width=10%>금액</th>";
							str += "<th width=10%>할인</th>";
							str += "<th width=10%>합계</th>";
							str += "</tr>";
							
							$(data).each(function() {

								str += "<tr class='detaillist'>";
								str += "<td>" + this.md_name + "</td>";
								str += "<td>" + this.md_ea + "</td>";
								str += "<td>" + this.price + "</td>";
								str += "<td>" + this.sale_price + "</td>";
								str += "<td>" + (this.price-this.sale_price) + "</td>";								
								str += "</tr>";

							});
							str += "</table>";

							$(".detaillisttable").html(str);

						});
			}
			if($("#"+trid).css( "background-color" ) == "rgb(46, 154, 254)"){
			getDetail();
			}
			$(".mainlisttable tr").off("click");
			
		});// 디테일 리스트
		
			
			function getPaymentList(){
				str ="";
				sale_date = $("#paymentdate").val();
				$.getJSON("selectPaymentList?member_no="+member_no+"&sale_date=" + sale_date,
						
						function(data) {
					str += "<table border='1' class='mainlisttable'>";
					str += "<tr>";
					str += "<th>거래번호</th>";
					str += "<th>거래시간</th>";
					str += "<th>상품수</th>";
					str += "<th>결제타입</th>";
					str += "<th>매출</th>";
					str += "</tr>";
					console.log(data);
					var i =1;
					$(data).each(function() {
						
						str += "<tr id = no"+i+" class='mainlist'>";
						str += "<td class = 'list_no' id = list_no"+i+">" + this.list_no + "</td>";
						str += "<td>" + this.sale_time + "</td>";
						str += "<td>" + this.list_md_ea + "</td>";
						str += "<td>" + this.type + "</td>";
						str += "<td>" + this.total_price + "</td>";
						str += "</tr>";
						i++;
					});
					str += "</table>";

					$(".mainlisttable").html(str);

			
				
				
				});//매출 확인 날짜 선택 
				
			}
			
	
});
