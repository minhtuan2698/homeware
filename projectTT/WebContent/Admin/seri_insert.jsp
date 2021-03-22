<%@page import="Model.CTBaoHanh"%>
<%@page import="Dao.CTBaoHanhDAO"%>
<%@page import="Model.BaoHanh"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BaoHanhDAO"%>
<%@page import="Dao.SeriDAO"%>
<%@page import="Model.Account"%>
<%@page import="Model.Seri"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="Model.Count"%>
<%@page import="Model.CountSeri"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Số Seri| Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<script src="js/jquery.js"></script>
	    
</head>
<body>
<%
if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
} 
AccountDAOImpl accDAO = new AccountDAOImpl();
ArrayList<Account> listAcc = accDAO.getAll();

BaoHanhDAO baoHanhDAO = new BaoHanhDAO();
List<BaoHanh> listBH = new ArrayList<>();
listBH = baoHanhDAO.getallBH();
System.out.print(listBH);

SeriDAO seriDAO = new SeriDAO();
List<Seri> listseri= new ArrayList<>();
listseri = seriDAO.listSeri();
		String maseri_error = ""; 
		if (request.getAttribute("maseri_error") != null) {
			maseri_error = (String) request.getAttribute("maseri_error");
		}
		
		String maseri = ""; 
		if (request.getAttribute("Seri") != null) {
			maseri = (String) request.getAttribute("Seri");
		}
	
		%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SỐ SERI</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">Thêm số seri</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/NhapSeri" method="post">
										
											<div class="form-group">
						                    <label>Tên sản phẩm</label>						
						<select class="form-control" name = "Masp" id="cmbTenSP" >
													<% 	
														ProductDAOImpl spDAO = new ProductDAOImpl();
													     SeriDAO seDAO = new SeriDAO();
														List<Product> listSP= new ArrayList<>();
														List<Count> listC= new ArrayList<>();
														List<CountSeri> listD= new ArrayList<>();
														
														listSP= spDAO.getList();
														
													
														for(int i=0;i<listSP.size();i++){
															String ID_Product = listSP.get(i).getID_Product();
											
															listC= seDAO.listCount(ID_Product);
															listD= seDAO.listCountSeri(ID_Product);
															for(int j=0;j<listC.size();j++ ){
																
																
																for(int k=0;k<listD.size();k++){
													%>
						 							 <option <% 
													if (listD.get(k).getQuantity() > listC.get(j).getCount_id()) {											
												%> style="pointer-events: auto; color:black"  <%}
                        else{ %> style=" pointer-events: none; color: red" disabled
													<%
													}
												%> 
												 value="<%=listSP.get(i).getID_Product()%>" ><%=listSP.get(i).getID_Product()%> - <%=listSP.get(i).getName_Product()%> (<%=listC.get(j).getCount_id()%> / <%=listD.get(k).getQuantity()%>)</option>
						  							<%
															
													}
						  							%>
						  							<%
															
													}
						  							%>
						  							<%
															
													}
						  							%>
						  							
						</select>
					  </div>
											
											<div class="form-group">
												<label>Mã Số Seri</label> 
												<input class="form-control" type="text" name="Seri" id="maseri" value="<%=maseri%>" />
												<span style="color: red" id="maseri_error"><%=maseri_error %></span>
											</div>
											
		             
											
											<input type="hidden" name="action" value="Seriadd"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
											<a href="/TheSinh_Homeware/Admin/qlyseri.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
										</form>
										<br />
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
</body>
</html>