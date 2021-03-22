<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Mùa Sự Kiện | Admin TS-Homeware</title>

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
	String tenmuasukien_error = "", ngaybatdau_error="", ngayketthuc_error="";
		if (request.getAttribute("tenmuasukien_error") != null) {
			tenmuasukien_error = (String) request.getAttribute("tenmuasukien_error");
		}
		if (request.getAttribute("ngaybatdau_error") != null) {
			ngaybatdau_error = (String) request.getAttribute("ngaybatdau_error");
		}
		if (request.getAttribute("ngayketthuc_error") != null) {
			ngayketthuc_error = (String) request.getAttribute("ngayketthuc_error");
		}
		
		String tenmuasukien = "", ngaybatdau="", ngayketthuc="";
		if (request.getAttribute("Name_Season") != null) {
			tenmuasukien = (String) request.getAttribute("Name_Season");
		}
		if (request.getAttribute("DateStart") != null) {
			 ngaybatdau = (String) request.getAttribute("DateStart");
		}
		if (request.getAttribute("DateEnd") != null) {
			ngayketthuc = (String) request.getAttribute("DateEnd");
		}
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Sản Phẩm</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">Sửa thông mùa sự kiện</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/SeasonServlet_Update" method="post">
										
											<div class="form-group">
												<label>Tên mùa sự kiện</label> 
												<span style="color: red"><%=tenmuasukien_error %></span>
												<input class="form-control" type="text" name="Name_Season" value="<%=request.getParameter("Name_Season") %>" />
											</div>
											<div class="form-group">
												<label>Ngày bắt đầu</label> 
												<span style="color: red"><%=ngaybatdau_error %></span>
												<input class="form-control" type="text" name="DateStart" value="<%=request.getParameter("DateStart") %>" />
											</div>
											<div class="form-group">
												<label>Ngày kết thúc</label> 
												<span style="color: red"><%=ngayketthuc_error %></span>
												<input class="form-control" type="text" name="DateEnd" value="<%=request.getParameter("DateEnd") %>" />
											</div>
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Season" value="<%=request.getParameter("ID_Season")%>"> 				
											<button type="submit" class="btn btn-success">Sửa</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
											<a href="qlymuasukien.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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