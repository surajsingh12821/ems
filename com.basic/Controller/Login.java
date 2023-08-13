package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import Entity.User;
import Service.MySqlConnection;

public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 resp.setContentType("text/html");
		 
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		User user = new User(email, password);
		String urlInfo =  req.getContextPath();
		String msg = "";
		try {
			UserDao userDao = new UserDao(MySqlConnection.getConnection());
			User validate = userDao.getValidate(email, password);
			if (validate != null)
			{
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("validate", validate);
				if (validate.getRole_Id() == 2)
				{
					String url=urlInfo+"/Student/StudentHome.jsp?msg=wel";
					if ("Active".equalsIgnoreCase(validate.getAccount_Status()) )
					{
						System.out.println("Student Login ");
						resp.sendRedirect(url);
					} else
					{
						msg = "inActive";
					}
					
				}
				if (validate.getRole_Id() == 3)
				{
					
					String url=urlInfo+"/Teacher/TeacherHome.jsp?msg=wel";
					if ("Active".equalsIgnoreCase(validate.getAccount_Status()))
					{
						System.out.println("Teacher Login ");
						resp.sendRedirect(url);
					}
					else
					{
						msg = "inActive";
					}
				}
				if (validate.getRole_Id() == 3)
				{
					String url=urlInfo+"/Parent/ParentHome.jsp?msg=wel";
					if (validate.getAccount_Status() == "Active")
					{
						System.out.println("Parent Login ");
						resp.sendRedirect(url);
					} else 
					{
						msg = "inActive";
					}
				}
				if (validate.getRole_Id() == 1)
				{
					String url=urlInfo+"/Admin/AdminHome.jsp?msg=wel";
					System.out.println(url);
					if (validate.getAccount_Status().equalsIgnoreCase("Active"))
					{
						System.out.println("Admin Login ");
						resp.sendRedirect(url);
					} else
					{
						msg = "inActive";
					}
				}
			}
			else {
				msg = "notExist";
			}

			System.out.println(msg);
			resp.sendRedirect("home.jsp?msg=" + msg);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
