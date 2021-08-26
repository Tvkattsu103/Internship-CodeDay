<%@page import="Dao.BookDao"%>
<%@page import="Bean.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết sách</title>

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
				<%@include file="SlideImage.jsp"%>
				<div>
					<style type="text/css">
#Datmua a {
	clear: both;
	background-color: red;
	color: white;
	width: 120px;
	display: block;
	float: right;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
	transition: .4s;
}

#Datmua a:hover {
	opacity: 0.6;
}
</style>
					<%
						int id = Integer.parseInt(request.getParameter("bookid"));
						BookDao bdao = new BookDao();
						BookBean tam = bdao.getSachTheoMa(id);
						String name = tam.getName();
						int price = tam.getPrice();
						String image = tam.getImage();
						int quantity = tam.getQuantity();
					%>
					<h3 align="center" style="font-size: 20px;">THÔNG TIN CHI TIẾT
						SÁCH</h3>
					<div>
						<div
							style="width: 30%; float: left; border-left: dotted 1px; border-color: azure">
							<img src="<%=image%>" width="70%" alt="">
						</div>
						<div style="width: 60%; float: left; padding: 10px">
							<p style="text-align: justify">
								<span style="font-weight: bold"> TÊN SÁCH: </span>
								<%=name%>
							</p>
							<p style="text-align: justify">
								<span style="font-weight: bold"> TÁC GIẢ: </span>
								<%=tam.getAuthor()%>
							</p>
							<p style="text-align: justify">
								<span style="font-weight: bold"> XUẤT BẢN: </span>
								<%=tam.getDateAdded()%>
							</p>
							<p style="text-align: justify">
								<span style="font-weight: bold"> MÔ TẢ: </span>
								<%=tam.getDescription()%>
							</p>
							<p style="font-weight: bold">
								GIÁ BÁN: <span style="color: #F39801; font-size: 15pt"> <%=price%>đ
								</span>
							</p>
						</div>

						<div id="Datmua">
							<a href="BuyServlet?bookid=<%=tam.getBookid()%>&Name=<%=tam.getName()%>&Author=<%=tam.getAuthor()%>&Price=<%=tam.getPrice()%>&Image=<%=tam.getImage()%>&Quantity=1"
							 class="list-group-item"> ĐẶT MUA </a>
						</div>

					</div>

				</div>


			</div>
		</div>
	</div>
	<!-- /.container -->
	<%@include file="Footer.jsp"%>


</body>
</html>