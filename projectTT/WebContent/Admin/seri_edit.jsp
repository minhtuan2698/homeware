<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Kích hoạt seri sản phẩm | Admin TS-Homeware</title>

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
	String tendanhmuc_error = "",mhdct_error = "";
		if (request.getAttribute("tendanhmuc_error") != null) {
			tendanhmuc_error = (String) request.getAttribute("tendanhmuc_error");
		}
		if (request.getAttribute("mhdct_error") != null) {
			mhdct_error = (String) request.getAttribute("mhdct_error");
		}
		
		String masanpham = "", tensanpham = "",soseri= "",trangthai = "", mhdct="";
		if (request.getAttribute("ID_Product") != null) {
			masanpham = (String) request.getAttribute("ID_Product");
		}
		if (request.getAttribute("Name_Product") != null) {
			tensanpham = (String) request.getAttribute("Name_Product");
		}
		if (request.getAttribute("id_seri1") != null) {
			soseri = (String) request.getAttribute("id_seri1");
		}
		if (request.getAttribute("Status_Seri") != null) {
			trangthai = (String) request.getAttribute("Status_Seri");
		}
		if (request.getAttribute("ID_InvoiceDetail") != null) {
			mhdct = (String) request.getAttribute("ID_InvoiceDetail");
		}
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Seri Sản Phẩm</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Kích hoạt seri sản phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/UpdateSeri" method="post">
										
											<div class="form-group">
												<label>Mã sản phẩm</label> 
												<input class="form-control" type="text" name="ID_Product" value="<%=request.getParameter("ID_Product") %>" readonly style="background:#DDDDDD"/>
											</div>
											<div class="form-group">
												<label>Tên sản phẩm</label> 
												<input class="form-control" type="text" name="Name_Product" value="<%=request.getParameter("Name_Product") %>" readonly style="background:#DDDDDD"/>
											</div>
											<div class="form-group">
												<label>Số seri sản phẩm </label>
												<input class="form-control" type="text" name="id_seri" value="<%=request.getParameter("id_seri") %>" readonly style="background:#DDDDDD"/>
											</div>
											<div class="form-group">
												<label>Trạng thái</label> 
												<select 
													class="form-control" name="Status_Seri"  readonly style="background:#DDDDDD" >
													<option value="1">Kích hoạt</option>	
												
													
												</select>
											</div>
											<div class="form-group">
												<label>Mã hóa đơn chi tiết</label>
												<input class="form-control" type="text" name="ID_InvoiceDetail" value="<%=mhdct%>"/>
												<span style="color: red" id="mhdct_error"><%=mhdct_error %></span>
											</div>
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="id_seri" value="<%=request.getParameter("id_seri")%>"> 				
											<button type="submit" class="btn btn-success">Kích hoạt</button>
											
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