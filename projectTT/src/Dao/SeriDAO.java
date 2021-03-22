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
import java.util.Random;

import Connection.DBConnection;
import Model.CTBaoHanh;
import Model.Count;
import Model.CountSeri;
import Model.KetQuaBH;
import Model.Product;
import Model.Seri;

public class SeriDAO {
	public static void main(String[] args) {
		try {
			KetQuaBH ketQuaBH = checkseri(1234);
			System.out.println(ketQuaBH.getTensp()+ketQuaBH.getId() + ketQuaBH.getNgaymua()+ketQuaBH.getHanbaohanh());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static KetQuaBH checkseri(int seri) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		Date d = new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String date = formatDay.format(d);
		KetQuaBH kBh= new KetQuaBH();
		
		String sqlString = "select * from Seri join Product on Seri.ID_Product = Product.ID_Product join InvoiceDetail on InvoiceDetail.ID_Product = Product.ID_Product join Invoice on Invoice.ID_Invoice = InvoiceDetail.ID_Invoice where Seri.id_seri = " + seri;
		System.out.print(sqlString);
		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			String beforeCreatedDate= rSet.getString("Purchase_Date");
			
			Date afterCreatedDate = new Date();
			
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String tensp = rSet.getString("Name_Product");
			
			String ngaytao = afterFormat.format(afterCreatedDate);
			int hanbh = rSet.getInt("Warranty_Period");
			int trangthai = rSet.getInt("Status_Seri");
			
			kBh.setId(seri);
			kBh.setTensp(tensp);
			kBh.setNgaymua(ngaytao);
			kBh.setHanbaohanh(hanbh);
			kBh.setTrangthai(trangthai);
			
			
		}
		return kBh;
	}
	
	public void UpdateStatusSeri(int productID, int quantity) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		Statement stm = ketNoi.createStatement();
		String sql=String.format("update Seri set Seri.Status_Seri = 1 where Seri.Status_Seri = 0 and Seri.ID_Product = '" + productID + "' limit " + quantity + "");
		System.out.println(sql);
		int result= stm.executeUpdate(sql);
		
	}
	
	public boolean insertSeri(int MaSP ,int seri) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		Random rd = new Random();
		int n = 945135;

		
		
		Statement stm = ketNoi.createStatement();
		
		
			String sqlString2 = String.format("insert into Seri (id_seri, ID_Product, Status_Seri) values ('" + seri + "','" + MaSP + "', 0)");
			int rSet1 =stm.executeUpdate(sqlString2);
			if(rSet1 >= 0) {
				return true;
			}else {
				return false;
			}
		
	}
	public static List<Seri> listSeri() throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		List<Seri> dsMenu = new ArrayList<>();
		String sqlString = "select * from Seri s join Product p on s.ID_Product = p.ID_Product ";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {	
			Seri me = new Seri(rSet.getString(3), rSet.getString(8), rSet.getInt(1), rSet.getInt(2), rSet.getInt(4),rSet.getInt(5) );
			dsMenu.add(me);

		}
		return dsMenu;
	}
	public boolean UpdateSeri(int id_seri, int ID_Product, int ID_InvoiceDetail) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		String sqlString = "update Seri set Status_Seri = '1', ID_InvoiceDetail ='"+ ID_InvoiceDetail+"' where id_seri = '" +  id_seri + "' and ID_Product ='" +  ID_Product + "'" ;
		System.out.print(sqlString);
		Statement stm = ketNoi.createStatement();
		int rSet = stm.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	public static boolean checkIdSeri(int id_seri)throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT id_seri FROM Seri WHERE id_seri='" + id_seri + "'";
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
	public static List<Count> listCount( String ID_Product) throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		List<Count> dsMenu = new ArrayList<>();
		String sqlString = "select count(ID_Product) count_id from Seri where ID_Product ='" +  ID_Product + "'";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {	
			Count me = new Count(rSet.getInt(1));
			dsMenu.add(me);

		}
		return dsMenu;
	}
	public static List<CountSeri> listCountSeri( String ID_Product) throws SQLException {

		Connection ketNoi = DBConnection.getConnection();
		List<CountSeri> dsMenu = new ArrayList<>();
		String sqlString = " SELECT rd.ID_Product idproduct ,Sum( rd.Quantity) quantity FROM ReceiptDetail rd  where rd.ID_Product='" +  ID_Product + "'GROUP BY rd.ID_Product";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {	
			CountSeri me = new CountSeri(rSet.getString(1), rSet.getInt(2));
			dsMenu.add(me);

		}
		return dsMenu;
	}
}
