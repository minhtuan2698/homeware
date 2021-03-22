package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Advertise;


public class AdvertiseDAOImpl implements AdvertiseDAO{
	@Override
	public ArrayList<Advertise> getList() {
		Connection ketNoi = DBConnection.getConnection();
		/* String sql = "SELECT * FROM Advertise ORDER BY RAND()"; */
		/* String sql = "SELECT * FROM Advertise "; */
		String sql = "  SELECT TOP 4 Image_Ads,ID_Ads FROM   tshomeware.dbo.Advertise ORDER BY NEWID() ";
		ArrayList<Advertise> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Advertise ads = new Advertise();
				ads.setID_Ads(rs.getInt("ID_Ads"));			
				ads.setImage_Ads(rs.getString("Image_Ads"));	
				arr.add(ads);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
}
