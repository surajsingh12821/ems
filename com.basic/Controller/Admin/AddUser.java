package Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StudentDao;
import Dao.UserDao;
import Entity.User;
import Service.MySqlConnection;

public class AddUser  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("-----------------------");
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		 response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String user_Name = request.getParameter("user_Name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone_No = request.getParameter("phone_No");
		int role = Integer.parseInt(request.getParameter("role"));
		
		User user=new User(user_Name,email,password,phone_No,role);
		UserDao  userDao=new UserDao(MySqlConnection.getConnection());
		boolean isAvaliable=userDao.getEmailValidation(email);
		if(isAvaliable!=true)
		{
			
			boolean registerUser = userDao.registerUser(user);
			System.out.println("-----------User Registration-------------"+registerUser);
			if(registerUser==true)
			{
				User userDetail = userDao.getUserByEmail(email);
				switch(userDetail.getRole_Id())
				{    
				case 2:    
						{
							StudentDao studentDao=new StudentDao(MySqlConnection.getConnection());
							studentDao.CreateStudent(userDetail);
							
						}
						break;  //optional  
				case 3:    
				 //code to be executed;    
				 break; 
				case 4:    
					 //code to be executed;    
					 break; 
				    
				default:     
				 
				}    
				
				response.sendRedirect(contextPath+"/Admin/Registration.jsp?msg=new");
			}	
			else
				response.sendRedirect(contextPath+"/Admin/Registration.jsp?msg=notcreated");
		}
		else
		{
			response.sendRedirect(contextPath+"/Registration.jsp?msg=exist");
		}
	}
}
