<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="../resources/plugins/jQuery/jquery.form.min.js"></script> 



	<script type="text/javascript">
        
        var sel_files = [];
 
        $(document).ready(function() {
        	function checkImageType(fileName) {
        		var pattern = /jpg|gif|png|jpeg/i;
        		
        		return fileName.match(pattern);
        	}
        	function getImageLink(fileName) {
        		
        		if(!checkImageType(fileName)){
        			return;
        		}
        		var front = fileName.substr(0,12);
        		var end = fileName.substr(14);
        		
        		
        		return front+end;
        	}
        	
        	function getOriginalName(fileName){
        	
        		var idx=fileName.indexOf("_")+1;
        		
        		
        		return fileName.substr(idx);
        	}
        	
        	$("#input_imgs").on("change", function(event) {
        		
        		
        		var file = $("#input_imgs")[0].files[0];
        		
        		var formData = new FormData();
        	
        		formData.append("file",file);

        		$.ajax({
        			url:"../uploadAjax",
        			data:formData,
        			dataType:"text",
        			processData:false,
        			contentType:false,
        			type:"post",
        			success:function(data){
        				
        				var img = "";
        				var str ="";
        				if(checkImageType(data)){
        					img = "<div>" + 
        					"<img src='../displayFile?fileName="+getImageLink(data)+"'/>" +
        					"</div>";
							
        					str= "../displayFile?fileName="+getImageLink(data);
        	        		
        				}else {
		                    alert("이미지 파일을 등록하세요.");
		                    return;
        				}
        				
        					 
        				$("#md_img").val(str);
        				
	                    $(".imgs_wrap").html(img);
        			}
        		});

        		
        		
        	});
         
            $(document).on("click", "#addMDbtn", function(){
            	$("[name=b]").attr("required",true);
            	
            	$("#MDform").ajaxForm({
                     type: 'POST',
                     url: 'addMD',
                     enctype: "multipart/form-data",
                     contentType: false,
                     processData: false,
                   
                     success: function(result) {
                      
                         
             			$("input").val(null);
             			$("#md_img_div").html("");
                     },
                     error: function(data, status, err) {
                    	
             			alert("중복된 바코드번호 입니다.");
                     }
                 }).submit();
            
    
             });
            
            
        }); 

 
        
    </script>
    
	<div class="container-fluid  my-1">
		<div class="row"> 
			<div class="col-md-6 offset-md-1">
				<form id="MDform" name="MDform" method="post">
	
				<h1 align="center" style="padding-top: 10%; padding-bottom: 5%;">상품등록</h1>
	
						<table class="table">
							
							<tr>
								<td class="b">바코드번호</td>
								<td><input class="form-control" type="text" id="barcode_no" name="barcode_no" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">타입</td>
								<td><input class="form-control" type="text" id="type" name="type" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">세부타입</td>
								<td><input class="form-control" type="text" id="detail_type" name="detail_type" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">제조사</td>
								<td><input class="form-control" type="text" id="company" name="company" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">상품이름</td>
								<td><input class="form-control" type="text" id="md_name" name="md_name" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">원가</td>
								<td><input class="form-control" type="text" id="cost" name="cost" size="15px" required/></td>
							</tr>
								<tr>
								<td class="b">정가</td>
								<td><input class="form-control" type="text" id="price" name="price" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">유통기한</td>
								<td><input class="form-control" type="text" id="shelf_life" name="shelf_life" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">사진</td>
								<td><input class="btn" type="file" id="input_imgs" required>
									<input type='hidden' id ="md_img" name='md_img'>
								</td>
								
							</tr>
							<tr>
								<td colspan="2">
											<button type="button" class="btn btn-secondary btn-lg btn-block my-1" id= "addMDbtn">상품등록</button>
								</td>
							</tr>
						</table>
				</form>
			</div>	
			 	<div id="md_img_div" style="padding-top: 150px;" class="imgs_wrap"></div>
        </div>
		    
	</div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	

