package Dao;

import java.sql.Connection;
import java.sql.SQLException;

import Connection.DBConnection;
import Model.Season;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;

import Connection.DBConnection;
import Model.Account;
import Model.Brand;
import Model.Category;

import Model.Product;
import Model.Statistic;

public class SeasonDAO {
	public static Season promotionbyCurrentDate() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		String sqlString= String.format("select * from Season where DateStart <= '"+date+"' and DateEnd >= '"+date+"'");
		ResultSet resultSet= statement.executeQuery(sqlString);
		Season promotion= new Season();
		while(resultSet.next()) {
			String beforeCreatedDate= resultSet.getString("DateStart");
			String beforeCreatedDate2= resultSet.getString("DateEnd");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			promotion= new Season(resultSet.getInt("ID_Season"),resultSet.getString("Name_Season"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2));			
		}
		return promotion;	
	}


	public static Season getIdSeason(int ID_Season) throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Season WHERE ID_Season =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_Season);
			ResultSet rs = ps.executeQuery();
			Season cate= new Season();
			
			while (rs.next()) {
			
				cate.setID_Season(rs.getInt("ID_Season"));
				cate.setName_Season(rs.getString("Name_Season"));
				cate.setDateStart(rs.getString("DateStart"));
				cate.setDateEnd(rs.getString("DateEnd"));
				
				
			
				
			}
			return cate;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Season> getListSeason() throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Season";
		ArrayList<Season> arr = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				String beforeCreatedDate= rs.getString("DateStart");
				String beforeCreatedDate2= rs.getString("DateEnd");
				Date afterCreatedDate = new Date();
				Date afterCreatedDate2 = new Date();
				try {
					afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
					afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Season season= new Season();
				season.setID_Season(rs.getInt("ID_Season"));
				season.setName_Season(rs.getString("Name_Season"));
				season.setDateStart(afterFormat.format(afterCreatedDate));
				season.setDateEnd(afterFormat.format(afterCreatedDate2));
				arr.add(season);
				
			
				
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public static Season getSeason(int ID_Season) throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Season WHERE ID_Season ='" + ID_Season + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Season season = new Season();
			while (rs.next()) {
				
				season.setID_Season(rs.getInt("ID_Season"));
				season.setName_Season(rs.getString("Name_Season"));
				season.setDateStart(rs.getString("DateStart"));
				season.setDateEnd(rs.getString("DateEnd"));
				
				
				
			}
			
				return season;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public static void updateSeason(Season season) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Season SET  Name_Season=?,DateStart=?,DateEnd=?  WHERE ID_Season=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setString(1, season.getName_Season());
			ps.setString(2, season.getDateStart());
			ps.setString(3, season.getDateEnd());
			ps.setInt(4, season.getID_Season());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}

	public static boolean checkSeason(int ID_Season)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT ID_Season FROM Season WHERE ID_Season='" + ID_Season + "'";
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

	public static void insertSeason(Season season)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Season VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, season.getID_Season());
			ps.setString(2, season.getName_Season());
			ps.setString(3, season.getDateStart());
			ps.setString(4, season.getDateEnd());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteSeason(int ID_Season)throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM Season WHERE ID_Season = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_Season);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
