<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.UserDao"%>
<%@page import="java.util.List"%>

<%@include file="basic/basic.jsp"%>
<html>
<head>
<%@include file="basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Users</title>
</head>
<body
	style="background: url(../img/adminBg.jpg); background-size: cover;">
	<!-- navbar -->
	<%@include file="basic/navbar1.jsp"%>
	<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	UserDao userDao = new UserDao(MySqlConnection.getConnection());
	User editUsers = new User();
	editUsers = userDao.getUserById(userId);
	%>
	<div class="container-fluid">
		<div class="row p-2 justify-content-sm-center  ">
			<div class="col-6 bg-dark bg-opacity-10 fs-6" >
				<div class="card " style="width: 53rem; height: 39rem" >
					<div class="row g-7 " style="background-color: rgba(199, 0, 57 )">
						<div class="col-md-4 mt-5 p-3">
							<img src="../img/student.png<%-- <%=editUsers.getProfilePic()%> --%>"
								class="img-fluid rounded-start" alt="...">
						</div>
						<div class="col-sm-8 ">
							<h4 class="card-title text-center text-light p-2 mt-1 ">Edit User</h4>
							<div class="card-body">
								<form  action="../UpdateUser" method="post">
								<div id="updateUserForm" class="container-fluid  p-5 bg-dark">
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">User Id</label>
											<div class="col">
												<input type="text" class="form-control" id="inputPassword"
													name="userId" value="<%=editUsers.getId()%>"
													>
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">User Name</label>
											<div class="col">
												<input type="text" class="form-control" id="inputPassword"
													name="user_Name" value="<%=editUsers.getUser_Name()%>">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">Email</label>
											<div class="col">
												<input type="email" class="form-control" id="inputPassword"
													name="email" value="<%=editUsers.getEmail()%>"
													>
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">Password</label>
											<div class="col">
												<input type="text" class="form-control" id="inputPassword"
													name="password" value="<%=editUsers.getPassword()%>">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">Phone No</label>
											<div class="col">
												<input type="number" class="form-control" id="inputPassword"
													name="phone_No" value="<%=editUsers.getPhone_No()%>">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword" class="col text-light col-form-label">User Type</label>
											<div class="col">
												<input type="text" name="role_Id" class="form-control" id="inputPassword"
													value="<%=editUsers.getRole_Id()%>">
											</div>
										</div>
										<div class="mb-3 row">
											<label for="inputPassword"
												class="col text-light col-form-label">Account Status</label>
											<div class="col">
												<select class="form-select" name="Account_Status"
													aria-label="Default select example">
													<option  value="<%=editUsers.getAccount_Status()%>" selected><%=editUsers.getAccount_Status()%></option>
													<option value="Activated">ACTIVE</option>
													<option value="deActivated">DEACTIVATED</option>
												</select> 
											</div>
										</div>
										
										<div class="mb-3 float-end ">
											<a href="Registration.jsp" class="btn btn-info">Back</a>
											<button type="submit" id="submit" class="btn btn-warning">Update</button>
										</div>
									


								</div>
								</form>
								<p class="card-text ">
									<small class=" text-light">Account Registration Date : <%=editUsers.getReg_Date()%></small>
										
								
								</p>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./basic/footer.jsp"%>
</body>
</html>
<!-- <script>
	$(document)
			.ready(
					function(e) {
						$("#updateUserForm")
								.on(
										"submit",
										function(event) {
											event.preventDefault();
											console
													.log("submitted the form data")
											let form = new FormData(this);
											$
													.ajax({
														url : "../UpdateUser",
														type : 'POST',
														data : form,
														success : function(
																data,
																textStatus,
																jqXHR) {
															console.log(data);
															if (data.trim() == 'done') {
																swal(
																		"Good job!",
																		"Post Saved Successfully",
																		"success");
															}
														},
														error : function(jqXHR,
																textStatus,
																errorThrow) {
															swal(
																	"Error!",
																	"Something went Wrong Try Again",
																	"error");
														},
														processData : false,
														contentType : false
													})
										})
					})
</script> -->