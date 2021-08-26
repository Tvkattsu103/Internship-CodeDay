<%@page import="Bean.UserBean"%>
<%@page import="Bean.CartBean"%>
<%@page import="Dao.BookDao"%>
<%@page import="Bean.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap Core CSS -->
<link href="Content/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Custom CSS -->
<link href="Content/shop-homepage.css" rel="stylesheet" />
</head>
<body>
	<%@include file="Head.jsp"%>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<%@include file="MenuLeft.jsp"%>
			<div class="col-md-9">
				<div>
					<h2 style="text-align: center; font-size: 20px;">GIỎ HÀNG CỦA
						BẠN</h2>
					<h5 style="color: red" align="center"><%=request.getAttribute("msggiohang") != null ? request.getAttribute("msggiohang") : ""%></h5>
					<%
						ArrayList<CartBean> dsdathang = (ArrayList<CartBean>) session.getAttribute("dsgiohang");
						int price = 0;
						int total = 0;
						if (session.getAttribute("dsgiohang") != null) {
							for (CartBean gh : dsdathang) {
								price += gh.getQuantity();
								total += gh.getPriceTotal();
					%>
					<table class="table">
						<tbody>
							<tr style="font-weight: bold;">
								<td width="40%" colspan="2">Sản phẩm trong giỏ</td>
								<td width="20%" align="center">Giá bán</td>
								<td width="20%" align="center">Số lượng</td>
								<td width="20%" align="center">Thành tiền</td>
								<td width="20%"></td>
								<td width="20%"></td>
								<td width="20%"></td>
							</tr>

							<tr style="text-align: center;">
								<td><img width="40px" src="<%=gh.getImage()%>"></td>
								<td><%=gh.getName()%></td>
								<form action="UpdateCartServlet" method="post">
									<input type="text" name="txtMasach" value="<%=gh.getBookid()%>"
										style="display: none">
									<td><%=gh.getPrice()%> đ</td>
									<td><input style="width: 50px;" type="number" min="1"
										name="txtSoluong" value="<%=gh.getQuantity()%>"><br>
										<a style="color: #EA4335;"
										href="DeleteBookServlet?bookid=<%=gh.getBookid()%>">Xóa</a></td>
									<td><%=gh.getPriceTotal()%> đ</td>
									<td></td>
									<td><input style="color: tomato;" type="submit"
										value="Cập Nhật"></td>
								</form>
							</tr>
							<%-- <%
								}
								}
							%> --%>
							<tr>
								<td colspan="2"><a style="color: #00cc66;"
									href="HomeForward">Tiếp tục mua hàng</a></td>
								<td colspan="10" style="font-weight: bold; text-align: right">Tổng
									tiền: <u><%=total%></u> đ
								</td>
							</tr>

							<tr style="text-align: right">
								<td style="text-align: left" colspan="2">Bạn có <u><%=price%></u>
									sản phẩm trong giỏ
								</td>
								<td colspan="12"><a style="color: #EA4335;"
									href="DeleteCartServlet"
									onclick="return confirm('BẠN CÓ MUỐN XÓA');">Xóa Giỏ Hàng</a></td>
							</tr>
							<%-- <% if(session.getAttribute("dsgiohang") != null){ %> --%>
							<tr style="font-weight: bold; text-align: right">
								<td colspan="12"><a style="color: #4267b2;"
									href="PaymentOrderForward"
									onclick="return confirm('XÁC NHẬN THANH TOÁN');">THANH TOÁN</a></td>
							</tr>
						</tbody>
					</table>
					<%
						}
						} else {
					%>
					<span>Giỏ hàng đang trống :</span><a style="color: #000"
						href="HomeForward"> <input
						style="box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border: 2px solid #4CAF50; border-radius: 4px;"
						type="button" value="Chọn mua hàng"></a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>