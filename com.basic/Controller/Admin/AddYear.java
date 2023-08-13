package Controller.Admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.YearDao;
import Entity.Year;
import Service.MySqlConnection;

public class AddYear extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String year_Name = req.getParameter("year_Name");
		Date start_Date = new Date(req.getParameter("start_Date"));
		Date  end_Date=new Date(req.getParameter("end_Date"));
		System.out.println("----"+start_Date);
		
		Year year=new Year(year_Name,start_Date,end_Date);
		System.out.println(year);
		YearDao  dao=new YearDao(MySqlConnection.getConnection());
		boolean add_Year = dao.add_Year(year);
		if(add_Year!=false)
			resp.sendRedirect("courses.jsp?msg='new'");
		else
			resp.sendRedirect("courses.jsp?msg='notcreated'");
	}

}
