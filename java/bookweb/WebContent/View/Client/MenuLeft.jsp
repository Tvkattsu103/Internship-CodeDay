<%@page import="Dao.ItemDao"%>
<%@page import="Bean.ItemBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">

</style>
</head>
<body>
	<div class="col-md-3" style="padding-top: 20px">
		<!-- <h3 class="lead" style="text-align: center;">DANH MỤC SÁCH</h3> -->
		<div class="panel-primary">
			<div class="panel-heading"
				style="width: 160px; font-weight: bold; text-transform: uppercase; position: relative;">
				Danh Mục Sách<span class="b-main___category-arrow"></span>
			</div>
		</div>
		<div class="list-group">

			<%
				ArrayList<ItemBean> dsloai = ItemDao.getItemBook();
				for (ItemBean loai : dsloai) {
			%>
			<a
				href="ItemBookServlet?id=<%=loai.getIteambookid()%>&name=<%=loai.getName()%>"
				class="list-group-item"> <%=loai.getName()%>
			</a>
			<%
				}
			%>
		</div>
		<!-- <h3 align="center">TÌM KIẾM</h3> -->
		<div class="panel-primary">
			<div class="panel-heading"
				style="width: 110px; font-weight: bold; text-transform: uppercase; position: relative;">
				Tìm Kiếm<span class="b-main___category-arrow"></span>
			</div>
		</div>
		<form action="HomeForward" method="get" class="form-inline">
			<div class="input-group">
				<input style="padding-right: 50px;" name="timkiem"
					<%if (request.getParameter("timkiem") != null) {%>
					value="<%=request.getParameter("timkiem")%>" <%}%> id="myInput"
					onkeyup="show_result(this.value)" class="form-control " type="text"
					placeholder="Search" id=txt_1 aria-label="Search"> <span
					class="input-group-btn">
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
	</div>
</body> 
</html>