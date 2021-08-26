<%@page import="Bean.DetailBean"%>
<%@page import="Bean.InvoiceBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lịch sử mua hàng</title>
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom CSS -->
<link href="Content/shop-homepage.css" rel="stylesheet" />
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
	<%@include file="Head.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<%@include file="MenuLeft.jsp"%>
			<div class="col-md-9">
				<div>
					<button data-toggle="collapse" data-target="#info"
						class="btn btn-primary"
						style="margin-bottom: 5px; margin-top: 10px; float: right; font-size: 18px">
						<i class="fa fa-sort"></i> Thao tác khác
					</button>
					<div id="info" class="collapse" style="padding-top: 60px;">
						<table class="table table-striped">
							<tr>
								<th>THÔNG TIN CÁ NHÂN</th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<td>Họ và Tên</td>
								<td>: <%=session.getAttribute("sessionNameEM")%></td>
								<td>Mã số thuế</td>
								<td>: ---|---</td>
							</tr>
							<tr>
								<td>Mã</td>
								<td>: MSKH<%=session.getAttribute("sessionIdEM")%></td>
								<td>Website</td>
								<td>: ---|---</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>: <%=session.getAttribute("sessionEmailEM")%></td>
								<td>Giới tính</td>
								<td>: Nam</td>
							</tr>
							<tr>
								<td>Địa chỉ</td>
								<td>: <%=session.getAttribute("sessionAddrEM")%></td>
								<td>Số điện thoại</td>
								<td>: <%=session.getAttribute("sessionPhoneEM")%></td>
							</tr>
						</table>
					</div>
					<div style="padding-top: 20px;">
						<table class="table table-bordered table-striped" id="dataTable" width="100%">
							<thead>
							<tr>
								<th>Mã hóa đơn</th>
								<th>Trạng thái</th>
								<th>Số lượng</th>
								<th>Ảnh</th>
								<th>Giá trị</th>
								<th>Ngày mua</th>
							</tr>
							</thead>
							<tbody>
							<%
								ArrayList<InvoiceBean> dsHD = (ArrayList<InvoiceBean>) request.getAttribute("dshd");
								ArrayList<DetailBean> listChiTiet = (ArrayList<DetailBean>) request.getAttribute("dsct");
								int s = 0;
								if (dsHD != null)
									for (InvoiceBean hd : dsHD) {
										for (DetailBean ct : listChiTiet) {
											if(hd.getInvoiceid() == ct.getInvoiceid()){
											s += ct.getPriceTotal();
							%>
							
							<tr>
								<td>MSQS<%=hd.getInvoiceid()%></td>
								<td class="<%=hd.isBought() ? "a" : "b"%>"><%=hd.isBought() ? "Hoàn thành" : "Đang giao dịch"%></td>
								<td><%=ct.getQuantity()%></td>
								<td><img width="40px" alt="<%=ct.getBookid()%>"
									src="<%=ct.getImage()%>"></td>
								<td><%=ct.getPriceTotal()%> VND</td>
								<td><%=hd.getOrderDate()%></td>
							</tr>
							<%
								}}}
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<%@include file="Footer.jsp"%>
	<!-- <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
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