<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/posPayment.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript"
	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>
<script
	src="../resources/js/posPayment.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<header>
		<a id="membername">${login.member_name}님 환영합니다.</a>
		<button class="logout">로그아웃</button>
	</header>
	<div>
		<div class="middle">
			<div class="mdlist">
				<table class="listtable" border="1" width=750px>
					<!-- 상품리스트 -->
					<thead>
						<tr class="thead-dark">
							<td width=2%>NO</td>
							<!-- 번호 -->
							<td width=15%>바코드</td>
							<!-- 바코드 -->
							<td width=30%>상품명</td>
							<!-- 상품명 -->
							<td width=5%>판매가</td>
							<!-- 가격 -->
							<td width=4%>수량</td>
							<!-- 수량 -->
							<td width=5%>할인</td>
							<!-- 할인 -->
							<td width=7%>합계</td>
							<!-- 합계 -->
						</tr>
					</thead>
					<tbody>


					</tbody>
				</table>
				<div class="listbutton">
					<button class="eaplus">수량</button>
					</br>
					<button class="deletemd">삭제</button>
					</br>
				</div>
			</div>


			<div class="input">
				<input type="text" name="barcode_no" id="barcode_no"
					class="barcode_no">
				<button id=md_update>상품등록</button>
			</div>
		</div>

		<div id="modalLayer">	<!-- 단축키 검색 모달창 -->
			<div class="modalContent">
				<div>
					<input type="text" class="md_search_data"><input
						type="submit" value="검색" class="md_search">
				</div>
				<div class="search_info"></div>
				
				<div class="modalclose"><button type="button" class="close">X</button></div>
			</div>
		</div>

		
		<div id="point_save_modal">	<!-- 포인트 적립 모달창 -->
			<div class="save_modalContent">
				<div>
					<input type="text" class="point_save_data"><input
						type="submit" value="조회" class="member_no_search">
				</div>
				<div class="member_no_info"></div>
				<div class="modalclose">
					<button type="button" class="close">X</button>
				</div>
			</div>
		</div>
		
		<div id="tel_dis_modal">	<!-- 통신사 할인 모달창 -->
			<div class="tel_modalContent">
				<div>
					<select class="tel_com" name="tel_com">
					   	<option value="">통신사</option>
					   	<option value="SKT">SKT</option>
					   	<option value="KT">KT</option>
					   	<option value="LG">LG</option>
					</select>
					<input type="text" class="tel_membership_no_data"><input
						type="submit" value="조회" class="tel_search">
				</div>
				<div class="tel_membership_info"></div>
				
				<div class="modalclose">
					<button type="button" class="close">X</button>
				</div>
			</div>
		</div>
				
		
		<div class="bottom">
			<div class="functionkey">

				<!-- 간편키 -->
				<table class="functiontable" border="1" width=250px>
					
					<c:forEach var="Functionkey_infoVO" items="${functionkeyList}" varStatus="no">
						
						<c:if test="${no.index%4 == 0 && no.index!=0}">
							</tr>
						</c:if>
						<c:if test="${no.index%4 == 0 || no.index==0}">
							<tr>
						</c:if>
	
							   <td width=25% id="${Functionkey_infoVO.key_no}"	class="fk${Functionkey_infoVO.barcode_no}">${Functionkey_infoVO.md_name}</td>
	
						<c:if test="${no.index == 15}">
							</tr>
						</c:if>
					
					</c:forEach>
										
					<tr class="igkey">
						<td class="leftbutton">〈</td>
						<td class="rightbutton">〉</td>
						<td colspan="2">키설정</td>

					</tr>
				</table>

			</div>

			<div class="printprice">
				<!-- 가격출력창 -->
				<table border="1">
					<tr>
						<td width=30%>합계</td>
						<td width=70% class="prnum"><a class="listTotalPr">0</a></td>
					</tr>
					<tr>
						<td>할인금액</td>
						<td class="prnum"><a class="listSalePr">0</a></td>
					</tr>
					<tr>
						<td>받을금액</td>
						<td class="prnum"><a class="listPaymentPr">0</a></td>
					</tr>
					<tr>
						<td>받은금액</td>
						<td class="prnum"><input type="text" class="listInputPr"
							id="listInputPr" size="20px"></td>
					</tr>
					<tr>
						<td>거스름돈</td>
						<td class="prnum"><a class="listOutputPr">0</a></td>
					</tr>
				</table>
				<input type="hidden" id ="ignore_sale">
			</div>


			<div class="numbotton">
				<!-- 숫자 및 결제버튼 -->
				<table border="1" class="numkey">
					<tr>
						<td class="num">7</td>
						<td class="num">8</td>
						<td class="num">9</td>
						<td class="numright">전체선택</td>
					</tr>
					<tr>
						<td class="num">4</td>
						<td class="num">5</td>
						<td class="num">6</td>
						<td class="numright" id="point_save">포인트 적립</td>
					</tr>
					<tr>
						<td class="num">1</td>
						<td class="num">2</td>
						<td class="num">3</td>
						<td class="numright" id="tel_discount">통신사 할인</td>
					</tr>
					<tr>
						<td class="num">0</td>
						<td class="num">00</td>
						<td>취소</td>
						<td class="changeEA">수량변경</td>
					</tr>
					<tr>
						<td>천원</td>
						<td>오천원</td>
						<td>만원</td>
						<td class="paymentList">판매내역</td>
					</tr>
					<tr class="payment">
						<td colspan="2">현금</td>
						<td colspan="2">카드</td>
					</tr>


				</table>
				<a class="keyview"></a>
			</div>
		</div>
	</div>

			
		<script type="text/javascript">
		      var cnt = 1; //리스트 등록 카운트
		      var ea = 1; //첫 등록제품 수
		      var sale = 0; //할인
		      var bar = 0; //바코드번호 초기화
		      var price = 0; //가격 초기화
		      var ead = 0; //같은 상품 1개 증가
		      var totalpr = 0; //가격 *수량
		      var totalsale = 0;
		      var eaid = ""; //수량 id
		      var tpid = ""; //합계 id
		      var eav = ""; //수량 값
		      var tpv = ""; //합계 값
		      var barcode_no = "";
		      var key_no = "";
		      var pageNum ="";
		      var trid="";
		      var prea=0;
		      var prc="";
		      var minus_sale=0;
		      var ea_price = 0;
		      var pm_info_list = new Array();
		      var pr_info_list = new Array();		      
		      var parent = new Array();
		      var children = new Array();
		      var pr_no_list = new Array();
			  
		      var idname="";
		      var ignore_sale=0;
		      var tel_sale=1;
		     
              var to_pr_no_length =1;

		      
		      function appendMD(barcode_no) {//상품등록
		            var str = "";
		            var ealist = new Array();
		
		            $.getJSON("posList?barcode_no=" + barcode_no, function(data) {
		                        console.log(data);
		               
		                        
		                        
		                  $(data).each(function() {
		                           bar = $("." + barcode_no+ "").text();
		                           pm_info_list.push({barcode_no : this.barcode_no, price : this.price, promotion_no : this.promotion_no, pr_type : this.pr_type,pr_ea : this.pr_ea, pr_price : this.pr_price, pr_family : this.pr_family});
		                           pr_info_list.push(this.promotion_no);
		                         
		                           
		                           
		                        if (bar == barcode_no) { //바코드번호가 같을 때
		                         
		                              ead = parseInt($("."+ barcode_no+ "ea").text()) + 1; //수량 +1
		                              
		                              	 $("."+ barcode_no + "pr").text(this.price*ead)
		                                 $("."+ barcode_no + "ea").text(ead);//수량
		                                 $("#"+ barcode_no + "total").text(parseInt($("#"+ barcode_no + "total").text())+this.price);//합계
		                              
		                               
		                              
		                        }else {   //바코드번호가 다를 때
		
		                           
		                                 str += "<tr id='no"+cnt+"'>";
		                                 str += "<td id=cnt"+cnt+" class = cnt> "+ cnt + "</td>";
		                                 str += "<td> <a id=bar"+cnt+" class='"+this.barcode_no+"'>"+ this.barcode_no+ "</a></td>";
		                                 str += "<td> <a class="+this.md_name+">"+ this.md_name+"</a>";
		                              if(this.pr_subject != null && this.pr_content != null){
		                                    str += "<label style='color: red'>"+"&nbsp;&nbsp;"+this.pr_subject+"&nbsp;&nbsp;<a class='pr_no' id='pr_no"+(this.promotion_no)+"'>"+this.pr_content+"</a></label>";
		                                 }
		                                 str += "</td>";
		                                 str += "<td class='price'> <a class="+this.barcode_no+"pr>"+ this.price+ "</a></td>";
		                                 str += "<td class='md_ea' id=tdea"+cnt+"> <a id=ea"+cnt+" class="+this.barcode_no+"ea>"+ ea+ "</a></td>";
		                                 str += "<td> <a id="+this.barcode_no+"sale class='sale'>"+sale+"</a></td>";
		                                 str += "<td id=ea"+cnt+"xPrice class='trtotal_price'> <a id='"+this.barcode_no+"total' class ='a_trtotal_price'>"+ (this.price*ea-sale) +"</a></td>";
		                                 str += "<input id="+this.promotion_no+"hidden class='salehidden' type='hidden' value='0'>";
		                                 str += "<input id="+this.barcode_no+"hidden class='salehidden' type='hidden' value='0'>";
		                                 str += "</tr>";
		
		                                    cnt++;
		                                    totalpr += parseInt(this.price);
		                                    totalsale +=  sale;
		            
		                        } 

		             });
		             
		             sale=0;
		             minus_sale=0;
		             
		             $(".listtable").append(str);    
                   
                   
		             appendMD_sale(pm_info_list);
		             
		            });           
			      	
		      }
		      
		      function appendMD_sale(data) {//할인적용

		    	  $(data).each(function(index) {
                      console.log("index = "+index);

		    		  var paymentlist_length = pm_info_list.filter(pm_info_list => pm_info_list.barcode_no == this.barcode_no).length;//전체 상품 리스트 길이 
			          var promotion_length = pm_info_list.filter(pm_info_list => pm_info_list.promotion_no == this.promotion_no).length; //프로모션 상품 리스트 길이
			          var pr_info_list_check = pr_info_list.filter(pr_info_list => pr_info_list == this.promotion_no).length; //프로모션 상품 리스트 길이
							
			          var parent_length = pm_info_list.filter(pm_info_list => pm_info_list.promotion_no == this.promotion_no && pm_info_list.pr_family == "parent").length;
			          var children_length = pm_info_list.filter(pm_info_list => pm_info_list.promotion_no == this.promotion_no && pm_info_list.pr_family == "children").length;
			          var family_length = Math.abs(parent_length-children_length);
			          
			          if((parent_length - children_length) > 0){
			              var tofamily = "parent";
						  var sale_length = children_length; 
			           }else if(parent_length - children_length < 0){
			              var tofamily = "children";        
						  var sale_length = parent_length;
			
			           }
		          		  if(isNaN(parseInt(this.pr_type)) == false ){//n+m 증정행사
			          		  
		         
							    		var trid = $("."+this.barcode_no).parents("tr").attr("id");
					                    var tr_p =parseInt($("#"+trid).find(".price").text());//리스트 정가
					                   	
							            var pr_sale_ea = parseInt($("#"+this.promotion_no+"hidden").val());
				                        $("#"+this.promotion_no+"hidden").val(pr_sale_ea+1);    
				                        var pr_sale_ea_p = parseInt($("#"+this.promotion_no+"hidden").val());

							            
						    		if(pr_sale_ea_p%this.pr_ea == 0 && promotion_length%this.pr_ea ==0){
						    			var md_sale_ea = parseInt($("#"+this.barcode_no+"hidden").val());
						    			$("#"+this.barcode_no+"hidden").val(md_sale_ea+1);
				                        var md_sale_ea_p = parseInt($("#"+this.barcode_no+"hidden").val());

				                        console.log("md_sale_ea_p = "+ md_sale_ea_p);

			                        	$("#"+trid).find("#"+this.barcode_no+"sale").text(this.pr_price*md_sale_ea_p);   //할인가격
					                   	var after_sale = parseInt($("#"+trid).find(".sale").text());	

			                        	$("#"+trid).find(".a_trtotal_price").text( tr_p-after_sale);   //총가격    
			 						}
			          			
		        	          
		        	         
		          		  
		          		}else if(this.pr_type == "세트할인"){   //세트할인
		        			
					          			var trid = $("."+this.barcode_no).parents("tr").attr("id");
					                    var tr_p =parseInt($("#"+trid).find(".price").text());//리스트 정가
					                   	
							            var pr_sale_ea = parseInt($("#"+this.promotion_no+"hidden").val());
				                        $("#"+this.promotion_no+"hidden").val(pr_sale_ea+1);    
				                        var pr_sale_ea_p = parseInt($("#"+this.promotion_no+"hidden").val());

		 
		    	     			if(parent_length != 0 && children_length != 0){
		          				
		    	     				var to_barcode_no = this.barcode_no;
		    	          			
			                        var trid = $("#no"+(index+1)).attr("id");
			                        var tr_p =parseInt($("#"+trid).find(".price").text());//리스트 정가
			                        var tr_ea = parseInt($("#"+trid).find(".md_ea").text());//리스트 수량
			                    	$("#"+trid).find(".sale").text(sale+parseInt(this.pr_price));   //할인가격
			                    	var tr_sale = $("#"+trid).find(".sale").text();	
			           			 
			                        $("#"+trid).find(".a_trtotal_price").text((tr_p*tr_ea)-tr_sale);   //총가격    
		          				
			           				to_pr_no_length++;
		
		        	     	     }
		          		
		    
		           			
		           			
			      	      
		                }else if(this.pr_type == "묶음행사" ){//묶음행사
		                
		                	
		                }
		          	  
		          	  });
              	$(".salehidden").val(0);   //할인가격

		    	};
		      
		      
		      function appendMD_total_pay() {//합계적용
		    	
		    	  for(var i =0;i<cnt;i++){
		    		  var total_price = parseInt($("#no"+i).find(".price").text());
		    		  var total_sale = parseInt($("#no"+i).find(".sale").text());
		    		  $("#no"+i).find(".a_trtotal_price").text(total_price-total_sale);
		    	  
		    	  
		    	  }	
		      
		      };
		      
		      function functionkey(pageNum, color) {//단축키 페이징
		         
		      
		         $.getJSON("functionButton?pageNum="+pageNum,function(data) {
		            
		
		             var str = "<table class='functiontable' border='1' width=250px>";
		            if(color==null){
		               color="rgba(0, 0, 0, 0)";
		            }
		            $(data).each(function(index,data) {
		               //index는 객체 키, data는 객체 값
		
		            if(index%4 == 0 && index!=0){
		               str+="</tr>";
		            }if(index%4 == 0 && index==0){
		               str+="<tr>";
		            }
		               str += "<td width=25% style='background-color: "+color+"' id="+data.key_no+" class='fk"+data.barcode_no+"'>"+data.md_name+"</td>";
		            if(index==15){
		                  str+="</tr>";
		            }
		            });
		            str += "<tr class='igkey'>";
		            str += "<td class='leftbutton'>〈</td>";
		            str += "<td class='rightbutton'>〉</td>";
		            str += "<td colspan='2'>키설정</td></tr>";
		            str += "</table>";
		            
		            
		            $(".functiontable").html(str);
		
		         });
		      
		
		         
		      }
		   </script>





</body>
</html>