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
import Model.GoodReceipt;
import Model.GoodReceiptDetail;
import Model.Product;
import Model.Promotion;
import Model.PromotionDetail;

public class PromotionDetailDAO {
	public static List<PromotionDetail> listPromotion_detail() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		List<PromotionDetail> list = new ArrayList<>();
		String sql= String.format("select A.ID_Product,A.ID_Promotion, A.Sale,B.DateStart, B.DateEnd,C.Name_Product from PromotionDetail as A inner join Promotion as B on A.ID_Promotion= B.ID_Promotion inner join Product as C on A.ID_Product=C.ID_Product");
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
			
			PromotionDetail promotion_detail= new PromotionDetail(resultSet.getString("productID"),resultSet.getInt("promotionID"),resultSet.getInt("percent_promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("name"));			
			list.add(promotion_detail);
			
		}
		return list;
		
	}
	public static ArrayList<PromotionDetail> listPromotion_detailbyID(int ID_Promotion) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		ArrayList<PromotionDetail> list = new ArrayList<>();
		String sql= "select  A.ID_Product,A.ID_Promotion, A.Sale,B.DateStart, B.DateEnd,C.Name_Product from PromotionDetail as A inner join Promotion as B on A.ID_Promotion= B.ID_Promotion inner join Product as C on A.ID_Product=C.ID_Product where B.ID_Promotion='" + ID_Promotion + "'";
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
			
			PromotionDetail promotion_detail= new PromotionDetail(resultSet.getString("productID"),resultSet.getInt("promotionID"),resultSet.getInt("percent_promotion"),afterFormat.format(afterCreatedDate),afterFormat.format(afterCreatedDate2),resultSet.getString("name"));			
			list.add(promotion_detail);
			
		}
		return list;
		
	}
	public static PromotionDetail Promotion_detailByID(String productID, int  promotionID) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sql= String.format("Select * from dbo.PromotionDetail where ID_Product='"+productID+"' and ID_Promotion="+promotionID);
		ResultSet resultSet= statement.executeQuery(sql);
		PromotionDetail promotion_detail= new PromotionDetail();
		while(resultSet.next()) {
			
			promotion_detail=  new PromotionDetail(resultSet.getString("ID_Product"),resultSet.getInt("ID_Promotion"),resultSet.getInt("Sale"));			
		}
		return promotion_detail;		
	}
	public boolean deletePromotion_detail( String idProduct,int idPromotion) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sql= String.format("delete from dbo.PromotionDetail where ID_Product='"+idProduct+"' and ID_Promotion="+idPromotion);
		
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
		
	}
	public boolean updatePromotion_detail(String productID,int promotionID, int percent_promotion) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sql= String.format("update dbo.PromotionDetail set Sale="+percent_promotion+" where ID_Product= N'"+productID+"' and ID_Promotion= "+promotionID);
		int result= statement.executeUpdate(sql);
		if(result>0) {
			return true;
		}
		return false;
		
	}
	public int insertProductToPromotionDetail(String idProduct, int percent_promotion, int idPromotion) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sqlString=String.format("select * from PromotionDetail where ID_Product='"+idProduct+"' and ID_Promotion="+idPromotion);
		ResultSet resultSet= statement.executeQuery(sqlString);
		while(resultSet.next()) {
			return 1;
		}
		String sqlString2=String.format("insert into PromotionDetail(ID_Product,ID_Promotion,Sale) Values(N'"+idProduct+"',"+idPromotion+","+percent_promotion+")");
		int resultSet2= statement.executeUpdate(sqlString2);
		if(resultSet2>0) {
			return 0;
		} else {
		return 2;
		}
	}
	public int countPromotion_detailbyID(int id) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sqlString=String.format("select count(*) as count from PromotionDetail where ID_Promotion="+id);
		ResultSet resultSet= statement.executeQuery(sqlString);
		int count=0;
		while(resultSet.next()) {
			count= resultSet.getInt("count");
		}
		return count;
	
	}
	
}
