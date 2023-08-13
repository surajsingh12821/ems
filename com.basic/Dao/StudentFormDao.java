package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import Entity.StudentRegForm;

public class StudentFormDao {
	
	Connection connection;

	public StudentFormDao(Connection connection) {
		super();
		this.connection = connection;
	}
	public int getMaxFormId()
	{
		int max=0;
		try {
			String sql="select count(id) from studentregform";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				max=rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return max;
	}
	
	public boolean setNewAdmission(StudentRegForm sf)
	{
		
		boolean b=false;
		try {
			String sql="insert into studentregform(firstName,lastName,fatherName,motherName,gender,dob,bloodGroup,year_Id,class_Id) values(?,?,?,?,?,?,?,?,?) ";
			PreparedStatement ps=connection.prepareStatement(sql);
			
			ps.setString(1, sf.getFirstName());
			ps.setString(2, sf.getLastName());
			ps.setString(3, sf.getFatherName());
			ps.setString(4, sf.getMotherName());
			ps.setString(5, sf.getGender());
			ps.setDate(6, sf.getDob());
			ps.setString(7, sf.getBloodGroup());
			ps.setInt(8, sf.getYear_Id());
			ps.setInt(9, sf.getClass_Id());
			int executeUpdate = ps.executeUpdate();
			if(executeUpdate!=0)
			{
				b = true;
			}	
			else
				b=false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public List<StudentRegForm> getAllForm()
	{
		ArrayList<StudentRegForm> list=new ArrayList<StudentRegForm>();
		try {
			String sql="select * from studentregform ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				StudentRegForm sf=new StudentRegForm();
				sf.setId(rs.getInt(1));
				sf.setFirstName(rs.getString(2));
				sf.setLastName(rs.getString(3));
				sf.setFatherName(rs.getString(4));
				sf.setMotherName(rs.getString(5));
				sf.setGender(rs.getString(6));
				sf.setDob(rs.getDate(7));
				sf.setBloodGroup(rs.getString(8));
				sf.setYear_Id(rs.getInt(9));
				sf.setClass_Id(rs.getInt(10));
				sf.setAddressId(rs.getInt(11));
				list.add(sf);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public StudentRegForm getStudentDeatilForm()
	{
		StudentRegForm sf=new StudentRegForm();
		try {
			String sql="select * from studentregform ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				sf.setId(rs.getInt(1));
				sf.setFirstName(rs.getString(2));
				sf.setLastName(rs.getString(3));
				sf.setFatherName(rs.getString(4));
				sf.setMotherName(rs.getString(5));
				sf.setGender(rs.getString(6));
				sf.setDob(rs.getDate(7));
				sf.setBloodGroup(rs.getString(8));
				sf.setYear_Id(rs.getInt(9));
				sf.setClass_Id(rs.getInt(10));
				sf.setAddressId(rs.getInt(11));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sf;
	}
	public StudentRegForm getStudentFormDeatil(int id)
	{
		StudentRegForm sf=new StudentRegForm();
		try {
			String sql="select * from studentregform  where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				sf.setId(rs.getInt(1));
				sf.setFirstName(rs.getString(2));
				sf.setLastName(rs.getString(3));
				sf.setFatherName(rs.getString(4));
				sf.setMotherName(rs.getString(5));
				sf.setGender(rs.getString(6));
				sf.setDob(rs.getDate(7));
				sf.setBloodGroup(rs.getString(8));
				sf.setYear_Id(rs.getInt(9));
				sf.setClass_Id(rs.getInt(10));
				sf.setAddressId(rs.getInt(11));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sf;
	}

	public List<String> getColmName()
	{
		ArrayList<String> list=new ArrayList<String>();
		try {
			String sql="select * from studentregform ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			//Retrieving the ResultSetMetadata object
			ResultSetMetaData rsMetaData = (ResultSetMetaData) rs.getMetaData();
			
			int count = rsMetaData.getColumnCount();
			for(int i = 1; i<=count; i++) {
			   list.add(rsMetaData.getColumnName(i));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}

