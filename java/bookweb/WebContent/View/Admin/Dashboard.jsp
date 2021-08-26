<%@page import="java.util.Calendar"%>
<%@page import="Bean.DashboardBean"%>
<%@page import="Dao.UserDao"%>
<%@page import="Bean.UserBean"%>
<%@page import="Bean.InvoiceBean"%>
<%@page import="Dao.InvoiceDao"%>
<%@page import="Bean.CartBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Home</title>

<link href="admin/css/bootstrap.min.css" rel="stylesheet">

<link href="admin/css/font-awesome.min.css" rel="stylesheet">

<link href="admin/css/datepicker3.css" rel="stylesheet">

<link href="admin/css/styles.css" rel="stylesheet">

<!--Custom Font-->

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">


</head>
<body>
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="#"> <em class="fa fa-home"></em>
			</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</div>
	<!--/.row-->
	<!-- <div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Dashboard</h1>
		</div>
	</div> -->
	<!--/.row-->
	<div class="panel panel-container">
		<div class="row">
			<%
				ArrayList<InvoiceBean> ds = InvoiceDao.getHoaDonChuaMua();
				ArrayList<UserBean> us = UserDao.GetAllUser();
			%>
			<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
				<div class="panel panel-teal panel-widget border-right">
					<div class="row no-padding">
						<em class="fa fa-xl fa-shopping-cart color-blue"></em>
						<div class="large"><%=ds.size()%></div>
						<div class="text-muted">New Orders</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
				<div class="panel panel-blue panel-widget border-right">
					<div class="row no-padding">
						<em class="fa fa-xl fa-comments color-orange"></em>
						<div class="large">0</div>
						<div class="text-muted">Comments</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
				<div class="panel panel-orange panel-widget border-right">
					<div class="row no-padding">
						<em class="fa fa-xl fa-users color-teal"></em>
						<div class="large"><%=us.size()%></div>
						<div class="text-muted">New Users</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
				<div class="panel panel-red panel-widget ">
					<div class="row no-padding">
						<em class="fa fa-xl fa-search color-red"></em>
						<div class="large">0</div>
						<div class="text-muted">Page Views</div>
					</div>
				</div>
			</div>

		</div>
		<!--/.row-->
	</div>
	<% 
		DashboardBean db = (DashboardBean) request.getAttribute("db") ;%>
	<div class="card shadow mb-4">
    <div class="card-body">
        <div class="form-group">
            <select class="text form-control" id="OrderStatistic"
                    style="width: 100px; margin-left: auto;">
                <% for (int i = Calendar.getInstance().get(Calendar.YEAR) - 2; i <= Calendar.getInstance().get(Calendar.YEAR); i++)
                {
                    if (i == db.Year)
                    { %>
                        <option selected><%=i %></option>
                    <% }
                    else
                    {%> 
                        <option><%=i %></option>
                    <% }
                }%>
            </select>
            Total Revenue: <strong class="TTotal" style="color:orangered"><%=db.ToTal() %></strong>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>January</th>
                    <th>February</th>
                    <th>March</th>
                    <th>April</th>
                    <th>May</th>
                    <th>June</th>
                    <th>July</th>
                    <th>August</th>
                    <th>September</th>
                    <th>October</th>
                    <th>November</th>
                    <th>December</th>

                </tr>
            </thead>
            <tbody>
                <tr id="OrderStatistics"><% %>
                    <td><%=db.January %></td>
                    <td><%=db.February %></td>
                    <td><%=db.March %></td>
                    <td><%=db.April %></td>
                    <td><%=db.May %></td>
                    <td><%=db.June %></td>
                    <td><%=db.July %></td>
                    <td><%=db.August %></td>
                    <td><%=db.September %></td>
                    <td><%=db.October %></td>
                    <td><%=db.November %></td>
                    <td><%=db.December %></td>
                </tr>
            </tbody>

        </table>
    </div>
</div>
	<div class="box-body">
    <div class="row">
        <div class="col-md-12">
            <p class="text-center">
            
                <strong id="titleChart">Sales: 1 Jan, <%=db.Year %> - 30 Dec, <%=db.Year %></strong>
        	<div class="chart">
                <!-- Sales Chart Canvas -->
                <div class="card-body">
                    <canvas id="myChart" width="1500" height="450"></canvas>
                    <input type="hidden" value="@Model.RevenueDashBoard.ToTal()" id='doanhThu'>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</div>

</body>

</html>