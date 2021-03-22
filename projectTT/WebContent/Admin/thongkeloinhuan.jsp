<%@page import="Model.Statistic"%>
<%@page import="Model.Profit"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.Product"%>
<%@page import="Model.Invoice"%>
<%@page import="Model.Category"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.CategoryDAOImpl"%>
<%@page import="Dao.BrandDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Thống Kê Lợi Nhuận | Admin TS-Homeware</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
</head>
<script>


 $(document).ready(function() {
    var date = new Date().toISOString().split('T')[0];
    document.getElementsByName("date")[0].setAttribute('max', date);
    document.getElementsByName("date1")[0].setAttribute('max', date);
    var dat = new Date();
    
    var tomorrow = new Date(new Date(("09/09/2019"))).toISOString().split('T')[0];
    document.getElementsByName("date1")[0].setAttribute('min', tomorrow);
    document.getElementsByName("date")[0].setAttribute('min', tomorrow);
    
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    
     var dayy = dat.getDate();
    var monthh = dat.getMonth() + 1;
    var yearr = dat.getFullYear(); 
    
     var tomday = tomorrow.getDate();
    var tommonth = tomorrow.getMonth() + 1;
    var tomyear = tomorrow.getFullYear();
    
    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;
    
     if (monthh < 10) monthh = "0" + monthh;
    if (dayy < 10) dayy = "0" + dayy;
    
    if(tomday < 10) tomday="0" + tomday; 
    if(tommonth < 10) tommonth="0" + tommonth;
   
    var today = year + "-" + month + "-" + day; 
     var todayy = yearr + "-" + monthh + "-" + dayy;  
     var tomorrow = tomyear + "-" + tommonth + "-" + tomday;
 
    $("#datepickerTo").attr("value", today);
   
    $("#datepickerFrom").attr("value",tomorrow);
   
   

});   


$(document).ready(function(){
  var tr;
		function getProfit(dateFrom, dateTo) {
			
			$(".ttt").html("<h5 colspan=\"4\"  style=\"text-align: center; font-weight: bold; text-transform: uppercase; color: #c50000;\">\r\n" + 
					"Thống kê lợi nhuận từ ngày " +dateFrom + " đến ngày " + dateTo + "</h5>");
			$(".tt").html("<td colspan=\"4\" style=\"text-align: center;\">\r\n" + 
					"Thống kê lợi nhuận từ ngày " +dateFrom + " đến ngày " + dateTo + "</h5>");
			$.ajax({
				url:"/TheSinh_Homeware/LoiNhuanServlet",
				type:"GET",
				data:{
					action: "LoiNhuan",
					dateFrom: dateFrom,
					dateTo: dateTo
				}
			}).done(function(responseText) {
				var json = $.parseJSON(responseText);
				if(json.error !=null){
					alert("Lỗi: " + json.error);
				}else{
					$("#ShowLoiNhuan").html(json.data);
					$("#total").html(json.total);
					$("#total11").html(json.total);
					$("#total111").html(json.total);
				}
			});
		}
		$("#ok1").on("click", function () {
			var dateFrom = $("#datepickerFrom").val();
			var dateTo = $("#datepickerTo").val();
			var date = new Date();
			var day = date.getDate();
		    var month = date.getMonth() + 1;
			var year = date.getFullYear();
			if (month < 10) month = "0" + month;
		    if (day < 10) day = "0" + day;
		    var today = year + "-" + month + "-" + day; 
		if(dateFrom >= dateTo || dateTo > today)
			{
			
			$("#abc").html("Ngày không hợp lệ, vui lòng chọn lại ! ")
			}else{
				
				$("#abc").html("")
				}
			
			
		    getProfit(dateFrom, dateTo);
			
			
		});
	})

</script>
<body>
<%
	if (session.getAttribute("memberSession") == null) {
		response.sendRedirect("/TheSinh_Homeware/account.jsp");
	} 
		String denngay_error="";
		if (request.getAttribute("denngay_error") != null) {
			denngay_error = (String) request.getAttribute("denngay_error");
		}
		String tungay="", denngay="";
		if (request.getAttribute("tungay") != null) {
			tungay = (String) request.getAttribute("tungay");
		}
		if (request.getAttribute("denngay") != null) {
			denngay = (String) request.getAttribute("denngay");
		}
		ProductDAOImpl productDAO = new ProductDAOImpl();
		ArrayList<Product> listPro = productDAO.getList();
		CategoryDAOImpl cateDAO = new CategoryDAOImpl();
		BrandDAOImpl brandDAO = new BrandDAOImpl();
		InvoiceDetailDAOImpl indeDAO = new InvoiceDetailDAOImpl();
	
		ArrayList<Statistic> statistics = indeDAO.getListInvoiceDetail9();
		ArrayList<Statistic> statistics1 = indeDAO.getListInvoiceDetail10();
		ArrayList<Statistic> statistics2 = indeDAO.getListInvoiceDetail11();
		ArrayList<Statistic> statistics3 = indeDAO.getListInvoiceDetail12();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		 String dff = (String) request.getAttribute("dateFrom");
		 String dt = (String) request.getAttribute("dateTo");
		ArrayList<Statistic> listInvoiceDetaila = (ArrayList<Statistic>) request.getAttribute("listTK");
		ArrayList<Profit> profits = indeDAO.getListProfit(dff,dt);
		
	%>
 <%DecimalFormat df = new DecimalFormat("####0.00"); 

												
											  
												%> 
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>THỐNG KÊ LỢI NHUẬN</h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
					</div>
				</div>
				<hr />

				<div class="row" id="menu1">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading header-table" style="background:#319afc; color:white; font-weight:bold">
							<span >THỐNG KÊ LỢI NHUẬN</span>
							
							<!-- <span style="margin-left:50%; color:red;text-transform:uppercase;font-weight: bold">
							<span style="color:white">Tổng lợi nhuận:</span>  <span id="total"></span>
							 </span> -->
							 </div>
							 <div style="margin-top: 20px; margin-left: 50px">
							 <span>Từ ngày
							 <input type="date" id="datepickerFrom" name="date1" style="border-radius:10px;border:2px solid #d9534f; padding-left:10px" value="" data-date-format="mm/dd/yyyy"></span>
							 <span style="margin-left:20px" onload="validDate()">Đến ngày
							 <input type="date" id="datepickerTo" name="date" style="border-radius:10px;border:2px solid #d9534f; padding-left:10px"  value="" data-date-format="mm/dd/yyyy" required></span>
							 <span style="margin-left:20px; padding:30px 0px"> <button class="btnAdd btn btn-danger btn-xs" id="ok1" style="padding:8px 10px;border-radius:10px">THỐNG KÊ</button></span>
							 <span><button class="exportToExcel0  btn btn-success" id="export0" style="margin-left:5px;font-size:12px;padding:8px 12px;border-radius:10px"> XUẤT BÁO CÁO </button></span></span>
							  <br><span class="alert" id="abc" style="font-weight:bold; color:red"></span>
							 
							 <p id="err1"></p>
							 </div>
							<div class="panel-body">
								<div class="table-responsive">
								<div class="ttt">
				<h5 style="text-align: center; font-weight: bold; text-transform: uppercase; color: #c50000;">
					Thống kê lợi nhuận từ ngày<span>...</span>đến ngày <span>...</span><span>...</span>
				</h5>
			</div>
									<table class="table table-striped table-bordered table-hover table2excel hhh0">
								<tfoot style="display:none">
								<tr class="tt"></tr>
				
			</tfoot>
										<thead >
											<tr style="text-align: center;">
												<th style="text-align:center">Mã Sản Phẩm</th>
												<th style="text-align:center">Tên Sản Phẩm</th> 
												<th style="text-align:center">Số Lượng Đã Bán</th> 
												<th style="text-align:center">Tiền bán</th> 
												<th style="text-align:center">Giảm giá</th> 
												<!-- <th style="text-align:center">Tổng Tiền</th>  -->
												<th style="text-align:center">Tiền nhập</th> 
												<th style="text-align:center">Lợi nhuận</th>
												
											</tr>
										</thead>
										
										<tbody id="ShowLoiNhuan">
										<tr class="contentPage odd gradeX imgKho" style="text-align: center;">
													 
						                </tr>
						                
											
										</tbody>
									<tfoot style="display:none">
				<tr><td colspan="2">Tổng lợi nhuận: <span id="total11"></span> </td>
			</tfoot>
									</table>
										<span style="text-transform:uppercase; font-weight:bold; float:right">Tổng lợi nhuận: <span id="total111"></span></span>
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
			/* $('#dataTables-example5').dataTable(); */
		});
	</script>
	<script src="../dist/jquery.table2excel.js"></script>
    <script>
			$(function() {
		
				$(".exportToExcel0").click(function(e){
					/* alert("fsdfds"); */
					var table0 =  $('.hhh0');
					/* alert(table2.html()); */
					if(table0 && table0.length){
						
						$(table0).table2excel({
							exclude: ".noExl",
							name: "Excel Document Name",
							filename: "LoiNhuan",
							fileext: ".xls",
							exclude_img: true,
							exclude_links: true,
							exclude_inputs: true
							
						});
					}
					
				});
				
			});
		</script>
</body>
</html>