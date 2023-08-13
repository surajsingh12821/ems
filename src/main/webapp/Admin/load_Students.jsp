<%@page import="Entity.Student"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.StudentDao"%>
<div class="row justify-content-md-center">

<div class="col-6 ">
		<div class="card mb-3" style="max-width: 550px;">
			<div class="row g-0">
				<div class="col-md-6">
					<img src="../img/student.png" class="img-fluid rounded-start"
						alt="...">
				</div>
				<div class="col-md-6">
					<div class="card-body">
						<h5 class="card-title">Student List</h5>
						<p class="card-text">Provide Some Details</p>
						<table class="table text-light table-sm table-borderless">
										<tbody>
											<tr>
												<th scope="row">Session Year</th>
												<td><select class="form-select" name="sessionId"
													aria-label="Default select example" required>
														<option selected>choose any...</option>
														
														<%-- <option value="<%=ss.getId()%>"><%=ss.getSessionYear()%></option>
 --%>
												</select></td>
												<th scope="row">Class Name:</th>
												<td><select class="form-select" name="classId"
													aria-label="Default select example" required>
														<option selected>choose any...</option>
														
														
												</select></td>
											</tr>
											<tr>
												<th scope="row">Reg-Id</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="id"></td>
												<th scope="row">Roll No:</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="rollno"></td>
											</tr>
											<tr>
												<th scope="row">First Name</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="firstName"></td>
												<th scope="row">Last Name:</th>
												<td><input type="text" class="form-control"
													id="inputPassword2" name="lastName"></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td><button onclick="getStudentDetail(id)" 
														class="btn btn-success">Submit</button></td>
											</tr>
										</tbody>
									</table>
						
					</div>
				</div>
				
			</div>
			<div class="d-grid gap-2 d-md-flex p-2 justify-content-md-end">
							<a class="btn btn-danger me-md-2" type="button">Close</a>
							<a onclick="getregForm(1)" class="btn btn-primary" type="button">View</a>
						</div>
		</div>
	</div>
</div>