<%@page import="Bean.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ADMIN</title>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/styles.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/live/_MDB/css/customizer.min.css">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
</head>

<body>
	<!-- begin head -->
	<%@include file="Head.jsp"%>
	<!-- end head -->

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img
					src="https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ec593cc431fb70007482137%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1321%26cropX2%3D3300%26cropY1%3D114%26cropY2%3D2093"
					class="img-responsive" alt="">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">
					<%=session.getAttribute("sessionNameAD")%>
				</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
			<li><a href="Invoice"><em class="fa fa-dashboard">&nbsp;</em>
					Quản lý đơn hàng</a></li>
			<!-- <li><a href="#"><em class="fa fa-calendar">&nbsp;</em> Quản
					lý tài khoản</a></li> -->
			<li class="active"><a href="Book"><em class="fa fa-book">&nbsp;</em>
					Quản lý sách</a></li>
			<!-- <li><a href="#"><em class="fa fa-edit">&nbsp;</em> Quản lý
					loại sách</a></li> -->
			<li><a href="LogoutServlet"
				onclick="return confirm('BẠN CÓ MUỐN ĐĂNG XUẤT !!!');"><em
					class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div>
	<!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">ADMIN</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">SÁCH</h3>
			</div>
			<a class="m-0 font-weight-bold text-primary" href="AddBookServlet">
				<i class="fa fa-plus"></i> <input type="Submit"
				class="btn btn-primary" value="Thêm sách mới">
			</a>
		</div>
		<!--/.row-->

		<div>
			<table border="1" class="table table-bordered table-striped"
				id="dataTable" width="100%">
				<thead>
					<tr>
						<th>STT</th>
						<th width="150px">Ảnh</th>
						<th width="200px">Tên sách</th>
						<th width="200px">Tác giả</th>
						<th>Giá</th>
						<th width="100px">Số lượng</th>
						<th width="200px">Ngày Thêm Sách</th>
						<th width="500px">Mô tả</th>
						<th width="200px">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i=0;
						ArrayList<BookBean> lsSach = (ArrayList<BookBean>) request.getAttribute("lsSach");
						for (BookBean s : lsSach) {
							i++;
					%>
					<tr>
						<td style="text-align: center;"><%=i%></td>
						<td align="center"><img height="70px" width="50px"
							alt="<%=s.getImage()%>" src="<%=s.getImage()%>"></td>
						<td><%=s.getName()%></td>
						<td><%=s.getAuthor()%></td>
						<td><%=s.getPrice()%></td>
						<td style="text-align: center;"><%=s.getQuantity()%></td>
						<td><%=s.getDateAdded()%></td>
						<td><%=s.getDescription()%></td>
						<td><a href="EditBookServlet?bookid=<%=s.getBookid()%>"><input
								type="Submit" class="btn btn-success" value="Sửa "></a> <a
							href="DeteleBookAdminServlet?bookid=<%=s.getBookid()%>"
							onclick="return confirm('BẠN CÓ MUỐN XÓA !!!');"><input
								type="Submit" class="btn btn-danger" value="Xóa "></a></td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>
		</div>
	</div>
	<!--/.main-->
	<script src="admin/js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="admin/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="admin/js/easypiechart.js" type="text/javascript"></script>
	<script src="admin/js/easypiechart-data.js" type="text/javascript"></script>
	<script src="admin/js/custom.js" type="text/javascript"></script>
	<script src="admin/datatables/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script src="admin/datatables/dataTables.bootstrap4.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>