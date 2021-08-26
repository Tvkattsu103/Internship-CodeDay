<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="update" method="post">
		<table>
			<tr>
				<td>ID:</td>
				<td>
					<input value="${st.studentId }" type="text" name="id" readonly/>
				</td>
			</tr>
			<tr>
				<td>Ho ten:</td>
				<td><input value="${st.hoten }" type="text" name="hoten" placeholder="Nhap ho ten"/></td>
			</tr>
			<tr>
				<td>Dia chi:</td>
				<td><select id="diachi" list="diachi" name="diachi"> 
					<datalist id="diachi-list">
						<option value="hu" ${st.diachi == 'hu'? "selected":""}>Hue</option>
						<option value="dn" ${st.diachi == 'dn'? "selected":""}>Da Nang</option>
					</datalist>
					</select>
				</td>
			</tr>
			<tr>
				<td>Ngay sinh:</td>
				<td><input value="${st.ngaysinh }" type="text" name="ngaysinh" placeholder="Nhap ngay sinh"/></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit">Update student</button></td>
			</tr>
		</table>
	</form>
</body>
</html>