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
            $("#input_imgs").on("change", handleImgsFilesSelect);
        }); 
 
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
                    var img_html = "<img src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
 
    </script>
    
	<div class="container-fluid  my-1">
		<div class="row"> 
			<div class="col-md-6 offset-md-1">
				<form action="addMD" method="post">
	
				<h1 align="center" style="padding-top: 10%; padding-bottom: 5%;">상품등록</h1>
	
						<table class="table">
							
							<tr>
								<td class="b">상품번호</td>
								<td><input class="form-control" type="text" id="md_no" name="md_no" size="15px" required/></td>
							</tr>
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
								<td><input class="btn" type="file" id="input_imgs" name="md_img" required></td>
								
							</tr>
							<tr>
								<td colspan="2">
											<input class="btn btn-secondary btn-lg btn-block my-1" type="submit" value="상품등록" id ="join">
								</td>
							</tr>
						</table>
				</form>
			</div>	
			 	<div style="padding-top: 150px;" class="imgs_wrap"></div>
        </div>
		    
	</div>
	
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	


</body>
</html>