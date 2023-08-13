package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entity.Book;

public class BookDao {
	
	Connection connection;

	public BookDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public Book getBookDetail()
	{
		Book book=new Book();
		try {
			String sql="select * from book ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				
				book.setId(rs.getInt(1));
				book.setBook_Name(rs.getString(2));
				book.setBook_Type(rs.getString(3));
				book.setBook_Year(rs.getString(4));
				book.setBook_Price(rs.getInt(5));
				book.setBook_Author(rs.getString(6));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return book;
	}
	public Book getBookDetailBySubject(int subjectId)
	{
		Book book=new Book();
		try {
			String sql="select * from book where id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setInt(1, subjectId);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				book.setId(rs.getInt(1));
				book.setBook_Name(rs.getString(2));
				book.setBook_Type(rs.getString(3));
				book.setBook_Year(rs.getString(4));
				book.setBook_Price(rs.getInt(5));
				book.setBook_Author(rs.getString(6));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return book;
	}
}
