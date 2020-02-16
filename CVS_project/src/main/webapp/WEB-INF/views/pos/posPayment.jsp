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
		<button class="mainpage">메인페이지</button>
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
					   	<option selected>통신사</option>
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
						<td class="paymentList">판매내역</td>
					</tr>
					<tr>
						<td class="num">4</td>
						<td class="num">5</td>
						<td class="num">6</td>
						<td class="changeEA">수량변경</td>
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
						<td></td>
					</tr>
					<tr>
						<td>천원</td>
						<td>오천원</td>
						<td>만원</td>
						<td></td>
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
		      var re_pm_info_list = new Array();
		      var parent = new Array();
		      var children = new Array();
		      var pr_no_list = new Array();
		      var idname="";
		      var ignore_sale=0;
		      var tel_sale=0;
		      var tel_grade="";

              var to_pr_no_length =1;
			  var ignore_sale = 0;

		      
		      function appendMD(barcode_no) {//상품등록
		            var str = "";
		            var ealist = new Array();
		
		            $.getJSON("posList?barcode_no=" + barcode_no, function(data) {
		                        console.log(data);

		                        
		                        
		                  $(data).each(function() {
		                           bar = $("." + barcode_no+ "").text();
		                           pm_info_list.push({barcode_no : this.barcode_no, price : this.price, promotion_no : this.promotion_no, pr_type : this.pr_type,pr_ea : this.pr_ea, pr_price : this.pr_price, pr_family : this.pr_family});
		      			         console.log("bar_family1 = "+this.pr_family);

		                           
		                           
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
		                                 str += "<td class="+this.promotion_no+"sale> <a id="+this.barcode_no+"sale class='sale'>"+sale+"</a></td>";
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
		     
		      function appendMD_sale(data, data1) {//할인적용

		    	  if(data1 != null){
                      console.log("data1 = "+data1);

                 	 $(".salehidden").val(0);
                 	 $(".sale").text(0);

                 	ignore_sale=0;
                  }
		    	  $(data, data1, ignore_sale).each(function(index) {
		    		  
                     if(data.length-1 == index || data1 != null){ //data1의 값이 null이 아니면 리스트 전체 탐색
		    		  
                      console.log("index = "+index);
                      console.log("cnt = "+cnt);

                      var datalenght = parseInt(data.length)-1;
		    		  var paymentlist_length = data.filter(data => data.barcode_no == this.barcode_no).length;//전체 상품 리스트 길이 
			          var promotion_md = data.filter(data => data.promotion_no == this.promotion_no); //프로모션 상품 리스트 길이
	                  
			          var trid = $("."+this.barcode_no).parents("tr").attr("id");
                      console.log("trid = "+trid);
                      console.log("this.barcode_no = "+this.barcode_no);

			          var tr_p =parseInt($("#"+trid).find(".price").text());//리스트 정가
	                  var tr_ea = parseInt($("#"+trid).find(".md_ea").text());
                      var tr_sale = parseInt($("#"+ this.barcode_no + "sale").text());//할인가

		          		  if(isNaN(parseInt(this.pr_type)) == false ){//n+1 증정행사
			          		  
		         
							    		
							            var pr_sale_ea = parseInt($("#"+this.promotion_no+"hidden").val());
				                        $("#"+this.promotion_no+"hidden").val(pr_sale_ea+1);    
				                        var pr_sale_ea_p = parseInt($("#"+this.promotion_no+"hidden").val());
						    			var md_sale_ea = parseInt($("#"+this.barcode_no+"hidden").val());
										
							      
				                        $("#"+ this.barcode_no + "total").text(tr_p-tr_sale);//합계


						            if(pr_sale_ea_p%this.pr_ea == 0){
						    			
						    			$("#"+this.barcode_no+"hidden").val(md_sale_ea+1);
				                        var md_sale_ea_p = parseInt($("#"+this.barcode_no+"hidden").val());

				                        console.log("md_sale_ea_p = "+ md_sale_ea_p);
				                        console.log("this.barcode_no = "+this.barcode_no);

				                        $("#"+trid).find("#"+this.barcode_no+"sale").text(this.pr_price*md_sale_ea_p);   //할인가격
					                   	var after_sale = parseInt($("#"+trid).find(".sale").text());	

			                        	$("#"+trid).find(".a_trtotal_price").text( tr_p-after_sale);   //총가격    

			                        	ignore_sale += this.pr_price*this.pr_ea

						    		}
			          			
		        	          
		        	         
		          		  
		          		}else if(this.pr_type == "세트할인"){   //세트할인
		                      
		          			  var parent_length = data.filter(data => data.promotion_no == this.promotion_no && data.pr_family == "parent").length;
					          var children_length = data.filter(data => data.promotion_no == this.promotion_no && data.pr_family == "children").length;
					          var before_price= new Array();

					          var re_family ="";
					            if((parent_length - children_length) > 0){
									var tosale = "parent";
									var sale_length = children_length;
								}else{
									var tosale = "children";
									var sale_length = parent_length;
								}
       							
					            var pr_sale_ea = parseInt($("#"+this.promotion_no+"hidden").val());
		                        $("#"+this.promotion_no+"hidden").val(pr_sale_ea+1);    
		                        var pr_sale_ea_p = parseInt($("#"+this.promotion_no+"hidden").val());
				    			var md_sale_ea = parseInt($("#"+this.barcode_no+"hidden").val());
								

		                        $("#"+ this.barcode_no + "total").text(tr_p-tr_sale);//합계

				
						        if( parent_length == children_length || tosale != this.pr_family){
							         
							          before_price = data.filter(data => data.promotion_no == this.promotion_no && data.pr_family != this.pr_family); 
							          before_price = before_price[sale_length-1].price; //직전 family타입 상품 가격
							 

   	    	     				    $("#"+this.barcode_no+"hidden").val(md_sale_ea+1);    
			                        var md_sale_ea_p = parseInt($("#"+this.barcode_no+"hidden").val());


		                        	$("#"+trid).find("#"+this.barcode_no+"sale").text(this.pr_price*md_sale_ea_p);   //할인가격
				                   	var after_sale = parseInt($("#"+trid).find(".sale").text());	

		                        	$("#"+trid).find(".a_trtotal_price").text( tr_p-after_sale);   //총가격    
		                        	ignore_sale += this.price+before_price;
		        	     	     }
		          		
		    
		           			
		           			
			      	      
		                }else if(this.pr_type == "묶음행사" ){//묶음행사
		                

		            		
				            
				         	var pr_sale_ea = parseInt($("#"+this.promotion_no+"hidden").val());
	                        $("#"+this.promotion_no+"hidden").val(pr_sale_ea+1);    
	                        var pr_sale_ea_p = parseInt($("#"+this.promotion_no+"hidden").val());
			    			var md_sale_ea = parseInt($("#"+this.barcode_no+"hidden").val());
							
					    	$("#"+ this.barcode_no + "total").text(tr_p-tr_sale);//합계

		                  
		                  	 if(pr_sale_ea_p%this.pr_ea == 0){
				          		 
					    			for(var i = pr_sale_ea_p - this.pr_ea ; i < promotion_md.length ; i++){
		
							        var before_bar = promotion_md[i].barcode_no; //이전 행사 상품 바코드				    				
							        var before_price = promotion_md[i].price; //이전 행사 상품 가격				    				
							        var trid = $("."+before_bar).parents("tr").attr("id");
							        var before_ea = parseInt($("#"+trid).find(".md_ea").text()); //이전 행사 상품 수량

					    			$("#"+before_bar+"hidden").val(md_sale_ea+1);
			                        var md_sale_ea_p = parseInt($("#"+before_bar+"hidden").val());
			                        console.log("this.pr_price = "+this.pr_price);
			                        console.log("before_price = "+before_price);

			                        console.log("md_sale_ea_p = "+md_sale_ea_p);

			                        $("#"+before_bar+"total").text(this.pr_price*before_ea);   //총가격    
		                        	var total_pr = $("#"+before_bar+"total").text();   //총가격    
			                       
		                        	console.log("trid = "+trid);

		                        	console.log("before_price_ea = "+$("#"+trid).find(".md_ea").text());
						          	console.log("before_ea = "+before_ea);

		                        	$("#"+before_bar+"sale").text((before_price-this.pr_price)*(md_sale_ea_p));   //할인가격    
		                        		
		                        	ignore_sale += before_price;
				    				
				    			}
				    			

	

				    		}
				          	 console.log("tr_p = "+tr_p);
				          	 console.log("tr_sale = "+tr_sale);
				          	 console.log("this.barcode_no = "+this.barcode_no);

          			
		                }
		          	  
                     	
                     
                     
                     }//if datalength 끝
		          	 console.log("ignore_sale = "+ignore_sale);
                    
		          	
		    	  });//each끝
		    	
		  		appendMD_total_pay();

		    	};
		      
		     
		      function appendMD_total_pay() {//합계적용
		    	  
		    	  var total_price = 0;
	    		  var total_sale = 0; 
		    	 
	    		  for(var i =1;i<cnt;i++){
		    		  var tr_price = parseInt($("#no"+i).find(".price").text());
		    		  var tr_sale = parseInt($("#no"+i).find(".sale").text());
		    		  total_price += tr_price;
		    		  total_sale += tr_sale;
		    		  console.log("total_price = ");
		    		  console.log($("#no"+i).find(".price").text());

		    	  }
		          console.log("total_price = "+total_price);
		          console.log("total_sale = "+total_sale);

	    		  if(tel_grade == ""){
		    		  $(".listTotalPr").text(total_price);
		    		  $(".listSalePr").text(total_sale);
		    		  $(".listPaymentPr").text(total_price-total_sale);
		    	  }else{
		    		  tel_total_sale = (total_price-ignore_sale)*tel_sale;
			          console.log("tr_sale = "+tr_sale);
			          console.log("tel_sale = "+tel_sale);

		    		  $(".listTotalPr").text(total_price);
		    		  $(".listSalePr").text(total_sale+tel_total_sale);
		    		  $(".listPaymentPr").text(total_price-total_sale-tel_total_sale);	  
		    	  }
	    		  tr_sale=0;
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