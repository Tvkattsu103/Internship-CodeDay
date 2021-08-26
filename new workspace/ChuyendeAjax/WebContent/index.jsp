<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	


<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h1 class="font-weight-bold" style="">Chuyên đề Ajax</h1>
			<hr />
		</div>
		<div class="row">
			<div class="col-md-3 sidebar h-50">
				<div class="panel panel-danger">
					<div class="panel-heading font-weight-bold">Tình huống</div>
					<div class="panel-body">
						<div class="list-div">
							<div class="p-3 m-1 rounded-lg">01. Click to load</div>
							<div class="p-3 m-1 rounded-lg">02. Scroll to load</div>
							<div class="p-3 m-1 rounded-lg bg-primary" id="1">03. Pagination</div>
							<div class="p-3 m-1 rounded-lg">04. Tab</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-9">
				<div class="panel panel-danger">
					<div class="panel-heading font-weight-bold text-center">Demo Tab</div>
					<div class="panel-body">
							<div class="row">
								<div class="col-md-3 sidebar h-50">
									<div class="panel panel-danger">
										<div class="panel-heading font-weight-bold">Thể loại</div>
										<div class="panel-body">
											<div class="list-div">
												<div class="p-3 m-1 rounded-lg" cate="1">Hài hước</div>
												<div class="p-3 m-1 rounded-lg" cate="2">Kinh dị</div>
												<div class="p-3 m-1 rounded-lg bg-primary" id="1" cate="3">Hành động</div>
												<div class="p-3 m-1 rounded-lg" cate="4">Viễn tưởng</div>
											</div>
										</div>
									</div>
								</div>
					
								<div class="col-md-9">
									<div class="panel panel-danger">
										<div class="panel-heading font-weight-bold text-center">List Movie</div>
										<div class="panel-body">
											<div class="row row-cols-3 list-phim text-center justify-content-center">
					<%-- 							<c:forEach items="${listP}" var="o"> --%>
					<!-- 								<div class="col card m-4"> -->
					<!-- 									<img -->
					<%-- 										src="${o.img}" --%>
					<!-- 										class="card-img-top img-film m-auto" alt="anh-phim"> -->
					<!-- 									<div class="card-body p-0 pt-4"> -->
					<%-- 										<h4 class="card-title mt-1 font-weight-bold">${o.title}</h4> --%>
					<!-- 										<p> -->
					<%-- 											Release date: <strong>${o.releaseDate}</strong> --%>
					<!-- 										</p> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<%-- 							</c:forEach> --%>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
      	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      	
		
<!-- 		<script	src="pagination.js"></script> -->
		<script>
		$(document).ready(function() {
			var listItem = $('.list-div div');
			var currentPage = $('.pagination li a span.currentPage');
			var currentPageOfList = $('.pagination li a span.currentPageOfList');
			var pageEnd = $(".dropdown-menu li[end='1']");
			
			var getUrlParameter = function getUrlParameter(sParam) {
			    var sPageURL = window.location.search.substring(1),
			        sURLVariables = sPageURL.split('&'),
			        sParameterName,
			        i;
			    for (i = 0; i < sURLVariables.length; i++) {
			        sParameterName = sURLVariables[i].split('=');
			        if (sParameterName[0] === sParam) {
			            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
			        }
			    }
			    return false;
			};
			
			var page = getUrlParameter('page');
			
// 			if(page == false){
// 				loadData(1);
// 			} else {
// 				loadData(page);
// 			}
			
			listItem.add(pageItem).hover(function(){
				$(this).addClass('bg-primary');
			}, function() {
				if($(this).attr('id') != 1){
					$(this).removeClass('bg-primary');
				}
			})
			
			listItem.click(function(){
				if($(this).attr('id') != 1){
					listItem.removeAttr('id').removeClass('bg-primary');
					$(this).addClass('bg-primary');
					$(this).attr('id',1);
				}				
			})
			
			function changePage(page) {
				url = "/ChuyendeAjax/list?page=" + page;
				pageItem.removeAttr('id').removeClass('bg-primary');
				pageItem.each(function(){
					if($(this).attr('locate') == page){
						$(this).addClass('bg-primary');
						$(this).attr('id',1);
						currentPage.text($(this).text());
						currentPageOfList.text($(this).text());
						if($(this).attr('end') == 1){
							start.add(prev).removeClass('disabled');
							end.add(next).addClass('disabled');
						} else if($(this).attr('locate') == 1){
							end.add(next).removeClass('disabled');
							start.add(prev).addClass('disabled');
						} else {
							start.add(prev).removeClass('disabled');
							end.add(next).removeClass('disabled');
						}
					}
				})
				updateUrl(url);
			}
			
			function loadData(page){
				$.ajax({
					url:'/ChuyendeAjax/paging',
					type: 'GET',
					data:{ page:page },
					success: function(data){
						console.log(currentPageOfList.text());
						$('.row.list-phim').html(data);
						changePage(page);

					}
				})
			}
		})
		</script>
</html>