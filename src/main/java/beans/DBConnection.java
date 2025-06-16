package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private String dbName = "login";
	private String properties = "?characterEncoding=utf-8";
	private String url = "jdbc:mysql://localhost:3306/" + dbName + properties;

	private String user = "root";
	private String pass = "";

	/**
	 * フィールド
	 */
	private Connection con = null;

	/**
	 * コンストラクタ
	 */
	public DBConnection() {

	}

	public DBConnection(String dbName) {
		this.dbName = dbName;
	}

	public DBConnection(String dbName, String user, String pass) {
		this.dbName = dbName;
		this.user = user;
		this.pass = pass;
	}

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/" + dbName + properties;
			System.out.println("DB接続URL: " + url);
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("DB接続成功: " + con);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * 
	 */
	public void close() {
		try {
			if (null != con) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
