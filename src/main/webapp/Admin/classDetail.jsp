<%@page import="Entity.Teacher"%>
<%@page import="Dao.TeacherDao"%>
<%@page import="Entity.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="Dao.SubjectDao"%>
<%@page import="Entity.Year"%>
<%@page import="Dao.YearDao"%>
<%@page import="Entity.Classes"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.ClassDao"%>
<%
String id = request.getParameter("id");
if(id!=null)
{
	
}
int classId = Integer.parseInt(id);
if (classId == 0) {
%>
<div class='col align-self-center m-5'>
	<h2 class='display-3 text-center '>
		<br>
		<hr>
		Please Select Class 2...<br> <i
			class='fas fa-chevron-circle-left'></i><br> <br>
		<hr>
		<br>
	</h2>
</div>
<%
} else {

ClassDao classDao = new ClassDao(MySqlConnection.getConnection());
Classes classes = classDao.get_ClassDetail(classId);
YearDao yearDao = new YearDao(MySqlConnection.getConnection());
Year year = yearDao.get_Year(classes.getId());
SubjectDao subjectDao = new SubjectDao(MySqlConnection.getConnection());
List<Subjects> listSubjects = subjectDao.getAll_SubjectDetails(classes.getId());
TeacherDao teacherDao = new TeacherDao(MySqlConnection.getConnection());
%>




<div class="row ">
	
		

		<nav class="navbar navbar-light bg-dark">
		<button class="btn btn-primary" type="button"
			data-bs-toggle="collapse" data-bs-target="#viewYear"
			aria-expanded="false" aria-controls="collapseExample">Year</button>
  <div class="container-fluid">
    <ul class="navbar-nav">
    	
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Exam
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Create</a></li>
            <li><a class="dropdown-item" href="#">Delete</a></li>
            <li><a class="dropdown-item" href="#">Edit</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Notice
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="#">New Updates</a></li>
            <li><a class="dropdown-item" href="#">Create </a></li>
            <li><a class="dropdown-item" href="#">Update</a></li>
            <li><a class="dropdown-item" href="#">Delete</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Student
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Applied Registration</a></li>
            <li><a class="dropdown-item" href="#">Confirmed Registration</a></li>
            <li><a class="dropdown-item" href="#">Students List</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            TimeTable
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Create</a></li>
            <li><a class="dropdown-item" href="#">View</a></li>
            <li><a class="dropdown-item" href="#">Edit</a></li>
            <li><a class="dropdown-item" href="#">Delete</a></li>
          </ul>
        </li>
      </ul>
  </div>
</nav>
	</div>
	<br>
	<div class="collapse" id="viewYear">
		<div class="card card-body">
			<div class="row g-0 bg-dark position-relative">
				<div class="col-md-6 mb-md-0 p-md-4">
					<img src="../img/session.jpg" class="w-100" alt="...">
				</div>
				<div class="col-md-6 p-4 ps-md-0">
					<br>
					<h3 class="mt-0 text-light text-center">Year Details</h3>
					<table class="table text-light table-bordered border-light">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Year Name</th>
								<th scope="col">Starting Date</th>
								<th scope="col">Ending Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"><%=year.getId()%></th>
								<th scope="row"><%=year.getYear_Name()%></th>
								<th scope="row"><%=year.getStart_Date()%></th>
								<th scope="row"><%=year.getEnd_Date()%></th>
							</tr>
							<tr>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><button type="button" class="btn btn-danger"
										data-bs-toggle="modal" data-bs-target="#delete">
										Delete</button></td>
								<td><button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#editYear">
										Edit</button></td>


							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

</div>

<div class="row">
	<div class="row g-0 bg-dark position-relative">
		<div class="col-md-4 mb-md-0 p-md-4">
			<img src="../img/clas.jpg" class="w-100" alt="...">
		</div>
		<div class="col-md-8 p-4 ps-md-0">



			<br>
			<h3 class="mt-0 text-light text-center">Class Details</h3>
			<table class="table text-light table-bordered border-light">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Class Name</th>
						<th scope="col">Class Teacher</th>
						<th scope="col">Class Room No</th>
						<th scope="col">Total Seat</th>
						<th scope="col">Seat Available</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"><%=classes.getId()%></th>
						<th scope="row"><%=classes.getClass_Name()%></th>
						<th scope="row"><%=classes.getClass_Teacher()%></th>
						<th scope="row"><%=classes.getClass_Room()%></th>
						<th scope="row"><%=classes.getTotal_Seat()%></th>
						<th scope="row"><p class="text-success"><%=classes.getAvailable_Seat()%></p></th>
					</tr>
					<tr>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button type="button" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#delete">Delete</button></td>
						<td><button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#editYear">Edit</button></td>


					</tr>
				</tbody>
			</table>
		</div>
	</div>



</div>
<div class="row">
	<div class="row p-1 g-0 bg-dark position-relative">

		<div class="col-md-12 p-4 ps-md-0">
			<br>
			<h3 class="mt-0 text-light text-center">Subjects Details</h3>
			<table class="table text-light table-bordered border-light">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">Subject Name</th>
						<th scope="col">Subject Type</th>
						<th scope="col">Subject Teacher</th>
						<th scope="col">Marks</th>
						<th scope="col">Book</th>
						<th scope="col">Notes</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>

					</tr>
				</thead>
				<tbody>
					<%for(Subjects subjects:listSubjects){ %>
					<tr>
						<th scope="row"><%=subjects.getId()%></th>
						<th scope="row"><%=subjects.getSubject_Name()%></th>
						<th scope="row"><%=subjects.getSubject_Type()%></th>
						<th scope="row"><%=subjects.getSubject_Teacher()%></th>
						<th scope="row"><%=subjects.getSubject_Marks()%></th>
						<th scope="row"><%=subjects.getSubject_Book()%></th>

						<th scope="row"><p class="text-success"><%=subjects.getSubject_Notes()%></p></th>
						<td><button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#editYear">Edit</button></td>
						<td><button type="button" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#delete">Delete</button></td>


					</tr>
					<%} %>
					<tr>
					</tr>
					<tr>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>

<%
}
%>
<!-- Modal -->
<div class="modal fade" id="delete" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog model-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Are You Sure u
					want to delete</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card align-center" style="width: 13rem;">
					<img src="../img/delete.jpg" class="card-img-top" alt="...">

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">No</button>
				<button type="button" class="btn btn-danger">Yes</button>
			</div>
		</div>
	</div>
</div>


