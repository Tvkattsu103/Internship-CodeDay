<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="add" method="post">
		<table>
			<tr>
				<td>Ho ten:</td>
				<td><input type="text" name="hoten" placeholder="Nhap ho ten"/></td>
			</tr>
			<tr>
				<td>Dia chi:</td>
				<td><select id="diachi" list="diachi" name="diachi"> 
					<datalist id="diachi-list">
						<option value="hu">Hue</option>
						<option value="dn" selected>Da Nang</option>
					</datalist>
					</select>
				</td>
			</tr>
			<tr>
				<td>Ngay sinh:</td>
				<td><input type="text" name="ngaysinh" placeholder="Nhap ngay sinh"/></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit">Add student</button></td>
			</tr>
		</table>
	</form>
</body>
</html>