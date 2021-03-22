<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="Model.Season"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Dao.SeasonDAO"%>
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
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		TinhTrangDAO tt = new TinhTrangDAO();
		List<Product> listProductSearch = new ArrayList<>();
		List<Product> list12 = new ArrayList<>();
		list12 = sanPhamDAO.getList();
		listProductSearch= (List<Product>) session.getAttribute("dsSearch");
		ArrayList<Product> arr = sanPhamDAO.getListtt();
		ArrayList<Product> arr2 = tt.listProductbyPromotion();
		Season promotion= new Season();
		SeasonDAO promotionDAO= new SeasonDAO();
		promotion= promotionDAO.promotionbyCurrentDate();
		int start = 0, end = 15;
		if (arr.size() < 15) {
			end = arr.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		ArrayList<Product> list = sanPhamDAO.getListByPage(arr, start, end);
		

		ArrayList<Product> arr1 = sanPhamDAO.getList1();
		int start1 = 0, end1 = 15;
		if (arr1.size() < 15) {
			end1 = arr1.size();
		}
		if (request.getParameter("start1") != null) {
			start1 = Integer.parseInt(request.getParameter("start1"));
		}
		if (request.getParameter("end1") != null) {
			end1 = Integer.parseInt(request.getParameter("end1"));
		}
		ArrayList<Product> list1 = sanPhamDAO.getListByPage(arr1, start1, end1);
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		int start22 = 0, end22 = 3;
		if (arr2.size() < 3) {
			end22 = arr2.size();
		}
		if (request.getParameter("start22") != null) {
			start22 = Integer.parseInt(request.getParameter("start22"));
		}
		if (request.getParameter("end22") != null) {
			end22 = Integer.parseInt(request.getParameter("end22"));
		}
		ArrayList<Product> list22 = sanPhamDAO.getListByPage22(arr2, start22, end22);
	%>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
		<!-- // danh sách sản phẩm -->
			<h2 class="title text-center">Danh Sách Sản Phẩm  </h2>
			<%
				for (Product sp : sanPhamDAO.getListProductByCategory(request.getParameter("ID_Category"))) {
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
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219AFC;" <%}
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
						<img src="images/home/new.png" class="new" alt="" />
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
				for (Product sp : sanPhamDAO.getListProductByBrand(request.getParameter("ID_Brand"))) {
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
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219AFC;" <%}
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
						<img src="images/home/new.png" class="new" alt="" />
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
			<!--  danh sách sản phẩm // --> 
		</div>
		
		<div class="features_items">
		
<marquee width="96%" behavior="alternate" bgcolor="#fe980f" style="margin-left:2%;margin-bottom:3%;border:2px solid black">
	<h2 class="title1 text-center" style="color:black; font-size:18px; text-transform:uppercase;width:60%">Sản phẩm <%=promotion.getName_Season() %> ( <%=promotion.getDateStart() %> - <%=promotion.getDateEnd() %> ) </h2>
		 </marquee>	<br>
			<%
			for (Product sp : list22) {
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
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219AFC;" <%}
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
						<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/hf.jpg" class="proend" alt="" />
												<img <% String n= sp.getID_Product();
												int i = Integer.parseInt(n);
													if (i >= 122) {											
												%>style="display:block;position: absolute;top: 0;right: 0;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/new.png" class="new" alt="" />
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
			<ul class="pagination tim-kiem">


				<%
					int a22, b22;
					int limit22 = arr2.size() / 3;
					if (limit22 * 3 < arr2.size()) {
						limit22 += 1;
					}
					for (int i = 1; i <= limit22; i++) {
						a22 = (i - 1) * 3;
						b22 = i * 3;
						if (b22 > arr2.size()) {
							b22= arr2.size();
						}
				%>
				<li><a  class="tim-kiem" href="index.jsp?start22=<%=a22%>&end22=<%=b22%>" style="border:1px solid black; color: white; font-weight:bold; background: #219afc"><%=i%></a></li>
				<%
					}
				%>
			</ul>
			</div>

   <!---------------------------------------------------------   Sản phẩm khuyến mãi ---------------------------------------------->
     
		<div class="features_items tim-kiem">
			<div class="category-tab tim-kiem" >
				<!--category-tab-->
				<div class="col-sm-12 tim-kiem">
					<ul class="nav nav-tabs" style="margin-bottom:5%;">
						<li class="active"><a href="" data-toggle="tab" style="background:#219afc;color:white">Tổng
								Hợp Sản Phẩm </a></li>
								
								<li class="active" style="border-right:1px solid black;border-left:1px solid black"><a href="index1.jsp">
								 Sản Phẩm Khuyến Mãi</a></li>
								 
								 <li class="active"><a href="index2.jsp">
								  Bán Chạy Nhất</a></li>
								  
								   <li class="active"><a href="index3.jsp" <%if (acc==null) {%>style="display:none" <%}
                        else{ %> style="display: block; border-left:1px solid black;"
													<%
													}
												%>>
								 Dành Riêng Cho Bạn</a></li>
								 
								
					</ul>

				</div>
			</div>
			<%
			
				for (Product sp : list) {
					
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
							 <h4 <%if (sp.getSale()==0) {%>style="color:#219AFC;" <%}
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
									href="CartServlet?enter=insert&soluong=1&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
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
						<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/hf.jpg" class="proend" alt="" />
												<img <% String n= sp.getID_Product();
												int i = Integer.parseInt(n);
													if (i >= 122) {											
												%>style="display:block;position: absolute;top: 0;right: 0;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/new.png" class="new" alt="" />
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
			<ul class="pagination tim-kiem">


				<%
					int a, b;
					int limit = arr.size() / 15;
					if (limit * 15 < arr.size()) {
						limit += 1;
					}
					for (int i = 1; i <= limit; i++) {
						a = (i - 1) * 15;
						b = i * 15;
						if (b > arr.size()) {
							b = arr.size();
						}
				%>
				<li><a  class="tim-kiem" href="index.jsp?start=<%=a%>&end=<%=b%>" style="border:1px solid black; color: white; font-weight:bold; background: #219afc"><%=i%></a></li>
				<%
					}
				%>
			</ul>
		</div>

	</div>
</body>
</html>