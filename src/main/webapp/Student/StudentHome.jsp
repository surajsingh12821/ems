
<%@page import="Dao.StudentFormDao"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Entity.StudentRegForm"%>
<%@page import="Dao.StudentDao"%>
<%@page import="Entity.Student"%>
<%@page errorPage="../error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Student Home</title>
</head>
<body>
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>

	<!--Navbar Start  -------------------------------------------------------------------->
						<%
				String msg = request.getParameter("msg");

						if ("notreg".equals(msg)) {
						%>
						<div class="alert alert-danger" role="alert">
							Not Registered <i class="far fa-times-circle"></i>
						</div>
						<%
						}
						if ("reg".equals(msg)) {
						%>
						<div class="alert alert-success" role="alert">
							Successfully Registered <i class="far fa-check-circle"></i>
						</div>
						<%
						}
				if ("wel".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<h7><label class="text-dark text-center"><b>Welcome <%=user.getUser_Name() %></b></label></h7>
				</div>
				<%
				}
				if ("done".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<h4><label class="text-dark"><b> Done...</b><i class="far fa-smile"></i></label></h4>
				</div>
				<%
				}if ("reg".equals(msg)) {
					%>
					<div class="alert alert-success" role="alert" id="notification">
						<h4><label class="text-dark"><b>Registered...</b><i class="far fa-smile"></i></label></h4>
					</div>
				<%} %>
				<div class="container-fluid">
		
		<div class="row">
			<div class="col-2 mt-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home">Home</a> <a
						class="list-group-item list-group-item-action"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile">Profile</a>
					  <a
						class="list-group-item list-group-item-action"
						id="list-messages-list" data-bs-toggle="list"
						href="#list-messages" role="tab" aria-controls="list-messages">Messages</a> 
					 <a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list"
						href="#list-settings" role="tab" aria-controls="list-settings">Settings</a> 
				</div>
			</div>
			<div class="col-10">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<div class="container-fluid">

							<h2 class="text-center p-2">Welcome to Education Management
								System</h2>
							<hr>
							<div class="row text-center">
								<div class="col-md-7 content-center">
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
													<img src="../img/s1.jpg" class="d-block w-100" alt="...">
												</div>
												<div class="carousel-item">
													<img src="../img/s2.jpg" class="d-block w-100" alt="...">
												</div>
												<div class="carousel-item">
													<img src="../img/s3.jpg" class="d-block w-100" alt="...">
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
								<div class="col-5">
									<%
										StudentDao dao=new StudentDao(MySqlConnection.getConnection());
										Student student=dao.getStudentDetail(user);
										if (student.getReg_Id()==0  ) {
											%>
											<h4 class="text-center">Apply For Job</h4>
											<hr>
											<a href="stdRegForm.jsp"
												class="btn btn-lg btn-pill btn-success">Apply</a>

											<!-------------------------------------------------------------------------------------------------------->
											<%
										}else{
								
									if (student.getRegistration_Apply().equalsIgnoreCase("no")  ) {
									%>
									<h4 class="text-center">Apply For Job</h4>
									<hr>
									<a href="stdRegForm.jsp"
										class="btn btn-lg btn-pill btn-success">Apply</a>

									<!-------------------------------------------------------------------------------------------------------->
									<%
									}if (student.getRegistration_Apply().equalsIgnoreCase("Applied") ) {
									
									%>
									<!-------------------------------------------------------------------------------------------------------->
									<h3 class="text-danger">Registered Already.Wait for Admin
										to confirm your Account</h3>
									<!-------------------------------------------------------------------------------------------------------->
									<%}if (student.getRegistration_Apply().equalsIgnoreCase("Confirmed") ) { %>
									<!-------------------------------------------------------------------------------------------------------->
									<h3 class="text-success">Welcome</h3>
									<p>
										Your Account is successfully Registered <b
											class="text-danger">Teacher</b>
											<h2>Welcome  Teacher</h2>
									</p>
									<hr>
									<!-------------------------------------------------------------------------------------------------------->
									<%}} %>
								</div>
							</div>



						</div>
					</div>
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">
						<div class="container-fluid">
							<div class="row">
								<hr>
								<h4 class="text-center">User Details</h4>
								<hr>
								<div class="col-3  text-center">
									<div class="card mt-5" style="width: 18rem;">
										<img src="../img/<%-- <%=user.getProfilePic()%> --%>"
											class="card-img-top" alt="..."><br>
							<%-- 			<h4 class="text-dark">
											<strong><%=user.getUser_Name()%></strong>
										</h4>
									</div>
								</div>

								<div class="col-9">

									<%
									if (s.getRegistration_Apply().equalsIgnoreCase("Applied")) {
									%>
									<table
										class="table caption-top table-striped table-hover table-bordered">
										<caption>
											<strong class="text-dark">Teacher Personal Detail</strong>
										</caption>
										<tbody>
											<tr>
												<th scope="row">Teacher Name</th>
												<td><%=teacher.getFirstName() + " " + teacher.getLastName()%></td>
												<td colspan="2"></td>
											</tr>
											<tr>
												<th scope="row">Email-id</th>
												<td><%=user.getEmail().toUpperCase()%></td>
												<th scope="row">Phone No</th>
												<td><%=user.getPhoneno()%></td>
											</tr>
											<tr>
												<th scope="row">Father Name</th>
												<td></td>
												<th scope="row">Mother Name</th>
												<td><%=teacher.getMotherName()%></td>
											</tr>
											<tr>
												<th scope="row">Date of Birth</th>
												<td><%=teacher.getDob()%></td>
												<th scope="row">Blood Group</th>
												<td><%=teacher.getBloodGroup()%></td>
											</tr>
											<tr>
												<th scope="row">Marital Status</th>
												<td><%=teacher.getMaritalStatus()%></td>
											</tr>
										</tbody>
									</table>
									<table
										class="table caption-top table-striped table-hover table-bordered">
										<caption>
											<strong class="text-dark">Teacher Academic Detail</strong>
										</caption>
										<tbody>
											<tr>
												<th scope="row">Degree:</th>
												<td><%=teacher.getHighestDegree()%></td>
												<th scope="row">Designation</th>
												<td><%=teacher.getDesignation()%></td>

											</tr>

											<tr>
												<th scope="row">Experience:</th>
												<td><%=teacher.getExperience()%></td>
											</tr>
											<tr>
												<th scope="row">Registration Date:</th>
												<td><%=teacher.getRegistrationDate()%></td>
												<th scope="row">Registration Status:</th>
												<td><b class="text-success"><%=user.getRegApply()%></b></td>
											</tr>
										</tbody>
									</table>
									<%
									}
									if (user.getRegApply().equalsIgnoreCase("Confirmed")) {
									%>
									<%
									}
									if (user.getRegApply().equalsIgnoreCase("no")) {
									%>
									<table
										class="table caption-top table-striped table-hover table-bordered">
										<caption>
											<strong class="text-dark">Account Detail</strong>
										</caption>
										<tbody>
											<tr>
												<th scope="row">Email-id</th>
												<td><%=user.getEmail().toUpperCase()%></td>
												<th scope="row">User Name</th>
												<td><%=user.getUserName()%></td>
											</tr>
											<tr>
												<th scope="row">Phone No</th>
												<td><%=user.getPhoneno()%></td>
												<th scope="row">User Type</th>
												<td><%=user.getUserType().toUpperCase()%></td>
											</tr>
											<tr>
												<th scope="row">Account Status</th>
												<td><b class="text-success"><%=user.getAccountStatus()%></b></td>
												<th scope="row">Account Created on</th>
												<td><%=user.getCreated_at()%></td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<%-- <%
							}
							%> --%>
						</div>
						<hr>
						<div class="row">
							<div>
								<h3 class="text-dark">
									<i class="bi bi-house-fill"></i>Address
								</h3>

							</div>
							<table class="table table-borderless text-dark">
								<tbody>
									<tr class="bg-dark text-light">
										<th scope="row">Present Address</th>
										<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#presentModal">Enter</button>
											<!-- Modal -->
											<div class="modal fade" id="presentModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<form action="../presentAddress" method="get">
													<div id="presentAddForm" class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header text-dark">
																<h5 class="modal-title" id="exampleModalLabel">Present
																	Address</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">House Address</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="address">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">City</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="city">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">State</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="state">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">Country</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="country">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">PinCode</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="pinCode">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">Phone no</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="phoneNo">
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Close</button>
																<button id="submit1" type="submit"
																	class="btn btn-primary">Submit</button>
															</div>
														</div>
													</div>
												</form>
											</div>
										</td>
										<td><a href="../SameAs" class="btn btn-danger">Same
												As</a></td>
										<th scope="row">Permanent Address</th>
										<td>
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#permanentModal">
												Enter</button> <!-- Modal -->
											<div class="modal fade" id="permanentModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<form action="../permanentAddress" method="get">
														<div id="permanentAddForm" class="modal-content">
															<div class="modal-header text-dark">
																<h5 class="modal-title" id="exampleModalLabel">Permanent
																	Address</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">House Address</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="address">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">City</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="city">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">State</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="state">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">Country</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="country">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">PinCode</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="pinCode">
																	</div>
																</div>
																<div class="row mb-3">
																	<label for="inputEmail3"
																		class="col-sm-4 col-form-label">Phone no</label>
																	<div class="col-sm-8">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="phoneNo">
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Close</button>
																<button id="submit" type="submit"
																	class="btn btn-primary" value="Form1">Submit</button>
															</div>

														</div>
													</form>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="accordion" id="accordionPanelsStayOpenExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingOne">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseOne"
											aria-expanded="true"
											aria-controls="panelsStayOpen-collapseOne">Present
											Address</button>
									</h2>
									<div id="panelsStayOpen-collapseOne"
										class="accordion-collapse collapse show"
										aria-labelledby="panelsStayOpen-headingOne">
										<div class="accordion-body">
											<strong> <%-- <%
 PresentAddDao presentAddDao = new PresentAddDao(ConnectionProvider.getConnection());
 PresentAddress presentAddress = presentAddDao.getPresentADDByUserId(user.getUserId());
 %>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">House
														Address no</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getAddress()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">City</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getCity()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">State</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getState()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Country</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getCountry()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Pincode</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getPinCode()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Phone
														No</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=presentAddress.getPhoneNo()%></label>
													</div>
												</div>


											</strong> --%>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="headingThree">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											Permanent Address</button>
										<!-- Button trigger modal -->

									</h2>



									<div id="collapseThree" class="accordion-collapse collapse"
										aria-labelledby="headingThree"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<%-- <strong> <%
 PermanentAddDao permanentAddDao = new PermanentAddDao(ConnectionProvider.getConnection());
 PermanentAddress permanentAddress = permanentAddDao.getPermanentADDByUserId(user.getUserId());
 %>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">House
														Address no</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getAddress()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">City</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getCity()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">State</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getState()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Country</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getCountry()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Pincode</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getPinCode()%></label>
													</div>
												</div>
												<div class="row mb-3">
													<label for="inputEmail3" class="col-sm-4 col-form-label">Phone
														No</label>
													<div class="col-sm-8">
														<label for="inputEmail3" class="col-sm-6 col-form-label"><%=permanentAddress.getPhoneNo()%></label>
													</div>
												</div>
											</strong> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="list-messages" role="tabpanel"
				aria-labelledby="list-messages-list">...</div>
			<div class="tab-pane fade" id="list-settings" role="tabpanel"
				aria-labelledby="list-settings-list">...</div>
		</div>
	</div>

</body>
</html>
<script>
$('#notification').delay(2000).hide(0);             
</script>

