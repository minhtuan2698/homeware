package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.Account;
import Model.AccountSession;
import Model.Category;
import Model.Product;


public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public ArrayList<Category> getListParentCategory() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Category WHERE Parent_Category='null'";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category();
				danhMuc.setID_Category(rs.getString("ID_Category"));
				danhMuc.setName_Category(rs.getString("Name_Category"));
				danhMuc.setParent_Category(rs.getString("Parent_Category"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	
	@Override
	public ArrayList<Category> getListSubCategory(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Category WHERE Parent_Category='" + ID_Category + "'";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category();
				danhMuc.setID_Category(rs.getString("ID_Category"));
				danhMuc.setName_Category(rs.getString("Name_Category"));
				danhMuc.setParent_Category(rs.getString("Parent_Category"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	// Lay danh sach danh muc theo list
		@Override
		public ArrayList<Category> getList() {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT * FROM Category WHERE Parent_Category='GD'";
			ArrayList<Category> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				    Category danhMuc = new Category();
				     danhMuc.setID_Category(rs.getString("ID_Category"));
				     danhMuc.setName_Category(rs.getString("Name_Category"));
					 arr.add(danhMuc);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		
		@Override
		public Category getIdCate(String ID_Category) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT * FROM Category WHERE ID_Category =?";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ps.setString(1, ID_Category);
				ResultSet rs = ps.executeQuery();
				Category cate= new Category();
				while (rs.next()) {
					cate.setID_Category(rs.getString("ID_Category"));
					cate.setName_Category(rs.getString("Name_Category"));
					
					
				
					
				}
				return cate;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
		
		@Override
		public boolean checkCategory(String ID_Category) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT ID_Category FROM Category WHERE ID_Category='" + ID_Category + "'";
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
		
		@Override
		public void insertCategory(Category cate) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "INSERT INTO Category VALUES (?,?,?)";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ps.setString(1, cate.getID_Category());
				ps.setString(2, cate.getName_Category());
				ps.setString(3, cate.getParent_Category());
				ps.executeUpdate();
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public Category getCategory(String ID_Category){
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT * FROM Category WHERE ID_Category ='" + ID_Category + "'";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				Category cate = new Category();
				while (rs.next()) {
					
					cate.setID_Category(rs.getString("ID_Category"));
					cate.setName_Category(rs.getString("Name_Category"));
					
					
					
				}
				
					return cate;
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
		@Override
		public void updateNameCategory(Category cate)  {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "UPDATE Category SET  Name_Category=?  WHERE ID_Category=?";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				
				ps.setString(1, cate.getName_Category());
				ps.setString(2, cate.getID_Category());
				ps.executeUpdate();
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
		

		}
		@Override
		public void deleteCategory(String ID_Category) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "DELETE FROM Category WHERE ID_Category = ?";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ps.setString(1, ID_Category);
				ps.executeUpdate();
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}

