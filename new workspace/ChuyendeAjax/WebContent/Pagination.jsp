<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pagination</title>
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
					<div class="panel-heading font-weight-bold text-center">Demo Pagination</div>
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
						<nav aria-label="Page navigation example">
							<ul class="float-right pagination justify-content-center pagination-position">
								<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"><span class="currentPageOfList">Page ${pageCurrent }</span> of ${endP }</a>	</li>
								<li class="page-item start"><a class="page-link">Start</a></li>
								<li class="page-item prev"><a class="page-link">&#xab;&nbsp;Previous</a></li>
								<li class="dropdown dropdown-inline">
						          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="currentPage">Page 1</span>&nbsp;&nbsp;&nbsp;&nbsp;</a>
						          <ul class="dropdown-menu menu-box bg-dark">
						          	<c:forEach begin="1" end="${endP }" var="i"> 
						          		<li class="text-center mb-1 ml-2 mr-2 rounded-lg bg-primary" end="${endP==i ? "1" : ""}" locate="${i}">Page ${i}</li>
						          	</c:forEach>
<%-- 						          	${i}==${endP} ? "1":"" " locate="${i} --%>
<%-- 						          	${i}==1 ? "asdfasdf" : " " --%>
<%-- 						          	id="<c:if text=${i == 1}>1</c:if>" locate="${i}" end="<c:if text=${i == 5}>1</c:if>" --%>
<!-- 						            <li class="text-center mb-1 ml-2 mr-2 rounded-lg bg-primary" id="1" locate="1">Page 1</li> -->
<!-- 						            <li class="text-center mb-1 ml-2 mr-2 rounded-lg" locate="2">Page 2</li> -->
<!-- 						            <li class="text-center mb-1 ml-2 mr-2 rounded-lg" locate="3">Page 3</li> -->
<!-- 						            <li class="text-center mb-1 ml-2 mr-2 rounded-lg" locate="4">Page 4</li> -->
<!-- 						            <li class="text-center mb-1 ml-2 mr-2 rounded-lg" locate="5" end="1">Page 5</li> -->
						          </ul>
						        </li>
								<li class="page-item next"><a class="page-link">Next&nbsp;&#xbb;</a></li>
								<li class="page-item end"><a class="page-link">End</a></li>
							</ul>
						</nav>
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
      	
		
		<script	src="pagination.js"></script>
		<script>
		
		</script>
</html>