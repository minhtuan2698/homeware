<%@page import="Model.AccountSession"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật tài khoản | TS-Homeware</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.3&appId=327890844754184&autoLogAppEvents=1"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        
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
<%if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
} 
	


	 String password_error = "", fullname_error = "", phone_error = "",
				address_error = "";
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

<div class="hidden-profile">
<jsp:include page="header.jsp"></jsp:include>
</div>
	
	<div>
	<h2 class="Title-edit" style="margin-bottom:3%;margin-bottom: 0;padding-bottom: 10px; text-align:center">CẬP NHẬT TÀI KHOẢN</h2>
	
	<div class="table-content" style="padding-top: 10px;padding-bottom: 10px;border: 2px solid black; width:40%;margin:auto; background:#219AFC; border-radius:15px; margin-bottom:50px">
		<form action="/TheSinh_Homeware/EditProfile" method="post"> 
		<%
		
			AccountDAOImpl memberDAO = new 	AccountDAOImpl();
			Account member = new Account();
			member = (Account) session.getAttribute("memberSession");
			
			/* member = memberDAO.getAccount(AccountSession.Username); */
		
			
			
		%>
			<p style="font-weight:bold; margin-left: 10%">Mật khẩu</p>
		<input id="MatKhau" class="col-10" type="password"
			placeholder="Mời bạn nhập mật khẩu" name="Password"
			value="<%=member.getPassword()%>">
	
		<span id="password_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert"><%=password_error %></span>
		
		<p style="font-weight:bold; margin-left: 10%">Tên người dùng</p>
		<input id="Username" class="col-10" type="text" style="background:#DDDDDD"
			placeholder="" name="Username"
			value="<%=member.getUsername()%>"readonly>
			
			
		<p style="font-weight:bold; margin-left: 10%">Email</p>
		<input style="background: #DDDDDD; color: black;"
			class="col-10" type="email" id="Email" name="Email"
			placeholder="" value="<%=member.getEmail()%>"
			readonly>
			
		<p style="font-weight:bold; margin-left: 10%">Họ và tên</p>
		<input id="FullName" class="col-10" type="text"
			placeholder="Mời bạn nhập họ và tên" name="Fullname"
			value="<%=member.getFull_Name()%>">
	
		<span id="fullname_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert" ><%=fullname_error %></span>
			
				
		<p style="font-weight:bold; margin-left: 10%">Địa chỉ</p>
		<input id="Address" class="col-10" type="text"
			placeholder="Mời bạn nhập họ và tên" name="Address"
			value="<%=member.getAddress()%>">
		<span id="address_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert" ><%=address_error %></span>
		
		
		<p style="font-weight:bold; margin-left: 10%">Số điện thoại</p>
		<input id="SDT" class="col-10" type="text"
			placeholder="Mời bạn nhập số điện thoại của bạn" name="Phone"
			value="<%=member.getSDT()%>">
		<p id="phone_error" style="margin-left: 35px;color:#FFFFFF; font-weight:bold" class="alert"><%=phone_error %></p>

		
		<input type="hidden" name="action" value="Update1"> 
		<input type="hidden" name="ID_Account" value="<%=member.getID_Account()%>"> 
			<button type="submit"  id="submit-edit" style="background: #FE980F;border: 0 solid black;color: white;margin-left: 15px;margin-bottom: 10px;border-radius: 8px;padding: 5px 20px;margin-left:10%;color:black" class="button-submit">Lưu</button>
			<button type="reset" class="btn btn-primary" style="background: #FE980F; border: 0 solid black; padding: 5px 20px; color: white;margin-left: 10px;margin-bottom: 10px;border-radius: 8px; margin-left:10%;color:black">Khôi phục</button>
			<a href="index.jsp" style="background: #FE980F; border: 0 solid black; padding: 5px 20px; color: white;margin-left: 10px;margin-bottom: 10px;border-radius: 8px; margin-left:10%;color:black">Thoát</a>
		
		 </form> 
	</div>
	
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>