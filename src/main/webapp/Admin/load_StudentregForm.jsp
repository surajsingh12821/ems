<%@page import="Entity.StudentRegForm"%>
<%@page import="java.util.List"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.StudentFormDao"%>
<div class="row  justify-content-around mb-2">
	<%
	StudentFormDao studentFormDao = new StudentFormDao(MySqlConnection.getConnection());
	%>


	<%
	List<StudentRegForm> list = studentFormDao.getAllForm();
	if (list.size() == 0) {
		out.println(
		"<div class='col align-self-center m-5'><h1 class='display-4 text-center text-light '><br>No Student Registration Form Available Here<br> </h1></div>");
	}
	if (list.size() != 0) {
		out.println("<h2 class='text-center text-light p-2'>List All Student Registration Form <hr></h2>");
	
	
	%>
	<table class="table text-light ">
		<thead class="table-primary">
			<tr>
				
				<th scope="col">Id</th>
				<th scope="col">FirstName</th>
				<th scope="col">LastName</th>
				<th scope="col">FatherName</th>
				<th scope="col">MotherName</th>
				<th scope="col">Gender</th>
				<th scope="col">Dob</th>
				<th scope="col">BloodGroup</th>
				<th scope="col">Year_Id</th>
				<th scope="col">Class_Id</th>
				
				
			</tr>
		</thead>
		<tbody>
		<%
				for (StudentRegForm s : list) {
				%>
			<tr>
				<th scope="row"><%=s.getId()%></th>
				<td><%=s.getFirstName()%></td>
				<td><%=s.getLastName()%></td>
				<td><%=s.getFatherName()%></td>
				<td><%=s.getMotherName()%></td>
				<td><%=s.getGender()%></td>
				<td><%=s.getDob()%></td>
				<td><%=s.getBloodGroup()%></td>
				<td><%=s.getYear_Id()%></td>
				<td><%=s.getClass_Id()%></td>

				<td><a href="editClassAction.jsp?id=<%=s.getId()%>"><i
						class="far fa-edit"></i></a></td>
				<td><a href="DeleteClasses?id=<%=s.getId()%>"><i
						class="far fa-trash-alt"></i></a></td>
			</tr>
			<%
			}}
			%>
		</tbody>
	</table>
</div>