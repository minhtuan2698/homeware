<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Shipper | Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<script src="js/jquery.js"></script>
	     <script>
        $(document).ready(function(){
        	
        	
        	$("#madanhmuc").keypress(function() {
        		$("#madanhmuc_error").html('');
        	});
        	$("#tendanhmuc").keypress(function() {
        		$("#tendanhmuc_error").html('');
        	});
       
        	})
        </script>
</head>
<body>
<%
if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
} 
		String mashipper_error = "", tenshipper_error = "", sdt_error ="", congty_error ="";
		if (request.getAttribute("mashipper_error") != null) {
			mashipper_error = (String) request.getAttribute("mashipper_error");
		}
		if (request.getAttribute("tenshipper_error") != null) {
			tenshipper_error = (String) request.getAttribute("tenshipper_error");
		}
		if (request.getAttribute("sdt_error") != null) {
			sdt_error = (String) request.getAttribute("sdt_error");
		}
		if (request.getAttribute("congty_error") != null) {
			congty_error = (String) request.getAttribute("congty_error");
		}
		
		String mashipper = "", tenshipper = "", sdt ="", congty ="";
		if (request.getAttribute("ID_Shipper") != null) {
			mashipper = (String) request.getAttribute("ID_Shipper");
		}
		if (request.getAttribute("Name_Shipper") != null) {
			tenshipper = (String) request.getAttribute("Name_Shipper");
		}
		if (request.getAttribute("Phone_Shipper") != null) {
			sdt = (String) request.getAttribute("Phone_Shipper");
		}
		if (request.getAttribute("Company_Shipper") != null) {
			congty = (String) request.getAttribute("Company_Shipper");
		}
		
		%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ SHIPPER</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">Thêm Shipper</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/ShipperServlet_Add" method="post">
										
											<div class="form-group">
												<label>Mã Shipper</label>
												<input class="form-control" type="text" name="ID_Shipper" id="mashipper" value="<%=mashipper%>" />
												<span style="color: red" id="mashipper_error"><%=mashipper_error %></span>
											</div>
											
											<div class="form-group">
												<label>Tên Shipper</label> 
												<input class="form-control" type="text" name="Name_Shipper" id="tenshipper" value="<%=tenshipper%>" />
												<span style="color: red" id="tenshipper_error"><%=tenshipper_error %></span>
											</div>
											<div class="form-group">
												<label>Số điện thoại</label> 
												<input class="form-control" type="text" name="Phone_Shipper" id="sdt" value="<%=sdt%>" />
												<span style="color: red" id="sdt_error"><%=sdt_error %></span>
											</div>
											<div class="form-group">
												<label>Công ty</label> 
												<input class="form-control" type="text" name="Company_Shipper" id="congty" value="<%=congty%>" />
												<span style="color: red" id="congty_error"><%=congty_error %></span>
											</div>
											
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
											<a href="/Admin/shipper_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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