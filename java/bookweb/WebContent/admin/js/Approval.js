    function ClickToApproval(id) {
    	
    	if($('#status'+id).text()=="Đã duyệt")
		{
		 if(confirm('Hoàn tác đơn hàng')){
			 $.ajax({
		            type: "GET",
		            url: "UpdateInvoiceServlet", 
		            data: "invoiceid="+ id,
		            dataType: "text",
		            async: true,
		            cache: false,
		            success: function (result) {
		            		if($('#status'+id).text()=="Đã duyệt")
		            			{
		            			$('#status'+id).html('<td style="color:red;">Đang chờ duyệt</td>');
		            			$('#bt'+id).html('<input style="width: 90px" type="Submit" class="btn btn-success" value="Duyệt">')
		            			}
		            		else{
		            			$('#status'+id).text("Đã duyệt");
		            			$('#bt'+id).html('<input type="Submit" class="btn btn-warning" value="Hoàn tác">')
		            		}
		            }
		        });
		 }
		}
	else{
		 if(confirm('Duyệt đơn hàng')){
			 $.ajax({
		            type: "GET",
		            url: "UpdateInvoiceServlet", 
		            data: "invoiceid="+ id,
		            dataType: "text",
		            async: true,
		            cache: false,
		            success: function (result) {
		            		if($('#status'+id).text()=="Đã duyệt")
		            			{
		            			$('#status'+id).text("Đang chờ duyệt");
		            			$('#bt'+id).html('<input type="Submit" class="btn btn-success" value="Duyệt">')
		            			}
		            		else{
		            			$('#status'+id).html('<td style="color:green;">Đã duyệt</td>');
		            			$('#bt'+id).html('<input style="width: 90px" type="Submit" class="btn btn-warning" value="Hoàn tác">')
		            		}
		            }
		        });
		 }
	}
       
    }
    
  function ClickToDelete(id) {
	  if (confirm('BẠN CÓ MUỐN XÓA')){
			$.ajax({
				type : "POST",
				url : "DeleteInvoiceServlet", //Tên servlet
				dataType:"text",
				data : {
					invoiceid : id
				},
				success : function(result) {
					$('#trDelete'+ id).remove();
				}
			});
			}}

