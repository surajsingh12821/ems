
<%@page import="Entity.Student"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.StudentDao"%>
<%@page import="Entity.User"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<%@include file="basic.jsp"%>
<%
User user = (User) session.getAttribute("validate");

if (user == null) {
	response.sendRedirect("../home.jsp?msg=error");
} else {
	if (user.getRole_Id()!=2)
		response.sendRedirect("../error.jsp");
	else
	{%>
		<nav class="navbar navbar-expand-lg fw-bold text-dark  text-black"
	style="background-color: rgba(117, 154, 255, 0.89);">
	<div class="container-fluid">
		<img src="../img/logo.jpg" width="120" height="40">
		<div class="collapse navbar-collapse justify-content-center"
			id="navbarCenteredExample">
			<!-- Left links -->
			
			<ul class="navbar-nav mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link active fw-bold text-dark" aria-current="page"
					href="StudentHome.jsp"><h5>
							<i class="fa-solid fa-house"></i> Home
						</h5></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-dark"
					href="courses.jsp"><h5>
							<i class="fas fa-book"> </i> Courses
						</h5></a></li>
			
			
				<li class="nav-item"><a class="nav-link fw-bold text-dark"
					href="posts.jsp"><h5>
							<i class="bi bi-postcard-fill"></i> Posts
						</h5></a></li>
				<li class="nav-item"><a class="nav-link fw-bold text-dark"
					href="#"><h5>
							<i class='fas fa-graduation-cap'></i> Result
						</h5></a></li>

			</ul>
			
		</div>
		<!-- Left links -->
		<label class="text-b fw-bold text-dark "><h5><%=user.getUser_Name()%>
				&nbsp;
			</h5></label>
		<div class="dropdown">
			<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
				href="#" id="navbarDropdownMenuAvatar" role="button"
				data-mdb-toggle="dropdown" aria-expanded="false"> <img
				src="../img/<%-- <%=user.getProfilePic()%> --%>" class="rounded-circle"
				height="40" width="43" alt="Black and White Portrait of a Man"
				loading="lazy" /> <i class="bi bi-caret-down-fill"></i>
			</a>

			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdownMenuAvatar">
				<li><a class="dropdown-item text-dark" data-bs-toggle="modal"
					data-bs-target="#viewProfile"><i class="bi bi-person-circle">View
							Profile</i></a></li>
				<li><a class="dropdown-item" data-bs-toggle="modal"
					data-bs-target="#viewSetting"><i class="bi bi-gear-fill">Settings</i></a></li>
				<li><a class="dropdown-item bg-danger text-light"
					href="../logout.jsp"><i class="bi bi-box-arrow-right">Sign
							out</i></a></li>
			</ul>
		</div>
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
				<h5 class="modal-title" id="exampleModalLabel">Education
					Management System</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid text-center">
					<img src="../img/<%-- <%=user.getProfilePic()%> --%>"
						style="width: 18rem; height: 17rem;" />
					<h5 class="model-title mt-2 text-center"><%=user.getEmail().toUpperCase()%></h5>

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
				<h5 class="modal-title" id="exampleModalLabel">Account Setting</h5>
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
