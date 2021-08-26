<%@page import="java.awt.print.Book"%>
<%@page import="Bean.BookBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<title>Web bán sách online</title>
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
	<div class="container">
		<div class="row">
			<%@include file="MenuLeft.jsp"%>
			<div class="col-md-9">
				<%@include file="SlideImage.jsp"%>
				<!-- <div class="content_title">
					<ul class="child_item">
						<li><img src="images/booksearch.png"></li>
						<li class="title__item">Sách Mới</li>
					</ul>
					</div> -->
				<div class="panel-primary" style="padding-bottom:10px;">
					<div class="panel-heading"
						style="width: 160px; font-weight: bold; font-size:20px; text-transform: uppercase; position: relative;">
						Sách Mới<span class="b-main___category-arrow"></span>
					</div>
				</div>
				<div class="row">
					<%
						ArrayList<BookBean> ds = (ArrayList<BookBean>) request.getAttribute("listsach");
						int dau = (int) request.getAttribute("dau");
						int cuoi = (int) request.getAttribute("cuoi");
						int trangcuoi = (int) Math.ceil((double) ds.size() / 8);
						int tranghientai = (int) request.getAttribute("tranghientai");
						for (BookBean sach : ds.subList(dau, cuoi)) {
					%>
					<div class="col-sm-3 col-lg-3 col-md-3">
						<div class="thumbnail" id="<%=sach.getBookid()%>">
							<a style="text-decoration: none;"
								href="BookDetailForward?bookid=<%=sach.getBookid()%>&Name=<%=sach.getName()%>&Author=<%=sach.getAuthor()%>&Price=<%=sach.getPrice()%>&Image=<%=sach.getImage()%>&Quantity=1">
								<img style="width: 170px; height: 250px;"
								alt="<%=sach.getName()%> " src="<%=sach.getImage()%>" />
								<div class="thumbnail-item">
									<h4 style="text-align: center;">
										<%
											if (sach.getName().length() >= 18) {
													out.print(sach.getName().substring(0, 12));
													out.print("...");
												} else {
													out.print(sach.getName());
												}
										%>
									</h4>
									<h3 style="text-align: center; font-size: 20px; color: #F39801">
										<b>Giá: <%=sach.getPrice()%>đ 
									</h3>
									<a style="width: 50px;"
										href="BuyServlet?bookid=<%=sach.getBookid()%>&Name=<%=sach.getName()%>&Author=<%=sach.getAuthor()%>&Price=<%=sach.getPrice()%>&Image=<%=sach.getImage()%>&Quantity=1">
										<img src="images/buynow1.jpg">
									</a>
								</div>
							</a>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>

			<div class="pagination" style="float: right;">
				<a href="#">&laquo;</a>
				<%
					for (int i = 1; i <= trangcuoi; i++) {
						if (tranghientai == i) {
				%>
				<a class="active"> <%=tranghientai%>
				</a>
				<%
					} else {
				%>
				<a href="HomeForward?pageid=<%=i%>"> <%=i%>
				</a>
				<%
					}
					}
				%>
				<a href="#">&raquo;</a>

			</div>

		</div>
	</div>
	<a id="back2Top" title="Back to top" href="#" style="display: inline;">&#10148;</a>

	<%@include file="Footer.jsp"%>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	/*Scroll to top when arrow up clicked BEGIN*/
	$(window).scroll(function() {
		var height = $(window).scrollTop();
		if (height > 50) {
			$('#back2Top').fadeIn();
		} else {
			$('#back2Top').fadeOut();
		}

	});
	$(document).ready(function() {
		$("#back2Top").click(function(event) {
			event.preventDefault();
			$("html, body").animate({
				scrollTop : 0
			}, "slow");
			return false;
		});

	});
	/*Scroll to top when arrow up clicked END*/
</script>
</html>