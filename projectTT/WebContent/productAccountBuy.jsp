<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Sản Phẩm | TS-Homeware</title>
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
	Account acc = (Account) session.getAttribute("memberSession");
	if (acc == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	}
	String ID_Account = acc.getID_Account(); 
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
	
	
		

		ArrayList<Product> arr3 = sanPhamDAO.getListProductAccountBuy(ID_Account);
		int start3 = 0, end3 = 15;
		if (arr3.size() < 15) {
			end3 = arr3.size();
		}
		if (request.getParameter("start3") != null) {
			start3 = Integer.parseInt(request.getParameter("start3"));
		}
		if (request.getParameter("end3") != null) {
			end3 = Integer.parseInt(request.getParameter("end3"));
		}
		ArrayList<Product> list3 = sanPhamDAO.getListByPage(arr3, start3, end3);
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<h2 class="title text-center">Danh Sách Sản Phẩm</h2>
			<%
				for (Product sp : sanPhamDAO.getListProductByCategory3(ID_Account,request.getParameter("ID_Category"))) {
			%>
			<div class="col-sm-4 tim-kiem" >
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD; color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<div class="product-overlay">
							<div class="overlay-content">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
								<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD;color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div>
						<img src="images/home/like.png" class="new" alt="" />
						<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                        else{ %> style="display:none"
													<%
													}
												%>  src="images/home/hf.jpg" class="proend" alt="" />
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i
									class="fa fa-plus-square"></i>Xem chi tiết</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%
				}
			%>
			
			<%
				for (Product sp : sanPhamDAO.getListProductByBrand3(ID_Account,request.getParameter("ID_Brand"))) {
			%>
			<div class="col-sm-4 tim-kiem">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219afc;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD;color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
								
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<div class="product-overlay">
							<div class="overlay-content">
							<%-- <img src="<%=sp.getImage()%>" alt="" />
								<h2><%=nf.format(sp.getPrice())%>
									VNĐ
								</h2>
								<h4><%=nf.format(nh.getSale())%>
								VNĐ</h4>
								<p style="font-weight: bold"><%=sp.getName_Product()%></p> --%>
								<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219afc;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
								<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD;color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<% 
													}
												%> 
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div>
						<img src="images/home/like.png" class="new" alt="" />
						<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                        else{ %> style="display:none"
													<%
													}
												%>  src="images/home/hf.jpg" class="proend" alt="" />
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i
									class="fa fa-plus-square"></i>Xem chi tiết</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%
				}
			%>
			
		</div>


		<div class="features_items">
			<div class="category-tab" >
				<!--category-tab-->
				<div class="col-sm-12">
					<ul class="nav nav-tabs" style="margin-bottom:5%;">
						<li class="active"><a href="index.jsp">Tổng
								Hợp Sản Phẩm </a></li>
								<li class="active" style="border-right:1px solid black;border-left:1px solid black"><a href="index1.jsp" >
								 Sản Phẩm Khuyến Mãi</a></li>
								 <li class="active"><a href="index2.jsp">
								 Bán Chạy Nhất</a></li>
								  <li class="active"><a href="index3.jsp" style="background:#219afc;color:white">
								 Dành Riêng Cho Bạn</a></li>
					</ul>

				</div>
			</div>
			<%
				for (Product sp : list3) {
			%>

			<div class="col-sm-4 tim-kiem">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD;color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<div class="product-overlay">
							<div class="overlay-content">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice() - sp.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219afc;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp.getName_Product()%></p>
								
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD;color:white " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div>
						<img src="images/home/like.png" class="new" alt="" />
						<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                        else{ %> style="display:none"
													<%
													}
												%>  src="images/home/hf.jpg" class="proend" alt="" />
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i class="fa fa-plus-square"></i>Xem chi
									tiết</a></li>
							
						</ul>
					</div>
				</div>
			</div>

			<%
				}
			%>
			<div style="clear: both;"></div>
			<ul class="pagination">


				<%
					int a, b;
					int limit = arr3.size() / 15;
					if (limit * 15 < arr3.size()) {
						limit += 1;
					}
					for (int i = 1; i <= limit; i++) {
						a = (i - 1) * 15;
						b = i * 15;
						if (b > arr3.size()) {
							b = arr3.size();
						}
				%>
				<li><a href="index3.jsp?start3=<%=a%>&end3=<%=b%>" style="border:1px solid black; color: white; font-weight:bold; background: #219afc"><%=i%></a></li>
				<%
					}
				%>
			</ul>
		</div>

	</div>
</body>
</html>