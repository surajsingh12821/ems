
<%@page import="java.util.Map.Entry"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="Dao.TeacherFormDao"%>
<%@page import="Dao.TeacherDao"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page errorPage="error.jsp"%>


<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Teacher Registration Form</title>
</head>
<body>
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>
	<div class="container-fluid" id="regForm">
		<br>
		<h2 class="text-center">Teacher Registration Form</h2>
		<hr>
		<div class="row">
			<div class="col-8 m-3 bg-dark ">
				<h8> <%
 				String msg = request.getParameter("msg");
 				if ("pstAdd".equals(msg)) {
 				%>
				<div class="alert alert-success" role="alert">
					Present Address Added <i class="far fa-check-circle"></i>
				</div>
				<%
				}
				if ("notpstAdd".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">
					Address not Added <i class="far fa-times-circle"></i>
				</div>
				<%
				}
				if ("pmtAdd".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">
					Permanent Address Added <i class="far fa-check-circle"></i>
				</div>
				<%
				}
				if ("notpmtAdd".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">
					Address not Added <i class="far fa-times-circle"></i>
				</div>
				<%
				}
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
				if ("updated".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert">
					Successfully Updated <i class="far fa-check-circle"></i>
				</div>
				<%
				}
				if ("notUpdated".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">
					Not Updated <i class="far fa-times-circle"></i>
				</div>
				<%
				}
				if ("notDeleted".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">
					Not Deleted <i class="far fa-times-circle"></i>
				</div>
				<%
				}
				if ("notSaved".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert">
					Not Saved <i class="far fa-times-circle"></i>
				</div>
				<%
				}
				%> </h8>
				<br>
					<%
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					String currentDate = df.format(new Date());
					TeacherFormDao teacherDao=new TeacherFormDao(MySqlConnection.getConnection());
					int regId=1+teacherDao.getMaxFormId();
					%>
					<div class="row justify-content-center">
						<!--Grid column-->
						<div class="col-md-6 text-center text-light ">
							<h3>Education Management System</h3>

							<h5>Teacher Report</h5>

						</div>
						<hr class="text-light">
						<div class="row  mb-3">
							<label for="inputEmail3"
								class="col-sm-1 text-light fw-bold col-form-label">Reg
								Id:</label>
							<div class="col-sm">

								<label for="inputEmail3"
									class="col-sm text-light fw-bold col-form-label"><%=regId %></label>
							</div>
							<label for="inputEmail3"
								class="col-sm-1 text-light fw-bold col-form-label">Session:</label>
							<div class="col-sm">
								<label for="inputEmail3"
									class="col-sm text-light fw-bold col-form-label"></label>
							</div>
							<label for="inputEmail3"
								class="col-sm-1 text-light fw-bold col-form-label">Class:</label>
							<div class="col-sm">
								<label for="inputEmail3"
									class="col-sm text-light  fw-bold col-form-label"></label>

							</div>
							<label for="inputEmail3"
								class="col-sm-1 text-light fw-bold col-form-label">Date:</label>
							<div class="col-sm">
								<label for="inputEmail3"
									class="col text-light  fw-bold col-form-label"><%=currentDate%></label>
							</div>


							<div class="col">
								<a class="btn btn-light" id="saveAs"><i
									class="fas fa-file-pdf"></i> Print</a>
							</div>

						</div>
					</div>
					<h6 class="text-light">Account Details</h6>
					<table class="table table-borderless text-light">
						<tbody class="table-primary bg-opacity-10">
							<tr>
								<th scope="row">User Id</th>
								<td><label type="text" class="form-control"
									id="inputPassword2" name="userId"><%=user.getId()%></label></td>
								<th scope="row">Email Id:</th>
								<td><label type="text" class="form-control"
									id="inputPassword2" name="email"><%=user.getEmail().toUpperCase()%></label></td>
							</tr>
							<tr>
								<th scope="row">User Name</th>
								<td><label type="text" class="form-control"
									id="inputPassword2" name="userName"><%=user.getUser_Name().toUpperCase()%></label></td>

								<th scope="row">Phone no:</th>

								<td><label type="text" class="form-control"
									id="inputPassword2" name="phoneno"><%=user.getPhone_No()%></label></td>
							</tr>
							<tr>
								<th scope="row">User Type</th>
								<td><label type="text" class="form-control"
									id="inputPassword2" name="userType"><%=user.getRole_Id()%></label></td>

								<th scope="row">User Account Status:</th>

								<td><label type="text" class="form-control"
									id="inputPassword2" name="accountStatus"><%=user.getAccount_Status().toUpperCase()%></label></td>
							</tr>
						</tbody>
					</table>
			

				<!-- table 1 ends ----------------------------------------------------------- -->



				<!-- table 2 ends ----------------------------------------------------------------->
					<h6 class="text-light text-center">Provide Personal Details</h6>
					<form  action="../TeacherRegistration" method="get">
					<div id="teacherRegForm" class="col-12" >
						<table class="table table-borderless text-light">
							<tbody class="table-primary bg-opacity-10">
								<tr>
									<th scope="row">First Name</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="firstName"></td>
									<th scope="row">Last Name:</th>

									<td><input type="text" class="form-control"
										id="inputPassword2" name="lastName"></td>

								</tr>
								<tr>
									<th scope="row">Father's Name</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="fatherName"></td>
									<th scope="row">Mother's Name:</th>

									<td><input type="text" class="form-control"
										id="inputPassword2" name="motherName"></td>
								</tr>
								<tr>

									<th scope="row">Gender:</th>
									<td><select class="form-select" name="gender"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<option value="Male">Male</option>
											<option value="Female">Female</option>
											<option value="Others">Others</option>
									</select></td>
									<th scope="row">Date of Birth:</th>
									<td><input type="date" class="form-control"
										id="inputPassword3" name="dob" required></td>
								</tr>
								<tr>
									<th scope="row">Blood Group:</th>
									<td><select class="form-select" name="bloodGroup"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<option value="A+">A+</option>
											<option value="A-">A-</option>
											<option value="B+">B+</option>
											<option value="B-">B-</option>
											<option value="AB+">AB+</option>
											<option value="AB-">AB-</option>
											<option value="O+">O+</option>
											<option value="O-">O-</option>
									</select></td>

									<th scope="row">Marital status:</th>
									<td><select class="form-select" name="maritalStatus"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<option value="single">single</option>
											<option value="married">married</option>
											<option value="widowed">widowed</option>
											<option value="divorced">divorced</option>
											<option value="separated ">separated</option>
									</select></td>
									
								</tr>

								<tr>
									
									<th scope="row">Highest Degree</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="highestDegree"></td>
									<th scope="row">Years Of Experience:</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="experience"></td>
								</tr>
								<tr>
									<th scope="row">Job Profile:</th>
									<td><select class="form-select" name="designation"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<option value="primary">Primary level teacher</option>
											<option value="secondary">Secondary level teacher</option>
											<option value="seniorSecondary">Senior secondary level teacher</option>

									</select></td>
									<th scope="row">Joining Date:</th>
									<td><input type="date" class="form-control"
										id="inputPassword3" name="dob" required></td>
								</tr>
								<tr>
									<th scope="row">Select Subject:</th>
									<td><select class="form-select" name="subject_Id"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<%
						SubjectDao subjectDao=new SubjectDao(MySqlConnection.getConnection());
						HashMap<Integer,String> names=subjectDao.getSubById();
					for (Entry<Integer,String> sub : names.entrySet()) {
					%>
											<option value=<%=sub.getKey() %>><%=sub.getValue() %></option>
											<%} %>
									</select></td>

									<th scope="row">Salary Expected</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="salaryExp"></td>
									
								</tr>
								
								<tr>
								<td></td>
								<td><button type="reset" class="btn btn-warning">Reset</button></td>
								<td><button type="submit" 
										class="btn btn-success">Register</button></td>
								<td><button type="button" class="btn btn-danger">Cancel</button></td>
								</tr>
							</tbody>
						</table>
						</div>
					</form>
				
			</div>
			<div class="col-3 m-1 mt-2 bg-primary bg-opacity-25 fs-6">
				<hr>
				<h5>Teacher Photo</h5>
				<img src="../img/<%-- <%=user.getProfilePic()%> --%>" class="img-thumbnail"
					alt="Hollywood Sign on The Hill" />
				<hr>
				<h5>Teacher Signature</h5>
				<img src="../img/<%-- <%=user.getSign()%> --%>" class="img-thumbnail"
					alt="Hollywood Sign on The Hill" />
				<hr>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div><%@include file="./basic/footer.jsp"%></div>

</body>
</html>

<script>
	$(document)
			.ready(
					function(e) {
						$("#teacherRegForm")
								.on(
										"submit",
										function(event) {
											event.preventDefault();
											console
													.log("submitted the form data")
											let form = new FormData(this);
											$
													.ajax({
														url : "../TeacherRegistration",
														type : 'GET',
														data : form,
														success : function(
																data,
																textStatus,
																jqXHR) {
															console.log(data);
															if (data.trim() == 'done') {
																swal(
																		"Good job!",
																		"Teacher details Saved Successfully",
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
<script type="text/javascript">
	$("body").on("click", "#saveAs", function() {
		html2canvas($('#regForm')[0], {
			onrendered : function(canvas) {
				var data = canvas.toDataURL();
				var docDefinition = {
					content : [ {
						image : data,
						width : 500
					} ]
				};
				pdfMake.createPdf(docDefinition).download("Registration.pdf");
			}
		});
	});
</script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>