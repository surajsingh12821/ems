<%@page import="java.util.Map.Entry"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.RoleDao"%>
<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<!--  BODY -->
	<div class="container-fluid fw-bold text-dark ">
		<div class="row justify-content-between ">
			<hr>
			<h3 class="text-center">Welcome to Education Management System</h3>
			<hr>
			<div class="col-md-8  justify-content-center">
				<!-- Message Column Starts-------------------------------------------------------- -->
				<%
				String msg = request.getParameter("msg");
				if ("error".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<label class="text-dark"><b>Error !!! Try Again<i
							class="far fa-sad-cry"></i></b></label>
				</div>
				<%}
				if ("exist".equals(msg)) {
					%>
				<div class="alert alert-danger" role="alert" id="notification">
					<label class="text-dark"><b>Email already exists.Try
							With Different Email.<i class="far fa-times-circle"></i>
					</b></label>
				</div>
				<%}
				if ("reg".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<label class="text-dark"><b>Successfully Registered</b></label>
				</div>
				<%
				}
				if ("send".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<label class="text-dark"><b>Message Send Successfully</b></label>
				</div>
				<%
				}if("notExist".equals(msg)){
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<label class="text-dark"><b>Email or Password Credentials are Wrong <i class="far fa-times-circle"></i>
					</b></label>
				</div>
				
				<%}if("logout".equals(msg)){ %>
				<div class="alert alert-success" role="alert" id="notification">
					<label class="text-dark"><b> Successfully Logout</b></label>
				</div>
				<%}%>
				<!-- Message Column Ends--------------------------------------------------------------------------->



				<!-- Image Response Column Start--------------------------------------------------------------------------->
				<div class="ratio ratio-4x3">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="img/a.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="img/2.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="img/3.jpg" class="d-block w-100" alt="...">
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
				<!-- Image Response Column Ends--------------------------------------------------------------------------->
			</div>


			<!-- -------------------------------------- -->
			<!-- login Button trigger modal -->
			<!-- Modal -->
			<div class="modal fade" id="loginModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<form action="Login" method="post">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header text-light bg-dark bg-opacity-75">
								<h5 class="modal-title " id="exampleModalLabel">Log in</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row mb-3">
									<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
									<div class="col-sm-10">
										<input type="email" name="email" class="form-control"
											id="inputEmail3">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
									<div class="col-sm-10">
										<input type="password" name="password" class="form-control"
											id="inputPassword3">
									</div>
								</div>

								<div class="row mb-3">
									<div class="col-sm-10 offset-sm-2">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="gridCheck1"> <label class="form-check-label"
												for="gridCheck1"> save password</label> <br>
										</div>
									</div>
								</div>

								<div class="text-end "></div>
							</div>
							<div
								class="modal-footer justify-content-between text-light bg-primary bg-opacity-10">
								<a class="fs-6" data-bs-toggle="modal"
									data-bs-target="#forgetPasswordForm"> <b
									class="text-danger">Click forget password</b></a>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- login button ends-------------------------------------- -->


			<!--Col 2  ------------------------------------------------------------->
			<div class="col-md-4 align-self-start p-4 bg-primary bg-opacity-25 ">
				<br>
				<h3 class="text-center">Create New Account</h3>
				<p class="fw-light fst-italic text-center">Create a New User Account
					Of Education Management System</p>
				<hr>
				<form id="myform" action="SignUp" method="post">
					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-3 col-form-label">
							User Name:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="user_Name"
								id="inputEmail3" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-3 col-form-label">Email</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="email"
								id="inputEmail3" required="required">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-3 col-form-label">Password</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="password"
								id="inputPassword3">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-3 col-form-label">PhoneNo</label>
						<div class="col-sm-9">
							<input type="number" class="form-control" name="phone_No"
								id="inputPassword3">
						</div>
					</div>
					<div class="row mb-4">
						<label for="inputPassword3" class="col-sm-6 col-form-label">Type
							of User</label>
						<div class="col-sm-6">
							<select class="form-select" name="role"
								aria-label="Default select example" required>
								<option selected disabled>choose any...</option>
								<%
								RoleDao roleDao = new RoleDao(MySqlConnection.getConnection());
								HashMap<Integer, String> map = roleDao.getRoleNames();
								for (Entry<Integer, String> entry : map.entrySet()) {
								%>
								<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
								<%
								}
								%>
							</select>
						</div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#loginModal">Log
							in</button>
						<button type="submit" value="signin" class="btn btn-success">Sign
							up</button>
					</div>
				</form>
			</div>
		</div>
		<!--ROW -1 ENDS  ------------------------------------------------------------->
		<!--ROW -2 Starts  -------------------------------------------------------------->
		<div class="row justify-content-between p-5">
			<div class="card p-2" style="width: 15rem;">
				<img src="img/document.png" class="card-img-top p-2" alt="...">
				<a href="courses.jsp" class="text-center text-dark"><h5>Courses</h5></a>
			</div>
			<div class="card p-2" style="width: 15rem;">
				<img src="img/sub.png" class="card-img-top" alt="..."> <a
					href="books.jsp" class="text-center text-dark"><h5>Books</h5></a>
			</div>
			<div class="card p-2" style="width: 15rem;">
				<img src="img/ss.png" class="card-img-top" alt="..."> <a
					href="result.jsp" class="text-center text-dark"><h5>Results</h5></a>
			</div>
			<div class="card p-2" style="width: 15rem;">
				<img src="img/summary.jpg" class="card-img-top" alt="..."> <a
					href="notice.jsp" class="text-center text-dark"><h5>Notice</h5></a>
			</div>
			<div class="card p-2" style="width: 15rem;">
				<img src="img/contact.png" class="card-img-top" alt="..."> <a
					href="contactUs.jsp" class="text-center text-dark"><h5>Contact
						Us</h5></a>
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
<!--forget password----------------------------------------------  -->
<div class="modal fade" id="forgetPasswordForm"
	data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h5 class="modal-title" id="staticBackdropLabel">
					<b class="text-light">Forget Password</b>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="forgetPasswordAction.jsp" method="get">
				<div class="modal-body">
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-4 col-form-label">Email
							id</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email"
								id="inputPassword">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-4 col-form-label">Phone
							no</label>
						<div class="col-sm-8">
							<input type="number" class="form-control" name="phone_No"
								id="inputPassword">
						</div>
					</div>

					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-6 col-form-label">Type
							of User</label>
						<div class="col-sm-6">
							<select class="form-select" name="role" type="number"
								aria-label="Default select example" required>
								<option selected disabled>choose any...</option>
								<%
								HashMap<Integer, String> mapq = roleDao.getRoleNames();
								for (Entry<Integer, String> entry : mapq.entrySet()) {
								%>
								<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
								<%
								}
								%>
							</select>
						</div>
					</div>
					<div class="row mb-4">
						<label for="inputPassword3" class="col-sm-4 col-form-label">New
							Password</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="password"
								id="inputPassword3">
						</div>
					</div>
					<div class="modal-footer">
						<a href="home.jsp" class="btn btn-danger">Back</a>
						<button type="submit" value="signin" class="btn btn-success">Save</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$('#notification').delay(2000).hide(0);
</script>


