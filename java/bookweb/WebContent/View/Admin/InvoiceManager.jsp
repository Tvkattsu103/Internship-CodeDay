<%@page import="Bean.DetailBean"%>
<%@page import="Bean.InvoiceBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ADMIN</title>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="admin/css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
	<style type="text/css">
	.b{
		color: red;
	}
	.a{
		color: green;
	}
</style>
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
			<li class="active"><a href="Invoice"><em
					class="fa fa-dashboard">&nbsp;</em> Quản lý đơn hàng</a></li>
			<!-- <li><a href="#"><em class="fa fa-calendar">&nbsp;</em> Quản
					lý tài khoản</a></li> -->
			<li><a href="Book"><em class="fa fa-book">&nbsp;</em> Quản
					lý sách</a></li>
			<!-- <li><a href="#"><em class="fa fa-edit">&nbsp;</em> Quản lý
					loại sách</a></li> -->
			<li><a href="LogoutServlet"
				onclick="return confirm('BẠN CÓ MUỐN ĐĂNG XUẤT !!!');"><em
					class="fa fa-power-off">&nbsp;</em> Logout</a></li>
		</ul>
	</div>
	<!-- side bar -->
	<style>
</style>
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
				<h3 class="page-header"><%=request.getAttribute("msgtieude")%></h3>
				<!-- <a class="m-0 font-weight-bold text-primary" href="#">
				 <input style="margin-bottom: 10px;" type="Submit" class="btn btn-success" value="TẤT CẢ ĐON HÀNG">
			</a> -->
			</div>
		</div>
		<!--/.row-->

		<div>
			<table border="1" class="table table-bordered table-striped"
				id="dataTable" width="100%">
				<%
					ArrayList<InvoiceBean> dshd = (ArrayList<InvoiceBean>) request.getAttribute("dshd");
					ArrayList<Integer> invoiceID = new ArrayList<Integer>();
					int i = 1;
				%>
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên Người Mua</th>
						<th>Ngày Mua</th>
						<th>Tình Trạng</th>
						<th>Thao Tác</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (InvoiceBean h : dshd) {
							invoiceID.add(h.getInvoiceid());
					%>
					<tr id="trDelete<%=h.getInvoiceid()%>">
						<td><%=i++%></td>
						<td><%=h.getName()%></td>
						<td><%=h.getOrderDate()%></td>
						<td class="<%=h.isBought() ? "a" : "b"%>" id="status<%=h.getInvoiceid()%>"><%=h.isBought() ? "Đã duyệt" : "Đang chờ duyệt"%></td>
						<td><a><input type="Submit" class="btn btn-primary" style="width: 90px"
								data-toggle="modal" data-target="#Invoice<%=h.getInvoiceid()%>"
								value="Chi tiết"></a> <% if (h.isBought() == false) {%> 
								<a id="bt<%=h.getInvoiceid()%>" 
							       onclick="ClickToApproval(<%=h.getInvoiceid()%>)"><input style="width: 90px"
								   type="Submit" class="btn btn-success" value="Duyệt"> </a> <% } else {
 %>
							<a id="bt<%=h.getInvoiceid()%>"
							onclick="ClickToApproval(<%=h.getInvoiceid()%>)"><input style="width: 90px"
								type="Submit" class="btn btn-warning" value="Hoàn tác"></a>
							<%
								}
							%> <a onclick="ClickToDelete(<%=h.getInvoiceid()%>)" ><input style="width: 60px"
								type="submit" class="btn btn-danger" value="Xóa"></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!--/.main-->
	<!-- modal detail -->

	<%
		for (Integer j : invoiceID) {
	%>
	<div class="modal fade" id="Invoice<%out.print(j);%>">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 700px; padding: 15px">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">CHI TIẾT HÓA ĐƠN MUA HÀNG</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<div class="col-12">
						<table class="table table-bordered table_striped">
							<thead>
								<tr>
									<th>STT</th>
									<th>Tên Sách</th>
									<th>Ảnh</th>
									<th>Số Lượng</th>
									<th>Giá</th>
									<th>Thành Tiền</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<DetailBean> listChiTiet = (ArrayList<DetailBean>) request.getAttribute("dsct");
										int k = 1, s = 0;
										for (DetailBean chiTiet : listChiTiet) {
											if (chiTiet.getInvoiceid() == j) {
												int totalPrice = chiTiet.getQuantity() * chiTiet.getPrice();
												s += chiTiet.getPriceTotal();
								%>
								<tr>
									<td>
										<%
											out.print(k);
														k++;
										%>
									</td>
									<td><%=chiTiet.getName()%></td>
									<td><img style="width: 50px;"
										src="<%=chiTiet.getImage()%>"></td>
									<td><%=chiTiet.getQuantity()%></td>
									<td style="font: bold"><%=chiTiet.getPrice()%></td>
									<td style="color: red; font: bold"><%=chiTiet.getPriceTotal()%>
										VND</td>

								</tr>
								<%
									}
										}
								%>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5" style="text-align: right;"><strong>Tổng
											Cộng: </strong></td>
									<td style="color: red"><b><%=s%> VND</b></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<!-- End modal -->
	<script src="admin/js/Approval.js"></script>
	<script src="admin/js/jquery-1.11.1.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/easypiechart.js"></script>
	<script src="admin/js/easypiechart-data.js"></script>
	<script src="admin/js/custom.js"></script>
	<script src="admin/datatables/jquery.dataTables.min.js"></script>
	<script src="admin/datatables/dataTables.bootstrap4.min.js"></script>
	<script>
						$(document).ready(function () {
							$('#dataTable').DataTable();
						});
					</script>
</body>
</html>