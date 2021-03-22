<%@page import="com.restfb.types.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.*"%>
<%@page import="Model.Cart"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.AccountSession"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang thanh toán | TS-Homeware</title>
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

</head>
<body>
<%if (session.getAttribute("memberSession") == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
}
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
	cart = new Cart();
	session.setAttribute("cart", cart);
}
TreeMap<Product, Integer> list = cart.getList();
%>

<div id="buy-ok">
<jsp:include page="header.jsp"></jsp:include>
</div>

	<div style="text-align:center; margin-bottom:10%; font-weight:bold" >
	<p style="text-transform: uppercase; text-align:center;font-size:35px; margin-bottom: 10px"> Mua hàng thành công ! </p><br>
	
	
	<a href="index.jsp" style=" background:#FE980F; padding: 10px 20px;color:white; font-weight:bold; border-radius:10px">Quay lại trang chủ</a>
	
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>