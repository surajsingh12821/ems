package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Student;
import Entity.User;

public class StudentDao {
	
	Connection connection;

	public StudentDao(Connection connection) {
		super();
		this.connection = connection;
	}
	public int countStudents()
	{
		int total=0;
		try {
			String sql="select count(id) from student";
			PreparedStatement ps=connection.prepareStatement(sql);
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public int countStudentRegApply()
	{
		int total=0;
		try {
			String sql="select count(id) from student where registration_Apply=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "true");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public void CreateStudent(User user)
	{
		System.out.println(user);
		int total=0;
		boolean b=false;
		try {
			String sql="insert into student (id,registration_Apply) values(?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ps.setString(2, "no");
			total=ps.executeUpdate();
			if(total!=0)
				b=true;
			else
				b=false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public boolean studentRegApply(int userId,int reg_Id)
	{
		String apply="Applied";
		int total=0;
		boolean b=false;
		try {
			String sql="insert into student  registration_Apply=? and reg_Id=?  where id=? ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, apply);
			ps.setInt(2, reg_Id);
			ps.setInt(3, userId);
			total=ps.executeUpdate();
			if(total!=0)
				b=true;
			else
				b=false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public int countStudentRegNotApply()
	{
		int total=0;
		try {
			String sql="select count(id) from student where registration_Apply=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "false");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	
	
	public Student getStudentDetail(User user)
	{
		Student s=new Student();
		try {
			String sql="select * from student where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, user.getId());
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s.setId(rs.getInt(1));
				s.setRegistration_Apply(rs.getString(4));
				s.setRegistration_Date(rs.getTimestamp(5));
				s.setAdmission_Confirm(rs.getString(6));
				s.setAdmission_Date(rs.getTimestamp(7));
				s.setStudentStatus(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return s;
	}

}
