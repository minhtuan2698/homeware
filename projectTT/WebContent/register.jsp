<%@page import="Dao.AccountDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Đăng ký | TS-Homeware</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
		<script>

$(document).ready(function(){
	
	$("#userregister").keypress(function() {
		$("#userregister-error").html('');
	});
	$("#passregister").keypress(function() {
		$("#passregister-error").html('');
	});
	$("#repassregister").keypress(function() {
		$("#repassregister-error").html('');
	});
	$("#emailregister").keypress(function() {
		$("#emailregister-error").html('');
	});
	$("#nameregister").keypress(function() {
		$("#nameregister-error").html('');
	});
	$("#sdtregister").keypress(function() {
		$("#sdtregister-error").html('');
	});
	$("#addressregister").change(function() {
		$("#addressregister-error").html('');
	});

	/* $('#email-login #password-login  #btn-login').keypress(function(event) {
		 if (event.keyCode == 13 || event.which == 13) {
		         event.preventDefault();      
		    }
		}); */
	/* if($("#email-login").val() != '' && $("#password-login").val() !=''){
		$('#rememberme').prop('checked', true);
	} */
	

})
 
</script>
</head>
<body>
	<%
		String username_error = "", password_error = "", password1_error = "",password2_error = "", email_error = "", fullname_error = "", phone_error = "",
				address_error = "";
		if (request.getAttribute("username_error") != null) {
			username_error = (String) request.getAttribute("username_error");
		}
		if (request.getAttribute("password_error") != null) {
			password_error = (String) request.getAttribute("password_error");
		}
		if (request.getAttribute("password1_error") != null) {
			password1_error = (String) request.getAttribute("password1_error");
		}
		if (request.getAttribute("password2_error") != null) {
			password2_error = (String) request.getAttribute("password2_error");
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

		String username = "", password1 = "",password2 = "", email = "", phone = "", fullname = "", address = "";
		if (request.getAttribute("username") != null) {
			username = (String) request.getAttribute("username");
		}
		if (request.getAttribute("password1") != null) {
			password1 = (String) request.getAttribute("password1");
		}
		if (request.getAttribute("password2") != null) {
			password2 = (String) request.getAttribute("password2");
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

		
	%>
<div class="hidden-header-register">
	<jsp:include page="header.jsp"></jsp:include>
</div>
	<section id="form-register-ts">
	<div class="container-register">
		
				<div class="signup-form">
					<h2>ĐĂNG KÝ TÀI KHOẢN</h2>
					<form action="RegisterServlet" method="post">
						<p style="color: blue;margin-left:5%"><%=password_error%></p>
						
					
						<input type="text" id="userregister" placeholder="Tài khoản" name="ten_dang_nhap"
							value="<%=username%>" />
								<p id="userregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=username_error%></p>
						
						
						<input type="password" id="passregister"placeholder="Mật khẩu" name="mat_khau1"
							value="<%=password1%>" /> 
							<p id="passregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=password1_error%></p>
							
						
						<input type="password" id="repassregister" placeholder="Nhập lại mật khẩu" name="mat_khau2"
							value="<%=password2%>" />
							<p id="repassregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=password2_error%></p>
						
							
						
						<input type="text" id="emailregister" placeholder="Địa chỉ Email" name="email"
							value="<%=email%>" />
							<p id="emailregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=email_error%></p> 
							
						
						<input type="text" id="nameregister" placeholder="Họ và tên"
							name="ho_va_ten" value="<%=fullname%>"/> 
							<p id="nameregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=fullname_error%></p>	
						
						
						<input type="tel" id="sdtregister" placeholder="Số điện thoại" name="so_dien_thoai"  value="<%=phone%>"/> 
							<p id="sdtregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=phone_error%></p>
						
						
						<%-- <select id="addressregister" name="dia_chi">
							<option value="<%=address%>">Chọn Địa Chỉ</option>
							<option value="Quận 1">Quận 1</option>
							<option value="Quận 2">Quận 2</option>
							<option value="Quận 3">Quận 3</option>
							<option value="Quận 4">Quận 4</option>
							<option value="Quận 5">Quận 5</option>
							<option value="Quận 6">Quận 6</option>
							<option value="Quận 7">Quận 7</option>
							<option value="Quận 8">Quận 8</option>
							<option value="Quận 9">Quận 9</option>
							<option value="Quận 10">Quận 10</option>
							<option value="Quận 11">Quận 11</option>
							<option value="Quận 12">Quận 12</option>
							<option value="Quận gò vấp">Quận Gò Vấp</option>
							<option value="Quan bình thạnh">Quận Bình Thạnh</option>
							<option value="Nơi khác">Nơi khác...</option>
						</select> --%>
						<input type="text" id="addressregister" placeholder="Địa chỉ" name="dia_chi"  value="<%=address%>"/> 
						<p id="addressregister-error" style="color: black;margin-left:7%;margin-top:2%"><%=address_error%></p>
						<span style="color: white;margin-left:7%;margin-top:2%; font-weight:bold">${message}</span>
						 <br> </br>
						<button type="submit" class="btn btn-default">Đăng Ký</button>
						<div class="click" >
				         <a  id="login-click" href="account.jsp"> Bạn đã có tài khoản? Đăng nhập ngay ! </a>
		             	</div>
					</form>
					
				</div>
	
			</div>

	
	</section>
	
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>