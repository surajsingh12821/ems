package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.security.auth.Subject;

import Entity.Classes;
import Entity.Subjects;
import Service.MySqlConnection;

public class SubjectDao {
	private Connection con;

	public SubjectDao(Connection con) {
		super();
		this.con = con;
	}
	public List<Subjects> getAll_SubjectName(int class_Id)
	{
		List< Subjects> list=new ArrayList<Subjects>();
		try {
			String sql="select subject_Name from subjects where class_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, class_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Subjects subjects=new Subjects();
				subjects.setSubject_Name(rs.getString(1));
				list.add(subjects);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<Subjects> getAll_SubjectDetails(int class_Id)
	{
		List< Subjects> list=new ArrayList<Subjects>();
		try {
			String sql="select * from subjects where class_Id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, class_Id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Subjects subjects=new Subjects();
				subjects.setId(rs.getInt(1));
				subjects.setSubject_Name(rs.getString(2));
				subjects.setSubject_Type(rs.getString(3));
				subjects.setSubject_Teacher(rs.getString(4));
				subjects.setSubject_Marks(rs.getInt(5));
				subjects.setSubject_Book(rs.getString(6));
				subjects.setSubject_Notes(rs.getString(7));
				list.add(subjects);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public HashMap<Integer,String> getSubById() {
		HashMap< Integer, String> list=new HashMap<Integer, String>();
		try {
			Connection connection2 = MySqlConnection.getConnection();
			String sql = "select id,subject_Name from subjects ";
			PreparedStatement ps = connection2.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.put(rs.getInt(1),rs.getString(2));
			}

		} catch (Exception e) {
			
		}
		return list;
	}
	
	public Set<String> getOnly_SubjectNameById()
	{
		Set< String> list=new HashSet<String>();
		try {
			String sql="select subject_Name from subjects";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String subName = rs.getString(1);
				list.add(subName);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public Set<Integer> getClassOf_SubjectOfSameType(String subName)
	{
		Set< Integer> list=new HashSet<Integer>();
		try {
			String sql="select class_Id from subjects where subject_Name=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, subName);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getInt(1));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	public int getSubjectId(String name)
	{
		int id=0;
		try {
			String sql="select  from subjects where subject_Name=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				id=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}
	

}
