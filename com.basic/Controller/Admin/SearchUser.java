package Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;
import Entity.User;
import Service.MySqlConnection;

@WebServlet(value = "/searchUser")
public class SearchUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------");
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String ids = request.getParameter("userId");
		String email=request.getParameter("email");
		String user_Name=request.getParameter("user_Name");
		UserDao dao=new UserDao(MySqlConnection.getConnection());
		User user=null;
		if(ids!=null)
		{
			int id=Integer.parseInt(ids);
			user = dao.getUserById(id);
			
			
		}
		else if(email!=null)
		{
			user = dao.getUserByEmail(email);
			
		}
		else if(user_Name!=null)
		{
			user= dao.getUserByUserName(user_Name);
		}
		request.getServletContext().setAttribute("user", user);
		request.getRequestDispatcher("/Admin/Registration.jsp").forward(request, response);
	}
}
