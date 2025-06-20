package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.ArtistsDTO;
import beans.DBConnection;

public class ArtistDAO {
	
	private Connection con = null;
	ResultSet rs = null;
	PreparedStatement prst = null;

	// コンストラクタ
	public ArtistDAO() {
		DBConnection dbCon = new DBConnection();
		this.con = dbCon.getConnection();

		if (this.con == null) {
			System.out.println("DB接続失敗：Connectionがnullです");
		}
	}
	
	//artist一覧表示
	public ArrayList<ArtistsDTO> artists() {
		
		ArrayList<ArtistsDTO> artists = new ArrayList<ArtistsDTO>();
		String sql = "SELECT * FROM artists;";
		
		try {
			prst =con.prepareStatement(sql);
			rs = prst.executeQuery();
			System.out.println("artist情報の取得");
			while(rs.next()) {
				ArtistsDTO a = new ArtistsDTO();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setSong(rs.getString("genre"));
				a.setSong(rs.getString("favorite_song"));
				a.setLocation(rs.getString("location"));
				a.setUrl(rs.getString("URL"));
				artists.add(a);
			}
			System.out.println("終了");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return artists;
				
	}
	
	
	
	
	
	
	
	
	

}
