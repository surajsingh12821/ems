package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import Entity.StudentRegForm;
import Entity.Teacher;
import Entity.TeacherRegForm;

public class TeacherFormDao {

	Connection connection;

	public TeacherFormDao(Connection connection) {
		super();
		this.connection = connection;
	}
	public int getMaxFormId()
	{
		int max=0;
		try {
			String sql="select count(id) from teacherregform";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				max=rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return max;
	}
	
	public List<TeacherRegForm> getAllForm()
	{
		ArrayList<TeacherRegForm> list=new ArrayList<TeacherRegForm>();
		try {
			String sql="select * from teacherregform ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TeacherRegForm sf=new TeacherRegForm();
				sf.setId(rs.getInt(1));
				sf.setFirstName(rs.getString(2));
				sf.setLastName(rs.getString(3));
				sf.setFatherName(rs.getString(4));
				sf.setMotherName(rs.getString(5));
				sf.setGender(rs.getString(6));
				sf.setDob(rs.getDate(7));
				sf.setBloodGroup(rs.getString(8));
				sf.setMaritalStatus(rs.getString(9));
				sf.setDesignation(rs.getString(10));
				sf.setExperience(rs.getString(11));
				sf.setHighestDegree(rs.getString(12));
				sf.setJoiningDate(rs.getString(13));
				sf.setSubject_Id(rs.getInt(14));
				sf.setSalaryExp(rs.getInt(15));
				sf.setAddressId(rs.getInt(16));
				list.add(sf);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<String> getColmName()
	{
		ArrayList<String> list=new ArrayList<String>();
		try {
			String sql="select * from teacherregform ";
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
	public List<TeacherRegForm> getAllTeacherForm(int id)
	{
		ArrayList<TeacherRegForm> list=new ArrayList<TeacherRegForm>();
		try {
			String sql="select * from teacherregform where id=? ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TeacherRegForm sf=new TeacherRegForm();
				sf.setId(rs.getInt(1));
				sf.setFirstName(rs.getString(2));
				sf.setLastName(rs.getString(3));
				sf.setFatherName(rs.getString(4));
				sf.setMotherName(rs.getString(5));
				sf.setGender(rs.getString(6));
				sf.setDob(rs.getDate(7));
				sf.setBloodGroup(rs.getString(8));
				sf.setMaritalStatus(rs.getString(9));
				sf.setDesignation(rs.getString(10));
				sf.setExperience(rs.getString(11));
				sf.setHighestDegree(rs.getString(12));
				sf.setJoiningDate(rs.getString(13));
				sf.setSubject_Id(rs.getInt(14));
				sf.setSalaryExp(rs.getInt(15));
				sf.setAddressId(rs.getInt(16));
				list.add(sf);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
}
