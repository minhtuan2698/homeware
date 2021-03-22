package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Connection.DBConnection;
import Model.AccountSession;
import Model.Export;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;
import Model.Profit;
import Model.Statistic;

public class InvoiceDetailDAOImpl implements InvoiceDetailDAO {

	@Override
	public void insertInvoiceDetail(InvoiceDetail hdct) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO InvoiceDetail VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, hdct.getID_InvoiceDetail());
			ps.setString(2, hdct.getHoa_Don().getID_Invoice());
			ps.setString(3, hdct.getSan_Pham().getID_Product());
			ps.setInt(4, hdct.getQuantity());
			ps.setInt(5, hdct.getPrice());
			ps.setInt(6, hdct.getSale());
			ps.setInt(7, hdct.getTotal());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<InvoiceDetail> getListInvoiceDetail() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				bill.setTotal(rs.getInt("Total"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ArrayList<InvoiceDetail> getListInvoiceDetail1(String ID_Account) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail INNER JOIN Invoice ON InvoiceDetail.ID_Invoice = Invoice.ID_Invoice where ID_Account ='"+ ID_Account +"' ";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				bill.setTotal(rs.getInt("Total"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public void updateInvoiceDetail(InvoiceDetail hdct) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE InvoiceDetail SET Quantity=?, Sale=? WHERE ID_InvoiceDetail=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, hdct.getQuantity());
			ps.setInt(2, hdct.getSale());
			ps.setInt(3, hdct.getID_InvoiceDetail());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInvoiceDetail(int ID_InvoiceDetail) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE From InvoiceDetail WHERE ID_InvoiceDetail=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_InvoiceDetail);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public ArrayList<InvoiceDetail> getListInvoiceHistoryDetail(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail  where ID_Invoice ='"+ ID_Invoice +"' ";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				bill.setTotal(rs.getInt("Total"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public ArrayList<InvoiceDetail> getListInvoiceHistoryDetail1(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail  where ID_Invoice ='"+ ID_Invoice +"' ";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0,null);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				bill.setTotal(rs.getInt("Total"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ArrayList<InvoiceDetail> getListUpdateProduct(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql ="SELECT ID_Product,Quantity FROM InvoiceDetail where ID_Invoice = '"+ ID_Invoice +"'";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String sql1 = "UPDATE Product SET Quantity=Quantity+? WHERE ID_Product= ?";
				PreparedStatement ps1 = ketNoi.prepareStatement(sql1);
				ps1.setInt(1, rs.getInt("Quantity"));
				ps1.setString(2,rs.getString("ID_Product"));
				ps1.executeUpdate();
				
//				InvoiceDetail bill = new InvoiceDetail();
//				/*bill.setQuantity( rs.getInt("Quantity"));
//				bill.getSan_Pham().setID_Product(rs.getString("ID_Product"));*/
//				Product product = new Product(rs.getString("ID_Product"), null, "", "", rs.getInt("Quantity"), "", 0, 0,null);
//				bill.setSan_Pham(product);
//				list.add(bill);
			}
			
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ArrayList<Statistic> getListInvoiceDetail9() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,SUM(Total) total\r\n" + 
				"FROM Invoice \r\n" + 
				"JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product\r\n" + 
				"WHERE  Status_Order ='1'\r\n" + 
				"GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price";
		ArrayList<Statistic> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Statistic statistic = new Statistic(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("total"));
				list.add(statistic);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public ArrayList<Statistic> getListInvoiceDetail10() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,SUM(Total) total \r\n" + 
				"				FROM Invoice  \r\n" + 
				"				JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"				JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product \r\n" + 
				"				WHERE  Status_Order ='1' AND ID_Category='DCNB'\r\n" + 
				"				GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price";
		ArrayList<Statistic> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Statistic statistic = new Statistic(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("total"));
				list.add(statistic);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ArrayList<Statistic> getListInvoiceDetail11() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,SUM(Total) total \r\n" + 
				"				FROM Invoice  \r\n" + 
				"				JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"				JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product \r\n" + 
				"				WHERE  Status_Order ='1' AND ID_Category='DDGD'\r\n" + 
				"				GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price";
		ArrayList<Statistic> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Statistic statistic = new Statistic(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("total"));
				list.add(statistic);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public ArrayList<Statistic> getListInvoiceDetail12() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,SUM(Total) total \r\n" + 
				"				FROM Invoice  \r\n" + 
				"				JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"				JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product \r\n" + 
				"				WHERE  Status_Order ='1' AND ID_Category='VDTN'\r\n" + 
				"				GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price";
		ArrayList<Statistic> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Statistic statistic = new Statistic(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("total"));
				list.add(statistic);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	/* Doanh thu */
	@Override
	public ArrayList<Statistic> getListInvoiceDetail13(String dateFrom, String dateTo) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,SUM(Total) total\r\n" + 
				"				FROM Invoice \r\n" + 
				"				JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"				JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product \r\n" + 
				"				WHERE  Status_Order ='1'and Purchase_Date > '"+ dateFrom +"' and Purchase_Date < '"+ dateTo +"'\r\n" + 
				"				GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price";
		ArrayList<Statistic> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Statistic statistic = new Statistic(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("total"));
				list.add(statistic);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	/* Lợi nhuận */
	@Override
	public ArrayList<Profit> getListProfit(String dateFrom, String dateTo) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT SUM(InvoiceDetail.Quantity) quantity, InvoiceDetail.ID_Product product_id, Product.Name_Product product_name, Product.Price,Product.Sale,SUM(Total) total,rd.Price priceImport\r\n" + 
				"FROM Invoice \r\n" + 
				"JOIN InvoiceDetail ON Invoice.ID_Invoice = InvoiceDetail.ID_Invoice\r\n" + 
				"JOIN Product ON InvoiceDetail.ID_Product = Product.ID_Product \r\n" + 
				"join ReceiptDetail rd on Product.ID_Product = rd.ID_Product\r\n" + 
				"WHERE  Status_Order ='1' and Purchase_Date > '"+ dateFrom +"' and Purchase_Date < '"+ dateTo +"'\r\n" + 
				"GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.Price,Product.Sale,rd.Price";
		ArrayList<Profit> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Profit profit = new Profit(rs.getInt("quantity"), rs.getString("product_id"), rs.getString("product_name"), rs.getDouble("price"), rs.getDouble("sale") ,rs.getDouble("total"),rs.getDouble("priceImport") );
				list.add(profit);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ArrayList<Export> getListExport() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT  InvoiceDetail.ID_Product product_id,Product.ID_Category category_id ,Product.ID_Brand brand_id,Product.Name_Product product_name,Product.Image image ,SUM(InvoiceDetail.Quantity) quantity\r\n" + 
				"									FROM Invoice join InvoiceDetail on Invoice.ID_Invoice= InvoiceDetail.ID_Invoice join Product ON InvoiceDetail.ID_Product = Product.ID_Product where Status_Order !=3 and Status_Order !=2\r\n" + 
				"									GROUP BY InvoiceDetail.ID_Product, Product.Name_Product, Product.ID_Category, Product.Image, Product.Quantity, Product.ID_Brand";
		ArrayList<Export> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Export export = new Export( rs.getString("product_id"),rs.getString("category_id"),rs.getString("brand_id"), rs.getString("product_name"), rs.getString("image"),rs.getInt("quantity"));
				list.add(export);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
}

