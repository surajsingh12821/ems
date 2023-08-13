<%@page import="java.util.List"%>
<%@page import="javax.security.auth.Subject"%>
<%@page import="Entity.Subjects"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="Entity.Year"%>
<%@page import="Dao.YearDao"%>
<%@page import="Entity.Classes"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.ClassDao"%>

<%@page import="java.sql.*"%>
<%@page errorPage="error.jsp"%>
<div class="row">
		<hr>
		<a href="courses.jsp" class="text-start"><h4><i class="bi bi-arrow-left-circle"></i></h4></a>
		
		<h3 class="text-center text-light">Detail Of Class</h3>
		<br>
		<div class="row ">
		
			<h5 class="text-center text-light">Session Detail</h5>
			<%
			int cId = Integer.parseInt(request.getParameter("id"));
			ClassDao classDao=new ClassDao(MySqlConnection.getConnection());
			Classes classes=classDao.get_ClassDetail(cId);
			YearDao yearDao=new YearDao(MySqlConnection.getConnection());
			Year year=yearDao.get_Year(classes.getYear_Id());
			%>
			<table class="table table-sm table-primary table-bordered fw-bolder">
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
		<br>
		<div class="row">
			<div class="col-10">
				<h5 class="text-center text-light">Class Details</h5>
				<table class="table table-sm table-warning table-bordered fw-bolder">
					<thead class="table-primary">
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
						<td><%=classes.getClass_Room() %>
							<td><%=classes.getClass_Name() %> Class</td>
							<td><%=classes.getClass_Teacher()%></td>
							<td><%=classes.getTotal_Seat()%></td>
							<td><%=classes.getAvailable_Seat()%></td>
						</tr>
						
					</tbody>
				</table>
			</div>
			</div>
			<br>
			<div class="row">
			<div class="col-10">
				<h5 class="text-center text-light">Various Subject Details</h5>
				<table class="table table-sm table-warning table-bordered fw-bolder">
					<thead class="table-primary">
						<tr>
							<th scope="col">Subject Id:</th>
							<th scope="col">Subject Name:</th>
							<th scope="col">Subject Type</th>
							<th scope="col">Subject Teacher</th>
							<th scope="col">Total Marks</th>
							<th scope="col">Subject Books</th>
							<th scope="col">Subject Notes</th>
						</tr>
					</thead>
					<tbody>
						<%
						SubjectDao subjectDao=new SubjectDao(MySqlConnection.getConnection());
						List<Subjects> listSubject=subjectDao.getAll_SubjectDetails(classes.getId());
						for(Subjects s:listSubject)
						{
						%>
						<tr>
							<td><%=s.getId()%></td>
							<td><%=s.getSubject_Name()%></td>
							<td><%=s.getSubject_Type()%></td>
							<td><%=s.getSubject_Teacher()%></td>
							<td><%=s.getSubject_Marks()%></td>
							<td><%=s.getSubject_Book()%></td>
							<td><%=s.getSubject_Notes()%></td>
						</tr>
						<%
						}
						
						%>
					</tbody>
				</table>
			</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-12">
					
						<h5 class="text-center text-light">Student Applied</h5>
						<table
							class="table table-sm table-danger bg-opacity-10 table-bordered fw-bolder">
							<thead class="table-primary">
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
									<th scope="col">Edit</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>
								<%-- <%
								try
								{
									Connection connection=ConnectionProvider.getConnection();
									PreparedStatement ps=connection.prepareStatement("select * from studentDetail where studentStatus='inActive'  and sessionId='"+sessionId+"' and classId='"+classId+"' ");
									ResultSet rs=ps.executeQuery();
									while(rs.next())
									{
									
								%> --%>
								<%-- <tr>
									<td><%=rs.getInt(1)%></td>
									<td><%=rs.getInt(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getDate(8)%>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><%=rs.getString(10)%></td>
									<td><%=rs.getString(18)%></td>
									<td><a href="editRegStudent.jsp?id=<%=rs.getInt(1)%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserRegAction.jsp?id=<%=rs.getInt(1)%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr> --%>
								
								<%-- <%}}
								catch(Exception e)
								{
									System.out.println(e);
								}
								%> --%>
							</tbody>
						</table>
					</div>
			</div>
			<div class="row">
				<div class="col-12">
					
						<h5 class="text-center text-light">Student Confirmed</h5>
						<table
							class="table table-sm table-success bg-opacity-10 table-bordered fw-bolder">
							<thead class="table-primary">
								<tr>
									<th scope="col">Reg-Id</th>
									<th scope="col">Roll No</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Date Of Birth</th>
									<th scope="col">Father Name</th>
									<th scope="col">Mother Name</th>
									<th scope="col">Admission Date</th>
									<th scope="col">Status</th>
									<th scope="col">Edit</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>
								<%-- <%
								StudentDao studentDao=new StudentDao(ConnectionProvider.getConnection());
								List<Student> studentsList=studentDao.getAllActiveStudentsList(sessionId, classId);
								for(Student student:studentsList)
								{								%>
								<tr>
									<td><%=student.getId()%></td>
									<td><%=student.getRollNo()%></td>
									<td><%=student.getFirstName()%></td>
									<td><%=student.getLastName()%></td>
									<td><%=student.getDob() %>
									<td><%=student.getFatherName()%></td>
									<td><%=student.getMotherName()%></td>
									<td><%=student.getAdmissionDate()%></td>
									<td><%=student.getStudentStatus()%></td>
									<td><a href="editRegStudent.jsp?id=<%=student.getId()%>"><i
											class="far fa-edit"></i></a></td>
									<td><a
										href="deleteUserRegAction.jsp?id=<%=student.getId()%>"><i
											class="far fa-trash-alt"></i></a></td>
								</tr>
								<%
								}
								%> --%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	