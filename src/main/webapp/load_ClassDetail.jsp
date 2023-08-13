<%@page import="java.util.List"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="Entity.Subjects"%>
<%@page import="Entity.Classes"%>
<%@page import="Dao.ClassDao"%>
<%@page import="Entity.Year"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.YearDao"%>
<div class="row">
	<%
	int cId = Integer.parseInt(request.getParameter("id"));
	ClassDao classDetail = new ClassDao(MySqlConnection.getConnection());
	Classes classes = classDetail.get_ClassDetail(cId);
	YearDao yearDao = new YearDao(MySqlConnection.getConnection());
	Year year = yearDao.get_Year(classes.getYear_Id());
	SubjectDao subjectDao=new SubjectDao(MySqlConnection.getConnection());
	List<Subjects> listSubject=subjectDao.getAll_SubjectName(classes.getId());
	if (year == null) {
		%>
		<div class='col align-self-center m-5'>
			<h2 class='display-3 text-center '>
				<br>
				<hr>
				There is No Detail About This Class RightNow<br> <i
					class='fas fa-chevron-circle-left'></i><br> <br>
				<hr>
				<br>
			</h2>
		</div>
		<%
		}
	else{
	%>
		<hr>
		<a href="courses.jsp" class="text-start"><h4>
				<i class="bi bi-arrow-left-circle"></i>
			</h4></a>
		<h3 class="text-center">Detail Of Class</h3>
		<hr>
		<div class="row ">
			<h5>Session Detail</h5>
			<table class="table table-sm table-warning table-bordered fw-bolder">
				<tr>
					<th scope="row">Session Year</th>
					<td class="fw-bolder"><%=year.getYear_Name()%></td>
					<th scope="col">Session Starting Date</th>
					<td class="fw-bolder"><%=year.getStart_Date()%></td>
					<th scope="row">Session Ending Date</th>
					<td class="fw-bolder"><%=year.getEnd_Date()%></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="row">
			<h5>Class Details</h5>
			<table class="table table-sm table-primary table-bordered fw-bolder">
				<thead class="table-dark">
					<tr>
						<th scope="col">Class Room No:</th>
						<th scope="col">Class Name:</th>
						<th scope="col">Class Teacher</th>
						<th scope="col">Total Seat</th>
						<th scope="col">Available Seat</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=classes.getId()%>
						<td><%=classes.getClass_Name()%></td>
						<td><%=classes.getClass_Teacher()%></td>
						<td><%=classes.getTotal_Seat()%></td>
						<td><%=classes.getAvailable_Seat()%></td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div class="row">
			<h5>Various Subject Details</h5>
			<table class="table table-sm table-primary table-bordered fw-bolder">
				<thead class="table-dark">
					<tr>
						<th scope="col">Subject Id:</th>
						<th scope="col">Subject Name:</th>
						<th scope="col">Subject Type</th>
						<th scope="col">Total Marks</th>
						<th scope="col">Subject Teacher</th>
						<th scope="col">Subject Book</th>
						<th scope="col">Subject Notes</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Subjects s:listSubject)
						{
						%>
					<tr>
						<td><%=s.getId()%></td>
						<td><%=s.getSubject_Name()%></td>
						<td><%=s.getSubject_Type()%></td>
						<td><%=s.getSubject_Marks()%></td>
						<td><%=s.getSubject_Teacher()%></td>
						<td><%=s.getSubject_Book()%></td>
						<td><%=s.getSubject_Notes()%></td>
					</tr>
					<%
						}
						
						%>
				</tbody>
			</table>
		</div>
		<hr>

	</div>
</div>
<%}%>