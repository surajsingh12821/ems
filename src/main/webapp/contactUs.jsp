
<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="./basic/basic.jsp"%>
</head>
<body>
<script language="javascript">
    window.history.forward();
</script><%
session.removeAttribute("currentUser");

session.invalidate();

 %>
	<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<!--  BODY -->
	<div class="container-fluid">
	
		<!-- Message Column Starts-------------------------------------------------------- -->
				<%
				String msg = request.getParameter("msg");
				if ("new".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<label class="text-dark"><b>Message Send  Successfully
						</b><i class="far fa-smile"></i></label>
				</div>
				<%
				}
				if ("not".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<label class="text-dark"><b>Message Not Send .Try
							Again<i class="far fa-frown-open"></i> !!!
					</b></label>
				</div>
				<%
				}%>
		<div class="row">
			<hr>
			<h2 class="text-center">Contact Us</h2>
			<hr>
			<div class="col-8">
				
					<!-- Image Response Column Start--------------------------------------------------------------------------->
					<div class="ratio ratio-4x3">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="img/2.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="img/class.jpg" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="img/tech.jpg" class="d-block w-100" alt="...">
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>

							</div>

						</div>
						</div>
					<!-- Image Response Column Ends--------------------------------------------------------------------------->
				
			</div>
			<div class="col-4  mb-1 bg-primary bg-opacity-50">
				<br>
				<h4 class="text-center p-2">Message Us</h4>
				<hr>
				<form action="ContactUs" method="post">
				<div class="container">
					<div class="mb-3">
						<label for="formGroupExampleInput" class="form-label">Name</label>
						<input type="text" class="form-control" id="formGroupExampleInput"
							name="name">
					</div>
					<div class="mb-3">
						<label for="formGroupExampleInput" class="form-label">Email-Id</label>
						<input type="text" class="form-control" id="formGroupExampleInput"
							name="email">
					</div>
					<div class="mb-3">
						<label for="formGroupExampleInput" class="form-label">Phone
							No</label> <input type="number" class="form-control"
							id="formGroupExampleInput" name="phoneno">
					</div>
					
					<br>
					<div class="form-floating">

						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" name="message" style="height: 120px"></textarea>
						<label for="floatingTextarea2">Message</label>
					</div>
					<br>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">

						<button class="btn btn-primary" type="submit">Send</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -------------------------------------------------------------------->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
	<!-- footer ends---------------------------------------------------------------->
</body>
</html>
<script>
$('#notification').delay(2000).hide(0);             
</script>