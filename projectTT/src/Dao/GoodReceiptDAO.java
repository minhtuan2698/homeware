package Dao;

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

import com.sun.org.apache.bcel.internal.generic.Select;

import Connection.DBConnection;
import Model.Account;
import Model.Brand;

import Model.GoodReceipt;
import Model.Shipper;

public class GoodReceiptDAO {
	public static List<GoodReceipt> listGoodReceipts() throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		Statement stm = ketNoi.createStatement();
		List<GoodReceipt> listGoodReceipts = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
	
		String sqlString = String.format("select * from Receipt");

	
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			String beforeCreatedDate= rSet.getString("Created_date");
			Date afterCreatedDate = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			GoodReceipt goodReceipt = new GoodReceipt ();
			goodReceipt.setID_Receipt(rSet.getInt("ID_Receipt"));
			goodReceipt.setID_Account(rSet.getString("ID_Account"));
			goodReceipt.setCreated_date(afterFormat.format(afterCreatedDate));
			goodReceipt.setTotal(rSet.getInt("total"));
			
			listGoodReceipts.add(goodReceipt);

		}
		return listGoodReceipts;
	}
	public int insertGoodReceipt(String id, String time) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sql=String.format("select * from Receipt where ID_Account='" + id+ "' and Created_date='"+time+"'");
		ResultSet resultSet= statement.executeQuery(sql);
		while(resultSet.next()) {
			return 1;
		}
		String sqlString="INSERT INTO dbo.Receipt(ID_Receipt,ID_Account, Created_date, total)\r\n" + 
				"VALUES (56,'"+id+"', '"+ time+"',0)";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} else {
			return 2;
		}
	}
	public boolean deleteGoodReceipt(int id) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sql=String.format("delete from Receipt where ID_Receipt="+id);
		int rSet = statement.executeUpdate(sql);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean updateGoodReceipt(int id,int total) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement= ketNoi.createStatement();
		String sqlString="UPDATE dbo.Receipt set total= total+"+total+ " where ID_Receipt="+ id;
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}

public static GoodReceipt goodReceiptById(int ID_Receipt) throws SQLException {
	Connection ketNoi = DBConnection.getConnection();
	Statement stm = ketNoi.createStatement();
	SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");

	GoodReceipt goodReceipt= new GoodReceipt();
	String sqlString ="select * from Receipt where ID_Receipt='"+ ID_Receipt +"'";
	ResultSet rSet = stm.executeQuery(sqlString);
	while (rSet.next()) {
		String beforeCreatedDate= rSet.getString("Created_date");
		Date afterCreatedDate = new Date();
		 try {
			afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
			goodReceipt.setID_Receipt(rSet.getInt("ID_Receipt"));
			goodReceipt.setID_Account(rSet.getString("ID_Account"));
			goodReceipt.setCreated_date(afterFormat.format(afterCreatedDate));
			goodReceipt.setTotal(rSet.getInt("total"));
			
	}
return goodReceipt;
}
public static boolean checkGR(int ID_Receipt)throws SQLException {
	Connection ketNoi = DBConnection.getConnection();
	String sql = "SELECT ID_Receipt FROM Receipt WHERE ID_Receipt='" + ID_Receipt + "'";
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
public static void insertGR(GoodReceipt gr)throws SQLException {
	Connection ketNoi = DBConnection.getConnection();
	String sql = "INSERT INTO Receipt VALUES (?,?,?,?)";
	try {
		PreparedStatement ps = ketNoi.prepareStatement(sql);
		ps.setInt(1, gr.getID_Receipt());
		ps.setString(2, gr.getID_Account());
		ps.setString(3, gr.getCreated_date());
		ps.setInt(4, gr.getTotal());
		ps.executeUpdate();
		ketNoi.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

public GoodReceipt getReceipt(int ID_Receipt)throws SQLException{
	Connection ketNoi = DBConnection.getConnection();
	SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
	String sql = "SELECT * FROM Receipt WHERE ID_Receipt ='" + ID_Receipt + "'";
	try {
		PreparedStatement ps = ketNoi.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		GoodReceipt goodReceipt = new GoodReceipt();
		while (rs.next()) {
			String beforeCreatedDate= rs.getString("Created_date");
			Date afterCreatedDate = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			goodReceipt.setID_Receipt(rs.getInt("ID_Receipt"));
			goodReceipt.setID_Account(rs.getString("ID_Account"));
			goodReceipt.setCreated_date(afterFormat.format(afterCreatedDate));
			goodReceipt.setTotal(rs.getInt("total"));
			
			
			
		}
		
			return goodReceipt;
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
}
}
