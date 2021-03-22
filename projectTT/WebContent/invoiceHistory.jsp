<%@page import="com.sun.accessibility.internal.resources.accessibility"%>
<%@page import="java.text.NumberFormat"%>
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
 
InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
 String ID_Account = acc.getID_Account(); 
ArrayList<Invoice> listInvoice = invoiceDAO.getListInvoice1(ID_Account);
AccountDAOImpl accDAO = new AccountDAOImpl();

ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
/* Account user = new AccountDAOImpl().getUser(ID_Account); */
	
	%>

<div class="hidden-profile">
<jsp:include page="header.jsp"></jsp:include>
</div>
	
	
	<div id="wrapper">
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2 style="text-align:center;text-transform: uppercase">Xem lịch sử đơn hàng</h2>
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
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">LỊCH SỬ ĐƠN HÀNG</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr style="text-align: center;">
												<th>Mã Hóa Đơn</th>
												<!-- <th>Khách Hàng</th>
												<th>Số điện thoại</th> -->
												<th>Địa Chỉ Giao Hàng</th>
												<th>Phương Thức Thanh Toán</th>
												<th>Tổng tiền hóa đơn</th>
												<th>Ngày Mua Hàng</th>
												<th>Ngày Giao Hàng</th>
												<th>Trạng Thái Đơn Hàng</th>
												<!-- <th>Chức Năng</th> -->
												<th>Chi Tiết</th>
												
											</tr>
										</thead>

									
										<tbody>
											<%
											for (Invoice invoice : listInvoice) {
										%>
											<tr class="odd gradeX">
												<td><%=invoice.getID_Invoice()%></td>
												<%-- <td><%=accDAO.getAccount(invoice.getTai_Khoan().getID_Account()).getUsername()%></td>
												<td><%=accDAO.getAccount(invoice.getTai_Khoan().getID_Account()).getSDT()%></td> --%>
												<td><%=invoice.getShipping_Address()%></td>
												<td><%=invoice.getPayment_Methods()%></td>
												<td><%=invoice.getTotal_Invoice() %></td>
												<td><%=invoice.getPurchase_Date()%></td>
							<%-- 				    <td> <%if (invoice.getStatus_Order()==3) {%> <%}
                        else{ %> <%=invoice.getTime_Limit()%>
													<%
													}
												%></td>	 --%>	
												<%-- <td><%=invoice.getTime_Limit()%></td> --%>
												<td <%if (invoice.getStatus_Order()==3) {%> style="color:red;" <%}
                       
												%>> <%if (invoice.getStatus_Order()==3) {%> Ngày hủy: <%=invoice.getTime_Limit()%> <%}
                        else{ %> <%=invoice.getTime_Limit()%>
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
												<a class="btn btn-primary btn-xs">Đang Xử Lý</a>			
												<%
													}
												%>
												<% 
													if (invoice.getStatus_Order()==3) {											
												%>									
												<a class="btn btn-danger btn-xs">Đã Hủy</a>			
												<%
													}
												%>
												</td>
												<%-- <td class="center" style="text-align: center;">
												
												<a href="/TheSinh_Homeware/InvoiceServlet_Update_Del?action=Delete&ID_Invoice=<%=invoice.getID_Invoice() %> " onclick="return confirm('Bạn không thể xóa dòng này nếu mà bạn chưa xóa dòng tương ứng với hóa đơn chi tiết ?')"
													class="btn btn-warning btn-xs">Hủy</a></td> --%>
													</td>
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
			$('#dataTables-example').dataTable();
		/* 	$('#dataTables-example3_filter').css('display','none'); */
			
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>