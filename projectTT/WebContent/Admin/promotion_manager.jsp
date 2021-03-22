<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Promotion"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.PromotionDAO"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Khuyến Mãi | Admin TS-Homeware</title>
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
		PromotionDAO promotionDAO = new PromotionDAO();
		ArrayList<Promotion> listPro = promotionDAO.listPromotion();
		TinhTrangDAO ttDAO = new TinhTrangDAO();
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ KHUYẾN MÃI</h2>
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="navbar-brand" href="/TheSinh_Homeware/Admin/muasukien_insert.jsp" style="color: white;text-transform:uppercase;font-size:14px;"> Thêm đợt khuyến mãi</a>
						</div>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">QUẢN LÝ KHUYẾN MÃI</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead >
											<tr style="text-align: center;">
												<th style="text-align:center">Mã Khuyến Mãi</th>
												<th style="text-align:center">Lí Do Khuyến Mãi</th>
												 <th style="text-align:center">Ngày Bắt Đầu</th> 
												  <th style="text-align:center">Ngày Kết Thúc</th>
												 <th style="text-align:center">Người Tạo</th> 
												 <th style="text-align:center">Xem chi tiết</th>
												  <th style="text-align:center">Chức năng</th> 
											</tr>
										</thead>
										<tbody>
										<%
												for (Promotion pr : listPro) {
											%>
											<tr class="odd gradeX">
												<td style="text-align:center"><%=pr.getID_Promotion()%></td>
												<td style="text-align:center"><%=pr.getReason()%></td>
												<td style="text-align:center"><%=pr.getDateStart()%></td>
												<td style="text-align:center"><%=pr.getDateEnd()%></td>
													<td style="text-align:center"><%=pr.getID_Account()%></td>
													<td class="center" style="text-align: center;">
												
												<a href="/TheSinh_Homeware/PromotionServlet_View?action=Views&ID_Promotion=<%=pr.getID_Promotion()%>"
													class="btn btn-warning btn-xs">Xem</a></td>
													<td style="text-align:center"><%=pr.getID_Account()%></td>
												
										
												<%-- <td class="center" style="text-align:center"><a href="/TheSinh_Homeware/Admin/muasukien_edit.jsp?action=Update&ID_Season=<%=cate.getID_Season()%>&Name_Season=<%=cate.getName_Season()%>&DateStart=<%=cate.getDateStart()%>&DateEnd=<%=cate.getDateEnd()%>"
													class="btn btn-info btn-xs" style="margin-bottom:5px">Sửa</a> 
													 <a <% int ID_Season = cate.getID_Season();
													 if (ttDAO.checkEmptySeason(ID_Season) == true) {											
												        %>style="display:none" <%}
                                                    else{ %> style=" display:block;width:26%;margin-left:36%"
													<%
													}
												%>  href="/TheSinh_Homeware/SeasonServlet_Delete?action=Delete&ID_Season=<%=cate.getID_Season()%>" onclick="return confirm('Bạn có chắc chắn xóa sự kiện <%=cate.getName_Season() %> không ?')"
														 
													 class="btn btn-warning btn-xs">Xóa</a>  
													 </td> --%>
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