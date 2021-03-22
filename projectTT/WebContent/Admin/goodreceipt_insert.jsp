<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Phiếu Nhập | Admin TS-Homeware</title>

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
		String maphieunhap_error = "";
		if (request.getAttribute("maphieunhap_error") != null) {
			maphieunhap_error = (String) request.getAttribute("maphieunhap_error");
		}
		
		
		String maphieunhap = "";
		if (request.getAttribute("ID_Receipt") != null) {
			maphieunhap = (String) request.getAttribute("ID_Receipt");
		}
		
		
		%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>PHIẾU NHẬP</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">THÊM PHIẾU NHẬP</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/GoodReceipt_Add" method="post">
										
											<div class="form-group">
												<label>Mã Phiếu Nhập</label>
												<input class="form-control" type="text" name="ID_Receipt" value="<%=maphieunhap%>" />
												<span style="color: red" id="maphieunhap_error"><%=maphieunhap_error %></span>
											</div>
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<a href="GoodReceipt.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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