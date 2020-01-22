$(document).ready(function() {
			
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
						
						
						
				var sale_date = $("#paymentdate").val();
				var str = "";
				$(".detaillist").html(str);

				$.getJSON("selectPaymentList?sale_date=" + sale_date,
						
						function(data) {
					str += "<table border='1' class='mainlisttable'>";
					str += "<tr>";
					str += "<th>거래번호</th>";
					str += "<th>거래시간</th>";
					str += "<th>상품수</th>";
					str += "<th>매출</th>";
					str += "</tr>";
					console.log(data);

					$(data).each(function() {

						str += "<tr class='mainlist'>";
						str += "<td class = 'list_no'>" + this.list_no + "</td>";
						str += "<td>" + this.sale_time + "</td>";
						str += "<td>" + this.list_md_ea + "</td>";
						str += "<td>" + this.total_price + "</td>";
						str += "</tr>";
				
					});
					str += "</table>";

					$(".mainlisttable").html(str);

			
				
				
				});//매출 확인 날짜 선택 
				
				
				$(".mainlisttable tr").on("click",function() {
			
					var list_no = $(this).children(".list_no").text();
					var str = "";
					alert(list_no);
					console.log(list_no);
					
					$.getJSON("DetailPaymentList?list_no=" + list_no,
							function(data) {
								console.log(data);
								
								
								str += "<table border='1' class='detaillisttable'>";						
								str += "<tr>";
								str += "<th>상품명</th>";
								str += "<th>수량</th>";
								str += "<th>금액</th>";
								str += "<th>할인</th>";
								str += "</tr>";
								
								$(data).each(function() {

									str += "<tr class='detaillist'>";
									str += "<td>" + this.md_name + "</td>";
									str += "<td>" + this.md_ea + "</td>";
									str += "<td>" + this.price + "</td>";
									str += "<td>" + this.price + "</td>";
									str += "</tr>";

								});
								str += "</table>";

								$(".detaillisttable").html(str);

							});

				});// 디테일 리스트

		
		});
			$(document).on("click", ".mainlisttable tr", function(){
	
			
			
			var list_no = $(this).children(".list_no").text();
			var str = "";
			console.log(list_no);
			
			$.getJSON("DetailPaymentList?list_no=" + list_no,
					function(data) {
						console.log(data);
						
						
						str += "<table border='1' class='detaillisttable'>";						
						str += "<tr>";
						str += "<th>상품명</th>";
						str += "<th>수량</th>";
						str += "<th>금액</th>";
						str += "<th>할인</th>";
						str += "</tr>";
						
						$(data).each(function() {

							str += "<tr class='detaillist'>";
							str += "<td>" + this.md_name + "</td>";
							str += "<td>" + this.md_ea + "</td>";
							str += "<td>" + this.price + "</td>";
							str += "<td>" + this.price + "</td>";
							str += "</tr>";

						});
						str += "</table>";

						$(".detaillisttable").html(str);

					});

		});// 디테일 리스트
		
		

});
