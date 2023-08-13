<%@page import="java.util.List"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.TeacherFormDao"%>
<%@page import="Entity.TeacherRegForm"%>
<div class="col-10">
<%TeacherFormDao teacherFormDao=new TeacherFormDao(MySqlConnection.getConnection());

%>

					
							<%
							
							List<TeacherRegForm> list=teacherFormDao.getAllForm();
							if (list.size() == 0) {
								out.println(
								"<div class='col align-self-center m-5'><h1 class='display-4 text-center text-light'>No Teacher Registration Form Available Here </h1></div>");
							}
							if (list.size() != 0) {
								out.println("<h2 class='text-center text-light p-2'>List All Teacher Registration Form <hr></h2>");
							%>
								<table class="table text-light ">
								<thead class="table-primary">
									<tr>
										<th scope="col">FirstName</th>
										<th scope="col">LastName</th>
										<th scope="col">Gender</th>
										<th scope="col">MaritalStatus</th>
										<th scope="col">Designation</th>
										<th scope="col">Experience</th>
										<th scope="col">HighestDegree</th>
										<th scope="col">JoiningDate</th>
										<th scope="col">SalaryExp</th>
										
										
									</tr>
								</thead>
								<tbody>
								<%
							for(TeacherRegForm s:list){
							%>
							<tr>
								
								<td><%=s.getFirstName()%></td>
								<td><%=s.getLastName()%></td>
								<td><%=s.getGender()%></td>
								<td><%=s.getMaritalStatus()%></td>
								<td><%=s.getDesignation()%></td>
								<td><%=s.getExperience()%></td>
								<td><%=s.getHighestDegree()%></td>
								<td><%=s.getJoiningDate()%></td>
								<td><%=s.getSubject_Id()%></td>
								<td><%=s.getSalaryExp()%></td>
								<td><%=s.getJoiningDate()%></td>
							
								
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