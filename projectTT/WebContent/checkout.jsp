<%@page import="com.restfb.types.User"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.*"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Thanh Toán | TS-Homeware</title>
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

	<%
		if (session.getAttribute("memberSession") == null) {
			response.sendRedirect("/TheSinh_Homeware/account.jsp");
		} else {
			Account user = (Account)session.getAttribute("memberSession");
			
			if(user != null){
				if(user.getAccess() != 2) return;
			}
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			TreeMap<Product, Integer> list = cart.getList();

			NumberFormat nf = NumberFormat.getInstance();
			nf.setMinimumIntegerDigits(0);

			String error_address = "", error_methods = "", error_email="", error_phone="", error_time="";
			if (request.getAttribute("error_address") != null) {
				error_address = (String) request.getAttribute("error_address");
			}
			if (request.getAttribute("error_email") != null) {
				error_email = (String) request.getAttribute("error_email");
			}
			if (request.getAttribute("error_phone") != null) {
				error_phone = (String) request.getAttribute("error_phone");
			}
			if (request.getAttribute("error_methods") != null) {
				error_methods = (String) request.getAttribute("error_methods");
			}
			if (request.getAttribute("error_time") != null) {
				error_time = (String) request.getAttribute("error_time");
			}
			String Shipping_Address = user.getAddress();
			String Phone = user.getSDT();
			String Email = user.getEmail();
			String Payment_Methods = "";
			/* String Time_Limit=""; */
			/*  if (request.getAttribute("Shipping_Address") != null) {
				Shipping_Address = (String) request.getAttribute("Shipping_Address");
			}
			
			if (request.getAttribute("Email") != null) {
				Email = (String) request.getAttribute("Email");
			}  */
			if (request.getAttribute("Payment_Methods") != null) {
				Payment_Methods = (String) request.getAttribute("Payment_Methods");
			}
			if (request.getAttribute("Total_Invoice") != null) {
				Payment_Methods = (String) request.getAttribute("Total_Invoice");
			}
			/* if (request.getAttribute("Time_Limit") != null) {
				Time_Limit = (String) request.getAttribute("Time_Limit");
			} */
			Date d = new Date();
			
			Calendar c = Calendar.getInstance();
	        c.setTime(d);

	        // manipulate date
	       
	        c.add(Calendar.DATE, 3); //same with c.add(Calendar.DAY_OF_MONTH, 1);
	       

	        // convert calendar to date
	        Date currentDatePlusOne = c.getTime();
			System.out.println("abcd"+currentDatePlusOne);
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
			Date afterCreatedDate = new Date();
			
		/* 	String date = formatDay.format(d); */
			String Time_Limit_FM = formatDay.format(currentDatePlusOne);	
			afterCreatedDate = (Date)formatDay.parse(Time_Limit_FM);
			String Time_Limit = afterFormat.format(afterCreatedDate);
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="index.jsp">Home</a></li>
				<li class="active">Thanh Toán</li>
			</ol>
		</div>



		<div class="register-req" style="font-size: 20px; font-weight: bold;">
			<p>Thông Tin Thanh Toán</p>
		</div>

		<div class="review-payment">
			<h2>Thông Tin Đơn Hàng</h2>
		</div>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu" style="text-align:center">
						<td class="image">Hình Ảnh</td>
						<td class="description">Thông Tin Sản Phẩm</td>
						<td class="price">Giá Bán</td>
						<td class="quantity">Số Lượng</td>
						<td class="total">Tổng Tiền</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						for (Map.Entry<Product, Integer> ds : list.entrySet()) {
					%>
					<tr style="border:1px solid #219AFC">
					
						<td class="cart_product"><a href=""><img
								src="<%=ds.getKey().getImage()%>" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href=""><%=ds.getKey().getName_Product()%></a>
							</h4>
							<p>
								Mã Sản Phẩm:
								<%=ds.getKey().getID_Product()%></p>
						</td>
						<td class="cart_price">
							<p><%=nf.format(ds.getKey().getPrice() - ds.getKey().getSale())%>
										VNĐ
									</p>
						</td>
						 <td class="cart_quantity">
							<div class="cart_quantity_button">
									<a class="cart_quantity_down"
											href="CartServlet?enter=giam1&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											- </a><input class="cart_quantity_input" type="text" name="Quantity"
											value="<%=ds.getValue()%>" autocomplete="off" size="2"
											disabled=""> 
										<a class="cart_quantity_up"
											href="CartServlet?enter=tang1&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											+ </a> 
									</div>
						</td> 
						<td class="cart_total">
						<p class="cart_total_price"><%=nf.format(ds.getValue() * ((ds.getKey().getPrice()) - (ds.getKey().getSale()))) %>
										VNĐ
									</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="CartServlet?enter=remove&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"><i
								class="fa fa-times"></i></a></td>
					</tr>

					<%
						}
					%>

				</tbody>
			</table>
		</div>
<br>
		<div class="shopper-informations" style="text-align: center;">
			<div class="row" style="border:4px solid #219afc; border-radius:20px;background:silver;">
				<div  style="width:40%; margin-left: 28%;">
					<div class="shopper-info">
						<form action="PayServlet" method="post">
						<p style="margin-top: 20px; text-transform:uppercase">Tổng tiền</p>
							<span style="color: red;"><%=error_email%></span>
							<input type="text" name="Total_Invoice" value="<%=nf.format(cart.totalCart())%>" style="color:red; font-weight:bold; backgrounf:#DDDDDD;font-size:20px;border:2px solid #219AFC" readonly></input>
							<p style="text-transform:uppercase">Địa Chỉ Giao Hàng</p>
							
							<span style="color: red;"><%=error_address%></span>
							<%-- <input name="Shipping_Address" value="<%=user.getAddress()%>"></input> --%>
							 <input name="Shipping_Address" value="<%=Shipping_Address%>"></input> 
							<p style="text-transform:uppercase">Số điện thoại</p>
							<span style="color: red;"><%=error_phone%></span>
							<input type="phone" name="Phone" value="<%=Phone%>"></input>
							<p style="text-transform:uppercase">Địa Chỉ Email</p>
							<span style="color: red;"><%=error_email%></span>
							<input type="email" name="Email" value="<%=Email%>"></input>
							<p style="text-transform:uppercase">Ngày giao hàng tiêu chuẩn</p>
							<span style="color: red;"><%=error_time%></span>
							<input type="text" name="Time_Limit" value="<%=Time_Limit%>"  readonly style="background:#DDDDDD;color:red"></input>
							<p style="text-transform:uppercase">Phương Thức Thanh Toán</p>
							<span style="color: red;"><%=error_methods%></span> 
							<select name="Payment_Methods"  onchange="validateSelectBox(this)" >
								<option value="Thanh toán khi giao hàng">Thanh toán khi giao hàng</option>
								<option value="Thanh toán qua thẻ ngân hàng"> Thanh toán qua thẻ ngân hàng </option>
							</select>
							
							<%-- <input type="hidden" value="<%=user.getUsername()%>" name="Account" /> --%>
							<input type="submit" value="Xác Nhận Mua Hàng" class="btn btn-primary" id="okie" style="margin-bottom: 20px"/>
						</form>
						<span style="color: red;">${message}</span>
					</div>
				</div>
				
				 <div id="ss" style="display:none; margin-top: 30px">
				<!--  <img  style="width:400px" src="images/home/sa.png" alt="" /><br> -->
					<img  style="width:200px" src="images/home/paypal.png" alt="" />
					
				 <div >  <span style="margin-left:80px;">Sản phẩm </span><span style="margin-left:150px;">Giá tiền </span> <span style="margin-left:110px;"> Số lượng</span></div>
					<form action="${initParam['posturl']}" method="POST">
      <input type="hidden" name="upload" value="1" />
      <input type="hidden" name="return" value="${initParam['returnurl']}" />
      <input type="hidden" name="cmd" value="_cart" />
      <input type="hidden" name="business" value="${initParam['business']}" />
      <%
						for (Map.Entry<Product, Integer> ds : list.entrySet()) {
							 		%>
	<div >			
     
     <input type="text" name="item_name_1" value="<%=ds.getKey().getName_Product()%>" readonly style="width:25%;background:#DDDDDD;"  /> 
      
      <input type="text" name="amount_1" value="<%=(ds.getKey().getPrice() - ds.getKey().getSale()) %>" readonly style="background:#DDDDDD"/>
     
      <input type="text" name="quantity_1" value="<%=ds.getValue()%>"readonly style="background:#DDDDDD; width:5%" />
      </div>	
      <%
						}
					%>
      <input type="submit"  class="btn btn-primary" value="Xác nhận và Thanh toán" style="margin-top:5%; margin-bottom:20px"/>
   	
   </form>
			
   
   </div>  
			</div>
			
			


		</div>
		</br>
		</hr>
		</br>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

	<%
		}
	%>
	
	 <script language="javascript">
            function validateSelectBox(obj){
                var options = obj.children;
                for (var i = 0; i < options.length; i++){
                    if (options[1].selected){
                      document.getElementById('ss').style.display = "block";
                      document.getElementById('okie').style.display = "none"; 
                    }
                  else{
                	  document.getElementById('ss').style.display = "none";
                	  document.getElementById('okie').style.display = "block"; 
                	 
                	  
                	 
                  }
                }
                
               
            }
        </script>
</body>
</html>