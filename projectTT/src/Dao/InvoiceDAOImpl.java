package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sun.accessibility.internal.resources.accessibility;

import Connection.DBConnection;
import Model.Account;
import Model.AccountSession;
import Model.Brand;
import Model.Category;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;
import Model.Shipper;

public class InvoiceDAOImpl implements InvoiceDAO {

	private static final String ID_Invoice = null;


	@Override
	public void insertInvoice(Invoice hd) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Invoice VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, hd.getID_Invoice());
			ps.setString(2, hd.getTai_Khoan().getID_Account());
			ps.setString(3, hd.getShipping_Address());
			ps.setString(4, hd.getPayment_Methods());
			ps.setTimestamp(5, hd.getPurchase_Date());
			ps.setInt(6, hd.getStatus_Order());
			ps.setInt(7, hd.getTotal_Invoice());
			ps.setInt(8, hd.getGiao_Hang().getID_Shipper());
			ps.setString(9, hd.getID_Employee());
			ps.setString(10, hd.getTime_Limit());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Invoice> getListInvoice() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Invoice";
		ArrayList<Invoice> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String beforeCreatedDate= rs.getString("Time_Limit");
				Date afterCreatedDate = new Date();
				try {
					afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Invoice bill = new Invoice();
				Account acc = new Account(rs.getString("ID_Account"), "", "", "","","","", 0, 0);
				bill.setID_Invoice(rs.getString("ID_Invoice"));
				bill.setTai_Khoan(acc);
				bill.setShipping_Address(rs.getString("Shipping_Address"));
				bill.setPayment_Methods(rs.getString("Payment_Methods"));
				bill.setPurchase_Date(rs.getTimestamp("Purchase_Date"));
				bill.setStatus_Order(rs.getInt("Status_Order"));
				bill.setTotal_Invoice(rs.getInt("Total_Invoice"));
				Shipper ship = new Shipper(rs.getInt("ID_Shipper"),"","","");
				bill.setGiao_Hang(ship);
				bill.setID_Employee(rs.getString("ID_Employee"));
				bill.setTime_Limit(afterFormat.format(afterCreatedDate));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public ArrayList<Invoice> getListInvoice1(String ID_Account) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Invoice where ID_Account ='"+ ID_Account +"' AND (Status_Order='1' OR Status_Order='3') ORDER BY Purchase_Date DESC";
		ArrayList<Invoice> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String beforeCreatedDate= rs.getString("Time_Limit");
				Date afterCreatedDate = new Date();
				try {
					afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Invoice bill = new Invoice();
				Account acc = new Account(rs.getString("ID_Account"), "", "", "","","","", 0, 0);
				bill.setID_Invoice(rs.getString("ID_Invoice"));
				bill.setTai_Khoan(acc);
				bill.setShipping_Address(rs.getString("Shipping_Address"));
				bill.setPayment_Methods(rs.getString("Payment_Methods"));
				bill.setPurchase_Date(rs.getTimestamp("Purchase_Date"));
				bill.setStatus_Order(rs.getInt("Status_Order"));
				bill.setTotal_Invoice(rs.getInt("Total_Invoice"));
				Shipper ship = new Shipper(rs.getInt("ID_Shipper"),"","","");
				bill.setGiao_Hang(ship);
				bill.setID_Employee(rs.getString("ID_Employee"));
				bill.setTime_Limit(afterFormat.format(afterCreatedDate));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ArrayList<Invoice> getListInvoice2(String ID_Account) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Invoice where ID_Account ='"+ ID_Account +"' AND (Status_Order='2' OR Status_Order='4')  ORDER BY Purchase_Date DESC, ID_Invoice ASC";
		ArrayList<Invoice> list = new ArrayList<>();
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String beforeCreatedDate= rs.getString("Time_Limit");
				Date afterCreatedDate = new Date();
				try {
					afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Invoice bill = new Invoice();
				Account acc = new Account(rs.getString("ID_Account"), "", "", "","","","", 0, 0);
				bill.setID_Invoice(rs.getString("ID_Invoice"));
				bill.setTai_Khoan(acc);
				bill.setShipping_Address(rs.getString("Shipping_Address"));
				bill.setPayment_Methods(rs.getString("Payment_Methods"));
				bill.setPurchase_Date(rs.getTimestamp("Purchase_Date"));
				bill.setStatus_Order(rs.getInt("Status_Order"));
				bill.setTotal_Invoice(rs.getInt("Total_Invoice"));
				Shipper ship = new Shipper(rs.getInt("ID_Shipper"),"","","");
				bill.setGiao_Hang(ship);
				bill.setID_Employee(rs.getString("ID_Employee"));
				bill.setTime_Limit(afterFormat.format(afterCreatedDate));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public void updateInvoice(Invoice hd) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Invoice SET Status_Order=?, ID_Shipper=?, ID_Employee=? WHERE ID_Invoice=? ";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setInt(1, hd.getStatus_Order());
			ps.setInt(2, hd.getGiao_Hang().getID_Shipper());
			ps.setString(3, hd.getID_Employee());
			ps.setString(4, hd.getID_Invoice());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void updateInvoice1(Invoice hd) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Invoice SET Status_Order=?, ID_Shipper=?, Time_Limit=? WHERE ID_Invoice=? ";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setInt(1, hd.getStatus_Order());
			ps.setInt(2, hd.getGiao_Hang().getID_Shipper());
			ps.setString(3, hd.getTime_Limit());
			ps.setString(4, hd.getID_Invoice());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInvoice(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE From Invoice WHERE ID_Invoice=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Invoice);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Invoice getInvoiceByID(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "Select * From Invoice Where ID_Invoice=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Invoice);
			ResultSet rs = ps.executeQuery();
			Invoice hd = new Invoice();
			if (rs.next()) {
				Account acc = new Account(rs.getString("Account"), sql, sql, sql, sql, sql, sql, 0, 0);
				hd.setID_Invoice(rs.getString("ID_Invoice"));
				hd.setTai_Khoan(acc);
				hd.setShipping_Address(rs.getString("Shipping_Address"));
				hd.setPayment_Methods(rs.getString("Payment_Methods"));
				hd.setPurchase_Date(rs.getTimestamp("Payment_Methods"));
				hd.setStatus_Order(rs.getInt("Status_Order"));
				hd.setTotal_Invoice(rs.getInt("Total_Invoice"));
			}
			return hd;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	@Override
	public Invoice getDetailInvoice2(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Invoice WHERE ID_Invoice='" + ID_Invoice + "'";
		Invoice hd = new Invoice();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account acc = new Account(rs.getString("Account"), sql, sql, sql, sql, sql, sql, 0, 0);
				hd.setID_Invoice(rs.getString("ID_Invoice"));
				hd.setTai_Khoan(acc);
				hd.setShipping_Address(rs.getString("Shipping_Address"));
				hd.setPayment_Methods(rs.getString("Payment_Methods"));
				hd.setPurchase_Date(rs.getTimestamp("Payment_Methods"));
				hd.setStatus_Order(rs.getInt("Status_Order"));
				hd.setTotal_Invoice(rs.getInt("Total_Invoice"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return hd;
	}

	public Invoice getTotal() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(Total_Invoice) FROM Invoice WHERE Status_Order ='1'";
		Invoice bill = new Invoice();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			/* ps.setString(1, total_Invoice); */
			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				
				Account acc = new Account(rs.getString("ID_Account"), "", "", "","","","", 0, 0);
				bill.setID_Invoice(rs.getString("ID_Invoice"));
				bill.setTai_Khoan(acc);
				bill.setShipping_Address(rs.getString("Shipping_Address"));
				bill.setPayment_Methods(rs.getString("Payment_Methods"));
				bill.setPurchase_Date(rs.getTimestamp("Purchase_Date"));
				bill.setStatus_Order(rs.getInt("Status_Order"));
				bill.setTotal_Invoice(rs.getInt("Total_Invoice"));
				Shipper ship = new Shipper(rs.getInt("ID_Shipper"),"","","");
				bill.setGiao_Hang(ship);
				bill.setID_Employee(rs.getString("ID_Employee"));
				bill.setTime_Limit(rs.getString("Time_Limit"));
				
			}
			
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return bill;
	}
	
	
}
