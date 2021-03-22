<%@page import="Model.TinhTrang"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Model.Brand"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Sản Phẩm | Admin SunHouse</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
	<script type="text/javascript">
    $(document).ready(function(){
        $('#spkm-check').click(function(){
            if($(this).prop("checked") == true){
            	$("#giagiamshow").css("display" , "block");
                /* alert("Checkbox is checked."); */
            }
            else if($(this).prop("checked") == false){
            	$("#giagiamshow").css("display" , "none");
                /* alert("Checkbox is unchecked."); */
            }
        });
    });
	</script>
<body>
	
	<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
		}

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
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold">Thêm Đơn Bảo Hành</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/TheSinh_Homeware/AddBaoHanh" method="post">
											<div class="form-group">
												<label>Seri Sản Phẩm</label> 								
												<input class="form-control" type="text" name="Seri" required>
											</div>
											
											<div class="form-group">
												<label>Tình Trạng Hư</label>
												<br>
												<select id="cmbTinhTrang" style=" width:100%; padding: 5px 0px; border: 1px solid lightgray; border-radius: 5px;" name="id_tinhtrang" required>
													<% 	
														TinhTrangDAO ttDAO= new TinhTrangDAO();
														List<TinhTrang> listtt= new ArrayList<>();
														listtt= ttDAO.listTinhTrangs();
														for(int i=0;i<listtt.size();i++){
														
													%>
						 							 <option value="<%=listtt.get(i).getId()%>" ><%=listtt.get(i).getTentinhtrang()%></option>
						  							<%
													
													}
						  							%>
												</select>
											</div>
											
											<input type="hidden" name="action" value="Insert"> 
											<button type="submit" class="btn btn-success">Thêm</button>
											<button type="reset" class="btn btn-primary" style="margin-left:1%">Hủy</button>
											<a href="ManageBaoHanh.jsp"  class="btn btn-danger" style="margin-left:1%">Thoát</a>	
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
	

	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/custom.js"></script>

</body>
</html>