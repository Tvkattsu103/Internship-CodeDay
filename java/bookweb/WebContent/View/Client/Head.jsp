<%@page import="java.util.ArrayList"%>
<%@page import="Bean.InvoiceBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="Content/reset.min.css" />
<link rel="stylesheet" href="Content/style.css" />
<link rel="stylesheet" href="Content/header-7.css" />
</head>

<body>

	<!-- Header Start -->
	<header class="site-header">
	<div class="wrapper site-header__wrapper">
		<div class="site-header__start" style="padding-bottom:13px;">
			<h2 style="font-weight: bold; color:#eee; font-size: 25px; margin-left: 5px;">MINH KHAI STORE</h2>
		</div>
		<div class="site-header__middle">
			<nav class="nav">
			<button class="nav__toggle" aria-expanded="false" type="button">
				MENU</button>
			<ul class="nav__wrapper">
				<li class="nav__item"
					style="color: white; font-weight: bold; text-decoration: none;"><a
					href="Home">TRANG CHỦ</a></li>
				<%
					if (session.getAttribute("sessionNameEM") == null) {
				%>
				<li class="nav__item"><a href="RegisterForward">ĐĂNG
						K&#221;</a></li>
				<li class="nav__item"><a href="Login">ĐĂNG NHẬP</a></li>
				<%
					} else {
				%>

				<li class="nav__item"><a href="LogoutServlet"
					onclick="return confirm('BẠN CÓ MUỐN ĐĂNG XUẤT !!!');">ĐĂNG
						XUẤT</a></li>
				<li class="nav__item"><a href="ChangePwdForward">ĐỔI MẬT
						KHẨU</a></li>
				<li class="nav__item"><a href="PurchaseHistoryForward">LỊCH
						SỬ MUA HÀNG</a></li>
				<li class="nav__item"><a href="CartForward"
					style="color: white; font-weight: bold; text-decoration: none;">
						<%
							ArrayList<InvoiceBean> gh = (ArrayList<InvoiceBean>) session.getAttribute("dsgiohang");
						%> <i class="fa fa-shopping-cart"></i> GIỎ HÀNG (<%=gh == null ? "0" : gh.size()%>)
				</a></li>
				<%
					}
				%>
			</ul>
			</nav>
		</div>
		<div class="site-header__end" style="padding-bottom:15px;">
			<i class="fa fa-user" style="font-size: 30px; color: #eee"></i>
			<%
				if (session.getAttribute("sessionNameEM") != null) {
			%>
			<span style="color: #eee; margin-bottom: 20px;"> <strong>
					<%=session.getAttribute("sessionNameEM")%></strong>
			</span>
			<%
				}
			%>
		</div>
	</div>
	</header>
	<!-- Header End -->
	<script src="Content/header-7.js"></script>
</body>
</html>