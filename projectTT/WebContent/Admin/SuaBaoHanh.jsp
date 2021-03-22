<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sửa Bảo Hành | Admin TS-HOMEWARE</title>
<!-- BOOTSTRAP STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
	String Status = request.getParameter("Status");
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Bảo Hành</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Cập Nhật Bảo Hành</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/TheSinh_Homeware/UpdateBaoHanh" method="post">										
											<div class="form-group">
												<label>Ngày trả</label> 
												<input class="form-control" type="text" name="Ngaytra" />
											</div>									
											
	
											<div class="form-group">
												<label>Trạng Thái</label> 
												<select class="form-control" name="Status">
													
													
													<option value="2" <% 
													if (Status.equals("3")) {
														
												%>style="display: none" <%}
                       
												%>>Đang sửa chữa</option>
													<option value="3" <% 
													if (Status.equals("1")) {
														
												%>style="display: none" <%}
                       
												%>>Đã sửa xong</option>
													<option value="4" <% 
													if (Status.equals("1") || Status.equals("2")) {
														
												%>style="display: none" <%}
                       
												%>>Đã trả bảo hành</option>
												</select>
											</div>
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="Id_baohanh" value="<%=request.getParameter("ID_Warranty")%>"> 				
											<button type="submit" class="btn btn-success">Sửa</button>
											<button type="reset" class="btn btn-primary" style="margin-left:5%">Phục hồi</button>
												<a href="ManageBaoHanh.jsp"  class="btn btn-danger" style="margin-left:5%">Thoát</a>
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