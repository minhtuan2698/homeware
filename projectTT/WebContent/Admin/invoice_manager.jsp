<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAO"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Dao.ShipperDAO"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Danh Mục | Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
		InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
		ArrayList<Invoice> listInvoice = invoiceDAO.getListInvoice();
		AccountDAOImpl accDAO = new AccountDAOImpl();
		ShipperDAO shipDAO = new ShipperDAO();

		InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();
		ArrayList<InvoiceDetail> listInvoiceDetail = invoiceDetailDAO.getListInvoiceDetail();
		ProductDAOImpl productDAO = new ProductDAOImpl(); 
		
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ HÓA ĐƠN</h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						<!-- 	<a class="navbar-brand" href="invoice_manager.jsp" style="color: white;"></a> -->
						</div>
					</div>
				</div>
				<hr />


				<div class="row">
					<div class="col-md-12">
<!-- Hóa đơn chi tiết -->
					<%-- 	<div class="panel panel-default">
							<div class="panel-heading">Hóa Đơn Chi Tiết</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr style="text-align: center;">
												<th>Hóa Đơn Chi Tiết</th>
												<th>Mã Hóa Đơn</th>
												<th>Sản Phẩm</th>
												<th>Số Lượng</th>
												<th>Giá Sản Phẩm</th>
												<th>Giảm Giá</th>
												<th>Tổng Tiền</th>
												<!-- <th>Chức Năng</th> -->
											</tr>
										</thead>

										<%
											for (InvoiceDetail invoiceDetail : listInvoiceDetail) {
										%>
										<tbody>
											<tr class="odd gradeX">
												<td><%=invoiceDetail.getID_InvoiceDetail()%></td>
												<td><%=invoiceDetail.getHoa_Don().getID_Invoice()%></td>
												<td><%=productDAO.getProduct(invoiceDetail.getSan_Pham().getID_Product()).getName_Product()%></td>
												<td><%=invoiceDetail.getQuantity()%></td>
												<td><%=nf.format(invoiceDetail.getPrice())%> VNĐ</td>
												<td><%=invoiceDetail.getSale()%> %</td>
												<td>
												<% if(invoiceDetail.getSale()==0) {%>
													<%=nf.format(invoiceDetail.getQuantity()*invoiceDetail.getPrice())%> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==2) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.98)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==5) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.95)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==8) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.92)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==10) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.90)) %> VNĐ
												<% } %>
												</td>
												
												<td class="center" style="text-align: center;">
												<a href="/TheSinh_Homeware/Admin/invoiceDetail_edit.jsp?action=Update&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail()%>&Quantity=<%=invoiceDetail.getQuantity()%>" class="btn btn-danger btn-xs">Sửa</a> 
												<a href="/TheSinh_Homeware/InvoiceDetailServlet_Update_Del?action=Delete&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail() %>" onclick="return confirm('Bạn chắc chắn chứ ?')" class="btn btn-warning btn-xs">Xóa</a>
												</td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
								</div>
							</div>
						</div> --%>
						
						<!-- ket thuc Hóa đơn chi tiết -->

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ HÓA ĐƠN</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example5">
										<thead>
											<tr>
												<th>Mã Hóa Đơn</th>
												<th>Khách Hàng</th>
												<!-- <th>Email</th>  -->
												<th>Số điện thoại</th>
												<th>Địa Chỉ Giao Hàng</th>
												<th>Phương Thức Thanh Toán</th>
												<th>Tổng tiền hóa đơn</th>
												<th>Ngày Mua Hàng</th>
												<th>Ngày Giao Dự Kiến</th>
												<th>Nhân viên duyệt</th>
												<th>Trạng Thái Đơn Hàng</th>
												<th>Chức Năng</th>
												<th>Xem chi tiết</th>
											</tr>
										</thead>

										
										<tbody>
										<%
											for (Invoice invoice : listInvoice) {
										%>
											<tr class="odd gradeX">
												<td><%=invoice.getID_Invoice()%></td>
												<td><%=accDAO.getUser(invoice.getTai_Khoan().getID_Account()).getUsername()%></td>
												<%-- <td><%=accDAO.getUser(invoice.getTai_Khoan().getID_Account()).getEmail()%></td> --%>
												<td><%=accDAO.getUser(invoice.getTai_Khoan().getID_Account()).getSDT()%></td>
												<td><%=invoice.getShipping_Address()%></td>
												<td><%=invoice.getPayment_Methods()%></td>
												<td><%=nf.format(invoice.getTotal_Invoice()) %></td>
												<td><%=invoice.getPurchase_Date()%></td>	
												<td <%if (invoice.getStatus_Order()==3) {%> style="color:red;" <%}
                       
												%>> <%if (invoice.getStatus_Order()==3) {%> Ngày hủy: <%=invoice.getTime_Limit()%> <%}
                        else{ %> <%=invoice.getTime_Limit()%>
													<%
													}
												%></td>
												<td><%if (invoice.getID_Employee().equals("0")) {%> <%}
                        else{ %> <%=accDAO.getUser(invoice.getID_Employee()).getUsername()%>
													<%
													}
												%></td>
												<td class="center" style="text-align: center;">
												<%
													if (invoice.getStatus_Order()==1){
												%>
												<a class="btn btn-success btn-xs" >Đã Thanh Toán</a>
												<%
													}															
												%>	
												 <% 
													if (invoice.getStatus_Order()==2) {											
												%>									
												<a class="btn btn-primary btn-xs">Chờ Xử Lý</a>			
												<%
													}
												%> 
												<% 
													if (invoice.getStatus_Order()==3) {											
												%>									
												<a class="btn btn-danger btn-xs" >Đã hủy</a>			
												<%
													}
												%> 
												<% 
													if (invoice.getStatus_Order()==4) {											
												%>									
												<a class="btn btn-warning btn-xs" >Đang giao </a>	<br>		
												<span>Người giao:</span><br>
												<a class="btn btn-primary btn-xs" ><%=shipDAO.getShipperInvoice(invoice.getGiao_Hang().getID_Shipper()).getName_Shipper()%></a>
												<%
													}
												%> 
												</td>
												<td class="center" style="text-align: center;">
													<a href="/TheSinh_Homeware/Admin/invoice_edit.jsp?action=Update&ID_Invoice=<%=invoice.getID_Invoice()%>&Shipping_Address=<%=invoice.getShipping_Address() %>&Status_Order=<%=invoice.getStatus_Order() %>"
													<% 
													if (invoice.getStatus_Order()==3 || invoice.getStatus_Order()==1) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%>  class="btn btn-danger btn-xs" >Xử lý</a> 
													
												<%-- <a href="/TheSinh_Homeware/InvoiceServlet_Update_Del?action=Delete&ID_Invoice=<%=invoice.getID_Invoice() %> " onclick="return confirm('Bạn không thể xóa dòng này nếu mà bạn chưa xóa dòng tương ứng với hóa đơn chi tiết ?')"
													class="btn btn-warning btn-xs">Xóa</a></td> --%>
													<td class="center" style="text-align: center;">
												
												<a href="/TheSinh_Homeware/InvoiceHistoryDetailAdmin?action=Views&ID_Invoice=<%=invoice.getID_Invoice()%>"
													class="btn btn-warning btn-xs">Xem</a></td>
											</tr>
												<%
											}
										%>
										</tbody>

									
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example5').dataTable();
		
		});
	</script>
	<script src="assets/js/custom.js"></script>

</body>
</html>