
<%@page import="Dao.TeacherDao"%>
<%@page import="Dao.UserDao"%>
<%@page import="Dao.StudentDao"%>
<%@page import="Dao.ClassDao"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="../error.jsp"%>

<html>
<head>
<%@include file="./basic/basic.jsp"%>
<meta charset="UTF-8">
<title>Admin Home</title>
</head>
<body>
	<!-- navbar -->
	<%@include file="./basic/navbar1.jsp"%>
	<div class="container-fluid bg-dark">
		<br>
		<h4 class="text-center  text-light">DashBoard</h4>
	
		<div class="row d-flex justify-content-start m-2">

			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/book.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Book</h7>
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/course.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Courses</h7>
					<%
					ClassDao classDao = new ClassDao(MySqlConnection.getConnection());
					int total = classDao.countClasses();
					%>
					<h4 class="text-center"><%=total%></h4>
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/teacher.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Teachers</h7>
					 <%
					TeacherDao teacherDao = new TeacherDao(MySqlConnection.getConnection());
					int teachers = teacherDao.countTeachers();
					%> 
					<h4 class="text-center"><%=teachers%></h4> 
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/student.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Students</h7>
					<%
					StudentDao studentDao = new StudentDao(MySqlConnection.getConnection());
					int student = studentDao.countStudents();
					%>
					<h4 class="text-center"><%=student%></h4>
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/parent.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Parents</h7>
					<%-- <%
					ParentDao parentDao = new ParentDao(ConnectionProvider.getConnection());
					int parents = parentDao.countParents();
					%>
					<h4 class="text-center"><%=parents%></h4> --%>
				</div>
			</div>

			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/users.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Total Users</h7>
					<%
					UserDao dao = new UserDao(MySqlConnection.getConnection());
					int activeUsers = dao.getMaxUserId();
					%>
					<h4 class="text-center"><%=activeUsers%></h4>

				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 16rem;">
				<img src="../img/users.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h7 class="card-title">Active Users</h7>
					<%
					int active = dao.countActiveUsers();
					%>
					<h4 class="text-center"><%=activeUsers%></h4>

				</div>
			</div>
			
			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/users.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>DeActivated Users</h9>
					<%
					int inActive = dao.countDeActiveUsers();
					%>
					<h4 class="text-center"><%=inActive%></h4>

				</div>
			</div>

			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/preg.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Student Reg Applied</h9>
					<%
					int applyied = studentDao.countStudentRegApply();
					%>
					<h4 class="text-center"><%=applyied%></h4>

				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/preg.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Student Reg Pending</h9>
					<%
					int notapplyied = studentDao.countStudentRegNotApply();
					%>
					<h4 class="text-center"><%=notapplyied%></h4>

				</div>
			</div>
			 <div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/tpend.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Teacher Reg Appied </h9>
					<%
					int teacherRegActive = teacherDao.countTeacherRegApply();
					%>
					<h4 class="text-center "><%=teacherRegActive%></h4>
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/tpend.png" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Teacher Reg Pending</h9>
					<%
					int teacherRegnot = teacherDao.countTeacherRegNotApply();
					%>
					<h4 class="text-center "><%=teacherRegnot%></h4>
				</div>
			</div>
			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/parent.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Parent Reg Applied </h9>
					<%

					%>
					<h4 class="text-center "><%=teacherRegnot%></h4>
				</div>
			</div> 
			<div class="card m-2" style="width: 12rem; height: 17rem;">
				<img src="../img/parent.jpg" class="card-img-top" alt="...">
				<div class="card-body text-center">
					<h9>Parent Reg Pending </h9>
					<%

					%>
					<h4 class="text-center "><%=teacherRegnot%></h4>
				</div>
			</div> 
		</div>
	</div>
	<!-- footer -->
	<div>
		<%@include file="./basic/footer.jsp"%>
	</div>
</body>
</html>
<script>
$('#notification').delay(2000).hide(0);             
</script>