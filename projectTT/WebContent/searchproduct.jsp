<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
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

	<%-- <%
	Account acc = (Account) session.getAttribute("memberSession");
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
				List<Product> listProductSearch = new ArrayList<>();
		List<Product> list = new ArrayList<>();
		listProductSearch= (List<Product>) session.getAttribute("dsSearch");
		list = sanPhamDAO.getList();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
	%> --%>
	<%
	Account acc = (Account) session.getAttribute("memberSession");
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		List<Product> listProductSearch = new ArrayList<>();
		List<Product> list12 = new ArrayList<>();
		list12 = sanPhamDAO.getList();
		listProductSearch= (List<Product>) session.getAttribute("dsSearch");
		System.out.println("popoaaaaaaa"+ listProductSearch);
		ArrayList<Product> arr = sanPhamDAO.getList();
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
		String textSearch= (String) session.getAttribute("textSearch");
		System.out.println("popo"+ textSearch);
	%>
	

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<h2 class="title text-center">DANH SÁCH SẢN PHẨM </h2>
			<h2 style="text-align:center;font-size:18px; background:#219afc; padding:12px 0px;width:96%; margin-left:2%; text-transform: uppercase;font-weight:bold" >Danh Sách Sản Phẩm Tìm Kiếm Cho<span style="color:white; text-transfrom:uppercase"> <%=textSearch %></span> </h2>
			 <p class="nos" <% if(listProductSearch.size()==0 ) {%>style="display:block;font-weight:bold;color:red;font-size:20px;margin-left:20px;text-align:center" <%}
                        else{ %> style="display: none;"
													<%
													}
												%>>KHÔNG CÓ SẢN PHẨM MÀ BẠN TÌM KIẾM</p> 
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
			 <%
		            if(session.getAttribute("dsSearch")!=null){
						list12= listProductSearch;
					}
						 for (int i = 0; i < list12.size(); i++) {  
					%>

			<div class="col-sm-4 tim-kiem">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=list12.get(i).getImage()%>" alt="" />
							<h2><%=nf.format(list12.get(i).getPrice() - list12.get(i).getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (list12.get(i).getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(list12.get(i).getPrice())%>
								VNĐ</h4> 
							<p <%if (list12.get(i).getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=list12.get(i).getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=list12.get(i).getQuantity()%>
								sản phẩm
							</p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=list12.get(i).getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								<% 
													if (list12.get(i).getQuantity()==0) {											
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
							<img src="<%=list12.get(i).getImage()%>" alt="" />
							<h2><%=nf.format(list12.get(i).getPrice() - list12.get(i).getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (list12.get(i).getSale()==0) {%>style="color:#219AFC;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(list12.get(i).getPrice())%>
								VNĐ</h4> 
							<p <%if (list12.get(i).getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=list12.get(i).getName_Product()%></p>
								
								<a
									href="CartServlet?enter=insert&ID_Product=<%=list12.get(i).getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (list12.get(i).getQuantity()==0) {											
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
													if (list12.get(i).getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 365px;right: 60px;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/hf.jpg" class="proend" alt="" />
												<img <% String n= list12.get(i).getID_Product();
												int ia = Integer.parseInt(n);
													if (ia >= 122) {											
												%>style="display:block;position: absolute;top: 0;right: 0;" <%}
                                                    else{ %> style="display:none"
												<%
												   }
												%>  src="images/home/new.png" class="new" alt="" />
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=list12.get(i).getID_Product()%>"><i class="fa fa-plus-square"></i>Xem chi
									tiết</a></li>
							
						</ul>
					</div>
				</div>
			</div>

			<%
				}
			%>
		</div>

   <!---------------------------------------------------------   Sản phẩm khuyến mãi ---------------------------------------------->
     
		<div class="features_items tim-kiem">
			<div class="category-tab tim-kiem" >
				<!--category-tab-->
				<div class="col-sm-12 tim-kiem">
					<ul class="nav nav-tabs" style="margin-bottom:5%;">
						<li class="active"><a href="" data-toggle="tab" style="background:#fe980f">Tổng
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
				<li><a  class="tim-kiem" href="index10.jsp?start=<%=a%>&end=<%=b%>" style="border:1px solid black; color: white; font-weight:bold; background: #219afc"><%=i%></a></li>
				<%
					}
				%>
			</ul>
		</div>

	</div>
</body>
</html>