package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entity.Holiday;

public class HolidayDao {
	
	Connection connection;

	public HolidayDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean save(Holiday holiday)
	{
		boolean b=false;
		try {
			String sql="insert into holiday(name,date) values(?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, holiday.getName());
			ps.setString(2, holiday.getDate());
			b = ps.execute();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return b;
	}
	
	public List<Holiday> get_All_Holiday()
	{
		ArrayList<Holiday> list=new ArrayList<Holiday>();
		try {
			String sql="select * from holiday";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet executeQuery = ps.executeQuery();
			while(executeQuery.next())
			{
				Holiday holiday=new Holiday();
				holiday.setId(executeQuery.getInt(1));
				holiday.setName(executeQuery.getString(2));
				holiday.setDate(executeQuery.getString(3));
				list.add(holiday);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
