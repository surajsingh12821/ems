<%@page import="Entity.User"%>
<%@page errorPage="../error.jsp"%>
<%
User user = (User) session.getAttribute("validate");
if (user == null) {
	response.sendRedirect("../home.jsp?msg=error");
} else {
	if (user.getRole_Id()!=1)
		response.sendRedirect("../error.jsp");
	else
	{%>
<nav
	class="navbar navbar-expand-lg  text-black"style="background-color:rgba(171, 222, 226, 1)">
	<div class="container-fluid">
		<img src="../img/logo.jpg" width="120" height="40">
			<div class="collapse navbar-collapse justify-content-center"
			id="navbarCenteredExample">
			<!-- Left links -->
			<ul class="navbar-nav mb-2 mb-lg-0">
			<%-- <%if(user.getAccountStatus().equalsIgnoreCase("Activated") && user.getRegApply().equalsIgnoreCase("no")){ %>
				<li class="nav-item"><a class="nav-link active fw-bold text-dark"
					aria-current="page" href="parentHome.jsp"><h5><i class="fa-solid fa-house"></i> Home</h5></a></li>
			<%}if(user.getAccountStatus().equalsIgnoreCase("pending")){ %>
			<li class="nav-item"><a class="nav-link active fw-bold text-dark"
					aria-current="page" href="parentHome.jsp"><h5><i class="fa-solid fa-house"></i> Home</h5></a></li>
				<li class="nav-item"><a class="nav-link active fw-bold text-dark"
					aria-current="page" href="../contactUs.jsp"><h5><i class="bi bi-telephone-fill"></i> ContactUs</h5></a></li>
			<%} %> --%>
			</ul>
		</div>
		<label class="text-b"><h5><%=user.getUser_Name()%>
				&nbsp;
			</h5></label>
		<div class="dropdown">
			<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
				href="#" id="navbarDropdownMenuAvatar" role="button"
				data-mdb-toggle="dropdown" aria-expanded="false"> <img
				src="../img/<%-- <%=user.getProfilePic() --%>%>" class="rounded-circle"
				height="40" width="43" alt="Black and White Portrait of a Man" loading="lazy" />
			</a>

			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdownMenuAvatar">
				<li><a class="dropdown-item text-" data-bs-toggle="modal"
					data-bs-target="#viewProfile">View Profile</a></li>
				<li><a class="dropdown-item" href="#">Settings</a></li>
				<li><a class="dropdown-item bg-danger text-light" href="../logout.jsp">Logout</a></li>
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
			<div class="modal-header text-dark"style="background-color:rgba(171, 222, 226, 1)">
				<h5 class="modal-title" id="exampleModalLabel">Education
					Management System</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid text-center">
					<img src="../img/<%-- <%=user.getProfilePic()%> --%>" style="width: 18rem; height: 15rem;" />
					<h5 class="model-title mt-2 text-center"><%=user.getUser_Name().toUpperCase()%></h5>

					<!-- view profile table -->
					<div id="profileDetail">
						<table class="table table-striped table-hover table-bordered">
							<tbody>
								<tr>
									<th scope="row"> Id </th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th scope="row"> Email-id </th>
									<td><%=user.getEmail().toUpperCase()%></td>
								</tr>
								<tr>
									<th scope="row"> Phone No </th>
									<td><%=user.getPhone_No()%></td>
								</tr>
								<tr>
									<th scope="row"> User Type </th>
									<td><%=user.getRole_Id()%></td>
								</tr>
								<tr>
									<th scope="row"> Registration Status </th>
									<td><%=user.getReg_Date()%></td>
								</tr>
								<tr>
									<th scope="row"> Account Created on </th>
									<td><%=user.getAccount_Status()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- profile edit -->
					<div id="profileEdit" style="display: none;">
						<form action="../UpdateProfile" method="post" enctype="multipart/form-data">
								<h6 class="text-danger">Edit Carefully</h6>
							<table class="table table-striped table-hover table-bordered">
							<tbody>
								<tr>
									<th scope="row">User Type </th>
									<td><%=user.getUser_Name().toUpperCase()%></td>
								</tr>
								<tr>
									<th scope="row"> Id </th>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<th scope="row"> User Name </th>
									<td><input type="text"  class="form-control" name="userName" value="<%=user.getUser_Name()%>"></td>
								</tr>
								
								<tr>
									<th scope="row"> Phone No </th>
									<td><input type="number"  class="form-control" name="phoneno" value="<%=user.getPhone_No()%>"></td>
								</tr>
								<tr>
									<th scope="row"> Change Password </th>
									<td><input type="text"  class="form-control" name="password" value="<%=user.getPassword()%>"></td>
								</tr>
								<tr>
									<th scope="row"> Change Profile pic </th>
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
<%}} %>
<script>
	$(document).ready(function(){
		var edit=false;
		$('#editProfileButton').click(function()
				{
				if(edit==false)
					{
					$('#profileDetail').hide()
					$('#profileEdit').show();
					//alert("button clicked")
					$(this).text("View")
					edit=true;
					}
				else
					{
					//alert("button clicked")
					$('#profileDetail').show()
					$('#profileEdit').hide();
					$(this).text("Edit")
					edit=false;
					}
			
		})
	});
</script>