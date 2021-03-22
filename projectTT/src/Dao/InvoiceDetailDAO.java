package Dao;

import java.util.ArrayList;

import Model.Export;
import Model.InvoiceDetail;
import Model.Profit;
import Model.Statistic;

public interface InvoiceDetailDAO {
	
	// Them chi tiet hoa don
	public void insertInvoiceDetail(InvoiceDetail hdct);
	
	// Cap nhat du lieu
	public void updateInvoiceDetail(InvoiceDetail hdct);
	
	// Xoa Du Lieu
	public void deleteInvoiceDetail(int ID_InvoiceDetail);
	
	// Lay danh sach hoa don chi tiet
	public ArrayList<InvoiceDetail> getListInvoiceDetail();
	public ArrayList<InvoiceDetail> getListInvoiceDetail1(String ID_Account);
	public ArrayList<InvoiceDetail> getListInvoiceHistoryDetail(String ID_Invoice);
	public ArrayList<InvoiceDetail> getListInvoiceHistoryDetail1(String ID_Invoice);
	public ArrayList<InvoiceDetail> getListUpdateProduct(String ID_Invoice);
	public ArrayList<Statistic> getListInvoiceDetail9();
	public ArrayList<Statistic> getListInvoiceDetail10();
	public ArrayList<Statistic> getListInvoiceDetail11();
	public ArrayList<Statistic> getListInvoiceDetail12();
	public ArrayList<Statistic> getListInvoiceDetail13(String dateFrom, String dateTo);
	public ArrayList<Export> getListExport();
	public ArrayList<Profit> getListProfit(String dateFrom, String dateTo);
	

}
