package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import Entity.Classes;
import Entity.Year;



public class ClassDao {
	private Connection con;

	public ClassDao(Connection con) {
		super();
		this.con = con;
	}
	public int countClasses()
	{
		int total=0;
		try {
			String sql="select count(id) from classes";
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			total = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public List<Classes> getAll_ClassName(int year_Id)
	{
		List< Classes> list=new ArrayList<Classes>();
		try {
			String sql="select class_Name from classes where year_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, year_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Classes classes=new Classes();
				classes.setClass_Name(rs.getString(1));
				list.add(classes);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<Classes> getAll_Classes(int year_Id)
	{
		List< Classes> list=new ArrayList<Classes>();
		try {
			String sql="select * from classes where year_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, year_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Classes classes=new Classes();
				classes.setId(rs.getInt(1));
				classes.setClass_Name(rs.getString(2));
				classes.setClass_Teacher(rs.getString(3));
				classes.setClass_Room(rs.getInt(4));
				classes.setTotal_Seat(rs.getInt(5));
				classes.setAvailable_Seat(rs.getInt(6));
				list.add(classes);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<Classes> getClasses()
	{
		List< Classes> list=new ArrayList<Classes>();
		try {
			String sql="select * from classes";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Classes classes=new Classes();
				classes.setId(rs.getInt(1));
				classes.setClass_Name(rs.getString(2));
				list.add(classes);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public Classes get_Class(int year_Id)
	{
		Classes  classes =new Classes();
		try {
			String sql="select * from classes where year_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, year_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				classes.setId(rs.getInt(1));
				classes.setClass_Name(rs.getString(2));
				classes.setClass_Teacher(rs.getString(3));
				classes.setClass_Room(rs.getInt(4));
				classes.setTotal_Seat(rs.getInt(5));
				classes.setAvailable_Seat(rs.getInt(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return classes;
	}
	public Classes get_ClassDetail(int class_Id)
	{
		Classes  classes =new Classes();
		try {
			String sql="select * from classes where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, class_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				classes.setId(rs.getInt(1));
				classes.setClass_Name(rs.getString(2));
				classes.setClass_Teacher(rs.getString(3));
				classes.setClass_Room(rs.getInt(4));
				classes.setTotal_Seat(rs.getInt(5));
				classes.setAvailable_Seat(rs.getInt(6));
				classes.setYear_Id(rs.getInt(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return classes;
	}
	public boolean deleteClassById(Classes c)
	{
		boolean f=false;
		try {
			System.out.println("------------------1-");
			String sql="delete from classes where id=? and year_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, c.getId());
			ps.setInt(2, c.getYear_Id());
			System.out.println("-------------------2");
			int execute = ps.executeUpdate();
			System.out.println("-------------------3");
			if(execute!=0)
				f=true;
			else
				f=false;
			System.out.println("-------------------4");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	
	
}
