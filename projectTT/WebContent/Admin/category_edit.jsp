<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Danh Mục | Admin TS-Homeware</title>

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
	String tendanhmuc_error = "";
		if (request.getAttribute("tendanhmuc_error") != null) {
			tendanhmuc_error = (String) request.getAttribute("tendanhmuc_error");
		}
		
		String tendanhmuc = "";
		if (request.getAttribute("Name_Category") != null) {
			tendanhmuc = (String) request.getAttribute("Name_Category");
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
							<div class="panel-heading">Sửa thông tin sản phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/CategoryServlet_Update" method="post">
										
											<div class="form-group">
												<label>Tên danh mục</label> 
												<span style="color: red"><%=tendanhmuc_error %></span>
												<input class="form-control" type="text" name="Name_Category" value="<%=request.getParameter("Name_Category") %>" />
											</div>
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Category" value="<%=request.getParameter("ID_Category")%>"> 				
											<button type="submit" class="btn btn-success">Sửa</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
											<a href="qlydanhmuc.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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