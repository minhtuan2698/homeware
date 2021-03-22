
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
<title>Tài Khoản | TS-Homeware</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-social.css" rel="stylesheet">
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0&appId=327890844754184&autoLogAppEvents=1"></script>
		
		<script>


  $(document).ready(function(){
		$("#passForgot").keypress(function() {
    		$("#alert-passForgot").html('');
    	});
    	$("#repeatPassForgot").keypress(function() {
    		$("#alert-repeatPassForgot").html('');
    	});
        $("#savePassword").click(function(){
        			var flag=0
                    var passForgot=$("#passForgot").val()
                    var repeatPassForgot=$("#repeatPassForgot").val()
                    console.log(passForgot)
                    if (passForgot.trim()==''){
                    	$("#alert-passForgot").html('(*Vui lòng nhập mật khẩu! *)')
                    	flag=1
                    }
                    if (repeatPassForgot.trim()== ''){
                    	$("#alert-repeatPassForgot").html('(* Vui lòng nhập lại mật khẩu! *)')
                    	flag=1
                    }
                    /* if((passForgot.length >50 || passForgot.length <8) && passForgot != ""){
                    	$("#alert-passForgot").html('(* Password must >=8 chars and <= 30 chars! *)')
                    	flag=1
                    } */
                    if(repeatPassForgot != passForgot){
                    	$("#alert-repeatPassForgot").html('(* Nhập lại không chính xác! *)')
                    	flag=1
                    }
                    if(flag==0){
                    		var email ="<%=request.getParameter("email")%>"
											$.ajax({
														type : "post",
														url : "/TheSinh_Homeware/changeForgotPassword",
														data : {
															pass : passForgot,
															email : email
														},
														success : function(
																response) {
															if (response == "success") {
																window.location.href = "http://localhost:8080/TheSinh_Homeware/account.jsp";
															}
														}
													})
                    						}

							})

					})
</script>
</head>
<body>
<%
		String email= request.getParameter("email");
		if(email == null){			
			response.sendRedirect("account.jsp");
			return;
		}
	%>

	<div class="container">
		
<div style="background:#219AFC; width:40%; margin:auto; margin-top:50px;margin-bottom:100px ;border:2px solid #000000;border-radius:15px" >
<p style="text-align:center; font-weight:bold;font-size:25px;margin-top:5px">THAY ĐỔI MẬT KHẨU </p>
		<form>

			<div class="form-group" style="margin-left:23%">
				<p style="font-weight:bold">Mật khẩu mới</p>
				<input type="password" id="passForgot"
					placeholder="Mời bạn nhập mật khẩu" style="width:70%;margin:auto; padding-left:10px; padding:5px 5px">
					<p id="alert-passForgot" class="alert" style="magrin-bottom:0;padding: 10px 0px 0px 0px;color:white; font-weight:bold"></p>

			</div>

			<div class="form-group" style="margin-left:23%">
				<p style="font-weight:bold">Nhập lại mật khẩu</p>
				<input type="password" id="repeatPassForgot"
					placeholder="Mời bạn nhập lại mật khẩu" style="width:70%;margin:auto;padding-left:10px; padding:5px 5px">
					<p id="alert-repeatPassForgot" class="alert" style="magrin-bottom:0;padding: 10px 0px 0px 0px; color:white; font-weight:bold"></p>
	
			</div>

			

			<div class="form-group" style="margin-left:43%;">

				<button type="button" name="submit-save" id="savePassword"
					class="btn btn-success" style="background:#fe980f">Lưu</button>

			</div>
		</form>
		</div>
	</div>
	   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>