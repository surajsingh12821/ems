
<%@page import="Service.MySqlConnection"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<%@include file="./basic/basic.jsp"%>
</head>
<body>
	<!-- navbar--------------------------------------------------------------------->
	<%@include file="./basic/navbar.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<div class="container-fluid">
		<div class="col-12  justify-content-center ">
			<br>
			<h2 class="text-center ">About Us</h2>
			<hr>
			
			<h4>Introduction</h4>
			<p class="note note-primary">Now a day’s education plays a great
				role in development of any country. Many of education organizations
				try to increase education quality. One of the aspects of this
				improvement is managing of school resources. Education Management
				System carried on by any individual or institution engaged in
				providing a services to students, teachers, guardians and other
				persons are intermediary that performs one or more of the following
				functionalities – Student Admission, Employee Registration, Student
				List, Employee List, Student Attendance, Employee Attendance,
				Student Routine, Result Management, Payroll & Accounts. Education
				Management System (EMS) is such a service which provides all
				services for an educational institute to make your life easier and
				faster by assuring its performance. Easy User Management System,
				Easy Admission Process, Easy Attendance System. EMS is a system that
				will provide you a bird’s eye view of the functioning of the entire
				educational institution. It is a management information system helps
				to manage the different processes in an educational institution like
				General Administration, Staff Management, Academics, Student
				Management, and Accounts etc. The information is made using the
				latest technologies and help’s to make decision making a lot faster,
				effective and easier than ever before. Also helps to improve the
				overall quality of education of the institution. We use database and
				database technology are having a major impact on the growing use of
				computers. The implementation of the system was done using c# and
				SQL Server 2012 technologies, allowing system to be run in Windows
				OS. In a nutshell, Education Management Software managed your
				education institution by simplifying and automating processes and
				addressing the needs of all stakeholders helping them to be more
				efficient in their respective roles.</p>
		</div>
	</div>
	<hr>
	<h3 style="text-align: center">Our Team</h3>
	<hr>
	<div class="d-flex justify-content-around mb-2">
		<div class="card" style="width: 18rem;">
			<img src="img/admin.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Admin</h5>
				<p class="card-text">Suraj Singh</p>
				<button href="#" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">View Details</button>
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">Admin
									Details</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<table class="table">

									<tbody>
										<tr>
											<th scope="row">Admin Name</th>
											<td>Suraj Singh</td>
											<td><h6>
													<i class="bi bi-pencil-square"></i>
												</h6></td>
										</tr>
										<tr>
											<th scope="row">Email id</th>
											<td>SurajSingh@gmail.com</td>
										</tr>

										<tr>
											<th scope="row">Contact</th>
											<td>9824723654</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Understood</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		
		%>
		<div class="card" style="width: 18rem;">
			<img src="img/teacher.png" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Teacher's</h5>
				<p class="card-text">All Teacher's Detail</p>
				<button href="#" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal1">See Details</button>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal1" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Teacher's
									Detail</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<table class="table">
									<thead class="table-secondary">
										<tr>
											<th scope="col">User-Id</th>
											<th scope="col">First Name</th>
											<th scope="col">Last Name</th>
											<th scope="col">Father Name</th>
											<th scope="col">Mother Name</th>
											<th scope="col">Marital Status</th>
											<th scope="col">BloodGroup</th>
											<th scope="col">Designation</th>
											<th scope="col">Experience</th>
											<th scope="col">Highest Degree</th>
											<th scope="col">Teacher Status</th>
										</tr>
									</thead>
									<tbody>
										<%-- 
										<tr>
											<td><%=tt.getId() %></td>
											<td><%=tt.getFirstName() %></td>
											<td><%=tt.getLastName() %></td>
											<td><%=tt.getFatherName() %></td>
											<td><%=tt.getMotherName() %></td>
											<td><%=tt.getMaritalStatus() %></td>
											<td><%=tt.getBloodGroup() %></td>
											<td><%=tt.getDesignation() %></td>
											<td><%=tt.getExperience()%></td>
											<td><%=tt.getHighestDegree() %></td>
											<td><%=tt.getTeacherStatus() %></td>
										</tr> --%>
										
									</tbody>
								</table>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card" style="width: 18rem;">
			<img src="img/users.jpg" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">Student's</h5>
				<p class="card-text">Various Students of All Classes</p>
				<button href="#" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal2">See Details</button>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal2" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Teacher's
									Detail</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<table class="table">
									<thead class="table-secondary">
										<tr>
											<th scope="col">Reg-Id</th>
											<th scope="col">Roll No</th>
											<th scope="col">First Name</th>
											<th scope="col">Last Name</th>
											<th scope="col">Date Of Birth</th>
											<th scope="col">Father Name</th>
											<th scope="col">Mother Name</th>
											<th scope="col">Registration Date</th>
											<th scope="col">Status</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<%-- <td><%=tt.getId() %></td>
											<td><%=tt.getFirstName() %></td>
											<td><%=tt.getLastName() %></td>
											<td><%=tt.getDob() %></td>
											<td><%=tt.getFatherName() %></td>
											<td><%=tt.getMotherName() %></td>
											<td><%=tt.getRegistrationDate() %></td>
											<td><%=tt.getStudentStatus() %></td> --%>
											
										</tr>
										
									</tbody>
								</table>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>

	</div>
	<br>
	<!-- footer -------------------------------------------------------------------->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
	<!-- footer ends---------------------------------------------------------------->
</body>
</html>