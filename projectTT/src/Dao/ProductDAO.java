package Dao;

import java.util.ArrayList;
import java.util.List;

import Model.Account;
import Model.Product;

public interface ProductDAO {

	// Lay danh sach san pham dua theo ma danh muc
	public ArrayList<Product> getListProductByCategory(String ID_Category);
	public ArrayList<Product> getListProductByCategory1(String ID_Category);
	public ArrayList<Product> getListProductByCategory2(String ID_Category);
	public ArrayList<Product> getListProductByCategory3(String ID_Account,String ID_Category);
	
	// Lay danh sach san pham dua theo ma nhãn hiệu
		public ArrayList<Product> getListProductByBrand(String ID_Brand);
		public ArrayList<Product> getListProductByBrand1(String ID_Brand);
		public ArrayList<Product> getListProductByBrand2(String ID_Brand);
		public ArrayList<Product> getListProductByBrand3(String ID_Account,String ID_Brand);

	

	// Hien thi thong tin chi tiet san pham
	public Product getDetailProduct(String ID_Product);

	// Lay danh sach san pham theo danh sach
	public ArrayList<Product> getList();
	public ArrayList<Product> getListtt();
	public ArrayList<Product> getList1();
	public ArrayList<Product> getList2();

	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start, int end);
	public ArrayList<Product> getListByPage1(ArrayList<Product> arr1, int start1, int end1);
	public ArrayList<Product> getListByPage2(ArrayList<Product> arr2, int start2, int end2);
	public ArrayList<Product> getListByPage3(ArrayList<Product> arr3, int start3, int end3);
	public ArrayList<Product> getListByPage22(ArrayList<Product> arr22, int start22, int end22);
	
	
	// Lay San Pham Theo Ma
	public Product getProduct(String ID_Product);
	
	// Them moi san pham
		public void insertProduct(Product pro);

		// Sua san pham
	 public void updateProduct(Product pro); 

		// Xoa san pham
		public void deleteProduct(String ID_Product);
		public void updateQuantity(Product pro);
		public void updateQuantity1(int Quantity, String ID_Product);
		public void updateQuantity2(int Quantity, String ID_Product);
		public ArrayList<Product> getListProductAccountBuy(String ID_Account);
		public ArrayList<Product> listSanPhambySearch(String textSearch); 
		public boolean checkIdProduct(String ID_Product);
		
		
		
}
