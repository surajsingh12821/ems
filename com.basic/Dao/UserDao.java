package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import Entity.User;
import Service.MySqlConnection;

public class UserDao {
	
	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public int getMaxUserId()
	{
		int max=0;
		try {
			String sql="select count(id) from user";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
				max=rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return max;
	}
	public int countUsers()
	{
		int total=0;
		try {
			String sql="select count(id) from user ";
			PreparedStatement ps=connection.prepareStatement(sql);
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public int countActiveUsers()
	{
		int total=0;
		try {
			String sql="select count(id) from user where=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Active");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public int countDeActiveUsers()
	{
		int total=0;
		try {
			String sql="select count(id) from user where=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "inActive");
			total=ps.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	
	public List<User> getAllUser()
	{
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setReg_Date(rs.getTimestamp(7));
				user.setAccount_Status(rs.getString(8));
				list.add(user);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<User> getAllInActiveUser()
	{
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user where Account_Status=? ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "inActive");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setReg_Date(rs.getTimestamp(7));
				user.setAccount_Status(rs.getString(8));
				list.add(user);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<User> getAllActiveUser()
	{
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user where Account_Status=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setReg_Date(rs.getTimestamp(7));
				user.setAccount_Status(rs.getString(8));
				list.add(user);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<User> getAllActive(int i)
	{
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user where Account_Status=? and role_Id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "Active");
			ps.setInt(2, i);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setReg_Date(rs.getTimestamp(7));
				user.setAccount_Status(rs.getString(8));
				list.add(user);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<User> getAllInActive(int i)
	{
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user where Account_Status=? and role_Id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, "inActive");
			ps.setInt(2, i);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				User user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setReg_Date(rs.getTimestamp(7));
				user.setAccount_Status(rs.getString(8));
				list.add(user);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	
	public boolean getEmailValidation(String email)
	{
		boolean doExist=true;
		try
		{
			Connection connection2 = MySqlConnection.getConnection();
			String query="select count(email) from user where email=?";
			PreparedStatement preparedStatement=connection2.prepareStatement(query);
			preparedStatement.setString(1, email);
			ResultSet resultSet=preparedStatement.executeQuery();
		
			while(resultSet.next())
			{
				if(resultSet.getInt(1)==0)
				{
					doExist=false;
				}
				else
					doExist=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return doExist;
	}
	
	public boolean registerUser(User u)
	{
		boolean f = false;
		try {

			String query = "insert into user(user_Name,email,password,phone_No,role_Id) values(?,?,?,?,?)";
			PreparedStatement preparedStatement = this.connection.prepareStatement(query);
			preparedStatement.setString(1, u.getUser_Name());
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.setString(3, u.getPassword());
			preparedStatement.setString(4, u.getPhone_No());
			preparedStatement.setInt(5, u.getRole_Id());
			int executeUpdate = preparedStatement.executeUpdate();
			if(executeUpdate!=0)
			f = true;
			else
				f=false;
		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}
	public User getValidate(String email,String password)
	{
		User user=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setAccount_Status(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User getUserByEmail(String email)
	{
		User user=null;
		try {
			String sql="select * from user where email=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setAccount_Status(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}	
	public User getUserById(int id)
	{
		User user=null;
		try {
			String sql="select * from user where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setAccount_Status(rs.getString(8));
				user.setReg_Date(rs.getTimestamp(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}	
	public User getUserByUserName(String user_Name)
	{
		User user=null;
		try {
			String sql="select * from user where user_Name=? ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, user_Name);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				user=new User();
				user.setId(rs.getInt(1));
				user.setUser_Name(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone_No(rs.getString(5));
				user.setRole_Id(rs.getInt(6));
				user.setAccount_Status(rs.getString(8));
				user.setReg_Date(rs.getTimestamp(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}	
	public boolean deleteUser(int id)
	{
		
		boolean f=false;
		try {
			String sql="select * from user where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				f = rs.first();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}	
	
	public boolean updateUser(User u)
	{
		boolean f=false;
		try {
			String sql="update user set user_Name=?,email=?,password=?,phone_No=?,role_Id=?,Account_Status=?  where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, u.getUser_Name());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getPhone_No());
			ps.setInt(5 , u.getRole_Id());
			ps.setString(6, u.getAccount_Status());
			ps.setInt(7, u.getId());
			int executeUpdate = ps.executeUpdate();
			if(executeUpdate!=0)
				f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
