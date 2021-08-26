<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>List Student</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="text-center">List Student</h2>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>STT</th>
							<th>Ho Ten</th>
							<th>Dia chi</th>
							<th>Ngay sinh</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listS}" var="x" varStatus="loop">
							<tr>
								<td>${loop.index + 1 }</td>
								<td hidden>${x.studentId }</td>
								<td>${x.hoten }</td>
								<td><c:if test="${x.diachi == 'hu'}">
										Hue
									</c:if>
									<c:if test="${x.diachi == 'dn'}">
										Da Nang
									</c:if>
								</td>
								<td>${x.ngaysinh }</td>
								<td><a href="update?id=${x.studentId}">
										<button class="btn btn-warning">Edit</button>
								</a></td>
								<td><a href="#" onclick="showMess(${x.studentId})">
										<button class="btn btn-danger">Delete</button>
								</a></td>
							</tr>
						</c:forEach>
						<a href="add"><button class="btn btn-success mb-2">Create student</button></a>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	function showMess(id){
		var option = confirm('Are you sure want to delete?');
		if(option === true){
			window.location.href = 'delete?id='+id;
		}
	}
</script>
</html>