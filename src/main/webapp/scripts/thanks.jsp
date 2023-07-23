<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you for answering!</title>

	<link rel="stylesheet" href="style.css" type="text/css">

</head>
<body>

	<jsp:include page="header.html"></jsp:include>
	
	<br/>
	<br/>
	<center>
		<table class="table">
			<tr>
			<th>
				<h2 class="thanks">Thank You for Answering~</h2>
				<br/>
				<br/>
				<form action="home.jsp">
    			<input type="submit" value="home" class="btn"/>
				</form>
			</th>
			</tr>
		</table>
	</center>
	
	<jsp:include page="footer.html"></jsp:include>

</body>
</html>