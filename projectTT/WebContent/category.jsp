<%@page import="Model.Advertise"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="Model.Category"%>
<%@page import="Model.Brand"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.AdvertiseDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Thể Loại | TS-Homeware</title>
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
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
	    BrandDAOImpl brandDAO = new BrandDAOImpl();
	    AdvertiseDAOImpl adsDAO = new AdvertiseDAOImpl();
	    ArrayList<Advertise> list = adsDAO.getList();
	%>
	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>DANH MỤC</h2>
			<div class="panel-group category-products" id="accordian">

				<%
					for (Category Parent_Category : danhMucDAO.getListParentCategory()) {
				%>
				<div class="panel panel-default">
					<div class="panel-heading">

						<%
							for (Category danh_muc_con : danhMucDAO.getListSubCategory(Parent_Category.getID_Category())) {
						%>

						<%-- <%=Parent_Category.getName_Category()%> --%>

					</div>
					<div class="panel-body">
						<ul>
							<li><a
								href="index.jsp?ID_Category=<%=danh_muc_con.getID_Category()%>"><%=danh_muc_con.getName_Category()%></a></li>

							<%
								}
							%>
						</ul>
					</div>
				</div>

				<%
					}
				%>

			</div>

				
				<h2>NHÃN HIỆU</h2>
				<div class="panel-group category-products" id="accordian1">
				<%
					for (Brand Parent_Brand : brandDAO.getListParentBrand()) {
				%>
				
					<div class="panel panel-default">
					<div class="panel-heading">

						<%
							for (Brand nhan_hieu_con : brandDAO.getListSubBrand(Parent_Brand.getID_Brand())) {
						%>

					</div>
					<div class="panel-body">
						<ul>
							<li><a
								href="index.jsp?ID_Brand=<%=nhan_hieu_con.getID_Brand()%>"><%=nhan_hieu_con.getName_Brand()%></a></li>

							<%
								}
							%>
						</ul>
					</div>
				</div>
				
				<%
					}
				%>
			</div>
			

			<div class="price-range">
				<!--price-range-->
				<h2>Khoảng Giá</h2>
				<div class="well text-center">
					<input type="text" class="span2" value="" data-slider-min="0"
						data-slider-max="1000000" data-slider-step="500"
						data-slider-value="[0,1000000]" id="sl2"><br /> <b
						class="pull-left">0 VNĐ</b> <b class="pull-right">10,000,000 VNĐ</b>
				</div>
			</div>
			<!--/price-range-->

			<div class="shipping text-center">
				<h2 style="margin-top:10px">Quảng Cáo</h2>
				<%
				for (Advertise ad : list) {
			%>
				<img style="margin-top:2%" src="<%=ad.getImage_Ads()%>" alt="" />
				<!-- <img src="images/home/gioithieu1.jpg" alt="" />
				<img src="images/home/gioithieu3.jpg" alt="" />
				<img src="images/home/gioithieu.jpg" alt="" /> -->
					<%
				}
			%>
			
			</div>
			
		</div>
		<div style="clear: both;"></div>
	</div>

</body>
</html>