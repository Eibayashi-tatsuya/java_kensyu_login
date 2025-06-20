package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.UserDTO;
import beans.DBConnection;

public class LoginDAO {

	private Connection con = null;
	ResultSet rs = null;
	PreparedStatement prst = null;

	// コンストラクタ
	public LoginDAO() {
		DBConnection dbCon = new DBConnection();
		this.con = dbCon.getConnection();//データベース接続

		if (this.con == null) {
			System.out.println("DB接続失敗：Connectionがnullです");
		}
	}

	//ログイン認証
	public boolean userPass(UserDTO user) {
		boolean test = false;

		//受け取れているかの確認
		System.out.println("user: " + user.getUser());
		System.out.println("pass: " + user.getPass());

		//可変配列listのオブジェクト生成
		ArrayList<UserDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM users WHERE username = ? AND pass = ?;";

		try {
			prst = con.prepareStatement(sql);
			
			// ?に値をセットする処理(バインド処理)
			prst.setString(1, user.getUser());// 1つめの？に
			prst.setString(2, user.getPass());
			// セット後のsql文表示
			System.out.println(prst.toString());
			rs = prst.executeQuery();

			if (rs.next()) {
				// 目当てのものがあれば
				// ArrayListに引っ張ってきた情報を入れる処理
				UserDTO log = new UserDTO();
				log.setId(rs.getInt("id"));
				log.setUser(rs.getString("username"));
				log.setPass(rs.getString("pass"));
				list.add(log);//setしたものを可変配列に入れる
				// このif文ないは情報がある場合なので、戻り値trueを返すため代入
				test = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
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
		// 戻り値test(boolean型)を返す
		return test;
	}

}
