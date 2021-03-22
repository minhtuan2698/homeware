<%-- <%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountSession"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem chi tiết đơn hàng | TS-Homeware</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>

</head>
<body>
<%
Account acc = (Account) session.getAttribute("memberSession");
if (acc == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
}

AccountDAOImpl accDAO = new AccountDAOImpl();
String ID_Account = acc.getID_Account(); 
InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();
ArrayList<InvoiceDetail> listInvoiceDetail = invoiceDetailDAO.getListInvoiceDetail1(ID_Account);
ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
	
	%>

<div class="hidden-profile">
<jsp:include page="header.jsp"></jsp:include>
</div>
	
	
	<div id="wrapper">
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2 style="text-align:center;text-transform: uppercase">Xem chi tiết đơn hàng</h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
					</div>
				</div>
				<hr />
               	<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
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
												
												<a href="/TheSinh_Homeware/InvoiceDetailServlet_Update_Del?action=Delete&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail() %>" onclick="return confirm('Bạn chắc chắn chứ ?')" class="btn btn-warning btn-xs">Hủy</a>
												</td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
								</div>
							</div>
						</div>

						
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> --%>





<%@page import="com.sun.accessibility.internal.resources.accessibility"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Dao.ShipperDAO"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountSession"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem chi tiết đơn hàng | TS-Homeware</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>

</head>
<body>

<%
 Account acc = (Account) session.getAttribute("memberSession");
if (acc == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
}
 
InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
 String ID_Account = acc.getID_Account(); 
ArrayList<Invoice> listInvoice2 = invoiceDAO.getListInvoice2(ID_Account);
AccountDAOImpl accDAO = new AccountDAOImpl();

ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
ShipperDAO shipDAO = new ShipperDAO();
	
	%>

<div class="hidden-profile">
<jsp:include page="header.jsp"></jsp:include>
</div>
	
	
	<div id="wrapper">
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2 style="text-align:center;text-transform: uppercase">Xem chi tiết đơn hàng </h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
					</div>
				</div>
				<hr />
               	<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">CHI TIẾT ĐƠN HÀNG</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example3">
										<thead>
											<tr style="text-align: center;">
												<th>Mã Hóa Đơn</th>
												<!-- <th>Khách Hàng</th>
												<th>Số điện thoại</th> -->
												<th>Địa Chỉ Giao Hàng</th>
												<th>Phương Thức Thanh Toán</th>
												<th>Tổng hóa đơn</th>
												<th class="sorting_desc">Ngày Mua Hàng</th>
												<th>Dự kiến giao hàng</th>
												<th>Trạng Thái Đơn Hàng</th>
												<th>Người Giao Hàng</th>
												<th>Chức Năng</th>
												<th>Chi Tiết</th>
												
											</tr>
										</thead>

										
										<tbody>
										<%
											for (Invoice invoice : listInvoice2) {
										%>
											<tr class="odd gradeX">
												<td><%=invoice.getID_Invoice()%></td>
												<%-- <td><%=accDAO.getAccount(invoice.getTai_Khoan().getID_Account()).getUsername()%></td>
												<td><%=accDAO.getAccount(invoice.getTai_Khoan().getID_Account()).getSDT()%></td> --%>
												<td><%=invoice.getShipping_Address()%></td>
												<td><%=invoice.getPayment_Methods()%></td>
												<td><%=invoice.getTotal_Invoice() %>
												<td><%=invoice.getPurchase_Date()%></td>	
												<td><%=invoice.getTime_Limit()%></td>
												<td class="center" style="text-align: center;" name="Status_Order">
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
												<a class="btn  btn-danger btn-xs">Đã hủy</a>			
												<%
													}
												%>
												<% 
													if (invoice.getStatus_Order()==4) {											
												%>									
												<a class="btn  btn-warning btn-xs">Đang giao</a>
											
												
												<%
													}
												%>
												</td>
												<td><a <% 
													if (invoice.getStatus_Order()==2) {											
												%>style="display:none" <%}
                        else{ %> style=" display:block;color:black"
													<%
													}
												%> ><%=shipDAO.getShipperInvoice(invoice.getGiao_Hang().getID_Shipper()).getName_Shipper()%> <br>SĐT: <%=shipDAO.getShipperInvoice(invoice.getGiao_Hang().getID_Shipper()).getPhone_Shipper()%> 
												<br>Công ty: <%=shipDAO.getShipperInvoice(invoice.getGiao_Hang().getID_Shipper()).getCompany_Shipper()%>  </a></td>
												<%-- <td class="center" style="text-align: center;">
												
												<a href="/TheSinh_Homeware/InvoiceServlet_Update_Del?action=Delete&ID_Invoice=<%=invoice.getID_Invoice() %> " onclick="return confirm('Bạn không thể xóa dòng này nếu mà bạn chưa xóa dòng tương ứng với hóa đơn chi tiết ?')"
													class="btn btn-warning btn-xs">Hủy</a></td> --%>
													 <td class="center" style="text-align: center;">
												
												<a href="/homeware/InvoiceHistoryDetail?action=Cancel&ID_Invoice=<%=invoice.getID_Invoice() %>"  onclick="return confirm('Bạn có muốn hủy đơn hàng này không ?')"
													<% 
													if (invoice.getStatus_Order()==3) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
													class="btn btn-primary  btn-xs" style="background:red" >Hủy đơn hàng</a></td>
												 <td class="center" style="text-align: center;">
												
												<a href="/homeware/InvoiceHistoryDetail?action=View&ID_Invoice=<%=invoice.getID_Invoice() %>"
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
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example3').dataTable();
	/* 		$('#dataTables-example3_filter').css('display','none'); */
			
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>