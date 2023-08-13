<%@page import="Entity.User"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<%@include file="basic.jsp"%>
<%
User user = (User) session.getAttribute("validate");
if (user == null) {
	response.sendRedirect("../home.jsp?msg=error");
} else {
	if (user.getRole_Id()!=1)
		response.sendRedirect("../error.jsp");
	else
	{%>
		<nav class="navbar navbar-expand-lg fw-bold text-light  text-black"
	style="background-color: rgba(255, 0 ,0)">
	<div class="container-fluid text-light">
		<img src="../img/logo.jpg" width="100" height="30">
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarCenteredExample">
			<!-- Left links -->
			
			<ul class="navbar-nav mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link active fw-bold text-light" aria-current="page"
					href="AdminHome.jsp"><h6>
							<i class="fa-solid fa-house"></i> Home
						</h6></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="Registration.jsp"><h6>
							<i class="bi bi-layers-fill"></i> Admission 
						</h6></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="pims.jsp"><h6>
							<i class="fas fa-book"> </i> PIMS
						</h6></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="courses.jsp"><h6>
							<i class="fas fa-book"> </i> Subjects
						</h6></a></li>
			
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="post.jsp"><h6>
							<i class="bi bi-postcard-fill"></i> Notice
						</h6></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="#"><h6>
							<i class='fas fa-graduation-cap'></i> Result
						</h6></a></li>
						
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="TimeTable.jsp"><h6>
							<i class="bi bi-calendar3"></i> Courses
						</h6></a></li>
						
				<li class="nav-item"><a class="nav-link fw-bold text-light"
					href="Fees.jsp"><h6>
							<i class="bi bi-calendar3"></i> Fees
						</h6></a></li>

			</ul>
			
		</div>
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarCenteredExample">
			<!-- Left links -->
			
			<ul class="navbar-nav">
				<li class="nav-item m-2"><h6><i class="bi bi-bell-fill"></i></h6></li>
				
				<li class="nav-item m-2"><h6><i class="bi bi-envelope"></i></h6></li>
			</ul>
			
		</div>
		<!-- Left links -->
		<label class="text-b fw-bold text-light "><h6><%=user.getUser_Name()%>
				&nbsp;
				&nbsp;
			</h6></label>
		<div class="dropdown ">
			<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
				href="#" id="navbarDropdownMenuAvatar" role="button"
				data-mdb-toggle="dropdown" aria-expanded="false"> <img
				src="../img/student.png<%-- <%=user.getProfilePic()%> --%>" class="rounded-circle"
				height="42" width="45" alt="Black and White Portrait of a Man"
				loading="lazy" /> 
			</a>

			<ul class="dropdown-menu dropdown-menu-end "
				aria-labelledby="navbarDropdownMenuAvatar">
				<li><a class="dropdown-item text-dark" data-bs-toggle="modal"
					data-bs-target="#viewProfile"><i class="bi bi-person-circle"> &nbsp; &nbsp; View
							Profile</i></a></li>
				<li><a class="dropdown-item" data-bs-toggle="modal"
					data-bs-target="#viewSetting"><i class="bi bi-gear-fill"> &nbsp; &nbsp; Settings</i></a></li>
				<li><a class="dropdown-item bg-danger text-light"
					href="../logout.jsp"><i class="bi bi-box-arrow-right">  &nbsp; &nbsp; Sign
							out</i></a></li>
			</ul>
		</div>
		&nbsp;
	
	</div>
</nav>
<script>
	$(document).ready(function() {
		$('.dropdown-toggle').dropdown()
	});
</script>
<div class="modal fade" id="viewProfile" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-primary text-dark bg-opacity-25">
				<h6 class="modal-title" id="exampleModalLabel">Education
					Management System</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid text-center">
					<img src="../img/<%-- <%=user.getProfilePic()%> --%>"
						style="width: 18rem; height: 17rem;" />
					<h6 class="model-title mt-2 text-center"><%=user.getEmail().toUpperCase()%></h6>

					<!-- view profile table -->
					<div id="profileDetail">
						<table class="table table-striped table-hover table-bordered">
							<tbody>
								<tr>
									<th scope="row">Id</th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th scope="row">Email-id</th>
									<td><%=user.getEmail().toUpperCase()%></td>
								</tr>
								<tr>
									<th scope="row">Phone No</th>
									<td><%=user.getPhone_No()%></td>
								</tr>
								<tr>
									<th scope="row">User Type</th>
									<td><%=user.getRole_Id()%></td>
								</tr>
								<tr>
									<th scope="row">Registration Status</th>
									<td><%=user.getReg_Date()%></td>
								</tr>
								<tr>
									<th scope="row">Account Created on</th>
									<td><%=user.getAccount_Status()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- profile edit -->
					<div id="profileEdit" style="display: none;">
						<form action="../UpdateProfile" method="post"
							enctype="multipart/form-data">
							<h6 class="text-danger">Edit Carefully</h6>
							<table class="table table-striped table-hover table-bordered">
								<tbody>
									<tr>
										<th scope="row">User Type</th>
										<td><%=user.getRole_Id()%></td>
									</tr>
									<tr>
										<th scope="row">Id</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">User Name</th>
										<td><input type="text" class="form-control"
											name="userName" value="<%=user.getUser_Name()%>"></td>
									</tr>
									<tr>
										<th scope="row">Phone No</th>
										<td><input type="number" class="form-control"
											name="phoneno" value="<%=user.getPhone_No()%>"></td>
									</tr>
									<tr>
										<th scope="row">Change Password</th>
										<td><input type="text" class="form-control"
											name="password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<th scope="row">Change Profile pic</th>
										<td><input type="file" name="profilePic"></td>
									</tr>
								</tbody>
							</table>
							<div class="container">
								<button type="submit" class="btn btn-outline-success">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer bg-primary bg-opacity-10">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button id="editProfileButton" type="button" class="btn btn-primary">Edit</button>
			</div>
		</div>

	</div>
</div>
<script>
	$(document).ready(function() {
		var edit = false;
		$('#editProfileButton').click(function() {
			if (edit == false) {
				$('#profileDetail').hide()
				$('#profileEdit').show();
				//alert("button clicked")
				$(this).text("View")
				edit = true;
			} else {
				//alert("button clicked")
				$('#profileDetail').show()
				$('#profileEdit').hide();
				$(this).text("Edit")
				edit = false;
			}

		})
	});
</script>
<div class="modal fade" id="viewSetting" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header bg-primary text-dark bg-opacity-25">
				<h6 class="modal-title" id="exampleModalLabel">Account Setting</h6>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-4">
							<div class="list-group" id="list-tab" role="tablist">
								<a class="list-group-item list-group-item-action active"
									id="list-home-list" data-bs-toggle="list" href="#list-home"
									role="tab" aria-controls="list-home">Setting</a> <a
									class="list-group-item list-group-item-action"
									id="list-profile-list" data-bs-toggle="list"
									href="#list-profile" role="tab" aria-controls="list-profile">Profile</a>
								<a class="list-group-item list-group-item-action"
									id="list-messages-list" data-bs-toggle="list"
									href="#list-messages" role="tab" aria-controls="list-messages">Messages</a>
								<a class="list-group-item list-group-item-action"
									id="list-settings-list" data-bs-toggle="list"
									href="#list-settings" role="tab" aria-controls="list-settings">Settings</a>
							</div>
						</div>
						<div class="col-8">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="list-home"
									role="tabpanel" aria-labelledby="list-home-list">
									<div class="conatiner-fluid">
										<h4>General Account Settings</h4>
										<hr>
										<table class="table">
											
											<tbody>
												<tr>
													<th scope="row">User Name </th>
													<td><%=user.getUser_Name() %></td>
													<td><h6><i class="bi bi-pencil-square"></i></h6></td>
												</tr>
												<tr>
													<th scope="row">Email id </th>
													<td><%=user.getEmail() %></td>
												</tr>
												<tr>
													<th scope="row">Password </th>
													<td><%=user.getPassword() %></td>
													<td><h6><i class="bi bi-pencil-square"></i></h6></td>
												</tr>
												<tr>
													<th scope="row">Contact</th>
													<td><%=user.getPhone_No() %></td>
													<td><h6><i class="bi bi-pencil-square"></i></h6></td>
													
												</tr>
												<tr>
													<th scope="row">User Type</th>
													<td><%=user.getRole_Id() %></td>
												</tr>
												
												
											</tbody>
										</table>

									</div>
								</div>
								<div class="tab-pane fade" id="list-profile" role="tabpanel"
									aria-labelledby="list-profile-list">...</div>
								<div class="tab-pane fade" id="list-messages" role="tabpanel"
									aria-labelledby="list-messages-list">...</div>
								<div class="tab-pane fade" id="list-settings" role="tabpanel"
									aria-labelledby="list-settings-list">...</div>
							</div>
						</div>
					</div>


				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
	<% }
}
%>
