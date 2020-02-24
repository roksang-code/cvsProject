<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript"	src="../resources/plugins/jQuery/jquery-3.4.1.min.js"></script>

</head>
<body>
	<script type="text/javascript">
        
        var sel_files = [];
 
        $(document).ready(function() {

            
            
            $("#addMDbtn").on("click", function(){

            	var MDform = $('#MDform')[0];
                var formData = new FormData(MDform);
                formData.append("fileObj", $("#input_imgs")[0].files[0]);


            	
                var MDform = document.getElementById("MDform");	
                alert(MDform);
        		var formData = new FormData(MDform);
        		alert(formData);
        		console.log(formData);
        			$.ajax({

                		type : "post",
                		url : "addMD",
                		dataType : 'text',
                		data : formData, 
                		contentType : false,
                		processData : false,
                		
                		success : function(result) {
                			if(result == 'succese'){
                				alert("s");
                			}
                			
                			/* $("input").val(null); */


                		},
                		error : function(err) {

                			alert("등록에 실패했습니다.");
                		}



                	});

                });
            
            
        }); 
        $("#input_imgs").on("change", handleImgsFilesSelect);

        function handleImgsFilesSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            
            
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("이미지 파일을 등록하세요.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<img id='md_img' src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
 
        
    </script>
    
	<div class="container-fluid  my-1">
		<div class="row"> 
			<div class="col-md-6 offset-md-1">
				<form id="MDform" name="MDform" enctype="multipart/form-data">
	
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
								<td class="b">유통기한</td>
								<td><input class="form-control" type="text" id="shelf_life" name="shelf_life" size="15px" required/></td>
							</tr>
							<tr>
								<td class="b">사진</td>
								<td><input class="btn" type="file" id="input_imgs" name="md_img" ></td>
								
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
	


</body>
</html>