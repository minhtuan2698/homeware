package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import Connection.DBConnection;
import Model.BaoHanh;
import Model.KetQuaBH;


public class BaoHanhDAO {
	public static List<BaoHanh> getallBH() throws SQLException {

		Connection ketNoi = DBConnection.getConnection();

		List<BaoHanh> dsBH = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		String sqlString = "select * from Warranty";
		System.out.print(sqlString);

		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		while (rSet.next()) {
			String beforeCreatedDate= rSet.getString(2);
			String beforeCreatedDate1= rSet.getString(3);
			Date afterCreatedDate = new Date();
			Date afterCreatedDate1 = new Date();
			 try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate1 = (Date)beforeFormat.parse(beforeCreatedDate1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			BaoHanh bh = new BaoHanh(rSet.getInt(1), rSet.getInt(6), afterFormat.format(afterCreatedDate), afterFormat.format(afterCreatedDate1),rSet.getString(4), rSet.getInt(5));
			dsBH.add(bh);

		}
		return dsBH;
	}
	
	public boolean insertBaoHanh(int seri, int id_tinhtrang ) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		Random rd = new Random();
		int n = 351645;
		int id_baohanh = rd.nextInt(n); 
		
		Date d = new Date();
		
		Calendar c = Calendar.getInstance();
        c.setTime(d);

        // manipulate date
       
        c.add(Calendar.DATE, 3); //same with c.add(Calendar.DAY_OF_MONTH, 1);
       

        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
		System.out.println("abc"+currentDatePlusOne);
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		String date1 = formatDay.format(currentDatePlusOne);
		
		String thoigiansua = thoigiansua(id_tinhtrang);
		
		
		String sqlString = "insert into Warranty(ID_Warranty, Received_Date, Return_Date,Intend_Time, Status, id_seri) values ( '" + 
				id_baohanh + "','" + date + "','" + date1+ "','" + thoigiansua + "','" + 1 + "','" + seri + "')";
		System.out.print(sqlString);
		Statement stm = ketNoi.createStatement();
		int rSet = stm.executeUpdate(sqlString);
		if (rSet >= 0) {
			String sqString1 = "insert into WarrantyDetail(ID_Warranty, ID_StatusProduct) values ('"+ id_baohanh +"','"+id_tinhtrang +"')";
			int rSet1 = stm.executeUpdate(sqString1);
			if(rSet1 >= 0)	{
				return true;
			}else {
				return false;
			}	
		} else {
			return false;
		}
	}
	
	public static String thoigiansua(int id_tinhtrang) throws SQLException{
		Connection ketNoi = DBConnection.getConnection();
		
		Statement stm = ketNoi.createStatement();
		String sqlString2 = "select Repair_Time from StatusProduct where ID_StatusProduct = " + id_tinhtrang;
		ResultSet resut = stm.executeQuery(sqlString2);
		String name ="";
		while(resut.next()) {
			name = resut.getString("Repair_Time");
		}
		return name;
		
	}
	
	public boolean UpdateBaoHanh(int id, int status, String ngaytra ) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		String sqlString = "update Warranty set Return_Date = '"+ngaytra+"', Status = "+status+" where ID_Warranty =" + id;
		System.out.print(sqlString);
		Statement stm = ketNoi.createStatement();
		int rSet = stm.executeUpdate(sqlString);
		if (rSet >= 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public static BaoHanh checkbh(int seri) throws SQLException {
		Connection ketNoi = DBConnection.getConnection();
		
		Date d = new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		String date = formatDay.format(d);
		BaoHanh bh = new BaoHanh();
		
		String sqlString = "select * from Warranty where ID_Warranty = " + seri;
		System.out.print(sqlString);
		Statement stm = ketNoi.createStatement();
		ResultSet rSet = stm.executeQuery(sqlString);
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		while (rSet.next()) {
			String beforeCreatedDate= rSet.getString("Received_Date");
			String beforeCreatedDate2= rSet.getString("Return_Date");
			Date afterCreatedDate = new Date();
			Date afterCreatedDate2 = new Date();
			try {
				afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
				afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			bh.setNgaynhan(afterFormat.format(afterCreatedDate));
			bh.setNgaytra(afterFormat.format(afterCreatedDate2));
			bh.setThoigiandukien(rSet.getString("Intend_Time"));
			bh.setTrangthai(rSet.getInt("Status"));
			
			
		}
		return bh;
	}
}
