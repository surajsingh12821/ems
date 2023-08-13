<%@page import="Entity.Teacher"%>
<%@page import="java.util.List"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.TeacherDao"%>
<%
TeacherDao teacherDao=new TeacherDao(MySqlConnection.getConnection());
List<Teacher> list=teacherDao.getTeacher();


%>