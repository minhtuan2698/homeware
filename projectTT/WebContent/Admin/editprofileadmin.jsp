<%@page import="Model.AccountSession"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
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
	  
        <script>
        $(document).ready(function(){
        	
        	
        	$("#MatKhau").keypress(function() {
        		$("#password_error").html('');
        	});
        	$("#FullName").keypress(function() {
        		$("#fullname_error").html('');
        	});
        	$("#Address").keypress(function() {
        		$("#address_error").html('');
        	});
        	$("#SDT").keypress(function() {
        		$("#phone_error").html('');
        	});
        	})
        </script>
</head>
<body>
<%
if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
} 
String password_error = "", username_error = "", fullname_error = "", phone_error = "",
address_error = "", email_error = "";
if (request.getAttribute("password_error") != null) {
password_error = (String) request.getAttribute("password_error");
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
if (request.getAttribute("email_error") != null) {
email_error = (String) request.getAttribute("email_error");
}
if (request.getAttribute("username_error") != null) {
username_error = (String) request.getAttribute("username_error");
}
/* String  password = "", phone = "", fullname = "", address = "";

if (request.getAttribute("Password") != null) {
password = (String) request.getAttribute("Password");
}

if (request.getAttribute("Fullname") != null) {
fullname = (String) request.getAttribute("Fullname");
}
if (request.getAttribute("Phone") != null) {
phone = (String) request.getAttribute("Phone");
}
if (request.getAttribute("Address") != null) {
address = (String) request.getAttribute("Address");
}  */

%>
	
<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ TÀI KHOẢN</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">SỬA TÀI KHOẢN</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/AccountAdmin_Update" method="post">
										<%
		
		                        	AccountDAOImpl memberDAO = new 	AccountDAOImpl();
		                          	Account member = new Account();
		                         	member = (Account) session.getAttribute("memberSession");
		                                   %>
	
											<div class="form-group">
												<label>Mật Khẩu</label> 
												<span style="color: red"><%=password_error %></span>
												<input class="form-control" type="password" name="Password" value="<%=member.getPassword()%>" />
											</div>
											<div class="form-group">
												<label>Tài khoản</label> 
												<span style="color: red"><%=username_error %></span>
												<input class="form-control" type="text" name="Username" value="<%=member.getUsername()%>" readonly style="background:#DDDDDD" />
											</div>
											<div class="form-group">											
												<label>Địa Chỉ Email</label> 
												<span style="color: red"><%=email_error %></span>
												<input class="form-control" placeholder="@gmail.com" type="text" name="Email" value="<%=member.getEmail()%>" readonly style="background:#DDDDDD"/>
											</div>
											
											<div class="form-group">
												<label>Họ Và Tên</label> 
												<span style="color: red"><%=fullname_error %></span>
												<input class="form-control" type="text" name="Fullname" value="<%=member.getFull_Name()%>" />
											</div>
											
											<div class="form-group">
												<label>Địa Chỉ</label> 
												<span style="color: red"><%=address_error %></span>
												<input class="form-control" type="text" name="Address" value="<%=member.getAddress() %>"/>
											</div>
											
											<div class="form-group">
												<label>Số Điện Thoại</label> 
												<span style="color: red"><%=phone_error %></span>
												<input class="form-control" type="text" name="Phone" value="<%=member.getSDT()%>" />
											</div>
											
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Account" value="<%=member.getID_Account()%>"> 				
											<button type="submit" class="btn btn-success">Lưu</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
												<a href="invoice_manager.jsp"  class="btn btn-primary" style="margin-left:5%">Thoát</a>	
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
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>