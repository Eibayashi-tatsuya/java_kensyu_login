package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.UserDTO;
import beans.DBConnection;

public class SingupDAO {

	private Connection con = null;
	ResultSet rs = null;
	PreparedStatement prst = null;

	// コンストラクタ
	public SingupDAO() {
		DBConnection dbCon = new DBConnection();
		this.con = dbCon.getConnection();

		if (this.con == null) {
			System.out.println("DB接続失敗：Connectionがnullです");
		}
	}
	
	public boolean singup(UserDTO user) {
		boolean test = false;
		
		String sql = "INSERT INTO users (username,pass) VALUES(?,?);";
		
		//登録処理
		try {
			prst = con.prepareStatement(sql);
			prst.setString(1, user.getUser());
			prst.setString(2, user.getPass());
			
			int rowsInserted = prst.executeUpdate();
			
			if(rowsInserted > 0) {//正常に処理ができた場合
				
				System.out.println("登録成功:"+prst.toString());
				test = true;
				return test;
			}else {//登録処理が失敗したとき
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {

			try {
				if (null != rs) {
					rs.close();
				}
				if (null != prst) {
					prst.close();
				}
				if (null != con) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		
		
		return test;
	}
	
	
	

}
