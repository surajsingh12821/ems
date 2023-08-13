package Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StudentDao;
import Dao.StudentFormDao;
import Entity.Message;
import Entity.StudentRegForm;
import Service.MySqlConnection;

public class StudentRegistration  extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		    resp.setContentType("text/html");
		 	String urlInfo =  req.getContextPath();
			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String fatherName = req.getParameter("fatherName");
			String motherName = req.getParameter("motherName");
			String gender = req.getParameter("gender");
			Date dob = Date.valueOf(req.getParameter("dob"));
			String bloodGroup = req.getParameter("bloodGroup");
			int year_Id = Integer.parseInt( req.getParameter("year_Id"));
			int class_Id = Integer.parseInt(req.getParameter("class_Id"));
			int user_Id=Integer.parseInt(req.getParameter("id"));
			StudentRegForm form=new StudentRegForm(firstName,lastName,fatherName,motherName,gender,dob,bloodGroup,year_Id,class_Id);
			StudentFormDao studentFormDao=new StudentFormDao(MySqlConnection.getConnection());
			boolean setNewAdmission = studentFormDao.setNewAdmission(form);
			if(setNewAdmission!=false)
			{
				StudentDao studentDao=new StudentDao(MySqlConnection.getConnection());
				//StudentRegForm studentFormDeatil = studentFormDao.getStudentFormDeatil(user_Id);
				//add pdf format of registration form and send it to email of the user 
				boolean studentRegApply = studentDao.studentRegApply(user_Id,form.getId());
					if(studentRegApply!=false)
					{
						resp.sendRedirect("StudentHome.jsp?msg=reg");
					}
			}
			else
			{
				resp.sendRedirect("StudentHome.jsp?msg=notreg");
			}
			
	}

}
