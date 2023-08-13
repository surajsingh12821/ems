package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MessageDao;
import Entity.Message;
import Service.MySqlConnection;

public class ContactUs extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phoneno=req.getParameter("phoneno");
		String message=req.getParameter("message");
		Message message2=new Message(name,email,phoneno,message);
		MessageDao messageDao=new MessageDao(MySqlConnection.getConnection());
		boolean save_Message = messageDao.save_Message(message2);
		if(save_Message!=false)
				resp.sendRedirect("home.jsp?msg=send");
			else
				resp.sendRedirect("home.jsp?msg=error");
	}

}
