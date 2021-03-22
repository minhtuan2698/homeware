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
		String madanhmuc_error = "", tendanhmuc_error = "";
		if (request.getAttribute("madanhmuc_error") != null) {
			madanhmuc_error = (String) request.getAttribute("madanhmuc_error");
		}
		if (request.getAttribute("tendanhmuc_error") != null) {
			tendanhmuc_error = (String) request.getAttribute("tendanhmuc_error");
		}
		
		String madanhmuc = "", tendanhmuc = "";
		if (request.getAttribute("ID_Category") != null) {
			madanhmuc = (String) request.getAttribute("ID_Category");
		}
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
						<h2>QUẢN LÝ DANH MỤC</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Thêm Danh Mục</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/CategoryServlet_Add" method="post">
										
											<div class="form-group">
												<label>Mã danh mục</label>
												<input class="form-control" type="text" name="ID_Category" id="madanhmuc" value="<%=madanhmuc %>" />
												<span style="color: red" id="madanhmuc_error"><%=madanhmuc_error %></span>
											</div>
											
											<div class="form-group">
												<label>Tên danh mục</label> 
												<input class="form-control" type="text" name="Name_Category" id="tendanhmuc" value="<%=tendanhmuc%>" />
												<span style="color: red" id="tendanhmuc_error"><%=tendanhmuc_error %></span>
											</div>
											
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
											<a href="/TheSinh_Homeware/Admin/qlydanhmuc.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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