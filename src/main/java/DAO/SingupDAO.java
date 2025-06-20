package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import DTO.UserDTO;
import beans.DBConnection;

public class SingupDAO {

	private Connection con = null;
	ResultSet rs = null;
	PreparedStatement prst = null;

	// コンストラクタ
	public SingupDAO() {
		DBConnection dbCon = new DBConnection();//インスタンス生成
		this.con = dbCon.getConnection();//接続処理
		//接続チェック
		if (this.con == null) {
			System.out.println("DB接続失敗：Connectionがnullです");
		}
	}
	
	public boolean singup(UserDTO user) {
		boolean test = false;
		//INSERT文(userとpassの登録)
		String sql = "INSERT INTO users (username,pass) VALUES(?,?);";
		
		//登録処理(バインド処理)
		try {
			prst = con.prepareStatement(sql);
			prst.setString(1, user.getUser());//一つ目の？にバインド
			prst.setString(2, user.getPass());//二つ目の?にバインド
			//バインド処理後のsql文
			System.out.println(prst.toString());
			
			//バインド処理後に実行する
			int rowsInserted = prst.executeUpdate();
			//正常に処理ができた場合
			if(rowsInserted > 0) {
				
				System.out.println("登録成功:"+prst.toString());
				test = true;
				return test;
			}
			
		}catch(SQLIntegrityConstraintViolationException e ) {
			System.out.println("SQL制約違反~~~~~~\nデータベース処理中のエラー");
			e.printStackTrace();
		
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
