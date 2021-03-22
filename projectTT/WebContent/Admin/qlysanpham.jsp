<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="Model.Empty"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Sản Phẩm | Admin TS-Homeware</title>

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
		ProductDAOImpl proDAO = new ProductDAOImpl();
		ArrayList<Product> listPro = proDAO.getList();
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
		BrandDAOImpl brandDAO = new BrandDAOImpl();
		SeasonDAO seasonDAO = new SeasonDAO();
		InvoiceDetailDAOImpl indeDAO = new InvoiceDetailDAOImpl();
		ArrayList<InvoiceDetail> listInvoiceDetail3 = indeDAO.getListInvoiceDetail();
		
		TinhTrangDAO ttDAO = new TinhTrangDAO();
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SẢN PHẨM</h2>
						<!-- <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/TheSinh_Homeware/Admin/product_insert.jsp" style="color: white;">Thêm Sản Phẩm</a>
							
						</div> -->
						
						<!-- comment -->
					<!-- 	<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/product_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm Sản Phẩm</a>
						</div> -->
						
						<!-- comment -->
						
						<!-- <div class="navbar-header" style="margin-left:20px">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" onclick="document.getElementById('nhapseri').style.display='block'" style="color: white;">Nhập Seri</a>
							
						</div> -->
					</div>
				</div>
		
				<hr />

				<div class="row">
					<div class="col-md-12">
				
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ SẢN PHẨM</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example2">
										<thead>
											<tr>
												<th>Mã Sản Phẩm</th>
												<th>Mã Danh Mục</th>
												<th>Tên Sản Phẩm</th>
												<th>Hình Ảnh</th>
												<th>Số Lượng</th>
												<th>Mô Tả</th>
												<th>Giá Bán</th>
												<th>Giảm Giá</th>
												<th>Mã Nhãn Hiệu</th>
												<th>Bảo hành</th>
												<th>Mùa sự kiện</th>
												<th>Chức năng</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (Product pro : listPro) {
											%>
											<tr class="odd gradeX">
												<td><%=pro.getID_Product()%></td>
												<td><%=cateDAO.getIdCate(pro.getDanh_Muc().getID_Category()).getID_Category()%></td>
												<td><%=pro.getName_Product()%></td>
												<td><img style="width:60px; height:auto" src="<%=pro.getImage()%>" alt="" /></td>
												<td><%=pro.getQuantity()%></td>
												<td><%=pro.getDescribe()%></td>
												<td><%=pro.getPrice()%></td>
												<td><%=pro.getSale()%></td>
												<td><%=brandDAO.getIdBrand(pro.getNhan_Hieu().getID_Brand()).getID_Brand()%></td>
												<td><% 
													if (pro.getWarranty_Period() == 0) {											
												%>									
												<a>Không bảo hành </a>			
												<%
													}else{ %> <%=pro.getWarranty_Period()%> năm
													<%
													}
												%>  
												
												</td>
												<td><%=seasonDAO.getIdSeason(pro.getMua().getID_Season()).getName_Season()%></td>
												<td class="center" style="text-align: center;">
													<a href="/TheSinh_Homeware/Admin/product_edit.jsp?action=Update&ID_Product=<%=pro.getID_Product()%>&Danh_Muc=<%=cateDAO.getIdCate(pro.getDanh_Muc().getID_Category()).getID_Category()%>&Name_Product=<%=pro.getName_Product() %>&Image=<%=pro.getImage() %>&Quantity=<%=pro.getQuantity() %>&Describe=<%=pro.getDescribe() %>&Price=<%=pro.getPrice()%>&Sale=<%=pro.getSale()%>&Nhan_Hieu=<%=brandDAO.getIdBrand(pro.getNhan_Hieu().getID_Brand()).getID_Brand()%>&Warranty_Period=<%=pro.getWarranty_Period()%>&Mua=<%=seasonDAO.getIdSeason(pro.getMua().getID_Season()).getID_Season()%>"
												
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													 <%-- <a <% String ID_Product = pro.getID_Product();
													 if (ttDAO.checkEmptyProduct(ID_Product) == true) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block;color:black"
													<%
													}
												%>  href="/TheSinh_Homeware/ProductServlet_Delete?action=Delete&ID_Product=<%=pro.getID_Product()%>" onclick="return confirm('Bạn có chắc chắn xóa sản phẩm <%=pro.getName_Product() %> không ?')"
														 
													 class="btn btn-warning btn-xs">Xóa</a>  --%> 
													 </td>
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
	

<%-- 	<div id="nhapseri" class="modal">
		          <form class="modal-content animate" action="/TheSinh_Homeware/NhapSeri" method="post">
		            <div class="imgcontainer">
		              <span onclick="document.getElementById('nhapseri').style.display='none'" class="close" title="Close Modal">&times;</span>
		            </div>
		        
		            <div class="container-1">
		              <div class="form-group">
						<label>Tên sản phẩm</label>
						<br>
						<select name = "Masp" id="cmbTenSP" style=" width:100%; padding: 5px 0px; border: 1px solid lightgray; border-radius: 5px;">
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

		              <label for="uname"><b>Mã seri</b></label>
		              <input type="text" placeholder="Nhập seri" name="Seri" required>
		              
		              <input type="hidden" name="action" value="Seriadd">   
		              <button type="submit">Nhập</button>
		            </div>

		          </form>
     </div> --%>

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example2').dataTable();
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>