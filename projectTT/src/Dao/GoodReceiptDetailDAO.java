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

import Connection.DBConnection;
import Model.GoodReceipt;
import Model.GoodReceiptDetail;
import Model.Invoice;
import Model.Product;

public class GoodReceiptDetailDAO {
	public static ArrayList<GoodReceiptDetail> listGoodReceiptDetailbyID(int ID_Receipt) throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		Statement stm = ketNoi.createStatement();
		ArrayList<GoodReceiptDetail> list = new ArrayList<>();
	
		String sqlString = "select * from ReceiptDetail where ID_Receipt='"+ ID_Receipt +"' ORDER BY ID_PRODUCT ASC" ;
		ResultSet rs = stm.executeQuery(sqlString);
		while (rs.next()) {
			 GoodReceiptDetail goodReceiptDetail = new GoodReceiptDetail();
			    GoodReceipt goodReceipt = new GoodReceipt(rs.getInt("ID_Receipt"), null, "", 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null,0,null);
				goodReceiptDetail.setID_ReceiptDetail(rs.getInt("ID_ReceiptDetail"));
				goodReceiptDetail.setSan_Pham(product);
				goodReceiptDetail.setPhieu_Nhap(goodReceipt);
				goodReceiptDetail.setPrice(rs.getInt("Price"));
				goodReceiptDetail.setQuantity(rs.getInt("Quantity"));				
				list.add(goodReceiptDetail);
					

		}
		return list;
	}
	public int insertGoodReceiptDetail(int id, String productID, int price, int quantity) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement = ketNoi.createStatement();
		
		String sqlString="INSERT INTO dbo.ReceiptDetail(ID_Product,ID_Receipt,Price, Quantity) VALUES(N'"+productID+"' ,"+id+","+price+","+quantity+")";
		int rSet = statement.executeUpdate(sqlString);
		if (rSet >= 0) {
			return 0;
		} 
			return 2;
		}
	public int getIDgoodReceiptDetal() throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Statement statement = ketNoi.createStatement();
		String sqlString="select MAX(ID_ReceiptDetail) as ID_ReceiptDetail from ReceiptDetail";
		ResultSet resultSet= statement.executeQuery(sqlString);
		int id=0;
		while(resultSet.next()) {
			id= resultSet.getInt("ID_ReceiptDetail");
		}
		return id;
	}
	public static void insertGRD(GoodReceiptDetail grd)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO ReceiptDetail VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, grd.getID_ReceiptDetail());
			ps.setString(2, grd.getSan_Pham().getID_Product());
			ps.setInt(3, grd.getPhieu_Nhap().getID_Receipt());
			ps.setInt(4, grd.getPrice());
			ps.setInt(5, grd.getQuantity());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
