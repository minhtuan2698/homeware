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

ArrayList<InvoiceDetail> listInvoiceDetail = (ArrayList<InvoiceDetail>)  request.getAttribute("listDetail");
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
						<h2 style="text-align:center;text-transform: uppercase">Chi tiết lịch sử đơn hàng</h2>
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
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">THÔNG TIN CHI TIẾT ĐƠN HÀNG </div>
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
												<td><%=nf.format(invoiceDetail.getSale())%>  </td>
												<td><%=nf.format(invoiceDetail.getQuantity() * (invoiceDetail.getPrice() - invoiceDetail.getSale()))%> VNĐ</td>
											<%-- 	<td>
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
												</td> --%>
												<%-- <td class="center" style="text-align: center;">
												
												<a href="/TheSinh_Homeware/InvoiceDetailServlet_Update_Del?action=Delete&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail() %>" onclick="return confirm('Bạn chắc chắn chứ ?')" class="btn btn-warning btn-xs">Hủy</a>
												</td> --%>
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
			<div style="text-align:center; margin-bottom:10%; font-weight:bold" >
			 <a href="invoiceDetail.jsp" style=" background:#FE980F; padding: 10px 20px;color:white; font-weight:bold; border-radius:10px">Quay lại</a></div>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>