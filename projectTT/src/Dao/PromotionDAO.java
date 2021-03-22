package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Connection.DBConnection;
import Model.Promotion;

public class PromotionDAO {
	public static ArrayList<Promotion> listPromotion() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		ArrayList<Promotion> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		String sql= "Select * from Promotion";
		ResultSet resultSet= statement.executeQuery(sql);
		
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
			Promotion promotion= new Promotion(resultSet.getInt("ID_Promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("ID_Account"),resultSet.getString("Reason"));			
			list.add(promotion);
			
		}
		return list;
		
	}
	public static Promotion PromotionByID(int ID) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sql= String.format("Select * from Promotion where ID_Promotion="+ID);
		ResultSet resultSet= statement.executeQuery(sql);
		Promotion promotion= new Promotion();
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
			promotion= new Promotion(resultSet.getInt("ID_Promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("ID_Account"),resultSet.getString("Reason"));			
		}
		return promotion;		
	}
	
	public static Promotion promotionbyCurrentDate() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		
		String sqlString= String.format("select * from Promotion where DateStart <= '"+date+"' and DateEnd >= '"+date+"'");
		ResultSet resultSet= statement.executeQuery(sqlString);
		Promotion promotion= new Promotion();
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
			promotion= new Promotion(resultSet.getInt("ID_Promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("ID_Account"),resultSet.getString("Reason"));			
		}
		return promotion;	
	}
	
	public void insertPromotion(String dateStart, String dateEnd, int idEmployee,String reason) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		
		String sql= String.format("insert into Promotion(DateStart, DateEnd, ID_Account,Reason) VAlues ('"+dateStart+"','"+dateEnd+"',"+idEmployee+",N'"+reason+"')");
		int result= statement.executeUpdate(sql);
	
	}
	public void updatePromotion(String dateStart, String dateEnd, int idEmployee, int id) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		
		String sql= String.format("Update Promotion set DateStart='"+dateStart+"',DateEnd='"+dateEnd+"', ID_Account="+idEmployee+" where ID_Promotion="+id);
		System.out.print(sql);
		int result= statement.executeUpdate(sql);
	
	}
	public boolean deletePromotion( int id) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		
		String sql= "delete from Promotion where ID_Promotion="+id;
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
	
	}

}
