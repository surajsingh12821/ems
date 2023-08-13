<%@page import="Entity.TeacherRegForm"%>
<%@page import="Dao.TeacherFormDao"%>
<%@page import="Dao.StudentFormDao"%>
<%@page import="Entity.StudentRegForm"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="Entity.Role"%>
<%@page import="Dao.RoleDao"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.UserDao"%>
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

	<%UserDao userDao = new UserDao(MySqlConnection.getConnection());%>
	<div class="row-col-12 bg-dark">
		<div class="d-grid gap-2 p-2 d-md-flex justify-content-md-end">
			<button class="btn btn-secondary me-md-2" type="button"
				data-bs-toggle="modal" data-bs-target="#addNewPostModal">
				<i class="bi bi-person-check-fill"></i> Total Users=<%=userDao.getMaxUserId()%></button>
		</div>
	</div>
	<div class="container-fluid   bg-dark bg-opacity-10 fs-6">
		<div class="row">
			<div class="col-sm-2 p-2 mt-4 mb-4">
				<div class="list-group list-group-light">
					<a onclick="myFunction('addNewUser')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-primary"><i
						class="fas fa-user-plus"> New User </i> </a> <a
						onclick="myFunction('searchUser')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
						class="fas fa-user-plus"> Search User </i> </a> <a
						onclick="myFunction('listAllUsers')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary"><i
						class="fas fa-users"> List  All Users </i></a> <a
						onclick="myFunction('listAllActiveUsers')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
						class="fas fa-user-check"> Active Users </i></a> <a
						onclick="myFunction('listAllPendingUsers')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
						class="fas fa-user-clock"> InActive Users </i></a> <a
						onclick="myFunction('pendingRegistration')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-warning"><i
						class="fas fa-user-shield"> Registration</i> </a> <a
						onclick="myFunction('confirmedRegistration')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
						class="fas fa-external-link-alt"></i> Confirmed Registration </a>
				</div>

			</div>
			<div class="col-md-10 h-100 mt-2">
				<!-- Msg Box ----------------------------------------------------------------------------------->
				<%
				String msg = request.getParameter("msg");
				if ("activated".equals(msg)) {
				%><p class="alert alert-success" role="alert" id="notification">
					User Activated Successfully <i class="far fa-check-circle"></i>
				</p>
				<%}if ("updated".equals(msg)) {%>
				<p class="alert alert-success" role="alert" id="notification">
					User Updated Successfully<i class="far fa-check-circle"></i>
				</p>
				<%}if ("notdeleted".equals(msg)) {%>
				<p class="alert alert-danger" role="alert" id="notification">
					User Not Deleted ERROR!<i class="far fa-times-circle"></i>
				</p>
				<%}if ("deleted".equals(msg)) {%>
				<p class="alert alert-success" role="alert" id="notification">
					User Deleted Successfully <i class="far fa-check-circle"></i>
				</p>
				<%}if ("new".equals(msg)) {%>
				<p class="alert alert-success" role="alert" id="notification">
					<b>New User Successfully Created.</b><i class="far fa-smile"></i></label>
				</p>
				<%}if ("notcreated".equals(msg)) {%>
				<p class="alert alert-danger" role="alert" id="notification">
					User not created <i class="far fa-times-circle"></i>
				</p>
				<%}if ("exist".equals(msg)) {%>
				<p class="alert alert-danger" role="alert" id="notification">
					User already Exists <i class="far fa-times-circle"></i>
				</p>
				<%}if("wel".equals(msg)){%>
				<p class="alert alert-success" role="alert" id="notification">
					<b>Welcome Admin</b><i class="far fa-smile"></i></label>
				</p>
				<%}if("Confirmed".equals(msg)){%>
				<p class="alert alert-success" role="alert" id="notification">
					<b>Registration Confirmed</b><i class="far fa-smile"></i></label>
				</p>
				<%}if("notConfirmed".equals(msg)){%>
				<p class="alert alert-success" role="alert" id="notification">
					<b>Registration Not Confirmed</b><i class="far fa-smile"></i></label>
				</p>
				<%}if("alreadyConf".equals(msg)){%>
				<p class="alert alert-success" role="alert" id="notification">
					<b>Registration is already Confirmed</b><i class="far fa-smile"></i></label>
				</p>
				<%} %>
				<!-- Msg Box ----------------------------------------------------------------------------------->
				<!-- add New User ------------------------------------------------------------------------>
				<div class="container  text-light bg-dark bg-opacity-100% fs-6"
					id="addNewUser" style="display: none">
					<br>
					<h3 class="text-center">Add New User</h3>
					<hr>
					<div class="row">
						<div class="card " style="width: 12rem;">
							<img src="../img/new.png" class="card-img-top" alt="...">
						</div>
						<div class="col-10">
							<form id="addNewUserForm" action="../AddUser" method="post">
								<div class="table-responsive">
									<table class="table text-light table-sm table-borderless">
										<tbody>
											<tr>
												<th scope="row">User Id</th>
												<%
													int total = 1 + userDao.getMaxUserId();
												%>
												<td><input type="number" class="form-control"
													id="inputPassword2" name="userId" value="<%=total%>"></td>
												<th scope="row">User Name</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="user_Name" required></td>
											</tr>
											<tr>
												<th scope="row">Email id</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="email" required></td>
												<th scope="row">Password</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="password" required></td>
											</tr>
											<tr>
												<th scope="row">Phone no</th>
												<td><input type="number" class="form-control"
													id="inputPassword2" name="phone_No" required></td>
												<th scope="row">User Type</th>
												<td><select class="form-select" name="role"
													aria-label="Default select example" required>
														<option disabled="disabled">choose any...</option>
														<%
														RoleDao roleDao=new RoleDao(MySqlConnection.getConnection());
														
														HashMap<Integer,String> list = roleDao.getRoleNames();
														for (Entry<Integer,String> e: list.entrySet()) {
														%><option value="<%=e.getKey()%>"><%=e.getValue()%></option>
														<%}%>
												</select></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td><button type="submit" id="submit1"
														class="btn btn-success">Submit Now</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
					

				</div>
				<div
					class="container-fluid  text-light bg-dark bg-opacity-100% fs-6"
					id="searchUser" style="display: none">
					<br>
					<h3 class="text-center">Search User</h3>
					<div class="row">

						<hr>
						<div class="card " style="width: 12rem;">
							<img src="../img/male.png" class="card-img-top" alt="...">
						</div>
						<div class="col-7">
							<form action="../searchUser" method="post">	
								<div class="table-responsive">
									<table class="table text-light table-sm table-borderless">
																		<tbody>
											<tr>
												<th scope="row">SEARCH BY USER ID</th>

												<td><input type="text" class="form-control"
													id="inputPassword2" name="userId"></td>

												<td><button onclick="myFunction('showDetail')"
														class="btn btn-success">Search</button></td>
											</tr>
											<tr>
												<th scope="row">SEARCH BY EMAIL-ID</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="email" ></td>

												<td><button onclick="myFunction('showDetail')"
														class="btn btn-success">Search</button></td>
											</tr>
											<tr>
												<th scope="row">SEARCH BY USERNAME</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="user_Name"></td>

												<td><button onclick="myFunction('showDetail')"
														class="btn btn-success">Search</button></td>
											</tr>
											

										</tbody>
										</form>
									</table>
								</div>
							</form>
						</div>
					</div>
					<div
					
						<% User searchUser=(User)request.getServletContext().getAttribute("user") ;
						
						if (searchUser== null)
						{
						out.println("<div class='col align-self-center m-5 p-4'><h1 class='display-4 text-center text-light '><br>No User Available<br> </h1></div>");
						}
						else
						{
						%>
						class="row  text-light bg-dark bg-opacity-100% fs-6"
					id="showDetail" style="display: none">
						
						<br>
						<hr>
						<h5 class="text-center">Result</h5>
						<hr>
						<div class="col-sm-12 bg-dark  fs-6">
							<div class="table-responsive">
								<table class="table text-light table-sm table-borderless">
									<tbody>
									<thead class="table-secondary">
										<tr>
											<th scope="col">User-Id</th>
											<th scope="col">User Name</th>
											<th scope="col">Email-Id</th>
											<th scope="col">Phone-No</th>
											<th scope="col">User-Type</th>
											<th scope="col">Account-Status</th>
											<th scope="col">Edit-User</th>
											<th scope="col">Delete-User</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<th scope="row"><%=searchUser.getId()%></th>
											<td><%=searchUser.getUser_Name()%></td>
											<td><%=searchUser.getEmail()%></td>
											<td><%=searchUser.getPhone_No()%></td>
											<td><%=searchUser.getRole_Id()%></td>
											<td><%=searchUser.getAccount_Status()%></td>

											<td><a href="load_User.jsp?userId=<%=searchUser.getId()%>"><i
													class="far fa-edit"></i></a></td>
											<td><a
												href="deleteUser.jsp?userId=<%=searchUser.getId()%>"><i
													class="far fa-trash-alt"></i></a></td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
						
						<%} %>
					</div>
				</div>
				<!--------------------------------------------------------------------------------------->
				<div
					class="container-fluid  text-light bg-dark bg-opacity-100% fs-6"
					id="listAllUsers" style="display: none">
					<br>
					<h3 class="text-center">List All Users</h3>
					<hr>

					<div class="row">
						<div class="col-sm-12 bg-dark  fs-6">
							<div class="table-responsive">
								<table class="table text-light table-sm table-borderless">
									<tbody>
									<thead class="table-secondary">
										<tr>
											<th scope="col">User-Id</th>
											<th scope="col">User Name</th>
											<th scope="col">Email-Id</th>
											<th scope="col">Phone-No</th>
											<th scope="col">User-Type</th>
											<th scope="col">Account-Status</th>
											<th scope="col">Edit-User</th>
											<th scope="col">Delete-User</th>
										</tr>
									</thead>
									<tbody>
										<% List<User> u=userDao.getAllUser();
											for(User users:u)
											{
										%>
										<tr>
											<th scope="row"><%=users.getId()%></th>
											<td><%=users.getUser_Name()%></td>
											<td><%=users.getEmail()%></td>
											<td><%=users.getPhone_No()%></td>
											<td><%=users.getRole_Id()%></td>
											<td><%=users.getAccount_Status()%></td>

											<td><a href="load_User.jsp?userId=<%=users.getId()%>"><i
													class="far fa-edit"></i></a></td>
											<td><a
												href="deleteUser.jsp?userId=<%=users.getId()%>"><i
													class="far fa-trash-alt"></i></a></td>
										</tr>
										<%} %>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!----------------------------------------------------------------------------------------------->
				<!-- -----------All active Users--------------------------- ---------------------->
				<div
					class="container-fluid  text-light bg-dark bg-opacity-100% fs-6"
					id="listAllActiveUsers" style="display: none">
					<h3 class="text-center">Active Users</h3>
					<hr>
					<div class="list-group list-group-light">
						<div class="row">
							<div class="col-sm">
								<a onclick="myFunction('allActive')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
									class="fas fa-user-plus"> All </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('sActive')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
									class="fas fa-user-plus"> Student </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('tActive')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
									class="fas fa-user-plus"> Teacher </i> </a>
							</div>
							<div class="col-sm">

								<a onclick="myFunction('pActive')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
									class="fas fa-user-plus"> Parents </i> </a>
							</div>
						</div>
					</div>
					<!--  ------------all------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="allActive" style="display: none">
						<h3 class="text-center">All Active Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-success">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>
										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								List<User> list1=userDao.getAllActiveUser();
		 						for(User user1:list1){
								%>
								<tr>
									<th scope="row"><%=user1.getId()%></th>
									<td><%=user1.getUser_Name()%></td>
									<td><%=user1.getEmail()%></td>

									<td><%=user1.getRole_Id()%></td>
									<td><%=user1.getAccount_Status()%></td>
									<td><a href="load_User.jsp?userId=<%=user1.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user1.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Student------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="sActive" style="display: none">
						<h3 class="text-center">Active Student Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-success">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								 List<User> list2=userDao.getAllActive(2);
			 						for(User user2:list2){
								%>
								<tr>
									<th scope="row"><%=user2.getId()%></th>
									<td><%=user2.getUser_Name()%></td>
									<td><%=user2.getEmail()%></td>

									<td><%=user2.getRole_Id()%></td>
									<td><%=user2.getAccount_Status()%></td>
									<td><a href="load_User.jsp?userId=<%=user2.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user2.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Teacher------>

					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="tActive" style="display: none">
						<h3 class="text-center">Active Teacher Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-success">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								List<User> list3=userDao.getAllActive(3);
						  		for(User user3:list3){
						  		
								%>
								<tr>
									<th scope="row"><%=user3.getId()%></th>
									<td><%=user3.getUser_Name()%></td>
									<td><%=user3.getEmail()%></td>

									<td><%=user3.getRole_Id()%></td>
									<td><%=user3.getAccount_Status()%></td>
									<td><a href="load_User.jsp?userId=<%=user3.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user3.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Parent------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="pActive" style="display: none">
						<h3 class="text-center">Active Parents Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-success">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								List<User> list4=userDao.getAllActive(4);
								for(User user4:list4){
								%>
								<tr>
									<th scope="row"><%=user4.getId()%></th>
									<td><%=user4.getUser_Name()%></td>
									<td><%=user4.getEmail()%></td>

									<td><%=user4.getRole_Id()%></td>
									<td><%=user4.getAccount_Status()%></td>
									<td><a href="load_User.jsp?userId=<%=user4.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user4.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--  ----------------------------------------------------------------------------------------------------->
				<!-- -----------All PENDING Users--------------------------- ---------------------->
				<div class="container  text-light bg-dark bg-opacity-100% fs-6"
					id="listAllPendingUsers" style="display: none">
					<h3 class="text-center">Pending Users</h3>
					<hr>
					<div class="list-group list-group-light">
						<div class="row">
							<div class="col-sm">
								<a onclick="myFunction('allP')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
									class="fas fa-user-plus"> All </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('sP')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
									class="fas fa-user-plus"> Student </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('tP')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
									class="fas fa-user-plus"> Teacher </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('pP')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
									class="fas fa-user-plus">Parents </i> </a>
							</div>
						</div>
					</div>
					<!--  ------------all------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="allP" style="display: none">
						<h3 class="text-center">All Pending Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-danger">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
									List<User> list5=userDao.getAllInActiveUser();
									for(User user5:list5){
								%>
								<tr>
									<th scope="row"><%=user5.getId()%></th>
									<td><%=user5.getUser_Name()%></td>
									<td><%=user5.getEmail()%></td>

									<td><%=user5.getRole_Id()%></td>
									<td><%=user5.getAccount_Status()%></td>
									<td><a href="editUserAction.jsp?userId=<%=user5.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user5.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Student------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="sP" style="display: none">
						<h3 class="text-center">Pending Student Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-danger">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								List<User> list6=userDao.getAllInActive(2);
								for(User user6:list6){
								%>
								<tr>
									<th scope="row"><%=user6.getId()%></th>
									<td><%=user6.getUser_Name()%></td>
									<td><%=user6.getEmail()%></td>

									<td><%=user6.getRole_Id()%></td>
									<td><%=user6.getAccount_Status()%></td>
									<td><a href="editUserAction.jsp?userId=<%=user6.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUser.jsp?userId=<%=user6.getId()%>"><i
											class="far fa-trash-alt"
											></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Teacher------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="tP" style="display: none">
						<h3 class="text-center">Pending Teacher Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-danger">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
									List<User> list7=userDao.getAllInActive(3);
									for(User user7:list7){
								%>
								<tr>
									<th scope="row"><%=user7.getId()%></th>
									<td><%=user7.getUser_Name()%></td>
									<td><%=user7.getEmail()%></td>

									<td><%=user7.getRole_Id()%></td>
									<td><%=user7.getAccount_Status()%></td>
									<td><a href="editUserAction.jsp?userId=<%=user7.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserAction.jsp?userId=<%=user7.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Parent------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="pP" style="display: none">
						<h3 class="text-center">Pending Parents Users</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-danger">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>

										<th scope="col">User Type</th>
										<th scope="col">Account-Status</th>
										<th scope="col">Reg-Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
									List<User> list8=userDao.getAllInActive(4);
									for(User user8:list8){
								%>
								<tr>
									<th scope="row"><%=user8.getId()%></th>
									<td><%=user8.getUser_Name()%></td>
									<td><%=user8.getEmail()%></td>

									<td><%=user8.getRole_Id()%></td>
									<td><%=user8.getAccount_Status()%></td>
									<td><a href="editUserAction.jsp?userId=<%=user8.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserAction.jsp?userId=<%=user8.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!------------------------------------------------------------------------------------------------------->

				<!----------------------------------------------------------------------------------------------->
				<!-- -----------All pending Registration Users--------------------------- ---------------------->
				<div
					class="container-fluid  text-light bg-dark bg-opacity-100% fs-6"
					id="pendingRegistration" style="display: none">
					<h3 class="text-center">Pending Registration</h3>
					<hr>
					<div class="list-group list-group-light">
						<div class="row">
							<div class="col-sm">
								<a onclick="myFunction('sPReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-warning"><i
									class="fas fa-user-plus"> Student </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('tPReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-warning"><i
									class="fas fa-user-plus"> Teacher </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('pPReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-warning"><i
									class="fas fa-user-plus"> Parents </i> </a>
							</div>
						</div>
					</div>
					<!--  ------------Student------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="sPReg" style="display: none">
						<h3 class="text-center">Students Registration Pending</h3>
						<hr>
						<div class="table-responsive">
							<table class="table table-sm text-light table-border">
								<tbody>
								<thead class="table-warning">
									<tr>
										<th scope="col">Reg-Id</th>
										<th scope="col">FirstName</th>
										<th scope="col">LastName</th>
										<th scope="col">FatherName</th>
										<th scope="col">MotherName</th>
										<th scope="col">Gender</th>
										<th scope="col">Birth</th>
										<th scope="col">Blood Group</th>
										<th scope="col">Year Id</th>
										<th scope="col">Class Id</th>
										<th scope="col">Edit</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<%
									StudentFormDao studentFormDao=new StudentFormDao(MySqlConnection.getConnection());
									List<StudentRegForm> studentRegForms=studentFormDao.getAllForm();
									for(StudentRegForm sf:studentRegForms){
									
										%>
								<tr>
									<th scope="row"><%=sf.getId()%></th>
									<td><%=sf.getFirstName()%></td>
									<td><%=sf.getLastName()%></td>
									<td><%=sf.getFatherName()%></td>
									<td><%=sf.getMotherName()%></td>
									<td><%=sf.getGender()%></td>
									<td><%=sf.getDob()%></td>
									<td><%=sf.getBloodGroup()%></td>
									<td><%=sf.getYear_Id()%></td>
									<td><%=sf.getClass_Id()%></td>
									<td><a href="editRegStudent.jsp?id=<%=sf.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a href="deleteRegStudent?id=<%=sf.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  
					<!--  ------------Teacher------>
					<div class="container-12  text-light bg-dark bg-opacity-10 fs-6"
						id="tPReg" style="display: none">
						<h3 class="text-center">Teacher Registration Pending</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-warning">
									<tr>
										<th scope="col">Reg-Id</th>
										<th scope="col">FirstName</th>
										<th scope="col">LastName</th>
										<th scope="col">FatherName</th>
										<th scope="col">MotherName</th>
										<th scope="col">Gender</th>
										<th scope="col">Birth</th>
										<th scope="col">Blood Group</th>
										<th scope="col">Martial Status</th>
										<th scope="col">Designation</th>
										<th scope="col">Experience</th>
										<th scope="col">Degree</th>
										<th scope="col">Joining Date</th>
										<th scope="col">SUbject Id</th>
										<th scope="col">Salary Expected</th>
										<th scope="col">Edit</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<%
									TeacherFormDao teacherFormDao=new TeacherFormDao(MySqlConnection.getConnection());
									List<TeacherRegForm> teacherRegForms=teacherFormDao.getAllForm();
									for(TeacherRegForm tf:teacherRegForms){
								%>
								<tr>
									<th scope="row"><%=tf.getId()%></th>
									<td><%=tf.getFirstName()%></td>
									<td><%=tf.getLastName()%></td>
									<td><%=tf.getFatherName()%></td>
									<td><%=tf.getMotherName()%></td>
									<td><%=tf.getGender()%></td>
									<td><%=tf.getDob()%></td>
									<td><%=tf.getBloodGroup()%></td>
									<td><%=tf.getMaritalStatus()%></td>
									<td><%=tf.getDesignation() %>
									<td><%=tf.getExperience()%></td>
									<td><%=tf.getHighestDegree() %>
									<td><%=tf.getJoiningDate()%></td>
									<td><%=tf.getSubject_Id() %>
									<td><%=tf.getSalaryExp()%></td>
									<td><a href="editRegTeacher.jsp?id=<%=tf.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a href="deleteRegTeacher?id=<%=tf.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Parent------>
					<div class="container-12  text-light bg-dark bg-opacity-10 fs-6"
						id="pPReg" style="display: none">
						<h3 class="text-center">Parents Registration Pending</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-warning">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>
										<th scope="col">Password</th>
										<th scope="col">Phone No</th>
										<th scope="col">User Type</th>
										<th scope="col">Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%-- <% 
								try {
									Connection connection = ConnectionProvider.getConnection();
									PreparedStatement statement = connection
									.prepareStatement("select * from users where accountStatus='activated'and userType='parent'");
									ResultSet rs = statement.executeQuery();
									while (rs.next()) {
								%>
								<tr>
									<th scope="row"><%=rs.getString(1)%></th>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(7)%></td>
									<td><a href="editUserAction.jsp?id=<%=rs.getString(1)%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserAction.jsp?id=<%=rs.getString(1)%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}} catch (Exception exception) {System.out.println(exception);}%> 
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<%-- <!--  ----------------------------------------------------------------------------------------------------->
				<div
					class="container-fluid  text-light bg-dark bg-opacity-100% fs-6"
					id="confirmedRegistration" style="display: none">
					<h3 class="text-center">Confirmed Registration</h3>
					<hr>
					<div class="list-group list-group-light">
						<div class="row">
							<div class="col-sm">
								<a onclick="myFunction('sCReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
									class="fas fa-user-plus"> Student </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('tCReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
									class="fas fa-user-plus"> Teacher </i> </a>
							</div>
							<div class="col-sm">
								<a onclick="myFunction('pCReg')"
									class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
									class="fas fa-user-plus"> Parents </i> </a>
							</div>
						</div>
					</div>
					<!--  ------------Student------>
					<div class="container-12  text-light bg-dark bg-opacity-10 fs-6"
						id="sCReg" style="display: none">
						<h3 class="text-center">Confimed Student List</h3>
						<hr>
						<div class="table-responsive">
							<table class="table table-sm text-light table-border">
								<tbody>
								<thead class="table-info">
									<tr>
										<th scope="col">Reg-Id</th>
										<th scope="col">Roll No</th>
										<th scope="col">FirstName</th>
										<th scope="col">LastName</th>
										<th scope="col">FatherName</th>
										<th scope="col">MotherName</th>
										<th scope="col">Birth</th>
										<th scope="col">Registration Date</th>
										<th scope="col">Student Staus</th>
										<th scope="col">Edit</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<%
								try {
									Connection connection = ConnectionProvider.getConnection();
									PreparedStatement statement = connection.prepareStatement("SELECT * FROM studentDetail where studentStatus='Active'");
									ResultSet rs = statement.executeQuery();
									while (rs.next()) {
								%>
								<tr>
									<th scope="row"><%=rs.getString(1)%></th>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getString(10)%></td>
									<td><%=rs.getString(18)%></td>
									<td><a href="editRegStudent.jsp?id=<%=rs.getString(1)%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserRegAction.jsp?id=<%=rs.getString(1)%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}} catch (Exception exception) {System.out.println(exception);}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------teacher------>
					<div class="container-12  text-light bg-dark bg-opacity-10 fs-6"
						id="tCReg" style="display: none">
						<h3 class="text-center">Confirmed Teacher List</h3>
						<hr>
						<div class="table-responsive">
							<table class="table table-sm text-light table-border">
								<tbody>
								<thead class="table-info">
									<tr>
										<th scope="col">Reg-Id</th>
										<th scope="col">FirstName</th>
										<th scope="col">LastName</th>
										<th scope="col">Gender</th>
										<th scope="col">Registration Date</th>
										<th scope="col">Designation</th>
										<th scope="col">Joinig Date</th>
										<th scope="col">Teacher Status</th>
										<th scope="col">Edit</th>
										<th scope="col">Delete</th>
									</tr>
								</thead>
								<%
								try {
									Connection connection = ConnectionProvider.getConnection();
									PreparedStatement statement = connection.prepareStatement("select * from teacherDetail  where teacherStatus='Active'");
									ResultSet rs = statement.executeQuery();
									while (rs.next()) {
								%>
								<tr>
									<th scope="row"><%=rs.getString(1)%></th>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(9)%></td>
									<td><%=rs.getString(13)%></td>
									<td><%=rs.getString(17)%></td>
									<td><%=rs.getString(18)%></td>
									<td><a
										href="editRegTeacher.jsp?id=<%=rs.getString(1)%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteEmpRegAction.jsp?eId=<%=rs.getString(1)%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}} catch (Exception exception) {System.out.println(exception);}%>
								</tbody>
							</table>
						</div>
					</div>
					<!--  ------------Parent------>
					<div class="container-fluid  text-light bg-dark bg-opacity-10 fs-6"
						id="pCReg" style="display: none">
						<h3 class="text-center">Confirmed Parent List</h3>
						<hr>
						<div class="table-responsive">
							<table class="table text-light table-sm table-borderless">
								<tbody>
								<thead class="table-info">
									<tr>
										<th scope="col">User-Id</th>
										<th scope="col">Full Name</th>
										<th scope="col">Email Id</th>
										<th scope="col">Password</th>
										<th scope="col">Phone No</th>
										<th scope="col">User Type</th>
										<th scope="col">Status</th>
										<th scope="col">Edit User</th>
										<th scope="col">Delete User</th>
									</tr>
								</thead>
								<%
								try {
									Connection connection = ConnectionProvider.getConnection();
									PreparedStatement statement = connection
									.prepareStatement("select * from parentDetail where parentStatus='Active'");
									ResultSet rs = statement.executeQuery();
									while (rs.next()) {
								%>
								<tr>
									<th scope="row"><%=rs.getString(1)%></th>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(7)%></td>
									<td><a href="editUserAction.jsp?uId=<%=rs.getString(1)%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserAction.jsp?uId=<%=rs.getString(1)%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%}} catch (Exception exception) {System.out.println(exception);}%> --%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--  ----------------------------------------------------------------------------------------------------->
			</div>
		</div>
	</div>
	<!-- footer -->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
</body>
</html>
<script>
	function myFunction(divid) {
		var x = document.getElementById(divid);
		if (x.style.display == "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}
</script>
<script>
const triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
triggerTabList.forEach((triggerEl) => {
  const tabTrigger = new mdb.Tab(triggerEl)
  triggerEl.addEventListener('click', (e) => {
    e.preventDefault()
    tabTrigger.show()
  })
})
</script>
<script>
	$(document).ready(function(e) {
	$("#addNewUserForm").on("submit1",function(event) {
	event.preventDefault();
	console.log("submitted the form data")
	let form = new FormData(this);
	$.ajax({
	url : "../AddUser",
	type : 'POST',
	data : form,
	success : function(data,textStatus,jqXHR) {
	console.log(data);
	if (data.trim() == 'done') {
	swal(
	"Good job!",
	"User Created Successfully",
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

</script>
<script>
$('#notification').delay(2000).hide(0);             
</script>