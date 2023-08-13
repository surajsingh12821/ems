package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entity.Teacher;
import Entity.User;

public class TeacherDao {

	private Connection connection;

	public TeacherDao(Connection connection) {
		super();
		this.connection = connection;
	}
	public int countTeachers()
	{
		int total=0;
		try {
			String sql="select count(id) from teacher ";
			PreparedStatement ps=connection.prepareStatement(sql);
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public int countTeacherRegApply()
	{
		int total=0;
		try {
			String sql="select count(id) from teacher where registration_Apply=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "true");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public int countTeacherRegNotApply()
	{
		int total=0;
		try {
			String sql="select count(id) from teacher where registration_Apply=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "false");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public List<Teacher> getTeacher()
	{
		List<Teacher> list=new ArrayList<Teacher>();
		
		try {
			String sql="select count(id) from teacher where admission_Confirm=? and teacherStatus=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "true");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Teacher teacher=new Teacher();
				teacher.setId(rs.getInt(1));
				list.add(teacher);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public Teacher getTeacher_Detail(int userId)
	{
		Teacher teacher=new Teacher();
		
		try {
			String sql="select * from teacher where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1,userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				teacher.setId(rs.getInt(1));
				teacher.setRegistration_Apply(rs.getString(2));
				teacher.setRegistration_Date(rs.getTimestamp(3));
				teacher.setAdmission_Confirm(rs.getString(4));
				teacher.setAdmission_Date(rs.getTimestamp(5));
				teacher.setTeacherStatus(rs.getString(6));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return teacher;
	}
	public Teacher getTeacher_Detail(User u)
	{
		Teacher teacher=new Teacher();
		
		try {
			String sql="select * from teacher where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1,u.getId());
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				teacher.setId(rs.getInt(1));
				teacher.setRegistration_Apply(rs.getString(2));
				teacher.setRegistration_Date(rs.getTimestamp(3));
				teacher.setAdmission_Confirm(rs.getString(4));
				teacher.setAdmission_Date(rs.getTimestamp(5));
				teacher.setTeacherStatus(rs.getString(6));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return teacher;
	}
}
