package Controller.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;
import Service.MySqlConnection;

public class DeleteUser extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		UserDao userDao=new UserDao(MySqlConnection.getConnection());
		 boolean f=userDao.deleteUser(userId);
		 if(f==true)
			 response.sendRedirect("users.jsp?msg=deleted");
		 else
			 response.sendRedirect("users.jsp?msg=notdeleted");
	}
}
