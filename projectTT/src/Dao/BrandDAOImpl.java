package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Brand;
import Model.Category;

public class BrandDAOImpl implements BrandDAO {
	@Override
	public ArrayList<Brand> getListParentBrand() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Brand WHERE Parent_Brand='null'";
		ArrayList<Brand> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Brand nhanHieu = new Brand();
				nhanHieu.setID_Brand(rs.getString("ID_Brand"));
				nhanHieu.setName_Brand(rs.getString("Name_Brand"));
				nhanHieu.setCountry(rs.getString("Country"));
				nhanHieu.setParent_Brand(rs.getString("Parent_Brand"));
				arr.add(nhanHieu);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Brand> getListParentBrand1() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Brand WHERE Parent_Brand='NH'";
		ArrayList<Brand> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Brand nhanHieu = new Brand();
				nhanHieu.setID_Brand(rs.getString("ID_Brand"));
				nhanHieu.setName_Brand(rs.getString("Name_Brand"));
				nhanHieu.setCountry(rs.getString("Country"));
				nhanHieu.setParent_Brand(rs.getString("Parent_Brand"));
				arr.add(nhanHieu);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<Brand> getListSubBrand(String ID_Brand) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Brand WHERE Parent_Brand='" + ID_Brand + "'";
		ArrayList<Brand> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Brand nhanHieu = new Brand();
				nhanHieu.setID_Brand(rs.getString("ID_Brand"));
				nhanHieu.setName_Brand(rs.getString("Name_Brand"));
				nhanHieu.setCountry(rs.getString("Country"));
				nhanHieu.setParent_Brand(rs.getString("Parent_Brand"));
				arr.add(nhanHieu);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	
	@Override
	public Brand getIdBrand(String ID_Brand) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Brand WHERE ID_Brand=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Brand);
			ResultSet rs = ps.executeQuery();
			Brand brand= new Brand();
			while (rs.next()) {
				brand.setID_Brand(rs.getString("ID_Brand"));
				brand.setName_Brand(rs.getString("Name_Brand"));
				
				
			
				
			}
			return brand;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Brand getBrand(String ID_Brand){
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Brand WHERE ID_Brand ='" + ID_Brand + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Brand brand = new Brand();
			while (rs.next()) {
				
				brand.setID_Brand(rs.getString("ID_Brand"));
				brand.setName_Brand(rs.getString("Name_Brand"));
				
				
				
			}
			
				return brand;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
