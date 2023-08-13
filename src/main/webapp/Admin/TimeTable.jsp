
<%@page import="Entity.Classes"%>
<%@page import="Entity.Year"%>
<%@page import="Dao.YearDao"%>
<%@page import="Dao.ClassDao"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Various Books </title>
</head>
<body>
<!-- navbar--------------------------------------------------------------------->
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>
	<!--navbar ends----------------------------------------------------------------->
	<div class="row-col-12 bg-dark">
		<div class="d-grid gap-3 p-2 d-md-flex justify-content-md-end">
			<button class="btn btn-sm btn-success me-sm-2" type="button"
				data-bs-toggle="modal" data-bs-target="#addNewSessionPostModal">
				<i class="bi bi-card-list "></i> New Year
			</button>
			<button class="btn btn-sm btn-warning me-sm-2" type="button" data-bs-toggle="modal"
				data-bs-target="#addNewClassPostModal">
				<i class="fa-solid fa-screen-users"></i> New Class
			</button>
			<button class="btn btn-sm btn-primary me-sm-2" type="button" data-bs-toggle="modal"
				data-bs-target="#addNewSubjectPostModal"> New Subject</button>
		</div>
	</div>
	<!--body----------------------------------------------------------------->
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 mt-4">
				
				<div class="list-group list-group-light list-group-scrollable" id="list-tab" role="tablist">
					<a onclick="getYearName()"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home" aria-current="true" aria-hidden="true"> <h5><i class="fa-sharp fa-solid fa-layer-group"></i>  Time Table </i></h5>  </a>
					<%!int yearId=0 ;%>
					<%
						
						YearDao yearDao=new YearDao(MySqlConnection.getConnection());
						List<Year> list=yearDao.getAll_Year();
						
					for (Year year : list) {
					%>
					<a onclick="getYearName('<%=year.getId() %>')"
						class="list-group-item list-group-item-action px-3 border-0 rounded-3 mb-2 list-group-item-secondary"
						id="list-profile-list" data-bs-toggle="list" href="#list-profile"
						role="tab" aria-controls="list-profile"> <h6><i
						class="fa fa-bars" >  <%=year.getYear_Name()%></i></h6>
					</a>
					<%
					}
					%>
				</div>
				
			</div>
			<div class="col-10 bg-secondary mt-4 mb-2 bg-opacity-10">
				
						<div class="text-center" id="loader">
								<div class="spinner-border text-dark" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
						</div>
						
						<div class="container-fluid" id="class_container">
					
						</div>
						<div class="container-fluid" id="classDetail_container">
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<!-------------------------------------------------------------------------------------->
		<%@include file="./basic/footer.jsp"%>
</body>
</html>
<script>
	function getYearName(sName)
	{
		$.ajax({
			url:"load_classes.jsp",
			data:{id:sName},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#loader").hide();
				$("#default_container").hide();
				$("#class_container").html(data);
			}
		})
	}
	$(document).ready(function(e){
		getYearName()
	})
</script>
<script>
	function getclassDetail(cId)
	{
		$.ajax({
			url:"classDetail.jsp",
			data:{id:cId},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
				
				if(data==null)
					{
					$("#class_container").show();
					$("#classDetail_container").hide();
					}
				else
					{
					$("#class_container").hide();
					$("#classDetail_container").html(data);
					}
				
			}
		})
	}
	$(document).ready(function(e){
		getclassDetail()
	})
</script>
<script>
	function deleteClass(cId)
	{
		console.log(cId);
		$.ajax({
			url:"../DeleteClass",
			data:{id:cId},
			method:"Post",
			success:function(data,textStatus,jqXHR)
			{
				console.log(data);
			}
		})
	}
	$(document).ready(function(e){
		deleteClass()
	})
</script>
<!--addNewSessionPostModal  ----------------------------------------------------------------------------------------->
<!-- Modal -->
<div class="modal fade" id="addNewSessionPostModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-light bg-success">
				<h5 class="modal-title" id="exampleModalLabel">ADD NEW SESSION</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form id="addSessionsForm" action="../AddSessions" method="post">
				<div class="modal-body">
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Session
							Year</label> <input type="text" class="form-control" id="inputEmail3"
							name="sessionYear">
					</div>
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Starting
							Date</label> <input type="date" class="form-control" id="inputEmail3"
							name="sessionStartDate">
					</div>
					<div class="mb-3">
						<label for="message-text " class="col-form-label">Ending
							Date</label> <input type="date" class="form-control" id="inputEmail3"
							name="sessionEndDate">
					</div>
				</div>
				<div class="modal-footer bg-dark">
					<button type="button" class="btn btn-secondary"
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
				<div class="card" style="width: 15rem;">
					<img src="../img/course.jpg" class="card-img-top" alt="...">
				</div>
				<div class="col bg-dark  fs-6">
					<form id="addClassForm" action="../AddClasses" method="post"
						enctype="multipart/form-data">
						<div class="table-responsive">
							<table class="table align-middle  text-light">
								<tbody>
									<tr>
										<th scope="row">Session Year</th>
										<td><select class="form-select" name="sessionsId"
											aria-label="Default select example" required>
												<option selected>choose any...</option>
												<%
												List<Year> listYear=yearDao.getAll_Year();
												for (Year year : listYear) {
												%>
												<option value="<%=year.getId()%>"><%=year.getYear_Name()%></option>
												<%
												
												}
												%>
										</select></td>
									</tr>
									<tr>
										<th scope="row">Class Name</th>
										<td><input type="text" class="form-control"
											id="inputPassword3" name="className" required></td>
										<th scope="row">Class teacher</th>
										<td><input type="text" class="form-control"
											id="inputPassword3" name="classTeacher"></td>

									</tr>
									<tr>
										<th scope="row">Total Seat</th>
										<td><input type="number" class="form-control"
											id="inputPassword3" name="totalSeat" required></td>
										<th scope="row">Available Seat</th>
										<td><input type="number" class="form-control"
											id="inputPassword3" name="availableSeat"></td>
									</tr>
									<tr>
										<th scope="row">Room No</th>
										<td><input type="number" class="form-control"
											id="inputPassword3" name="roomNo" required></td>


									</tr>
									<tr>
										<th scope="row">Class Pic</th>
										<td><input type="file" name="cPic"></td>
										<td><button type="submit" id="submit2"
												class="btn btn-success">Submit</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
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
			<div class="modal-header text-light bg-primary">
				<h5 class="modal-title" id="exampleModalLabel">ADD NEW SUBJECT</h5>
				<button type="button" class="btn-close bg-light"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card" style="width: 15rem;">
					<img src="../img/course.jpg" class="card-img-top" alt="...">
				</div>
				<div class="col bg-dark  fs-6">
					<form id="addSubjectForm" action="../AddSubjects" method="post">
						<table class="table text-light">
							<tbody>
								<tr>
									<th scope="row">Session Year</th>
									<td><select class="form-select" name="sessionsId"
										aria-label="Default select example" required>
											<option selected>choose any...</option>
											<%
												
												for (Year year : listYear) {
												%>
												<option value="<%=year.getId()%>"><%=year.getYear_Name()%></option>
												<%
												 yearId=year.getId();
												}
												%>
									</select></td>
									<th scope="row">Class Name:</th>
									<td id="class-Id"><select class="form-select"
										name="classId" aria-label="Default select example" required>
											<option selected>choose any...</option>
											<%
											ClassDao classDao=new ClassDao(MySqlConnection.getConnection());
											
											List<Classes> listCLasses=classDao.getAll_ClassName(yearId);
											for (Classes c : listCLasses) {
											%>
											<option value="<%=c.getId()%>"><%=c.getClass_Name()%></option>
											<%
											}
											%>
									</select></td>

								</tr>
								<tr>
									<th scope="row">Subject Name:</th>
									<td><input type="text" class="form-control"
										id="inputPassword2" name="subjectName"></td>
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

<!--  --------------------------------------------------------------------------------------------->