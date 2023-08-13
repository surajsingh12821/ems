
package Controller.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Service.MySqlConnection;


public class DeleteClass extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		String sid=req.getParameter("id");
		if(sid!=null)
		{
			int id=Integer.parseInt(sid);
			ClassDao classDao=new ClassDao(MySqlConnection.getConnection());
			boolean deleteClassById = classDao.deleteClassById(id);
			System.out.println(deleteClassById+"/////////////////////////////////////////////");
			if(deleteClassById==true)
				out.print("deleted");
			else
				out.print("not deleted");
		}
	}
}