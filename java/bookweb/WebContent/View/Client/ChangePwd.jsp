<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="Login/fonts/icomoon/style.css">

<link rel="stylesheet" href="Login/css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Login/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="Login/css/style.css">

<title>Đổi mật khẩu</title>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<img src="Login/images/a.jpg" alt="Image" class="img-fluid">
				</div>
				<div class="col-md-6 contents">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="mb-4">
								<h3 style="text-align: center;">Đổi mật khẩu</h3>

							</div>
							<form action="ChangePwdServlet" method="post">
								<h5 style="color: red" align="center"><%=request.getAttribute("msgdoimk") != null ? request.getAttribute("msgdoimk") : ""%></h5>
								<div class="form-group first">
									<label for="username">Mật khẩu cũ</label> <input
										type="password" class="form-control" name="p1" required>

								</div>
								<div class="form-group first">
									<label for="password">Mật khẩu mới</label> <input
										type="password" class="form-control" name="p2" required>
 
								</div>
								<div class="form-group last mb-4">
									<label for="password">Xác nhận mật khẩu</label> <input
										type="password" class="form-control" name="p3" required>

								</div>
								<input type="submit" value="Tiếp tục"
									class="btn btn-block btn-primary">
									<span
									class="d-block text-left my-4 text-muted">&mdash; Trang chủ &mdash;</span>
								<div class="social-login">
									<a href="HomeForward" class="facebook"> <span
										class="icon-home mr-3"></span>
									<!-- <a href="#" class="facebook"> <span
										class="icon-facebook mr-3"></span>
									</a> <a href="#" class="twitter"> <span
										class="icon-twitter mr-3"></span>
									</a> <a href="#" class="google"> <span class="icon-google mr-3"></span>
									</a> -->
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<script src="Login/js/jquery-3.3.1.min.js"></script>
	<script src="Login/js/popper.min.js"></script>
	<script src="Login/js/bootstrap.min.js"></script>
	<script src="Login/js/main.js"></script>
</body>
</html>
