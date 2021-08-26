<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css" />


</head>
<body>
	<p>Hi</p>
	<table id="table" border="1px solid black">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Image</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody id="pagination_data">
		
<%-- 		<c:forEach items="${listA }" var="i"> --%>
			
<%-- 		</c:forEach> --%>
		</tbody>
	</table>
	<c:forEach begin="1" end="${endP }" var="i">
<%-- 		<button onclick="changePage(this)">${i }</button> --%>
			<span class="pagination_link" style="cursor:pointer;" id="${i }">${i }</span>
	</c:forEach>
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	$(document).on('click','.pagination_link',function(){
		var page = $(this).attr("id");
		$('span.pagination_link').each(function(){
			if($(this).hasClass('active')){
				$(this).toggleClass('active');
			}
		})
		loadData(page);
	})
	
	loadData();

	$('span.pagination_link').each(function(){
		console.log($(this).attr("id"));
	})

	function loadData(page){
		$.ajax({
			url:'/Paging/paging',
			type: 'GET',
			data:{ index:page },
			success: function(data){
				console.log(page);
				$('#pagination_data').html(data);
				$('span.pagination_link').each(function(){
					if($(this).attr("id") == page){
						$(this).toggleClass('active');
					}
				})
			}
		})
	}
	
	
})
</script>
</html>