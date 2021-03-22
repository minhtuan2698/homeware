package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

import Connection.DBConnection;
import Model.Account;
import Model.Season;
import Model.Shipper;

public class ShipperDAO {
	public static List<Shipper> listShipper() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		List<Shipper> list = new ArrayList<>();
		String sql= "Select * from Shipper";
		ResultSet resultSet= statement.executeQuery(sql);
		
		while(resultSet.next()) {
			Shipper employee= new Shipper(resultSet.getInt("ID_Shipper"),resultSet.getString("Name_Shipper"),resultSet.getString("Phone_Shipper"),resultSet.getString("Company_Shipper"));			
			list.add(employee);
			
		}
		return list;
		
	}
	public static Shipper getShipper(int ID_Shipper) throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Shipper WHERE ID_Shipper ='" + ID_Shipper + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Shipper shipper = new Shipper();
			while (rs.next()) {
				
				shipper.setID_Shipper(rs.getInt("ID_Shipper"));
				shipper.setName_Shipper(rs.getString("Name_Shipper"));
				shipper.setPhone_Shipper(rs.getString("Phone_Shipper"));
				shipper.setCompany_Shipper(rs.getString("Company_Shipper"));
				
				
				
			}
			
				return shipper;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static Shipper getShipperInvoice(int ID_Shipper) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Shipper WHERE ID_Shipper =?";
		Shipper acc = new Shipper();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_Shipper);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				acc.setID_Shipper(rs.getInt("ID_Shipper"));
				acc.setName_Shipper(rs.getString("Name_Shipper"));
				acc.setPhone_Shipper(rs.getString("Phone_Shipper"));
				acc.setCompany_Shipper(rs.getString("Company_Shipper"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return acc;
	}

	public static void updateShipper(Shipper shipper) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Shipper SET  Name_Shipper=?,Phone_Shipper=?,Company_Shipper=?  WHERE ID_Shipper=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setString(1, shipper.getName_Shipper());
			ps.setString(2, shipper.getPhone_Shipper());
			ps.setString(3, shipper.getCompany_Shipper());
			ps.setInt(4, shipper.getID_Shipper());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}
	public static boolean checkShipper(int ID_Shipper)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT ID_Shipper FROM Shipper WHERE ID_Shipper='" + ID_Shipper + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static void insertShipper(Shipper shipper)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Shipper VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, shipper.getID_Shipper());
			ps.setString(2, shipper.getName_Shipper());
			ps.setString(3, shipper.getPhone_Shipper());
			ps.setString(4, shipper.getCompany_Shipper());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void deleteShipper(int ID_Shipper)throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM Shipper WHERE ID_Shipper = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_Shipper);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
