<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Tài Khoản | Admin TS-Homeware</title>

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
		String username_error = "", password_error = "", email_error = "", fullname_error = "", phone_error = "",
				address_error = "",access_error="",status_error="";
		if (request.getAttribute("username_error") != null) {
			username_error = (String) request.getAttribute("username_error");
		}
		if (request.getAttribute("password_error") != null) {
			password_error = (String) request.getAttribute("password_error");
		}
		if (request.getAttribute("email_error") != null) {
			email_error = (String) request.getAttribute("email_error");
		}
		if (request.getAttribute("fullname_error") != null) {
			fullname_error = (String) request.getAttribute("fullname_error");
		}
		if (request.getAttribute("phone_error") != null) {
			phone_error = (String) request.getAttribute("phone_error");
		}
		if (request.getAttribute("address_error") != null) {
			address_error = (String) request.getAttribute("address_error");
		}
		if (request.getAttribute("access_error") != null) {
			access_error = (String) request.getAttribute("access_error");
		}
		if (request.getAttribute("status_error") != null) {
			status_error = (String) request.getAttribute("status_error");
		}

		String username = "", password = "", email = "", phone = "", fullname = "", address = "",access="", status="";
		if (request.getAttribute("username") != null) {
			username = (String) request.getAttribute("username");
		}
		if (request.getAttribute("password") != null) {
			password = (String) request.getAttribute("password");
		}
		if (request.getAttribute("email") != null) {
			email = (String) request.getAttribute("email");
		}
		if (request.getAttribute("fullname") != null) {
			fullname = (String) request.getAttribute("fullname");
		}
		if (request.getAttribute("phone") != null) {
			phone = (String) request.getAttribute("phone");
		}
		if (request.getAttribute("address") != null) {
			address = (String) request.getAttribute("address");
		}
		/*  if (request.getAttribute("access") != null) {
			access = (String) request.getAttribute("access");
		}
		if (request.getAttribute("status") != null) {
			status = (String) request.getAttribute("status");
		} 
 */
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Tài Khoản</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Thêm Tài Khoản</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/AccountServlet_Add_Del" method="post">
										
											<div class="form-group">
												<label>Tên Đăng Nhập</label>
												
												<input class="form-control" type="text" name="username" value="<%=username %>" />
												<span style="color: red"><%=username_error %></span>
											</div>
											
											<div class="form-group">
												<label>Mật Khẩu</label> 
												
												<input class="form-control" type="password" name="password" value="<%=password %>" />
												<span style="color: red"><%=password_error %></span>
											</div>
											
											<div class="form-group">											
												<label>Địa Chỉ Email</label> 
												
												<input class="form-control"  type="text" name="email" value="<%=email %>" />
												<span style="color: red"><%=email_error %></span>
											</div>
											
											<div class="form-group">
												<label>Họ Và Tên</label> 
											
												<input class="form-control" type="text" name="fullname" value="<%=fullname %>" />
													<span style="color: red"><%=fullname_error %></span>
											</div>
											
											<div class="form-group">
												<label>Địa Chỉ</label> 
												
												<input class="form-control" type="text" name="address" value="<%=address %>" />
												<span style="color: red"><%=address_error %></span>
											</div>
											
											<div class="form-group">
												<label>Số Điện Thoại</label> 
												
												<input class="form-control" type="text" name="phone" value="<%=phone %>" />
												<span style="color: red"><%=phone_error %></span>
											</div>
											
											<div class="form-group">
												<label>Quyền Truy Cập</label> 
												
												<select class="form-control" name="access">
													<option value="">Chọn</option>
													<option value="1">Admin</option>
													<option value="2">Khách Hàng</option>
													<option value="3">Nhân viên bán hàng</option>
													<option value="4">Nhân viên kế toán</option>
												</select>
												<span style="color: red"><%=access_error%></span>
											</div>
											<div class="form-group">
												<label>Trạng Thái</label> 
												
												<select class="form-control" name="status">
													<option value="">Chọn</option>
													<option value="1">Đã Kích Hoạt</option>
													<option value="2">Đang Chờ</option>
												</select>
												<span style="color: red"><%=status_error %></span>
											</div>
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
												<a href="/TheSinh_Homeware/Admin/account_manager.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>	
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