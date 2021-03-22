<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Season"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.SeasonDAO"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Mùa Sự Kiện | Admin TS-Homeware</title>
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
		SeasonDAO seasonDAO = new SeasonDAO();
		ArrayList<Season> listPro = seasonDAO.getListSeason();
		TinhTrangDAO ttDAO = new TinhTrangDAO();
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ MÙA SỰ KIỆN</h2>
						<!-- <div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/TheSinh_Homeware/Admin/muasukien_insert.jsp" style="color: white;">Thêm
								mùa sự kiện</a>
						</div> -->
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/muasukien_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm mùa sự kiện</a>
						</div>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ MÙA SỰ KIỆN</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead >
											<tr style="text-align: center;">
												<th style="text-align:center">Mã Mùa Sự Kiện</th>
												<th style="text-align:center">Tên Mùa Sự Kiện</th>
												 <th style="text-align:center">Ngày Bắt Đầu</th> 
												 <th style="text-align:center">Ngày Kết Thúc</th> 
												 <th style="text-align:center">Chức năng</th>
											</tr>
										</thead>
										<tbody>
										<%
												for (Season cate : listPro) {
											%>
											<tr class="odd gradeX">
												<td style="text-align:center"><%=cate.getID_Season()%></td>
												<td style="text-align:center"><%=cate.getName_Season()%></td>
												<td style="text-align:center"><%=cate.getDateStart()%></td>
												<td style="text-align:center"><%=cate.getDateEnd()%></td>
										
												<td class="center" style="text-align:center"><a href="/TheSinh_Homeware/Admin/muasukien_edit.jsp?action=Update&ID_Season=<%=cate.getID_Season()%>&Name_Season=<%=cate.getName_Season()%>&DateStart=<%=cate.getDateStart()%>&DateEnd=<%=cate.getDateEnd()%>"
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													 <a <% int ID_Season = cate.getID_Season();
													 if (ttDAO.checkEmptySeason(ID_Season) == true) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block;width:26%;margin-left:36%"
													<%
													}
												%>  href="/TheSinh_Homeware/SeasonServlet_Delete?action=Delete&ID_Season=<%=cate.getID_Season()%>" onclick="return confirm('Bạn có chắc chắn xóa sự kiện <%=cate.getName_Season() %> không ?')"
														 
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

	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>

</body>
</html>