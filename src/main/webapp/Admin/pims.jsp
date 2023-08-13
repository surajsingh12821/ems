
<%@page import="Entity.Year"%>
<%@page import="Dao.YearDao"%>
<%@page import="Entity.Subjects"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.*"%>
<%@page errorPage="../error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Courses</title>
</head>
<body class="bg-dark">
	<!-- style="background: url(../img/adminBg.jpg); background-size: cover;" -->
	<!-- navbar -->
	<%@include file="basic/navbar1.jsp"%>
	<div class="row-col-12 bg-dark">
		<div class="d-grid gap-2 p-2 d-md-flex justify-content-md-end">
			<button class="btn btn-success me-md-2" type="button"
				data-bs-toggle="modal" data-bs-target="#addNewCoursePostModal">
				<i class="fa-solid fa-screen-users"> New Year</i>
			</button>
			<button class="btn btn-warning" type="button" data-bs-toggle="modal"
				data-bs-target="#addNewClassPostModal">
				<i class="fa-solid fa-screen-users">New Class</i>
			</button>
			<button class="btn btn-primary" type="button" data-bs-toggle="modal"
				data-bs-target="#addNewSubjectPostModal">
				<i class="fa-solid fa-screen-users">New Subject</i>
			</button>
		</div>
	</div>
	<!--body  -->
	<div class="container-fluid  bg-dark bg-opacity-10 fs-6">
		<div class="row">
			<div class="col-sm-2 p-2 mt-4 mb-4">
				<div class="list-group list-group-light">
					<a onclick="getregForm(0)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-warning"><i
						class="fas fa-warehouse"></i>Registration Form</a> <a
						onclick="getYear(0)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-danger"><i
						class="fas fa-book"> Year </i></a> <a onclick="getStudent(0)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary"><i
						class='fas fa-user-graduate'> Student List </i></a> <a
						onclick="teacher()"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-info"><i
						class="fas fa-warehouse"> Teacher List </i></a> <a
						onclick="listener(4)"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-success"><i
						class="fas fa-warehouse"> PIMS</i></a>

				</div>
			</div>
			<!----------------------------------------------------------------------------------------------------------------------------------------------->
			<!-  ------------------------------------------------------------>
			<div class="col-sm-10  mt-2">
				<%
				String msg = request.getParameter("msg");
				if ("inserted".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<h5>Table has been updated</h5>
				</div>
				<%
				}
				if ("notinserted".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<h5>Not Inserted ERROR!</h5>
				</div>
				<%
				}
				if ("updated".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<h5>Table has been updated</h5>
				</div>
				<%
				}
				if ("notupdated".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<h5>Not Inserted ERROR!</h5>
				</div>
				<%
				}
				if ("deleted".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<h5>
						Deleted Successfully <i class="far fa-check-circle"></i>
					</h5>
				</div>
				<%
				}
				if ("notdeleted".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					<h5>
						Not Deleted ERROR <i class="far fa-times-circle"></i>
					</h5>
				</div>
				<%
				}
				if ("new".equals(msg)) {
				%>
				<div class="alert alert-success" role="alert" id="notification">
					<b>Successfully Created.</b><i class="far fa-smile"></i></label>
				</div>
				<%
				}
				if ("notcreated".equals(msg)) {
				%>
				<div class="alert alert-danger" role="alert" id="notification">
					User not created <i class="far fa-times-circle"></i>
				</div>
				<%
				}
				%>
				<!--  --------------------------------------------------------------------->
				<div class="clearfix" id="loader">
					<div class="spinner-grow text-danger spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-danger spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-danger spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-danger spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
					<div class="spinner-grow text-danger spinner-grow-sm" role="status">
						<span class="visually-hidden">Loading...</span>
					</div>
				</div>
				<div class="default-container" id="default_container"></div>
				<div class="container-fluid" id="year_container"></div>
				<div class="container-fluid" id="classes_container"></div>
				<div class="container-fluid" id="StudentTeacherForm_container"></div>
				<div class="container-fluid" id="StudentregForm_container"></div>
				<div class="container-fluid" id="Teacher_regForm_container"></div>
				<div class="container-fluid" id="classDetail_container"></div>

			</div>
		</div>
	</div>
	<!-- footer -->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
</body>
</html>
<!--  --------------------------------------------------------------------------------------------->
<script>
	function getStudent(cId) {
		$.ajax({
			url : "load_Students.jsp",
			data : {
				id : cId
			},
			method : "Post",
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#classes_container").hide();
				$("#classDetail_container").html(data);
				$("#classDetail_container").show("slow").delay(20000).hide(
						"slow");
			}
		})
	}
	$(document).ready(function(e) {
		getStudent()
	})
</script>
<script>
	function getClassDetail(cId) {
		$.ajax({
			url : "load_ClassDetails.jsp",
			data : {
				id : cId
			},
			method : "Post",
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#classes_container").hide();
				$("#classDetail_container").html(data);
				$("#classDetail_container").show("slow").delay(20000).hide(
						"slow");
			}
		})
	}
	$(document).ready(function(e) {
		getClassDetail()
	})
</script>
<script>
	$('#notification').delay(2000).hide(0);
</script>
<script>
	function getYear(cId) {
		$.ajax({
			url : "load_Year.jsp",
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#default_container").hide();
				$("#year_container").html(data);
				$("#year_container").show("slow").delay(20000).hide("slow");
			}
		})
	}
	$(document).ready(function(e) {
		getYear()
	})
</script>
<script>
	function getStudentList(cId) {
		$.ajax({
			url : "load_Students.jsp",
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#default_container").hide();
				$("#year_container").html(data);
				$("#year_container").show("slow").delay(20000).hide("slow");
			}
		})
	}
	$(document).ready(function(e) {
		getStudentList()
	})
</script>
<script>
	function getClasses(cId) {
		$.ajax({
			url : "load_classes.jsp",
			data : {
				id : cId
			},
			method : "Post",
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#default_container").show();
				$("#year_container").hide();
				$("#classes_container").html(data);
				$("#classes_container").show("slow").delay(15000).hide("slow");
			}
		})
	}
	$(document).ready(function(e) {
		getClasses()
	})
</script>
<script>
	function getregForm(cId) {
		switch (cId) {
		case 0:
			$.ajax({
				url : "StuTechSelector.jsp",
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#default_container").show();
					$("#default_container").hide();
					$("#StudentTeacherForm_container").html(data).show("slow");
					$("#StudentTeacherForm_container").show("slow")
							.delay(20000).hide("slow");
				}
			})
			$("#StudentTeacherForm_container").hide("slow");
			break;
		case 1:
			$.ajax({
				url : "load_StudentregForm.jsp",
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#default_container").hide();
					$("#StudentTeacherForm_container").hide();
					$("#StudentregForm_container").html(data);
					$("#StudentregForm_container").show("slow").delay(20000)
							.hide("slow");

				}
			})
			break;
		case 2:
			$("#default_container").show();
			$.ajax({
				url : "load_TeacherregForm.jsp",
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$("#default_container").show();
					$("#StudentTeacherForm_container").hide();
					$("#Teacher_regForm_container").html(data);
					$("#Teacher_regForm_container").show("slow").delay(20000)
							.hide("slow");
				}
			})
			break;
		default:
			$("#default_container").show();
		}
	}
	$(document).ready(function(e) {
		getregForm()

	})
</script>
<!--addNewCoursesModal  ----------------------------------------------------------------------------------------->
<!-- Modal -->
<div class="modal fade" id="addNewCoursePostModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-light bg-primary bg-opacity-50">
				<h5 class="modal-title text-dark" id="exampleModalLabel">ADD
					NEW SESSION</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="../AddYear" method="post">
				<div class="modal-body">
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Session
							Year</label> <input type="text" class="form-control" id="inputEmail3"
							name="year_Name">
					</div>
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Starting
							Date</label> <input type="date" placeholder="dd-mm-yyyy"
							class="form-control" id="inputEmail3" name="start_Date">
					</div>
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Ending
							Date</label> <input type="date" placeholder="dd-mm-yyyy"
							class="form-control" id="inputEmail3" name="end_Date">
					</div>
				</div>
				<div class="modal-footer bg-primary bg-opacity-25">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" id="submit1" class="btn btn-success">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!--  addNewClassPostModal--------------------------------------------------------------------------->
<!-- Modal -->
<div class="modal fade" id="addNewClassPostModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header  text-dark bg-warning">
				<h5 class="modal-title" id="exampleModalLabel">ADD NEW CLASS</h5>
				<button type="button" class="btn-close bg-light"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid bg-dark">
					<div class="row">
						<div class="col-md-4">
							<div class="card" style="width: 15rem;">
								<img src="../img/course.jpg" class="card-img-top" alt="...">
							</div>

						</div>
						<div class="col-md-6 ">
							<form id="addClassForm" action="../AddClasses" method="post"
								enctype="multipart/form-data">

								<table class="table align-center  text-light">
									<tbody>
										<tr>
											<th scope="row">Session Year</th>
											<td><select class="form-select" name="year_Id"
												aria-label="Default select example" required>
													<option selected>choose any...</option>
													<%
													YearDao yearDao = new YearDao(MySqlConnection.getConnection());
													List<Year> list = yearDao.getAll_Year();
													for (Year s : list) {
													%>
													<option value="<%=s.getId()%>"><%=s.getYear_Name()%></option>
													<%
													}
													%>
											</select></td>
										</tr>
										<tr>
											<th scope="row">Class Name</th>
											<td><input type="text" class="form-control"
												id="inputPassword3" name="class_Name" required></td>




										</tr>
										<tr>
											<th scope="row">Class teacher</th>
											<td><input type="text" class="form-control"
												id="inputPassword3" name="class_Teacher"></td>


										</tr>
										<tr>
											<th scope="row">Total Seat</th>
											<td><input type="number" class="form-control"
												id="inputPassword3" name="total_Seat" required></td>
										</tr>
										<tr>
											<th scope="row">Available Seat</th>
											<td><input type="number" class="form-control"
												id="inputPassword3" name="available_Seat"></td>
										</tr>

										<tr>
											<th scope="row">Room No</th>
											<td><input type="number" class="form-control"
												id="inputPassword3" name="class_Room" required></td>


										</tr>
										<tr>
											<th scope="row">Class Pic</th>
											<td><input type="file" name="cPic"></td>

										</tr>
										<tr>
											<td></td>
											<td><button type="submit" id="submit2"
													class="btn btn-success">Submit</button></td>
										</tr>
									</tbody>
								</table>

							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!--  --------------------------------------------------------------------------------------------->
<!--"addNewSubjectPostModal"  --------------------------------------------------------------------------->
<!-- Modal -->
<div class="modal fade" id="addNewSubjectPostModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header text-light bg-primary bg-opacity-50">
				<h5 class="modal-title text-dark" id="exampleModalLabel">ADD
					NEW SUBJECT</h5>
				<button type="button" class="btn-close bg-light"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid bg-dark">
					<div class="row">
						<div class="col-md-4 p-3">
							<div class="card " style="width: 15rem;">
								<img src="../img/sub.png" class="card-img-top" alt="...">
							</div>

						</div>
						<div class="col-md-8 p-3">

							<form id="addSubjectForm" action="../AddSubjects" method="post">
								<table class="table-sm table-responsive text-light">
									<tbody>
										<tr>
											<th scope="row">Session Year</th>
											<td><select class="form-select" name="sessionsId"
												aria-label="Default select example" required>
													<option selected>choose any...</option>
													<%-- <%
											ArrayList<Sessions> sessioList1 = sessionsDao.getAllSessions();
											for (Sessions s1 : sessioList1) {
											%>
											<option value="<%=s1.getId()%>"><%=s1.getSessionYear()%></option>
											<%
											}
											%>
									</select></td>
									<th scope="row">Class Name:</th>
									<td id="class-Id"><select class="form-select"
										name="classId" aria-label="Default select example" required>
											<option selected>choose any...</option>
											<%
											ClassDao classesDao = new ClassDao(ConnectionProvider.getConnection());
											ArrayList<Classes> listClasses = classesDao.getAllClasses();
											for (Classes c : listClasses) {
											%><option value="<%=c.getId()%>"><%=c.getClassName()%></option>
											<%
											}
											%> --%>
											</select></td>

										</tr>
										<tr>
											<th scope="row">Subject Name:</th>
											<td><input type="text" class="form-control"
												id="inputPassword2" name="subjectName"></td>

										</tr>
										<tr>
											<th scope="row">Subject Type:</th>
											<td><input type="text" class="form-control"
												id="inputPassword2" name="subjectType"></td>
										</tr>
										<tr>
											<th scope="row">Subject Marks:</th>
											<td><input type="text" class="form-control"
												id="inputPassword2" name="subjectMarks"></td>
										</tr>

										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td><button type="submit" id="submit3"
													class="btn btn-success">Submit</button></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>




				</div>
			</div>
		</div>
	</div>

	<!--  --------------------------------------------------------------------------------------------->