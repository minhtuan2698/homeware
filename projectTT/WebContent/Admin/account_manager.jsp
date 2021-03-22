<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Empty"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Tài Khoản | Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	/* if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	}  */
	
	Account user = (Account) session.getAttribute("memberSession");
		 if(user == null){			
			response.sendRedirect("/TheSinh_Homeware/account.jsp");
			return;}
		AccountDAOImpl accDAO = new AccountDAOImpl();
		ArrayList<Account> listAcc = accDAO.getAll();
		TinhTrangDAO ttDAO = new TinhTrangDAO();
		ArrayList<Empty> emp = ttDAO.getListEmpty();
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ TÀI KHOẢN</h2>
						<!-- <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/TheSinh_Homeware/Admin/account_insert.jsp" 
								style="color: white;">Thêm Tài Khoản</a>
						</div> -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/account_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm Tài Khoản</a>
						</div>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ TÀI KHOẢN</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr >
												<th>Mã Tài Khoản</th>
												<th>Tài Khoản</th>
												<!-- <th>Mật Khẩu</th> -->
												<th>Email</th>
												<th>Họ Và Tên</th>
												<th>Địa Chỉ</th>
												<th>Số Điện Thoại</th>
												<th>Quyền</th>
												<th>Trạng Thái</th>
												<th>Chức Năng</th> 
											</tr>
										</thead>

										<tbody>
											<%
												for (Account acc : listAcc) {
											%>
											<tr  class="odd gradeX">
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {											
						%>style="display:none" <%}%>><%=acc.getID_Account()%></td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {											
						%>style="display:none" <%}%>><%=acc.getUsername()%></td>
												<%-- <td><input style="border:none; background:inherit;" type = "password" value="<%=acc.getPassword()%>" readonly></td> --%>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {
						%>style="display:none" <%}%>><%=acc.getEmail()%></td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {										
						%>style="display:none" <%}%>><%=acc.getFull_Name()%></td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {											
						%>style="display:none" <%}%>><%=acc.getAddress()%></td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {										
						%>style="display:none" <%}%>><%=acc.getSDT()%></td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {											
						%>style="display:none" <%}%>class="center" style="text-align: center;">
												<%
													if (acc.getAccess() == 1) {
												%>
												<a  class="btn btn-success btn-xs" >Admin</a>
												<%
													}
												%>
												<%
													if (acc.getAccess() == 2) {
												%>
												<a class="btn btn-info btn-xs" >Khách Hàng</a>
												<%
													}
												%>
												<%
													if (acc.getAccess() == 3) {
												%>
												<a class="btn btn-warning btn-xs" >Nhân viên bán hàng</a>
												<%
													}
												%>
												 <%
													if (acc.getAccess() == 4) {
												%>
												<a class="btn btn-primary btn-xs" >Nhân viên kế toán</a>
												<%
													}
												%> 
												</td>
												<td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {											
						%>style="display:none" <%}%> class="center" style="text-align: center;">
												<%
													if (acc.getStatus() == 1) {
												%>
												<a class="btn btn-danger btn-xs" >Đã Kích Hoạt</a>
												<%
													}
												%>
												<%
													if (acc.getStatus() == 2) {
												%>
												<a class="btn btn-default btn-xs" >Đang Chờ</a>
												<%
													}
												%>
												</td>
												 <td <% if ((user.getAccess() == 3 && acc.getAccess() ==1) ||( user.getAccess() == 3 && acc.getAccess() ==3)|| (user.getAccess() == 3&& acc.getAccess() ==4)) {												
						%>style="display:none" <%}%> class="center" style="text-align: center;">
													<a <% String ID_Account1 = acc.getID_Account();
													if (user.getAccess() ==3 && acc.getAccess() == 3 && acc.getAccess() == 4   ) {											
														%>style="display:none" <%}
													else if (acc.getAccess() == 1 ) {											
												        %>style="display:none" <%}
													else if ((user.getAccess() == 3  && acc.getAccess() == 3) ||  (user.getAccess() == 3 && acc.getAccess() == 4)) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block"
													<%
													}
												%>  href="/TheSinh_Homeware/Admin/account_edit.jsp?action=Update&ID_Account=<%=acc.getID_Account()%>&Password=<%=acc.getPassword()%>&Username=<%=acc.getUsername()%>&Email=<%=acc.getEmail() %>&Fullname=<%=acc.getFull_Name() %>&Address=<%=acc.getAddress() %>&Phone=<%=acc.getSDT() %>"
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													
													<a <% String ID_Account = acc.getID_Account();
													if (acc.getAccess() == 1 || user.getAccess() == 3 ||user.getAccess() == 4 ) {											
														%>style="display:none" <%}
													else if (ttDAO.checkEmpty(ID_Account) == true) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block;color:black"
													<%
													}
												%>  href="/TheSinh_Homeware/AccountServlet_Delete?action=Delete&ID_Account=<%=acc.getID_Account()%>" onclick="return confirm('Bạn chắc chắn muốn xóa tài khoản <%=acc.getUsername()%> chứ ?')"
													 class="btn btn-warning btn-xs">Xóa</a> 
													 </td> 
											</tr>
											<%
												}
											%>
										</tbody>

									</table>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	
	
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<script src="assets/js/custom.js"></script>
</body>
</html>