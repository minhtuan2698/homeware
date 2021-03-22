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
import java.util.logging.Level;
import java.util.logging.Logger;

import org.eclipse.jdt.internal.compiler.lookup.ImplicitNullAnnotationVerifier;

import Connection.DBConnection;
import Model.Account;
import Model.Brand;
import Model.Category;

import Model.Product;
import Model.Season;
import Model.Statistic;

public class ProductDAOImpl implements ProductDAO {

	// Lay danh sach san pham dua theo ma danh muc
	@Override
	public ArrayList<Product> getListProductByCategory(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Category='" + ID_Category + "'";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	
	
	@Override
	public ArrayList<Product> getListProductByCategory1(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE Sale >0 AND ID_Category='" + ID_Category + "'" ;
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getListProductByCategory2(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period\r\n" + 
				"FROM Product p \r\n" + 
				"join InvoiceDetail i on p.ID_Product = i.ID_Product where p.ID_Category ='" + ID_Category + "'\r\n" + 
				" group by i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period\r\n" + 
				" having Sum(i.Quantity) >=2 " ;
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getListProductByCategory3(String ID_Account,String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT  id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,\r\n" + 
				"p.Sale, p.ID_Brand,p.Warranty_Period, i.ID_Account, SUM(id.Quantity) quantity\r\n" + 
				"FROM Product p join InvoiceDetail id on p.ID_Product = id.ID_Product  join Invoice i on id.ID_Invoice = i.ID_Invoice\r\n" + 
				"Where i.ID_Account='" + ID_Account + "' And p.ID_Category ='" + ID_Category + "'\r\n" + 
				"group by id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period, i.ID_Account\r\n" + 
				"order BY Sum(id.Quantity) DESC" ;
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	// Lay danh sach san pham dua theo ma nhan hiệu
		@Override
		public ArrayList<Product> getListProductByBrand(String ID_Brand) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT * FROM Product WHERE ID_Brand='" + ID_Brand + "'";
			ArrayList<Product> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product();
					sanPham.setID_Product(rs.getString("ID_Product"));
					Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
					sanPham.setNhan_Hieu(nhanHieu);
					sanPham.setName_Product(rs.getString("Name_Product"));
					sanPham.setImage(rs.getString("Image"));
					sanPham.setQuantity(rs.getInt("Quantity"));
					sanPham.setDescribe(rs.getString("Describe"));
					sanPham.setPrice(rs.getInt("Price"));
					sanPham.setSale(rs.getInt("Sale"));
					arr.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		@Override
		public ArrayList<Product> getListProductByBrand1(String ID_Brand) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT * FROM Product WHERE Sale >0 AND ID_Brand='" + ID_Brand + "'";
			ArrayList<Product> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product();
					sanPham.setID_Product(rs.getString("ID_Product"));
					Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
					sanPham.setNhan_Hieu(nhanHieu);
					sanPham.setName_Product(rs.getString("Name_Product"));
					sanPham.setImage(rs.getString("Image"));
					sanPham.setQuantity(rs.getInt("Quantity"));
					sanPham.setDescribe(rs.getString("Describe"));
					sanPham.setPrice(rs.getInt("Price"));
					sanPham.setSale(rs.getInt("Sale"));
					arr.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		@Override
		public ArrayList<Product> getListProductByBrand2(String ID_Brand) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period\r\n" + 
					"FROM Product p \r\n" + 
					"join InvoiceDetail i on p.ID_Product = i.ID_Product where p.ID_Brand ='" + ID_Brand + "'\r\n" + 
					" group by i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period\r\n" + 
					" having Sum(i.Quantity) >=2 ";
			ArrayList<Product> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product();
					sanPham.setID_Product(rs.getString("ID_Product"));
					Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
					sanPham.setNhan_Hieu(nhanHieu);
					sanPham.setName_Product(rs.getString("Name_Product"));
					sanPham.setImage(rs.getString("Image"));
					sanPham.setQuantity(rs.getInt("Quantity"));
					sanPham.setDescribe(rs.getString("Describe"));
					sanPham.setPrice(rs.getInt("Price"));
					sanPham.setSale(rs.getInt("Sale"));
					arr.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		@Override
		public ArrayList<Product> getListProductByBrand3(String ID_Account,String ID_Brand) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT  id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,\r\n" + 
					"p.Sale, p.ID_Brand,p.Warranty_Period, i.ID_Account, SUM(id.Quantity) quantity\r\n" + 
					"FROM Product p join InvoiceDetail id on p.ID_Product = id.ID_Product  join Invoice i on id.ID_Invoice = i.ID_Invoice\r\n" + 
					"Where i.ID_Account='" + ID_Account + "' And p.ID_Brand ='" + ID_Brand + "'\r\n" + 
					"group by id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period, i.ID_Account\r\n" + 
					"order BY Sum(id.Quantity) DESC" ;
			ArrayList<Product> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product();
					sanPham.setID_Product(rs.getString("ID_Product"));
					Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
					sanPham.setNhan_Hieu(nhanHieu);
					sanPham.setName_Product(rs.getString("Name_Product"));
					sanPham.setImage(rs.getString("Image"));
					sanPham.setQuantity(rs.getInt("Quantity"));
					sanPham.setDescribe(rs.getString("Describe"));
					sanPham.setPrice(rs.getInt("Price"));
					sanPham.setSale(rs.getInt("Sale"));
					arr.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
	// Hien thi thong tin chi tiet san pham
	@Override
	public Product getDetailProduct(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Product='" + ID_Product + "'";
		Product sanPham = new Product();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setID_Product(rs.getString("ID_Product"));
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				Brand nhanHieu = new Brand(rs.getString("ID_Brand"),"", "","");
				sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
				sanPham.setNhan_Hieu(nhanHieu);
			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return sanPham;
	}

	// Lay danh sach san pham theo List
	@Override
	public ArrayList<Product> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE Quantity >=0 ORDER BY ID_PRODUCT DESC";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
				sanPham.setNhan_Hieu(nhanHieu);
				sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
				Season season = new Season(rs.getInt("ID_Season"), "", "","");
				sanPham.setMua(season);
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getListtt() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE Quantity >=0 AND Price >0 ORDER BY ID_PRODUCT DESC";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
				sanPham.setNhan_Hieu(nhanHieu);
				sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
				Season season = new Season(rs.getInt("ID_Season"), "", "","");
				sanPham.setMua(season);
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getList1() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE Quantity >=0 AND Sale >0 AND Price >0 ORDER BY ID_PRODUCT DESC";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
				sanPham.setNhan_Hieu(nhanHieu);
				sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
				Season season = new Season(rs.getInt("ID_Season"), "", "","");
				sanPham.setMua(season);
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getList2() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period,p.ID_Season\r\n" + 
				"FROM Product p \r\n" + 
				"join InvoiceDetail i on p.ID_Product = i.ID_Product \r\n" + 
				" group by i.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period,p.ID_Season\r\n" + 
				" having Sum(i.Quantity) >=2 and p.Price > 0 \r\n" + 
				"order BY Sum(i.Quantity) DESC";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
				sanPham.setNhan_Hieu(nhanHieu);
				sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
				Season season = new Season(rs.getInt("ID_Season"), "", "","");
				sanPham.setMua(season);
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	@Override
	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start, int end) {
		ArrayList<Product> list = new ArrayList<>();
		for (int i = start; i < end; i++) {
			list.add(arr.get(i));
		}
		return list;
	}
	@Override
	public ArrayList<Product> getListByPage22(ArrayList<Product> arr22, int start22, int end22) {
		ArrayList<Product> list22 = new ArrayList<>();
		for (int i = start22; i < end22; i++) {
			list22.add(arr22.get(i));
		}
		return list22;
	}
	@Override
	public ArrayList<Product> getListByPage1(ArrayList<Product> arr1, int start1, int end1) {
		ArrayList<Product> list1 = new ArrayList<>();
		for (int i = start1; i < end1; i++) {
			list1.add(arr1.get(i));
		}
		return list1;
	}
	@Override
	public ArrayList<Product> getListByPage2(ArrayList<Product> arr2, int start2, int end2) {
		ArrayList<Product> list2 = new ArrayList<>();
		for (int i = start2; i < end2; i++) {
			list2.add(arr2.get(i));
		}
		return list2;
	}
	@Override
	public ArrayList<Product> getListByPage3(ArrayList<Product> arr3, int start3, int end3) {
		ArrayList<Product> list3 = new ArrayList<>();
		for (int i = start3; i < end3; i++) {
			list3.add(arr3.get(i));
		}
		return list3;
	}
	@Override
	public Product getProduct(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Product =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Product);
			ResultSet rs = ps.executeQuery();
			Product pr = new Product();
			while (rs.next()) {
				pr.setID_Product(rs.getString("ID_Product"));
				pr.setName_Product(rs.getString("Name_Product"));
			}
			return pr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void insertProduct(Product pro) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Product VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, pro.getID_Product());
			ps.setString(2, pro.getDanh_Muc().getID_Category()); 
			ps.setString(3, pro.getName_Product());
			ps.setString(4, pro.getImage());
			ps.setInt(5, pro.getQuantity());
			ps.setString(6, pro.getDescribe());
			ps.setInt(7, pro.getPrice());
			ps.setInt(8, pro.getSale());
		    ps.setString(9, pro.getNhan_Hieu().getID_Brand()); 
		    ps.setInt(10, pro.getWarranty_Period());
		    ps.setInt(11, pro.getMua().getID_Season());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateProduct(Product pro)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Product SET ID_Category=?, Name_Product=?, Image=?, Quantity=?, Describe=?, Price=?, Sale=?, ID_Brand=?, Warranty_Period=?, ID_Season=? WHERE ID_Product=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, pro.getDanh_Muc().getID_Category()); 
			ps.setString(2, pro.getName_Product());
			ps.setString(3, pro.getImage());
			ps.setInt(4, pro.getQuantity());
			ps.setString(5, pro.getDescribe());
			ps.setInt(6, pro.getPrice());
			ps.setInt(7, pro.getSale());
			ps.setString(8, pro.getNhan_Hieu().getID_Brand()); 
			ps.setInt(9, pro.getWarranty_Period());
			ps.setInt(10, pro.getMua().getID_Season());
			ps.setString(11, pro.getID_Product());
			ps.executeUpdate();
			ketNoi.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
	

	}

	@Override
	public void deleteProduct(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE Product FROM Product INNER JOIN InvoiceDetail ON Product.ID_Product = InvoiceDetail.ID_Product WHERE ID_Product= ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Product);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void updateQuantity(Product pro)  {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Product SET Quantity=Quantity-? WHERE ID_Product= ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			
			ps.setInt(1, pro.getQuantity());
			ps.setString(2, pro.getID_Product());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		}
	
		@Override
		public void updateQuantity1(int Quantity, String ID_Product)  {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "UPDATE Product SET Quantity=Quantity+? WHERE ID_Product= ?";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				
				ps.setInt(1, Quantity);
				ps.setString(2, ID_Product);
				ps.executeUpdate();
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
				
			}

	}
		@Override
		public void updateQuantity2(int Quantity, String ID_Product)  {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "UPDATE Product SET Quantity=Quantity+? WHERE ID_Product= ?";
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				
				ps.setInt(1, Quantity);
				ps.setString(2, ID_Product);
				ps.executeUpdate();
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
				
			}

	}
		
	
	
		@Override
		public ArrayList<Product> listSanPhambySearch(String textSearch) {
			Connection ketNoi = DBConnection.getConnection();
			
			String sql = "select * from Product where Name_Product like  '%" + textSearch + "%'";
		
			System.out.println("xzz" + sql);
			ArrayList<Product> list = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product(rs.getString(1), rs.getString(3), rs.getString(4), rs.getInt(7));
					list.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return list;
		}
		@Override
		public ArrayList<Product> getListProductAccountBuy(String ID_Account) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT  id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,\r\n" + 
					"p.Sale, p.ID_Brand,p.Warranty_Period, p.ID_Season,i.ID_Account, SUM(id.Quantity) quantity\r\n" + 
					"FROM Product p join InvoiceDetail id on p.ID_Product = id.ID_Product  join Invoice i on id.ID_Invoice = i.ID_Invoice\r\n" + 
					"Where i.ID_Account='" + ID_Account + "' AND p.Price>0\r\n" + 
					"group by id.ID_Product,p.Name_Product, p.ID_Category, p.Image,  p.ID_Brand, p.Quantity, p.Describe,p.Price,p.Sale, p.ID_Brand,p.Warranty_Period,p.ID_Season, i.ID_Account\r\n" + 
					"order BY Sum(id.Quantity) DESC";
			ArrayList<Product> arr = new ArrayList<>();
			try {
				PreparedStatement ps = ketNoi.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Product sanPham = new Product();
					sanPham.setID_Product(rs.getString("ID_Product"));
					Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
					sanPham.setDanh_Muc(danhMuc);
					sanPham.setName_Product(rs.getString("Name_Product"));
					sanPham.setImage(rs.getString("Image"));
					sanPham.setQuantity(rs.getInt("Quantity"));
					sanPham.setDescribe(rs.getString("Describe"));
					sanPham.setPrice(rs.getInt("Price"));
					sanPham.setSale(rs.getInt("Sale"));
					Brand nhanHieu = new Brand(rs.getString("ID_Brand"), "", "","");
					sanPham.setNhan_Hieu(nhanHieu);
					sanPham.setWarranty_Period(rs.getInt("Warranty_Period"));
					Season season = new Season(rs.getInt("ID_Season"), "", "","");
					sanPham.setMua(season);
					arr.add(sanPham);
				}
				ketNoi.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr;
		}
		@Override
		public boolean checkIdProduct(String ID_Product) {
			Connection ketNoi = DBConnection.getConnection();
			String sql = "SELECT ID_Product FROM Product WHERE ID_Product ='" + ID_Product + "'";
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
}
