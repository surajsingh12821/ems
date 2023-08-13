package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import Service.MySqlConnection;

public class RoleDao {
	private Connection connection;

	public RoleDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public HashMap<Integer,String> getRoleNames() {
		HashMap< Integer, String> list=new HashMap<Integer, String>();
		try {
			Connection connection2 = MySqlConnection.getConnection();
			String sql = "select id,type from role ";
			PreparedStatement ps = connection2.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.put(rs.getInt(1),rs.getString(2));
			}

		} catch (Exception e) {
			System.out.println("getRoleNames method :" + e);
		}
		return list;
	}
}
