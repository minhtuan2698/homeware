<%@page import="Model.CTBaoHanh"%>
<%@page import="Dao.CTBaoHanhDAO"%>
<%@page import="Model.BaoHanh"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BaoHanhDAO"%>
<%@page import="Model.Account"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Bảo Hành | Admin TS-HOMEWARE</title>

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
		
		CTBaoHanhDAO ctBaoHanhDAO = new CTBaoHanhDAO();
		List<CTBaoHanh> listctbh = new ArrayList<>();
		listctbh = ctBaoHanhDAO.listCtbh();
	%>

	<div id="wrapper">
	<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ BẢO HÀNH SẢN PHẨM</h2>
						<!-- <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/TheSinh_Homeware/Admin/ThemBaoHanh.jsp" 
								style="color: white;">Thêm Bảo Hành</a>
						</div> -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/ThemBaoHanh.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm bảo hành</a>
						</div>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ BẢO HÀNH</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Mã bảo hành</th>
												<th>Số seri</th>
												<th>Ngày nhận</th>
												<th>Ngày trả</th>
												<th>Thời gian dự kiến</th>
												<th>Trạng thái</th>
												<th>Chức Năng</th>
											</tr>
										</thead>

										<tbody>
											<%
												for (int i = 0; i < listBH.size(); i++ ) {
											%>
											<tr class="odd gradeX">
												<td><%=listBH.get(i).getId()%></td>
												<td><%=listBH.get(i).getSoseri()%></td>
												<td><%=listBH.get(i).getNgaynhan()%></td>
												<td><%=listBH.get(i).getNgaytra()%></td>
												<td><%=listBH.get(i).getThoigiandukien()%> ngày</td>
												<td class="center" style="text-align: center;">
												<%
													if (listBH.get(i).getTrangthai() == 1) {
												%>
												<a class="btn btn-warning btn-xs" >Đã nhận</a>
												<%
													}
												%>
												<%
													if (listBH.get(i).getTrangthai() == 2) {
												%>
												<a class="btn btn-danger btn-xs" >Đang sửa chữa</a>
												<%
													}
												%>
												<%
													if (listBH.get(i).getTrangthai() == 3) {
												%>
												<a class="btn btn-success btn-xs" >Đã sửa xong</a>
												<%
													}
												%>
												<%
													if (listBH.get(i).getTrangthai() == 4) {
												%>
												<a class="btn btn-primary btn-xs" >Đã trả bảo hành</a>
												<%
													}
												%>
												</td>
												<td class="center" style="text-align: center;">
													<a href="/TheSinh_Homeware/Admin/SuaBaoHanh.jsp?ID_Warranty=<%=listBH.get(i).getId()%>&Status=<%=listBH.get(i).getTrangthai()%>"
													<% 
													if (listBH.get(i).getTrangthai() == 4) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> class="btn btn-info btn-xs">Xử lý</a> 
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
						
						<div class="panel panel-default"> 
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">CHI TIẾT BẢO HÀNH</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example1">
										<thead>
											<tr style="text-align: center;">
												<th>Mã bảo hành</th>
												<th>Mã tình trạng</th>
												<th>Tên tình trạng</th>
											</tr>
										</thead>

										<%
											for (int i = 0; i < listctbh.size(); i++) {
										%>
										<tbody>
											<tr class="odd gradeX">
												<td><%=listctbh.get(i).getIdbaohanh()%></td>
												<td><%=listctbh.get(i).getIdtinhtrang()%></td>
												<td><%=listctbh.get(i).gettentinhtrang()%></td>
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
	</div>
	
	
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
			$('#dataTables-example1').dataTable();
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>