package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sun.org.apache.regexp.internal.recompile;

import Connection.DBConnection;
import Model.Brand;
import Model.Category;
import Model.ImageDetail;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;

public class ImageDetailDAOImpl implements ImageDetailDAO{
	@Override
	public ImageDetail getImageDetail(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM ImageDetail WHERE ID_Product='" + ID_Product + "'";
		ImageDetail img = new ImageDetail();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				img.setID_Image(rs.getInt("ID_Image"));
				img.setDetail_Image(rs.getString("Detail_Image"));
				img.setSan_Pham(product );
		
			}
		} catch (SQLException ex) {
			
			ex.printStackTrace();
		}
		return img;
	}
	
	@Override
	public ArrayList<ImageDetail> getListParentImageDetail() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM ImageDetail WHERE ID_Product=?";
		ArrayList<ImageDetail> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ImageDetail img = new ImageDetail();
				img.setID_Image(rs.getInt("ID_Image"));
				img.setDetail_Image(rs.getString("Detail_Image"));
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				img.setSan_Pham(product);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	
	@Override
	public ArrayList<ImageDetail> getListImageDetail(int ID_Image) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM ImageDetail WHERE ID_Product='" + ID_Image + "'";
		ArrayList<ImageDetail> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ImageDetail img = new ImageDetail();
				img.setID_Image(rs.getInt("ID_Image"));
				img.setDetail_Image(rs.getString("Detail_Image"));
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				img.setSan_Pham(product);
				
				arr.add(img);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ImageDetail getIdImage(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM ImageDetail WHERE ID_Product=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Product);
			ResultSet rs = ps.executeQuery();
			ImageDetail img= new ImageDetail();
			while (rs.next()) {
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				img.setSan_Pham(product);
				img.setDetail_Image(rs.getString("Detail_Image"));
				img.setDetail_Image1(rs.getString("Detail_Image1"));
				img.setDetail_Image2(rs.getString("Detail_Image2"));
				
				
			}
			return img;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
