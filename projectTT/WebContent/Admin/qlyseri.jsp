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
<title>Quản Lý Số Seri Sản Phẩm | Admin TS-HOMEWARE</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
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
		
		String maseri_error="";
		if (request.getAttribute("maseri_error") != null) {
			maseri_error = (String) request.getAttribute("maseri_error");
		}
		String maseri="";
		if (request.getAttribute("Seri") != null) {
			maseri = (String) request.getAttribute("Seri");
		}
	%>
<script > 
function popen(){
   

   

   $('#nhapseri').modal('show');
}</script>
	<div id="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SỐ SERI SẢN PHẨM</h2>
					<!-- 	<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" onclick="return popen()" style="color: white;">Nhập Số Seri</a>
							<a class="navbar-brand" href="/TheSinh_Homeware/Admin/seri_insert.jsp" style="color: white;">Nhập Số Seri
								</a>
						</div> -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/seri_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Nhập Số Seri</a>
						</div>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-12">

						
						<div class="panel panel-default"> 
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ SỐ SERI SẢN PHẨM</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example7">
										<thead>
											<tr style="text-align: center;">
												<th>Mã sản phẩm</th>
												<th>Tên sản phẩm</th>
												<th>Số seri sản phẩm</th>
												<th>Mã hóa đơn chi tiết</th>
												<th>Trạng thái </th>
												<th>Chức năng</th>
											</tr>
										</thead>

										
										<tbody>
										<%
											for (int i = 0; i < listseri.size(); i++) {
										%>
											<tr class="odd gradeX">
												<td><%=listseri.get(i).getMasanpham()%></td>
												<td><%=listseri.get(i).getTensanpham()%></td>
												<td><%=listseri.get(i).getSoseri()%></td>
												<td> <% 
													if (listseri.get(i).getInvoice_detailID()!=0) {											
												%><%=listseri.get(i).getInvoice_detailID()%> <%}
                                                   else{ %> 
													<%
													}
												%></td>
												<td class="center" style="text-align: center;">
												<%
													if (listseri.get(i).getTrangthai()==0){
												%>
												<a class="btn btn-primary btn-xs" >Chưa kích hoạt</a>
												<%
													}															
												%>	
												 <% 
													if (listseri.get(i).getTrangthai()==1) {											
												%>									
												<a class="btn btn-success btn-xs">Đã kích hoạt</a>			
												<%
													}
												%> 
												
												</td>
												
												<td class="center" style="text-align: center;">
							<a href="/TheSinh_Homeware/Admin/seri_edit.jsp?action=Update&ID_Product=<%=listseri.get(i).getMasanpham()%>&Name_Product=<%=listseri.get(i).getTensanpham()%>&id_seri=<%=listseri.get(i).getSoseri()%>&Status_Seri=<%=listseri.get(i).getTrangthai()%>" 
													<% 
													if (listseri.get(i).getTrangthai()==1) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%>  class="btn btn-danger btn-xs" >Kích hoạt</a> 
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
		<div id="nhapseri" class="modal fade" role="dialog">
		<div class="modal-dialog">
		          <form class="modal-content animate" action="/TheSinh_Homeware/NhapSeri" method="post">
		            <div class="imgcontainer modal-header">
		              <span style="color: #219AFC;text-align:center;font-weight:boldl; font-size: 20px; margin-left: 160px">NHẬP SỐ SERI SẢN PHẨM</span>
		            <button style="background:red; color: white; font-weight:bold; padding: 5px 5px" type="button" class="close" data-dismiss="modal">&times;</button>
		            </div>
		        
		            <div class="container-1">
		              <div class="form-group">
						<label style="margin-left:20px; margin-top:20px">Tên sản phẩm</label>
						
						<select name = "Masp" id="cmbTenSP" style=" width:60%; padding: 5px 0px; border: 1px solid lightgray;margin: 5px 20px ;border-radius: 5px;text-align:center">
													<% 	
														ProductDAOImpl spDAO = new ProductDAOImpl();
														List<Product> listSP= new ArrayList<>();
														listSP= spDAO.getList();
														for(int i=0;i<listSP.size();i++){
														
													%>
						 							 <option value="<%=listSP.get(i).getID_Product()%>" ><%=listSP.get(i).getName_Product()%></option>
						  							<%
													
													}
						  							%>
						</select>
					  </div>

		              <label style="margin-left:20px; margin-top:20px;" for="uname"><b>Mã seri</b></label>
		              <input type="text" style=" width:60%; padding: 5px 0px; border: 1px solid lightgray;margin: 5px 20px ;border-radius: 5px; margin-left:65px" placeholder="Nhập seri" name="Seri" value="<%=maseri%>" required>
		              <span style="color: red" id="maseri_error"><%=maseri_error %></span>
		              <input type="hidden" name="action" value="Seriadd">   
		              <br>
		              <button type="submit" style="background-color: #219AFC; margin: 20px 180px; padding:10px 100px;border-radius:20px; font-weight:bold; color: white;">Nhập</button>
		            </div>

		          </form>
     </div>
      </div>
	
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example7').dataTable();
			
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>