package Dao;

import java.util.ArrayList;

import Model.Invoice;

public interface InvoiceDAO {

	// Tao hoa don moi
	public void insertInvoice(Invoice hd);

	// Cap nhat du lieu
	public void updateInvoice(Invoice hd);
	public void updateInvoice1(Invoice hd);

	// Lay danh sach hoa don
	public ArrayList<Invoice> getListInvoice();
	
	public ArrayList<Invoice> getListInvoice1(String ID_Account);
	
	public ArrayList<Invoice> getListInvoice2(String ID_Account);

	// Xoa Invoice Theo Ma
	public void deleteInvoice(String id);

	// Lay Hoa Don theo ID
	public Invoice getInvoiceByID(String ID_Invoice);
	public Invoice getDetailInvoice2(String ID_Invoice);
	public Invoice getTotal();
}
