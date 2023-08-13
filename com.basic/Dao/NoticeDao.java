package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Entity.Notice;

public class NoticeDao {
	
	Connection connection;

	public NoticeDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean saveNotice(Notice notice)
	{
		boolean b=false;
		try {
			String sql="insert into notices(title,notice_Type,subject,message,date,time,uploaded_On) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, notice.getTitle());
			ps.setInt(2, notice.getNotice_Type());
			ps.setString(3, notice.getSubject());
			ps.setString(4, notice.getMessage());
			ps.setString(5, notice.getDate());
			ps.setString(6, notice.getTime());
			ps.setTimestamp(7, notice.getUploaded_On());
			b=ps.execute();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return b;
	}
	
	public List<Notice> get_All_Notices()
	{
		List<Notice> list=new ArrayList<Notice>();
		try {
			String sql="select * from notices";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Notice notice=new Notice();
				notice.setId(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setNotice_Type(rs.getInt(3));
				notice.setSubject(rs.getString(4));
				notice.setSubject(rs.getString(5));
				notice.setMessage(rs.getString(6));
				notice.setDate(rs.getString(7));
				notice.setTime(rs.getString(8));
				notice.setUploaded_On(rs.getTimestamp(9));
				list.add(notice);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
