<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&amp;display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="Login/fonts/icomoon/style.css">

<link rel="stylesheet" href="Login/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Login/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="Login/css/style.css">

<title>Đăng nhập</title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="Login/images/undraw_remotely_2j6y.svg" alt="Image"
						class="img-fluid">
				</div>
				<div class="col-md-6 contents">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="mb-4">
								<h3 style="text-align: center;">Đăng Nhập</h3>
							</div>
							<form action="LoginServlet" method="post">
								<h5 style="color: red" align="center"><%=request.getAttribute("msgdangnhap") != null ? request.getAttribute("msgdangnhap") : ""%></h5>
								<h5 style="color: red" align="center"><%=request.getAttribute("msgdangky") != null ? request.getAttribute("msgdangky") : ""%></h5>
								<div class="form-group first">
									<label for="username">Tên Đăng Nhập</label> <input type="text"
										class="form-control" name="un" required>

								</div>
								<div class="form-group last mb-4">
									<label for="password">Mật khẩu</label> <input type="password"
										class="form-control" name="pw" required>

								</div>
								<input type="submit" value="Đăng Nhập"
									class="btn btn-block btn-primary"> <span
									class="d-block text-left my-4 text-muted">&mdash; Trang
									chủ &mdash;</span>
								<div class="social-login">
									<a href="HomeForward" class="facebook"> <span
										class="icon-home mr-3"></span>
									</a>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<script src="Login/js/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="Login/js/popper.min.js" type="text/javascript"></script>
	<script src="Login/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="Login/js/main.js" type="text/javascript"></script>
</body>
</html>
