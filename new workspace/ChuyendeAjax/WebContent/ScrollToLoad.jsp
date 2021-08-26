<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<style>
			.container{
				width: 400px;
				height: 700px;
				overflow: scroll;
			}
		</style>
</head>
<body>
	<div class="container">
		<p>Javlặp, bộu t trình có thể là Notepad++, Netbean, Eclipse, … Chương trình Java đầu tiên Sau khi chuẩn bị xong môi trường và các công cụ cần thiết như ở trên chúng ta bắt tay vào viết chương trình đầu tiên, chương trình kinh điển hiển thị “HelloWorld”Java core là gì? Java Core là nền tảng của Java gồm các câu lệnh điều khiển , vòng lặp, chuỗi, mảng, các thư viện… Nói đơn giản thì khi các bạn học căn bản về Java thì chính là các bạn đang học Java Core. Môi trường và công cụ để bắt đầu Java Core Hệ điều hành: Windows, Mac hay Linux đều được. Java Development Kit (JDK): bộ công cụ hỗ trợ lập trình, trong nó có bộ biên dịch, bộ thực thi, môi trường lập trình… dùng để làm việc với Java. Công cụ lập trình (IDE): Một phần mềm hỗ trợ bạn lập trình có thể là Notepad++, Netbean, Eclipse, … Chương trình Java đầu tiên Sau khi chuẩn bị xong môi trường và các công cụ cần thiết như ở trên chúng ta bắt tay vào viết chương trình đầu tiên, chương trình kinh điển hiển thị “HelloWorld” Java core là gì? Java Core là nền tảng của Java gồm các câu lệnh điều khiển , vòng lặp, chuỗi, mảng, các thư viện… Nói đơn giản thì khi các bạn học căn bản về Java thì chính là các bạn đang học Java Core. Môi trường và công cụ để bắt đầu Java Core Hệ điều hành: Windows, Mac hay Linux đều được. Java Development Kit (JDK): bộ công cụ hỗ trợ lập trình, trong nó có bộ biên dịch, bộ thực thi, môi trường lập trình… dùng để làm việc với Java. Công cụ lập trình (IDE): Một phần mềm hỗ trợ bạn lập trình có thể là Notepad++, Netbean, Eclipse, … Chương trình Java đầu tiên Sau khi chuẩn bị xong môi trường và các công cụ cần thiết như ở trên chúng ta bắt tay vào viết chương trình đầu tiên, chương trình kinh điển hiển thị “HelloWorld”</p>
		<br>
		<br>	
	</div>
</body>

<script>
	var container = $('.container');
	container.on('scroll', scrollThis);
	
	function scrollThis(){
		var scollHeight = container[0].scrollHeight;
		var height = container.height();
		
// 		console.log(container.scrollTop()+height, "her...");
// 		console.log(scollHeight,"scheigh...");
		
		if(container.scrollTop()+height > scollHeight){
// 			console.log("unbind scroll");
			
			container.off('scroll', scrollThis);
			$.ajax({
				url:"http://localhost:8080/ChuyendeAjax/ham",
				success: function(res){
					console.log("ajax complete... rebind scroll");
					
					container.append("<p>avlặp, bộu t trình có thể là Notepad++, Netbean, Eclipse, … Chương trình Java đầu tiên Sau khi chuẩn bị xong môi trường và các công cụ cần thiết như ở trên chúng ta bắt tay vào viết chương trình đầu tiên, chương trình kinh điển hiển thị “HelloWorld”Java core là gì? Java Core là nền tảng của Java gồm các câu lệnh điều khiển , vòng lặp, chuỗi, mảng, các thư viện… Nói đơn giản thì khi các bạn học căn bản về Java thì chính là các bạn đang học Java Core. Môi trường và công cụ để bắt đầu Java Core Hệ điều hành: Windows, Mac hay Linux đều được. Java Development Kit</p>");
					
					container.off('scroll', scrollThis);
				}
			});
		}
	}
</script>
</html>