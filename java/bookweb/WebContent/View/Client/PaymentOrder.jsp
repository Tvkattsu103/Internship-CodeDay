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
<title>Thanh toán đơn hàng</title>

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

				<h2 style="text-align: center; font-size: 20px;">THANH TOÁN ĐƠN HÀNG</h2>
				<div
					style="background-color: #f4efef; width: auto; padding-bottom: 3px; padding-top: 2px; height: 24px;">
					<b>1.Thông tin giao hàng</b>
				</div>
				<table style="width: 100%; margin-bottom: 20px;">
					<tbody>
						<tr>
							<td style="padding-top: 10px; width: 180px;"><span>Họ
									Tên</span> <span style="color: red">*</span></td>
							<td><input type="text" style="width: 55%; height: 30px;" value="<%=session.getAttribute("sessionNameEM")%>">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Email</span> <span
								style="color: red">*</span></td>
							<td><input type="text" style="width: 55%; height: 30px;" value="<%=session.getAttribute("sessionEmailEM")%>">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Xác nhận Email</span> <span
								style="color: red">*</span></td>
							<td><input type="text" style="width: 55%; height: 30px;" value="<%=session.getAttribute("sessionEmailEM")%>">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px; vertical-align: top;"><span>Địa
									chỉ giao hàng</span> <span style="color: red">*</span></td>
							<td style="padding-top: 5px;"><textarea type="text"
									style="width: 70%; height: 60px;"><%=session.getAttribute("sessionAddrEM")%></textarea></td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Số điện thoại
									liên hệ</span> <span style="color: red">*</span></td>
							<td><input type="text" style="width: 55%; height: 30px;" value="<%=session.getAttribute("sessionPhoneEM")%>">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Quốc gia</span> <span
								style="color: red">*</span></td>
							<td><input type="text" style="width: 25%; height: 30px;"
								value="Việt Nam" disabled="disabled"></td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Thành Phố</span> <span
								style="color: red">*</span></td>
							<td><select style="width: 25%; height: 30px;">
									<option value="VN-44">An Giang</option>
									<option value="VN-43">Bà Rịa–Vũng Tàu</option>
									<option value="VN-54">Bắc Giang</option>
									<option value="VN-53">Bắc Kạn</option>
									<option value="VN-55">Bạc Liêu</option>
									<option value="VN-56">Bắc Ninh</option>
									<option value="VN-50">Bến Tre</option>
									<option value="VN-31">Bình Định</option>
									<option value="VN-57">Bình Dương</option>
									<option value="VN-58">Bình Phước</option>
									<option value="VN-40">Bình Thuận</option>
									<option value="VN-59">Cà Mau</option>
									<option value="VN-CT">Cần Thơ</option>
									<option value="VN-04">Cao Bằng</option>
									<option value="VN-DN">Đà Nẵng</option>
									<option value="VN-33">Đắk Lắk</option>
									<option value="VN-72">Đắk Nông</option>
									<option value="VN-71">Điện Biên</option>
									<option value="VN-39">Đồng Nai</option>
									<option value="VN-45">Đồng Tháp</option>
									<option value="VN-30">Gia Lai</option>
									<option value="VN-03">Hà Giang</option>
									<option value="VN-63">Hà Nam</option>
									<option value="VN-HN">Hà Nội</option>
									<option value="VN-23">Hà Tĩnh</option>
									<option value="VN-61">Hải Dương</option>
									<option value="VN-HP">Hải Phòng</option>
									<option value="VN-73">Hậu Giang</option>
									<option value="VN-SG">Hồ Chí Minh</option>
									<option value="VN-14">Hòa Bình</option>
									<option value="VN-66">Hưng Yên</option>
									<option value="VN-34">Khánh Hòa</option>
									<option value="VN-47">Kiên Giang</option>
									<option value="VN-28">Kon Tum</option>
									<option value="VN-01">Lai Châu</option>
									<option value="VN-35">Lâm Đồng</option>
									<option value="VN-09">Lạng Sơn</option>
									<option value="VN-02">Lào Cai</option>
									<option value="VN-41">Long An</option>
									<option value="VN-67">Nam Định</option>
									<option value="VN-22">Nghệ An</option>
									<option value="VN-18">Ninh Bình</option>
									<option value="VN-36">Ninh Thuận</option>
									<option value="VN-68">Phú Thọ</option>
									<option value="VN-32">Phú Yên</option>
									<option value="VN-24">Quảng Bình</option>
									<option value="VN-27">Quảng Nam</option>
									<option value="VN-29">Quảng Ngãi</option>
									<option value="VN-13">Quảng Ninh</option>
									<option value="VN-25">Quảng Trị</option>
									<option value="VN-52">Sóc Trăng</option>
									<option value="VN-05">Sơn La</option>
									<option value="VN-37">Tây Ninh</option>
									<option value="VN-20">Thái Bình</option>
									<option value="VN-69">Thái Nguyên</option>
									<option value="VN-21">Thanh Hóa</option>
									<option value="VN-26">Thừa Thiên–Huế</option>
									<option value="VN-46">Tiền Giang</option>
									<option value="VN-51">Trà Vinh</option>
									<option value="VN-07">Tuyên Quang</option>
									<option value="VN-49">Vĩnh Long</option>
									<option value="VN-70">Vĩnh Phúc</option>
									<option value="VN-06">Yên Bái</option>
							</select></td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Quận huyện</span> <span
								style="color: red">*</span></td>
							<td><input type="text" style="width: 55%; height: 30px;">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px;"><span>Loại tiền</span> <span
								style="color: red">*</span></td>
							<td><select style="width: 25%; height: 30px;">
									<option>VND</option>
									<option>USD</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<div
					style="background-color: #f4efef; width: auto; padding-bottom: 3px; padding-top: 2px; height: 24px;">
					<b>2.Chọn phương thức thanh toán</b>
				</div>
				<table style="width: 100%; margin-bottom: 20px;">
					<tbody>
						<tr>
							<td style="padding-top: 10px; width: 180px;"><span>Thanh
									toán</span> <span style="color: red">*</span></td>
							<td><select style="width: 25%; height: 30px;">
									<option>(Chọn)</option>
									<option>Chuyển khoản</option>
									<option>Dịch vụ kiểu hồi (Weston Union)</option>
									<option>Chuyển tiền qua mạng (áp dụng cho khách hàng
										tỉnh)</option>
									<option>Tiền mặt (chỉ áp dụng cho khách hàng ở Huế)</option>
									<option>Visa/Master Card (chưa hỗ trợ)</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<div
					style="background-color: #f4efef; width: auto; padding-bottom: 3px; padding-top: 2px; height: 24px;">
					<b>3. Thông tin tùy chọn</b>
				</div>
				<table style="width: 100%; margin-bottom: 20px;">
					<tbody>
						<tr style="width: 50%">
							<td style="padding-top: 10px; width: 50%;"><input
								type="checkbox"> <label> Ghi chú về đơn hàng cần
									nhập vào đây</label> <br> <textarea type="text"
									style="width: 95%; height: 60px;"></textarea></td>
							<td style="padding-top: 10px; width: 50%;"><input
								type="checkbox"> <label> Gói thành quà với lời
									chúc</label> <br> <textarea type="text"
									style="width: 95%; height: 60px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div style="width: auto; border-bottom: #d6d6d6 1px solid;">
					&nbsp;</div>
				<input type="checkbox"> <label> Nếu công ty cần xuất
					hóa đơn xin đánh dấu và nhập vào đây :</label> <br>
				<table style="width: 100%; margin-bottom: 20px;">
					<tbody>
						<tr>
							<td style="padding-top: 10px; width: 180px;"><span>Tên
									công ty</span></td>
							<td><input type="text" style="width: 55%; height: 30px;">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px; width: 180px;"><span>Mã
									số thuế</span></td>
							<td><input type="text" style="width: 55%; height: 30px;">
							</td>
						</tr>
						<tr>
							<td style="padding-top: 10px; width: 180px; vertical-align: top;"><span>Địa
									chỉ công ty</span></td>
							<td style="padding-top: 10px;"><textarea type="text"
									style="width: 95%; height: 60px;"></textarea></td>

						</tr>
					</tbody>
				</table>
				<table class="table">
					<tbody>
						<%
							ArrayList<CartBean> dsdathang = (ArrayList<CartBean>) session.getAttribute("dsgiohang");
							int price = 0;
							int total = 0;
							if (session.getAttribute("dsgiohang") != null) {
								for (CartBean gh : dsdathang) {
									price += gh.getQuantity();
									total += gh.getPriceTotal();
						%>
						<tr>
							<td style="text-align: center;"><img width="50px"
								src="<%=gh.getImage()%>"></td>
							<td style="float: left;" colspan="5"><span
								style="color: black:"><b style="font-weight: bold;"><%=gh.getName()%></b>
									(Tác giả: <%=gh.getAuthor()%>)</span> <br> <br> <input
								type="text" name="txtMasach" value="<%=gh.getBookid()%>"
								style="display: none"> <b>Giá: </b><span
								style="color: #6d2524"><%=gh.getPrice()%> đ</span> x <span><%=gh.getQuantity()%></span></td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td colspan="2"
								style="font-size: 20px; font-weight: bold; text-align: left">Tổng
								tiền: <u><%=total%></u> đ
							</td>
						</tr>
						<tr>
							<td colspan="12">
								<p style="font-size: 12px;">
									Ghi chú: Phần đánh dấu <span style="color: red">(*)</span> là
									bắt buộc. Quý khách điền thông tin giao hàng bằng font chữ Việt
									Unicode hoặc không dấu.
								</p>
								<p style="font-size: 12px;">Chi phí giao hàng sẽ được thông
									báo cụ thể qua email ngay khi chúng tôi nhận được Đơn đặt hàng
									của quý khách.</p>
							</td>
						</tr>
						<tr style="font-weight: bold; text-align: center">
							<td colspan="5"><a style="color: #4267b2;"
								href="OrderServlet"
								onclick="return confirm('Chúng tôi sẽ gửi đơn hàng đến địa chỉ email của quý khách. Vui lòng kiểm tra hộp mail spam nếu quý khách không nhận được trong inbox. Nhấn OK để đặt hàng.');">GỬI
									ĐƠN HÀNG</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>