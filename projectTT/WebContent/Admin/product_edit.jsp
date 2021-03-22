<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Sản Phẩm | Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
	String masanpham_error = "", madanhmuc_error = "",tensanpham_error = "", hinhanh_error = "",
				soluong_error = "",mota_error="",giaban_error="",giamgia_error="", manhanhieu_error="", baohanh_error="";
		if (request.getAttribute("masanpham_error") != null) {
			masanpham_error = (String) request.getAttribute("masanpham_error");
		}
		 if (request.getAttribute("madanhmuc_error") != null) {
			madanhmuc_error = (String) request.getAttribute("madanhmuc_error");
		} 
		if (request.getAttribute("tensanpham_error") != null) {
			tensanpham_error = (String) request.getAttribute("tensanpham_error");
		}
		if (request.getAttribute("hinhanh_error") != null) {
			hinhanh_error = (String) request.getAttribute("hinhanh_error");
		}
		if (request.getAttribute("soluong_error") != null) {
			soluong_error = (String) request.getAttribute("soluong_error");
		}
		if (request.getAttribute("mota_error") != null) {
			mota_error = (String) request.getAttribute("mota_error");
		}
		if (request.getAttribute("giaban_error") != null) {
			giaban_error = (String) request.getAttribute("giaban_error");
		}
		if (request.getAttribute("giamgia_error") != null) {
			giamgia_error = (String) request.getAttribute("giamgia_error");
		}
		if (request.getAttribute("manhanhieu_error") != null) {
			manhanhieu_error = (String) request.getAttribute("manhanhieu_error");
		} 
		if (request.getAttribute("baohanh_error") != null) {
			baohanh_error = (String) request.getAttribute("baohanh_error");
		} 

		String  masanpham= "", madanhmuc="", tensanpham = "", hinhanh= "", soluong = "",mota="", giaban="",giamgia="",manhanhieu="", baohanh="",mua="";
		
		if (request.getAttribute("ID_Product") != null) {
			masanpham = (String) request.getAttribute("ID_product");
		}
		 if (request.getAttribute("Danh_Muc") != null) {
			madanhmuc = (String) request.getAttribute("Danh_Muc");
		} 
		if (request.getAttribute("Name_Product") != null) {
			tensanpham = (String) request.getAttribute("Nam_Product");
		}
		if (request.getAttribute("Image") != null) {
			hinhanh = (String) request.getAttribute("Image");
		}
		if (request.getAttribute("Quantity") != null) {
			soluong = (String) request.getAttribute("Quantity");
		}
		if (request.getAttribute("Describe") != null) {
			mota = (String) request.getAttribute("Describe");
		}
		if (request.getAttribute("Price") != null) {
			giaban = (String) request.getAttribute("Price");
		}
		if (request.getAttribute("Sale") != null) {
			giamgia= (String) request.getAttribute("Sale");
		}
		 if (request.getAttribute("Nhan_hieu") != null) {
			manhanhieu = (String) request.getAttribute("Nhan_Hieu");
		} 
		 if (request.getAttribute("Warranty_Period") != null) {
				baohanh = (String) request.getAttribute("Warranty_Period");
			} 
		 if (request.getAttribute("Mua") != null) {
				mua = (String) request.getAttribute("Mua");
			} 
		

	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Sản Phẩm</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="font-weight:bold; background:#219afc;color:white">Sửa thông tin sản phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/ProductServlet_Update" method="post">
										
											<div class="form-group">
												<label>Mã sản phẩm</label> 
												<span style="color: red"><%=masanpham_error %></span>
												<input class="form-control" type="text" name="ID_Product" value="<%=request.getParameter("ID_Product") %>" readonly />
											</div>
											
											 <div class="form-group">											
												<label>Mã danh mục</label> 
												<span style="color: red"></span>
												<input class="form-control" type="text" name="Danh_Muc" value="<%=request.getParameter("Danh_Muc") %>" />
											</div>  
											
											<div class="form-group">
												<label>Tên sản phẩm</label> 
												<span style="color: red"><%=tensanpham_error %></span>
												<input class="form-control" type="text" name="Name_Product" value="<%=request.getParameter("Name_Product") %>" />
											</div>
											
											<div class="form-group">
												<label>Hình ảnh</label> 
												<span style="color: red"><%=hinhanh_error %></span>
												<input type="text" class="form-control" name="Image" value="<%=request.getParameter("Image") %>" />
											</div>
											
											<div class="form-group">
												<label>Số lượng</label> 
												<span style="color: red"><%=soluong_error %></span>
												<input class="form-control" type="text" name="Quantity" value="<%=Integer.parseInt(request.getParameter("Quantity"))%>" />
											</div>
											<div class="form-group">
												<label>Mô tả</label> 
												<span style="color: red"><%=mota_error %></span>
												<input class="form-control" type="text" name="Describe" value="<%=request.getParameter("Describe")%>" />
											</div>
											<div class="form-group">
												<label>Giá bán</label> 
												<span style="color: red"><%=giaban_error %></span>
												<input class="form-control" type="text" name="Price" value="<%=Integer.parseInt(request.getParameter("Price"))%>" />
											</div>
											<div class="form-group">
												<label>Giảm giá</label> 
												<span style="color: red"><%=giamgia_error %></span>
												<input class="form-control" type="text" name="Sale" value="<%=Integer.parseInt(request.getParameter("Sale"))%>" />
											</div>
											  <div class="form-group">
												<label>Mã nhãn hiệu</label> 
												<span style="color: red"></span>
												<input class="form-control" type="text" name="Nhan_Hieu" value="<%=request.getParameter("Nhan_Hieu")%>" />
											</div>  
											 <div class="form-group">
												<label>Hạn bảo hành</label> 
												<span style="color: red"></span>
												<input class="form-control" type="text" name="Warranty_Period" value="<%=request.getParameter("Warranty_Period")%>" />
											</div>  
											<div class="form-group">
												<label>Sản Phẩm Mùa</label> 
												<select class="form-control" name="Mua">
													<option value="1">Mùa Tết</option>
													<option value="2">Mùa Đông</option>
													<option value="3">Mùa Hè</option>
													<option value="4">Mùa Trung Thu</option>
												</select>
												<%-- <input class="form-control" type="text" name="Mua" value="<%=request.getParameter("Mua")%>" /> --%>
											</div> 
											
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Product" value="<%=request.getParameter("ID_Product")%>"> 				
											<button type="submit" class="btn btn-success">Sửa</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Khôi phục</button>
												<a href="qlysanpham.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
										</form>
										<br />
									</div>
								</div>
							</div>
						</div>				
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>