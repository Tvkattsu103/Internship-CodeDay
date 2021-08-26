<%@page import="Bean.BookBean"%>
<%@page import="Bean.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ADMIN</title>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/styles.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/live/_MDB/css/customizer.min.css">
<link href="admin/css/mdb.min.css" rel="stylesheet">
<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<script src="http://cdn.ckeditor.com/4.6.2/standard-all/ckeditor.js"></script>
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
			<li><a href="InvoiceManagerForward"><em
					class="fa fa-dashboard">&nbsp;</em> Quản lý đơn hàng</a></li>
			<!-- <li><a href="#"><em class="fa fa-calendar">&nbsp;</em> Quản
					lý tài khoản</a></li> -->
			<li class="active"><a href="BookWebServlet"><em
					class="fa fa-book">&nbsp;</em> Quản lý sách</a></li>
			<!-- <li><a href="#"><em class="fa fa-edit">&nbsp;</em> Quản lý
					loại sách</a></li> -->
			<li><a href="LogoutServlet"><em class="fa fa-power-off">&nbsp;</em>
					Logout</a></li>
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
				<h1 class="display-3">Sửa sách</h1>
				<br>
			</div>

		</div>
		<!--/.row-->
		<%
			ItemDao loaidao = new ItemDao();
			ArrayList<ItemBean> lsLoai = loaidao.getItemBook();
			BookBean book = (BookBean) request.getAttribute("bookItem");
		%>

		<div class="container" style="padding-bottom: 50px">
			<div style="min-height: 78vh">
				<form action="EditBookServlet" method="post"
					enctype="multipart/form-data">
					<table>
						<input style="display: none" type="text"
							value="<%=book.getBookid()%>" name="bookid" id="bookid">
						<tr>
							<td><label for="name">Tên sách: </label></td>
							<td><input style="margin-bottom:5px" type="text" name="tensach" id="tensach"
								value="<%=book.getName()%>"></td>
						</tr>
						<tr>
							<td><label for="price">Giá:</label></td>
							<td><input style="margin-bottom:5px" type="number" name="gia" id="gia"
								value="<%=book.getPrice()%>"></td>
						</tr>
						<tr>
							<td><label for="loai">Loại sách: </label></td>
							<td><select style="display: block !important; margin-bottom:5px;"
								class="form-control" name="maloai">
									<%
										for (ItemBean l : lsLoai) {
									%><option
										value="<%=l.getIteambookid()%>"><%=l.getName()%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td><label for="desc">Tác giả: </label></td>
							<td><input style="margin-bottom:5px" type="text" name="tacgia" id="tacgia"
								value="<%=book.getAuthor()%>"></td>
						</tr>
						<tr>
							<td><label for="star">Số lượng: </label></td>
							<td><input style="margin-bottom:5px" type="number" min="1" max="1000" name="soluong"
								id="soluong" value="<%=book.getQuantity()%>"></td>
						</tr>
						<tr>
							<td><label for="image">Ảnh: </label></td>
							<td><input style="margin-bottom:5px" type="file" name="photo" id="photo" ></td>
						</tr>
						<tr>
							<td><label for="mota">Mô tả đầy đủ: </label></td>
							<td><textarea name="mota" id="mota"
									value="<%=book.getDescription()%>"><%=book.getDescription()%></textarea></td>
						</tr>
					</table>
					<button style="margin-left: 350px; margin-top: 10px;"
						class="btn btn-info" type="submit">Sửa sách</button>
				</form>
			</div>
		</div>

	</div>
	<!--/.main-->

	<script src="admin/js/jquery-1.11.1.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/chart.min.js"></script>
	<script src="admin/js/chart-data.js"></script>
	<script src="admin/js/easypiechart.js"></script>
	<script src="admin/js/easypiechart-data.js"></script>
	<script src="admin/js/bootstrap-datepicker.js"></script>
	<script src="admin/js/custom.js"></script>
	<script src="admin/datatables/jquery.dataTables.min.js"></script>
	<script src="admin/datatables/dataTables.bootstrap4.min.js"></script>
	<script>
		CKEDITOR.replace('mota', {
			height : 300,
			filebrowserUploadUrl : "upload.php"
		});
	</script>


</body>

</html>