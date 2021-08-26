<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>ADMIN</title>
		<link href="admin/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet"
					href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="admin/css/styles.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>	
		<!--Custom Font-->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
			rel="stylesheet">
	</head>

	<body>
		<!-- begin head -->
		<%@include file="Head.jsp" %>
			<!-- end head -->

			<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
				<div class="profile-sidebar">
					<div class="profile-userpic">
								<img src="https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ec593cc431fb70007482137%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1321%26cropX2%3D3300%26cropY1%3D114%26cropY2%3D2093" class="img-responsive" alt="">
					</div>
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							<%=session.getAttribute("sessionNameAD")%>
						</div>
						<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="divider"></div>
				<ul class="nav menu">
					<li><a href="Invoice"><em class="fa fa-dashboard">&nbsp;</em> Quản lý đơn hàng</a></li>
					<!-- <li><a href="#"><em class="fa fa-calendar">&nbsp;</em> Quản lý tài khoản</a></li> -->
					<li><a href="Book"><em class="fa fa-book">&nbsp;</em> Quản lý sách</a></li>
					<!-- <li><a href="#"><em class="fa fa-edit">&nbsp;</em> Quản lý loại sách</a></li> -->
					<li><a href="LogoutServlet" onclick="return confirm('BẠN CÓ MUỐN ĐĂNG XUẤT !!!');"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
				</ul>
			</div>
			<!--/.sidebar-->
			<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
				<%@include file="Dashboard.jsp" %>
			</div>
			<!--/.main-->

			<script src="admin/js/jquery-1.11.1.min.js"></script>
			<script src="admin/js/bootstrap.min.js"></script>
			<script src="admin/js/easypiechart.js"></script>
			<script src="admin/js/easypiechart-data.js"></script>
			<script src="admin/js/custom.js"></script>
			<script src="admin/js/Dashboard.js"></script>
			
			<script>
				window.onload = function () {
					var chart1 = document.getElementById("line-chart").getContext("2d");
					window.myLine = new Chart(chart1).Line(lineChartData, {
						responsive: true,
						scaleLineColor: "rgba(0,0,0,.2)",
						scaleGridLineColor: "rgba(0,0,0,.05)",
						scaleFontColor: "#c5c7cc"
					});
				};
			</script>
	</body>

	</html>