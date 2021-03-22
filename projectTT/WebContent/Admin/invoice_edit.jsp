<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Dao.ShipperDAO"%>
<%@ page import="Model.Invoice"%>
<%@ page import="Model.Shipper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sửa Hóa Đơn | Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
		String error_address = "", error_methods="", error_status="";
		if (request.getAttribute("error_address") != null) {
			error_address = (String) request.getAttribute("error_address");
		}
		if (request.getAttribute("error_methods") != null) {
			error_methods = (String) request.getAttribute("error_methods");
		}
		if (request.getAttribute("error_status") != null) {
			error_status = (String) request.getAttribute("error_status");
		}

		String Shipping_Address = "", Payment_Methods="";
		if (request.getAttribute("Shipping_Address") != null) {
			Shipping_Address = (String) request.getAttribute("Shipping_Address");
		}
		if (request.getAttribute("Payment_Methods") != null) {
			Payment_Methods = (String) request.getAttribute("Payment_Methods");
		}
		InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
		ArrayList<Invoice> listInvoice = invoiceDAO.getListInvoice();
		String ID_Invoice = request.getParameter("ID_Invoice");
		Invoice sp = invoiceDAO.getDetailInvoice2(ID_Invoice);
		System.out.println("ssd"+sp);
		System.out.println("lll"+ID_Invoice);
		String Status = request.getParameter("Status_Order");
		ShipperDAO shipDAO = new ShipperDAO();
		List<Shipper> listshipper = shipDAO.listShipper();

	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2><a href="Admin/invoice_manager.jsp" style="color: red">Duyệt Hóa Đơn</a></h2>						
					</div>		
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Hóa Đơn</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/InvoiceServlet_Update_Del"
											method="post">

											<%-- <div class="form-group">
												<label>Địa Chỉ Giao Hàng: </label>	
												<span style="color: red;"><%=error_address%></span>							
												<input	class="form-control" type="text" name="Shipping_Address" value="<%=request.getParameter("Shipping_Address")%>" />
											</div> --%>

										<%-- 	<div class="form-group">
												<label>Phương Thức Thanh Toán: </label>
												<span style="color: red;"><%=error_methods%></span>		
												 <select class="form-control" name="Payment_Methods" >
													<option value="<%=Payment_Methods%>">Chọn</option>
													<option value="Thanh toan khi giao hang">Thanh
														toán khi giao hàng</option>
													<option value="Thanh toan qua the ngan hang">Thanh
														toán qua thẻ ngân hàng</option>
													<option value="Chuyen khoan ngan hang">Chuyển
														khoản ngân hàng</option>
												</select>
											</div> --%>

											<div class="form-group">
												<label>Trạng Thái Đơn Hàng: </label> 
													
												<select 
													class="form-control" name="Status_Order" onchange="validateSelectBox(this)">
													<option value="3">Hủy đơn hàng</option>	
													<option  value="4" <% 
													if (Status.equals("4")) {
														
												%>style="display: none" <%}
                       
												%>>Đang giao</option>	
												    <option value="1" <% 
													if (Status.equals("2")) {
														
												%>style="display: none" <%}
                       
												%> >Đã Thanh Toán</option>	
													
												</select>
											</div>
												<div <% 
													if (Status.equals("3") ||Status.equals("4")||Status.equals("1") ) {
														
												%>style="display: none" <%}
                       
												%> class="form-group" id="aa">
												<label>Người giao hàng </label> 
													
												<select 
													class="form-control" name="Giao_Hang"  >
													<%
					for (Shipper s : shipDAO.listShipper()) {
				%>
													<option value="<%=s.getID_Shipper()%>"><%=s.getName_Shipper()%></option>	
													
													<%
								}
							%>
												</select>
											</div>
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="action" value="Update4">
											<input type="hidden" name="ID_Invoice" value="<%=request.getParameter("ID_Invoice")%>">
											
											<input type="submit" class="btn btn-danger" value="Đồng ý" /> 
											<a href="invoice_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>		
										</form>
										<br/>
									</div>
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
	<script src="assets/js/custom.js"></script>
	
	 <script language="javascript">
            function validateSelectBox(obj){
                var options = obj.children;
                for (var i = 0; i < options.length; i++){
                    if (options[1].selected){
                      document.getElementById('aa').style.display = "block";
                      document.getElementById('okie').style.display = "none"; 
                    }
                  else{
                	  document.getElementById('aa').style.display = "none";
                	  document.getElementById('okie').style.display = "block"; 
                	 
                	  
                	 
                  }
                }
                
               
            }
        </script>
</body>
</html>