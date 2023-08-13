package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import Entity.NoticeType;

public class NoticeTypeDao {
	
	Connection connection;

	public NoticeTypeDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	
	HashMap<Integer,String> get_ListAll_Type()
	{
		HashMap< Integer,String> hashMap=new HashMap<Integer, String>();
		try {
			String sql="Select id,name from noticeType";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				hashMap.put(rs.getInt(1), rs.getString(2));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return hashMap;
	}

}
