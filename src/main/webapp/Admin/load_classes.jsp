<%@page import="Entity.Year"%>
<%@page import="Dao.YearDao"%>
<%@page import="Entity.Classes"%>
<%@page import="java.util.List"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.ClassDao"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<div class="row  justify-content-around mb-2">

	<%
	String iid = request.getParameter("id");

	if (iid == null) {
	%>
	<div class='col align-self-center m-5'>
		<h2 class='display-3 text-center '>
			<br>
			<hr>
			Please Select Class ...<br> <i
				class='fas fa-chevron-circle-left'></i><br> <br>
			<hr>
			<br>
		</h2>
	</div>
	<%
	} else {
	int id = Integer.parseInt(iid);
	YearDao yearDao = new YearDao(MySqlConnection.getConnection());
	Year year = yearDao.get_Year(id);
	ClassDao classDao = new ClassDao(MySqlConnection.getConnection());
	List<Classes> list = classDao.getAll_Classes(id);
	if (list.size() == 0) {
		out.println(
		"<div class='col align-self-center m-5'><h1 class='display-4 text-center text-dark '><br>No Class Available Here<br> </h1></div>");
	}
	if (list.size() != 0) {
		out.println("<h2 class='text-center text-Dark p-2'>Various Classes <hr></h2>");
	}
	for (Classes c : list) {
	%>
	<div class="col-5">

		<div class="card mb-4" style="max-width: 555px;">
			<div class="row g-0">
				<div class="col-md-4 text-center">
					<img src="../img/clas.jpg" class="img-fluid rounded-start"
						alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body ">
						<h4 class="card-title">
							<%=c.getClass_Name()%>
							Class
						</h4>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Total Seat: <%=c.getTotal_Seat()%></li>
							<li class="list-group-item ">No of Seat Available:<a
								class="text-success b"> <%=c.getAvailable_Seat()%></a></li>
							<li class="list-group-item">Class Teacher :<%=c.getClass_Teacher()%></li>
							<li class="list-group-item"></li>


						</ul>
						<p class="card-text">
							<a onclick="getclassDetail(<%=c.getId()%>)"
								class="btn btn-primary">Edit</a> <a
								onclick="getClassDetail(<%=c.getId()%>)" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#deleteClass">Delete </a>
						</p>
						<div class="modal fade" id="deleteClass" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Delete <%=c.getId() %> Class </h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
									
										<img src="../img/delete.jpg" class="img-fluid" alt="...">
										
									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<a onclick="deleteClass(<%=c%>)" class="btn btn-danger">Delete</a>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<%
	}

	}
	%>
</div>
