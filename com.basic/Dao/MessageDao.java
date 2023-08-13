package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Entity.Message;

public class MessageDao {
	
	Connection connection;

	public MessageDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	
	public boolean save_Message(Message m)
	{
		boolean f = false;
		try {
			
			String query = "insert into contactUs(name,email,phoneno,message,is_Read) values(?,?,?,?,?)";
			PreparedStatement preparedStatement = this.connection.prepareStatement(query);
			preparedStatement.setString(1,m.getName());
			preparedStatement.setString(2,m.getEmail());
			preparedStatement.setString(3, m.getPhoneno());
			preparedStatement.setString(4, m.getMessage());
			preparedStatement.setString(5, "false");
			
			
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

}
