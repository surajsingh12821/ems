package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import Entity.Year;
import Service.MySqlConnection;

public class YearDao {
	private Connection con;

	public YearDao(Connection con) {
		super();
		this.con = con;
	}
	
	public List<Year> getAll_YearName()
	{
		List< Year> list=new ArrayList<Year>();
		try {
			String sql="select year_Name from year";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Year year=new Year();
				year.setYear_Name(rs.getString(1));
				list.add(year);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<Year> getAll_Year()
	{
		List< Year> list=new ArrayList<Year>();
		try {
			String sql="select * from year";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Year year=new Year();
				year.setId(rs.getInt(1));
				year.setYear_Name(rs.getString(2));
				year.setStart_Date(rs.getDate(3));
				year.setEnd_Date(rs.getDate(4));
				list.add(year);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public Year get_Year(int id)
	{
		 Year year=new Year();
		try {
			String sql="select * from year where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				year.setId(rs.getInt(1));
				year.setYear_Name(rs.getString(2));
				year.setStart_Date(rs.getDate(3));
				year.setEnd_Date(rs.getDate(4));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return year;
	}
	
	public boolean add_Year(Year year)
	{
		
		boolean b=false;
		try {
			String sql="insert into year(year_Name,start_Date,end_Date) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, year.getYear_Name());
			ps.setDate(2, (java.sql.Date) year.getStart_Date());
			ps.setDate(3, (java.sql.Date) year.getEnd_Date());
			int executeUpdate = ps.executeUpdate();
			if(executeUpdate!=0)
			b = true;
			else
				b=false;
			
			System.out.println("Year Added");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public HashMap<Integer,String> getYear() {
		HashMap< Integer, String> list=new HashMap<Integer, String>();
		try {
			Connection connection2 = MySqlConnection.getConnection();
			String sql = "select id,year_Name from year ";
			PreparedStatement ps = connection2.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.put(rs.getInt(1),rs.getString(2));
			}

		} catch (Exception e) {
			
		}
		return list;
	}
	
	

}
