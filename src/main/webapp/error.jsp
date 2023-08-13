<%@include file="./basic/basic.jsp"%>
<%@page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body style="background: url(img/error.jpg); background-size: cover;">
	<div class="conatiner "> 
		<div class="row">
			<div class="col-md-6 mt-7 p-5 offset-md-3 bg-dark">
				<div class="card" style="width: 43rem;">
					<div class="card-body">
						<div class="card-title"><h3>ERROR OCCURED</h3>
							<h1><%=exception %></h1>
							<p>Go to Home Page</p>
						<a href="../home.jsp" class="btn btn-primary">HomePage</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>