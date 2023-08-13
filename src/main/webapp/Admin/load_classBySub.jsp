<%@page import="java.util.Set"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="Entity.Book"%>
<%@page import="Dao.BookDao"%>
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
	String name = request.getParameter("name");
	if (name == null) {
	%>
	<div class='col align-self-center m-5'>
		<h2 class='display-3 text-center '>
			<br>
			<hr>
			Select Subject Please...<br> <i
				class='fas fa-chevron-circle-left'></i><br> <br>
			<hr>
			<br>
		</h2>
	</div>
	<%
	} else {

			SubjectDao dao=new SubjectDao(MySqlConnection.getConnection());
			ClassDao classDao = new ClassDao(MySqlConnection.getConnection());
			Set<Integer> set=dao.getClassOf_SubjectOfSameType(name);
			if (set.size() == 0)
			{
			out.println("<div class='col align-self-center m-5'><h1 class='display-4 text-center text-light '><br>No Class Available Here<br> </h1></div>");
			}
			else
			{
				out.println("<h2 class='text-center text-dark p-2'>Various Classes <hr></h2>");
		     for(Integer i:set)
				{
					Classes c=classDao.get_ClassDetail(i);
					
				%>
					
					<div class="col-5">

					<div class="card mb-4" style="max-width: 555px;">
					<div class="row g-0">
					<div class="col-md-4 text-center">
							<img src="../img/clas.jpg" class="img-fluid rounded-start" alt="...">
					</div>
					<div class="col-md-8">
					<div class="card-body ">
						<h4 class="card-title">
							<%=c.getClass_Name()%>
							Class
						</h4>
						<ul class="list-group list-group-flush">
							<p>
							Subject:
							<h7><%=name%>
								
							</h7>
							</p>


						</ul>
						<div class="card-body align-baseline">
							<a class="btn btn-danger" data-bs-toggle="modal"
								data-bs-target="#viewSubject">view</a>
								<a class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#editSubject">Edit</a>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="viewSubject" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Book Detail</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="card mb-4" style="max-width: 800px;">
						<div class="row g-0">
							<div class="col-md-2 text-center">
								<img src="./img/book.png" class="img-fluid rounded-start"
									alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body ">
									<%
									SubjectDao subjectDao=new SubjectDao(MySqlConnection.getConnection());
									int subject_Id=subjectDao.getSubjectId(name);
									BookDao bookDao=new BookDao(MySqlConnection.getConnection());
										Book book=bookDao.getBookDetailBySubject(subject_Id);
										if(book.getId()==0)
										{
											out.println(
													"<div class='col align-self-center m-2'><br>No Book Available...<br><br><br> </div>");
										}
										else
										{
											
										
									%>
									<table class="table">
										<thead class="table-dark">
											<tr>
												
												<th scope="col">Subject Name</th>
												<th scope="col">Class Name</th>
											
												<th scope="col">Book Name</th>
												<th scope="col">Book Type</th>
												<th scope="col">Book Year</th>
												<th scope="col">Book Price</th>
												<th scope="col">Book Author</th>
											</tr>
										</thead>
										<tbody class="table-primary">
											<tr>
												<th scope="row"><%=name %></th>
												<th scope="row"><%=c.getClass_Name() %> </th>
												<th scope="row"><%=book.getBook_Name() %></th>
												<th scope="row"><%=book.getBook_Type() %></th>
												<th scope="row"><%=book.getBook_Year() %></th>
												<th scope="row"><%=book.getBook_Price() %></th>
												<th scope="row"><%=book.getBook_Author() %></th>
												
											</tr>
											</tbody>
											</table>
											<%} %>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>

	
	<%
		
		}
		
									
	}

	}
	%>
</div>