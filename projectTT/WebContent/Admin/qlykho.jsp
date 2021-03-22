<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
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
<title>Quản Lý Kho | Admin TS-Homeware</title>
<!-- BOOTSTRAP STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
		ProductDAOImpl proDAO = new ProductDAOImpl();
		ArrayList<Product> listPro = proDAO.getList();
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
		BrandDAOImpl brandDAO = new BrandDAOImpl();
		InvoiceDetailDAOImpl indeDAO = new InvoiceDetailDAOImpl();
		ArrayList<InvoiceDetail> listInvoiceDetail3 = indeDAO.getListInvoiceDetail();
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ KHO</h2>
						<!-- <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a  class="navbar-brand" href="/TheSinh_Homeware/Admin/kho_insert.jsp" style="color: white;">Thêm Sản Phẩm Vào Kho</a>
						</div> -->
						
						<!-- comment -->
						<!-- <div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/kho_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm Sản Phẩm Vào Kho</a>
						</div> -->
						<!-- comment -->
						<!-- <div class="navbar-header" style="margin-left:30px">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/product_export.jsp" style="color: white;">Sản Phẩm Đã Xuất Kho</a>
						</div> -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/product_export.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Sản Phẩm Đã Xuất Kho</a>
						</div>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="font-weight:bold; background:#428bca;color:white">QUẢN LÝ TỒN KHO</div>
							<button class="exportToExcelkk btn btn-success" id="export3" style="margin-left:15px;margin-top:10px;font-size:12px;padding:8px 12px"> XUẤT BÁO CÁO</button>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover table2excel kkk1"
										id="dataTables-example5">
										<tfoot style="display:none">
				                         <tr><td colspan="7">BÁO CÁO TỒN KHO </td></tr>
			                              </tfoot>
										<thead >
											<tr style="text-align: center;">
												<th style="text-align:center">Mã Sản Phẩm</th>
												<th style="text-align:center">Danh Mục</th> 
												<th style="text-align:center">Nhãn Hiệu</th> 
												<th style="text-align:center">Tên Sản Phẩm</th> 
												<th style="text-align:center">Hình Ảnh</th>
												<th style="text-align:center">Số Lượng</th> 
												<th style="text-align:center">Cảnh Báo Số Lượng Sản Phẩm</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (Product pro : listPro) {
											%>
												<tr class="odd gradeX imgKho">
												<td style="text-align:center"><%=pro.getID_Product()%></td>
												<td style="text-align:center"><%=cateDAO.getIdCate(pro.getDanh_Muc().getID_Category()).getName_Category()%></td>
												<td style="text-align:center"><%=brandDAO.getIdBrand(pro.getNhan_Hieu().getID_Brand()).getName_Brand()%></td>
												<td style="text-align:center"><%=pro.getName_Product()%></td>
												<td style="text-align:center"><img style="width:60px; height:auto" src="<%=pro.getImage()%>" alt="" /></td>
												<td style="text-align:center"><%=pro.getQuantity()%></td>
												<td><% 
													if (pro.getQuantity() <= 4 && pro.getQuantity() >= 1) {											
												%>									
												<a class="btn btn-primary btn-xs">Sản phẩm gần hết hàng, bạn cần nhập thêm sản phẩm </a>			
												<%
													}
												%>
												<% 
													if (pro.getQuantity() == 0 ) {											
												%>									
												<a class="btn btn-danger btn-xs">Sản phẩm đã hết hàng, bạn cần nhập thêm sản phẩm </a>			
												<%
													}
												%></td>
												
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

	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example5').dataTable();
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<!-- <script src="assets/js/custom.js"></script> -->
<script src="../dist/jquery.table2excel.js"></script>
    <script>
			$(function() {
				$(".exportToExcelkk").click(function(e){
					/* alert("fsdfds");  */
					var table =  $('.kkk1');
					if(table && table.length){
						$(table).table2excel({
							exclude: ".noExl",
							name: "Excel Document Name",
							filename: "BaoCaoTonKho",
							fileext: ".xls"
													
						});
					}	
				});
			
			});
		</script>
</body>
</html>