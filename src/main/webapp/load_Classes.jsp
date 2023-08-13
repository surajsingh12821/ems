<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.ClassDao"%>
<%@page import="Entity.Classes"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<div class="row  justify-content-around mb-2">
	<%
	int yId = Integer.parseInt(request.getParameter("yearId"));
	if (yId == 0) {
	%>
	<div class='col align-self-center m-5'>
		<h2 class='display-3 text-center '>
			<br>
			<hr>
			Please Select Course Session<br> <i
				class='fas fa-chevron-circle-left'></i><br> <br>
			<hr>
			<br>
		</h2>
	</div>
	<%
	}
	ClassDao dao = new ClassDao(MySqlConnection.getConnection());
	List<Classes> listC = dao.getAll_ClassName(yId);
	listC = dao.getAll_Classes(yId);
	if (listC.size() == 0) {
	out.println(
			"<div class='col align-self-center m-5'><h2 class='display-3 text-center '><br><hr>No Classes Are Available For This Year...<br><br><hr><br> </h2></div>");

	}
	if (listC.size() != 0) {
	out.println("<h2 class='text-center  p-2'>Various Classes <hr></h2>");
	for (Classes c : listC) {
	%>
	<div class="col-5">

		<div class="card mb-3" style="max-width: 540px;">
			<div class="row g-0">
				<div class="col-md-4 text-center">
					<img src="img/clas.jpg" class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body ">
						<h4 class="card-title">
							<%=c.getClass_Name()%> Class
						</h4>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Total Seat: <%=c.getTotal_Seat()%></li>
							<li class="list-group-item ">No of Seat Available:<a class="text-success b"> <%=c.getAvailable_Seat()%></a></li>
							<li class="list-group-item">Class Teacher :<%=c.getClass_Teacher()%></li>
						</ul>
						<div class="card-body">
							<a onclick="getClassDetail(<%=c.getId()%>)"
								class="btn btn-danger" data-bs-toggle="modal"
								data-bs-target="#details">View Class Details</a>

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
