
<%@page import="Model.Cart"%>
<%@page import="java.util.ArrayList"%>	
<%@page import="java.text.NumberFormat"%>
<%@page import="Model.Product"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="Dao.ImageDetailDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Chi Tiết Sản Phẩm | TS-Homeware</title>
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
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="js/imagezoom.js"></script>

</head>
<body>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10&appId=327890844754184";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>	

	<%
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		Product sp = sanPhamDAO.getDetailProduct(request.getParameter("ID_Product"));
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		BrandDAOImpl brandDAO = new BrandDAOImpl();
        ImageDetailDAOImpl imgDAO = new ImageDetailDAOImpl();
        System.out.println("ssd"+sp);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="product-details">
					<div class="col-sm-5">
						<div class="view-product">
							<img src="<%=sp.getImage()%>" data-imagezoom="true" alt="" />
						</div>
						<br>
						
                         <span class="view-product">
							<img style="height:30%;width:30%" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image()%>" data-imagezoom="true" data-magnification="5" alt="" />
						</span>
						<span class="view-product">
							<img  style="height:30%;width:30%; margin-left:3%" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image1()%>" data-imagezoom="true" data-magnification="5" alt="" />
						</span>
						<span class="view-product">
							<img style="height:30%;width:30%; margin-left:3%" src=" <%=imgDAO.getIdImage(sp.getID_Product()).getDetail_Image2()%>" data-imagezoom="true" data-magnification="5" alt="" />
						</span>
						
					</div>

					<div class="col-sm-7">
						<div class="product-information">
							<img src="images/product-details/new.jpg" class="newarrival"
								alt="" />
								<img <% 
													if (sp.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 0;left: 0;" <%}
                        else{ %> style="display:none"
													<%
													}
												%>  src="images/home/hf.jpg" class="proend" alt="" />

							<h2><%=sp.getName_Product()%></h2>
							
							<p>
								Mã Sản Phẩm:
								<%=request.getParameter("ID_Product")%>
							</p>

							<img src="images/product-details/rating.png" alt="" /> </br> <span>
							<span <%if (sp.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;color: #FE980F; font-family: 'Roboto', sans-serif;font-size: 18px;font-weight: 700; text-decoration: line-through;"
													<%
													}
												%> ><%=nf.format(sp.getPrice())%>
								VNĐ</span> <br>
							
								<span><%=nf.format(sp.getPrice() - sp.getSale())%> VNĐ</span> 
								
								<!-- <label>Số Lượng:</label> <input type="text" value="Nhập" /> -->
									
							</span>
						

							<p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									type="button" 
									<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
									class="btn btn-fefault cart"> <i
									class="fa fa-shopping-cart"></i> Thêm vào giỏ
								</a>
							</p>
							</br>

							<p></p>
							<p>
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
							<%-- <p>
								<b>Giảm giá: </b><%=sp.getSale()%>
								VNĐ
							</p> --%>
							<p>
								<b>Nhãn Hiệu:</b> <%=brandDAO.getIdBrand(sp.getNhan_Hieu().getID_Brand()).getName_Brand()%>
							</p>
							<p>
								<b>Mô tả sản phẩm:</b> <%=sp.getDescribe()%>
							</p>
							<div class="fb-like"
								data-href="https://www.facebook.com/hop.spirit"
								data-layout="standard" data-action="like" data-size="small"
								data-show-faces="true" data-share="true"></div>
						</div>
					</div>
				</div>

				<div class="category-tab shop-details-tab">
					<!--category-tab-->
					<div class="col-sm-12">
						<ul class="nav nav-tabs" style="margin-bottom:30px">
							<li><a href="#details" data-toggle="tab">Sản Phẩm Khác</a></li>
							<li class="active"><a href="#reviews" data-toggle="tab">Bình luận</a></li>
						</ul>
					</div>
					<%
		ProductDAOImpl sanPhamDAO1 = new ProductDAOImpl();
		ArrayList<Product> arr1 = sanPhamDAO1.getList();
		int start = 0, end = 6;
		if (arr1.size() < 6) {
			end = arr1.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		ArrayList<Product> list1 = sanPhamDAO.getListByPage(arr1, start, end);

		NumberFormat nf1 = NumberFormat.getInstance();
		nf1.setMinimumIntegerDigits(0);

		Cart cart1 = (Cart) session.getAttribute("cart");
		if (cart1 == null) {
			cart1 = new Cart();
			session.setAttribute("cart", cart1);
		}
	%>
					<div class="tab-content">
						<div class="tab-pane fade" id="details">
									<%
				for (Product sp1 : list1) {
			%>
							<div class="col-sm-4">
				
								<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp1.getImage()%>" alt="" />
							<h2><%=nf.format(sp1.getPrice() - sp1.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp1.getSale()==0) {%>style="color:white;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp1.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp1.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp1.getName_Product()%></p>
							<p  style="font-size:12px">
								<b>Số lượng</b>: còn
								<%=sp1.getQuantity()%>
								sản phẩm
							</p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp1.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								<% 
													if (sp.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<div class="product-overlay">
							<div class="overlay-content">
								<img src="<%=sp1.getImage()%>" alt="" />
								<h2><%=nf.format(sp1.getPrice() - sp1.getSale())%>
								VNĐ
							</h2>
							 <h4 <%if (sp1.getSale()==0) {%>style="color:#219AFC;" <%}
                        else{ %> style="display: block;"
													<%
													}
												%> ><%=nf.format(sp1.getPrice())%>
								VNĐ</h4> 
							<p <%if (sp1.getSale()==0) {%>style="font-weight: bold;" <%}	
							else{ %> style="font-weight: bold;"
									<%
									}
								
				%>  ><%=sp1.getName_Product()%></p>
								
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp1.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									<% 
													if (sp1.getQuantity()==0) {											
												%>style="pointer-events: none; background:#DDDDDD " <%}
                        else{ %> style=" pointer-events: auto;"
													<%
													}
												%> 
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div>
						<img <% 
													if (sp1.getQuantity()==0) {											
												%>style="display:block;position: absolute;top: 356px;right: 56px;" <%}
                        else{ %> style="display:none"
													<%
													}
												%>  src="images/home/hf.jpg" class="proend" alt="" />
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp1.getID_Product()%>"><i class="fa fa-plus-square"></i>Xem chi
									tiết</a></li>
							
						</ul>
					</div>
				</div>
							</div>
							
							<%
				}
			%>
			
				
						</div>

						<div class="tab-pane fade active in" id="reviews">
							<div class="col-sm-12">

								<div class="fb-comments"
									data-href="detail.jsp?msp<%=sp.getID_Product()%>"
									data-width="800px" data-numposts="5"></div>
								</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>