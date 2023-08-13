<%@page import="Entity.User"%>
<%@page import="Service.MySqlConnection"%>
<%@page import="Dao.UserDao"%>
<%
String context=request.getContextPath();
int id=Integer.parseInt(request.getParameter("userId"));
UserDao dao=new UserDao(MySqlConnection.getConnection());
boolean isDeleted=dao.deleteUser(id);
if(isDeleted!=true)
	response.sendRedirect(context+"/Admin/Registration.jsp?msg=deleted");
	else
		response.sendRedirect(context+"/Admin/Registration.jsp?msg=notdeleted");


%>