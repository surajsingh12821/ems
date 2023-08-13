package Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;
import Entity.User;
import Service.MySqlConnection;

public class UpdateUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-----------------------");
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id = Integer.parseInt(request.getParameter("userId"));
		String user_Name = request.getParameter("user_Name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone_No = request.getParameter("phone_No");
		int role = Integer.parseInt(request.getParameter("role_Id"));
		String Account_Status = request.getParameter("Account_Status");
		User user=new User(id,user_Name,email,password,phone_No,role,Account_Status);
		System.out.println(user);
		UserDao  userDao=new UserDao(MySqlConnection.getConnection());
		boolean updateUser = userDao.updateUser(user);
		if(updateUser==true)
			response.sendRedirect(contextPath+"/Admin/Registration.jsp?msg=updated");
			else
				response.sendRedirect(contextPath+"/Admin/Registration.jsp?msg=notupdated");
		
	}
}
