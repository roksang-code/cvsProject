
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
	
	
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file",file);
		
		
		$.ajax({
			url:"uploadAjax",
			data:formData,
			dataType:"text",
			processData:false,
			contentType:false,
			type:"post",
			success:function(data){
				
				var str = "";
				
				if(checkImageType(data)){
					str = "<div>" + 
					"<img src='displayFile?fileName="+getImageLink(data)+"'/>"
					+"<br><small data-src="+data+">X</small>" +
					"</div>";
				}else {
					str = "<div><a href='displayFile?fileName="+data+"'>"
					+getOriginalName(data)+"</a></div>";
				}
				
					 
				
				$(".upLoadedList").append(str);
			}
		});
		
		
	});
	
	
	$(".upLoadedList").on("click","small",function(event){
		var that = $(this);
		$.ajax({
			url:"deleteFile",
			data:{fileName:$(this).attr("data-src")},
			dataType:"text",
			type:"post",
			success:function(result){
				if(result == "deleted"){
						alert("deleted");
						that.parent("div").remove();
					}
				}
		});
	});
	
	
	$("#registerForm").submit(function(event) {
		event.preventDefault();
		
		var that = $(this);
		
		var str="";
		$(".upLoadedList small").each(function(index) {
			str+="<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src")+"'>";
			
		});
		that.append(str);
		that.get(0).submit();
	});
	
	
});