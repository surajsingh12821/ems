package Service;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConnection  {

	private Connection connection;
	
	MySqlConnection(Connection connection) {
		// TODO Auto-generated constructor stub
		this.connection=connection;
	}
	
	 public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduSystem", "root",
					"mysql");
			if (connection != null) {
				System.out.println("Database Successfully Connected");
				return connection;
			} else {
				System.out.println("Database not Connected");
				return null;
			}
			

		} catch (Exception e) {
			System.out.println("Database Driver Problem Not CONNECT!!! ");
		}
		return null;

	}

	public void closeConnection() {
		// TODO Auto-generated method stub

	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

}
