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
		this.con = dbCon.getConnection();

		if (this.con == null) {
			System.out.println("DB接続失敗：Connectionがnullです");
		}
	}

	public boolean userPass(UserDTO user) {
		boolean test = false;

		System.out.println("user: " + user.getUser());
		System.out.println("pass: " + user.getPass());

		ArrayList<UserDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM users WHERE username = ? AND pass = ?;";

		System.out.println("通過１");

		try {
			prst = con.prepareStatement(sql);//エラー発生箇所
			
			// ?に値をセットする処理
			prst.setString(1, user.getUser());// 1つめの？に
			prst.setString(2, user.getPass());
			// セット後の実行処理
			System.out.println(prst.toString());
			rs = prst.executeQuery();

			if (rs.next()) {
				// 目当てのものがあれば
				// ArrayListに引っ張ってきた情報を入れる処理
				UserDTO log = new UserDTO();
				log.setId(rs.getInt("id"));
				log.setUser(rs.getString("username"));
				log.setPass(rs.getString("pass"));
				list.add(log);
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
