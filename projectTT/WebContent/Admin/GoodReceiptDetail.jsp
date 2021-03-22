<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ProductDAOImpl"%>
<%@page import="Dao.InvoiceDetailDAOImpl"%>
<%@page import="Dao.GoodReceiptDetailDAO"%>
<%@page import="Dao.GoodReceiptDAO"%>
<%@page import="Model.InvoiceDetail"%>
<%@page import="Dao.AccountDAOImpl"%>
<%@page import="Dao.InvoiceDAOImpl"%>
<%@page import="Model.Invoice"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Account"%>
<%@page import="Model.GoodReceiptDetail"%>
<%@page import="Model.GoodReceipt"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết phiếu nhập | Admin TS-Homeware</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css" rel="stylesheet" /> 
<!--  <link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" /> -->
<!-- <link href="/TheSinh_Homeware/Admin/assets/css/custom.css" rel="stylesheet" />  -->
 <link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' /> 
	<link rel="stylesheet" href="/TheSinh_Homeware/css/normalize.min.css">
	<!-- <style type='text/css'>
        .a {
            background: black;
            color: white;
        }
        .b {
            color: black;
        }
        </style> -->
       <!--  <script src="/TheSinh_Homeware/js/html5-3.6-respond-1.1.0.min.js"></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<%
Account acc = (Account) session.getAttribute("memberSession");
if (acc == null) {
	response.sendRedirect("/TheSinh_Homeware/account.jsp");
}

ArrayList<GoodReceiptDetail> goodReceiptDetail = (ArrayList<GoodReceiptDetail>) request.getAttribute("receiptDetails");

ProductDAOImpl productDAO = new ProductDAOImpl(); 

NumberFormat nf = NumberFormat.getInstance();
nf.setMinimumIntegerDigits(0);
GoodReceipt goodReceipt= new GoodReceipt();
GoodReceiptDetail receiptDetail= new GoodReceiptDetail();
GoodReceiptDetailDAO goodReceiptDetailDAO= new GoodReceiptDetailDAO();
GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
Product product= new Product();
String idgoodReceiptString= request.getParameter("ID_Receipt");
goodReceipt=goodReceiptDAO.goodReceiptById(Integer.parseInt(idgoodReceiptString));
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
Date dateGoodReceipt = formatter.parse(goodReceipt.getCreated_date());
Date date = new Date();
DateFormat formatdateCurrent = new SimpleDateFormat("dd/MM/yyyy");
String dateCurrentFormatString= formatdateCurrent.format(date);
Date dateCurrent = formatter.parse(dateCurrentFormatString);
	System.out.println("fgg"+acc.getID_Account());
	System.out.println("ddd"+goodReceipt.getID_Account());
	%>
 <%
double count=0; 
												for (GoodReceiptDetail st : goodReceiptDetail ) {
												count += st.getQuantity() * st.getPrice();
												
												}
												
												
											  
												%>
<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>QUẢN LÝ CHI TIẾT CHI TIẾT PHIẾU NHẬP</h2>
						<div class="btn btn-success" style="padding: 0px 0px;" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a class="btn btn-success" href="/TheSinh_Homeware/Admin/GoodReceipt.jsp" style="font-size:14px;padding:8px 12px"> PHIẾU NHẬP</a>
						</div>
						<div class="btn btn-success" style="padding: 0px 0px;margin-left:20px" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a <%if(dateCurrent.compareTo(dateGoodReceipt)>0 ){ %> style="display:none"
		 <% }else if (!acc.getID_Account().equals(goodReceipt.getID_Account())){ %> style="pointer-events: none; background:#DDDDDD;color:black;font-size:14px;padding:8px 12px"<%}else{ %>style=" display:block;pointer-events: auto;font-size:14px;padding:8px 12px"<%}  %>
		 data-id=<%=idgoodReceiptString %> class="btn btn-success" href="/TheSinh_Homeware/Admin/NewReceipt.jsp?ID_Receipt=<%=goodReceipt.getID_Receipt()%>" style="font-size:14px;padding:8px 12px"> NHẬP THÊM </a>
						</div>
						<div class="btn btn-success" style="padding: 0px 0px;margin-left:20px" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<a <%if(dateCurrent.compareTo(dateGoodReceipt)>0 ){ %> style="display:none"
		 <% }else if (!acc.getID_Account().equals(goodReceipt.getID_Account())){ %> style="pointer-events: none; background:#DDDDDD;color:black;font-size:14px;padding:8px 12px"<%}else{ %>style=" display:block;pointer-events: auto;font-size:14px;padding:8px 12px"<%}  %>
		 data-id=<%=idgoodReceiptString %> class="btn btn-success" href="/TheSinh_Homeware/Admin/AddNewReceipt.jsp?ID_Receipt=<%=goodReceipt.getID_Receipt()%>" style="font-size:14px;padding:8px 12px"> NHẬP MỚI </a>
						</div>
						
				<div class="btn btn-success" style="padding: 0px 0px; margin-left:20px" >
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
								<button class="exportToExcel5 btn btn-success" id="export5" style="font-size:14px;padding:8px 12px;"> XUẤT BÁO CÁO</button>
						</div>
					</div>
				</div>
				<hr />


				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading" style="background:#319afc; color:white; font-weight:bold;text-transform:uppercase">
							Chi tiết phiếu nhập ngày <%=goodReceipt.getCreated_date()%> <span style="color:white;float:right"><span style="color:black">Tổng tiền nhập:</span>  <%= nf.format(count)%> VNĐ</span></div>
							
							<div class="panel-body">
								<div class="table-responsive" id="a">
									<table class="table table-striped table-bordered table-hover table2excel hhh5"
										id="dataTables-example5">
										<tfoot style="display:none">
				                         <tr><td colspan="6">DANH SÁCH SẢN PHẨM PHIẾU NHẬP </td></tr>
			                              </tfoot>
										<thead>
											<tr style="text-align: center;">
												<th>Mã phiếu nhập chi tiết</th>
												<th>Mã phiếu nhập</th>
												<th>Mã sản phẩm </th>
												<th>Tên sản phẩm </th>
												<th>Giá Sản Phẩm</th>
												<th>Số lượng (cái)</th>
												
												
											</tr>
										</thead>

										
										<tbody>
										<%
											for (GoodReceiptDetail grd : goodReceiptDetail ) {
										%>
											<tr class="odd gradeX" id="a" class="b">
												<td style="text-align:center"><%=grd.getID_ReceiptDetail()%></td>
												<td style="text-align:center"><%=grd.getPhieu_Nhap().getID_Receipt()%></td>
												<td style="text-align:center"><%=productDAO.getProduct(grd.getSan_Pham().getID_Product()).getID_Product()%></td>
												<td><%=productDAO.getProduct(grd.getSan_Pham().getID_Product()).getName_Product()%></td>
												<td style="text-align:center"><%=nf.format(grd.getPrice())%> VNĐ</td>
											    <td style="text-align:center"><%=nf.format(grd.getQuantity())%></td>
												
											
											</tr>
										<%
											}
										%>
										</tbody>
										
										<tfoot style="display:none">
				<tr><td colspan="6">Tổng vốn nhập:  <%= nf.format(count)%> </td><br>
				</tr>
			</tfoot>
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
			$('#dataTables-example5').dataTable();
		
		});
	</script> 
	 <!-- <script src="assets/js/custom.js"></script>  -->
	 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
        <script>
        window.jQuery || document.write('<script src="/TheSinh_Homeware/dist/jquery.min.js"><\/script>')
        </script>
       
        <script src="/TheSinh_Homeware/js/jQuery.print.js"></script>
        <script type='text/javascript'>
    
      /*   jQuery(function($) { 'use strict';
            $("#a").find('.bb').on('click', function() {
            	/* alert("fsdfds");  */
                $.print("#a");
            });
           
         
            
        }); */
    
        </script>
	<script>(function ( $, window, document, undefined ) {
	    var pluginName = "table2excel",

	    defaults = {
	        exclude: ".noExl",
	        name: "Table2Excel",
	        filename: "table2excel",
	        fileext: ".xls",
	        exclude_img: true,
	        exclude_links: true,
	        exclude_inputs: true,
	        preserveColors: false
	    };

	    // The actual plugin constructor
	    function Plugin ( element, options ) {
	            this.element = element;
	            // jQuery has an extend method which merges the contents of two or
	            // more objects, storing the result in the first object. The first object
	            // is generally empty as we don't want to alter the default options for
	            // future instances of the plugin
	            //
	            this.settings = $.extend( {}, defaults, options );
	            this._defaults = defaults;
	            this._name = pluginName;
	            this.init();
	    }

	    Plugin.prototype = {
	        init: function () {
	            var e = this;

	            var utf8Heading = "<meta http-equiv=\"content-type\" content=\"application/vnd.ms-excel; charset=UTF-8\">";
	            e.template = {
	                head: "<html xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:x=\"urn:schemas-microsoft-com:office:excel\" xmlns=\"http://www.w3.org/TR/REC-html40\">" + utf8Heading + "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets>",
	                sheet: {
	                    head: "<x:ExcelWorksheet><x:Name>",
	                    tail: "</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>"
	                },
	                mid: "</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body>",
	                table: {
	                    head: "<table>",
	                    tail: "</table>"
	                },
	                foot: "</body></html>"
	            };

	            e.tableRows = [];
		
				// Styling variables
				var additionalStyles = "";
				var compStyle = null;

	            // get contents of table except for exclude
	            $(e.element).each( function(i,o) {
	                var tempRows = "";
	                $(o).find("tr").not(e.settings.exclude).each(function (i,p) {
						
						// Reset for this row
						additionalStyles = "";
						
						// Preserve background and text colors on the row
						if(e.settings.preserveColors){
							compStyle = getComputedStyle(p);
							additionalStyles += (compStyle && compStyle.backgroundColor ? "background-color: " + compStyle.backgroundColor + ";" : "");
							additionalStyles += (compStyle && compStyle.color ? "color: " + compStyle.color + ";" : "");
						}

						// Create HTML for Row
	                    tempRows += "<tr style='" + additionalStyles + "'>";
	                    
	                    // Loop through each TH and TD
	                    $(p).find("td,th").not(e.settings.exclude).each(function (i,q) { // p did not exist, I corrected
							
							// Reset for this column
							additionalStyles = "";
							
							// Preserve background and text colors on the row
							if(e.settings.preserveColors){
								compStyle = getComputedStyle(q);
								additionalStyles += (compStyle && compStyle.backgroundColor ? "background-color: " + compStyle.backgroundColor + ";" : "");
								additionalStyles += (compStyle && compStyle.color ? "color: " + compStyle.color + ";" : "");
							}

	                        var rc = {
	                            rows: $(this).attr("rowspan"),
	                            cols: $(this).attr("colspan"),
	                            flag: $(q).find(e.settings.exclude)
	                        };

	                        if( rc.flag.length > 0 ) {
	                            tempRows += "<td> </td>"; // exclude it!!
	                        } else {
	                            tempRows += "<td";
	                            if( rc.rows > 0) {
	                                tempRows += " rowspan='" + rc.rows + "' ";
	                            }
	                            if( rc.cols > 0) {
	                                tempRows += " colspan='" + rc.cols + "' ";
	                            }
	                            if(additionalStyles){
									tempRows += " style='" + additionalStyles + "'";
								}
	                            tempRows += ">" + $(q).html() + "</td>";
	                        }
	                    });

	                    tempRows += "</tr>";

	                });
	                // exclude img tags
	                if(e.settings.exclude_img) {
	                    tempRows = exclude_img(tempRows);
	                }

	                // exclude link tags
	                if(e.settings.exclude_links) {
	                    tempRows = exclude_links(tempRows);
	                }

	                // exclude input tags
	                if(e.settings.exclude_inputs) {
	                    tempRows = exclude_inputs(tempRows);
	                }
	                e.tableRows.push(tempRows);
	            });

	            e.tableToExcel(e.tableRows, e.settings.name, e.settings.sheetName);
	        },

	        tableToExcel: function (table, name, sheetName) {
	            var e = this, fullTemplate="", i, link, a;

	            e.format = function (s, c) {
	                return s.replace(/{(\w+)}/g, function (m, p) {
	                    return c[p];
	                });
	            };

	            sheetName = typeof sheetName === "undefined" ? "Sheet" : sheetName;

	            e.ctx = {
	                worksheet: name || "Worksheet",
	                table: table,
	                sheetName: sheetName
	            };

	            fullTemplate= e.template.head;

	            if ( $.isArray(table) ) {
	                 Object.keys(table).forEach(function(i){
	                      //fullTemplate += e.template.sheet.head + "{worksheet" + i + "}" + e.template.sheet.tail;
	                      fullTemplate += e.template.sheet.head + sheetName + i + e.template.sheet.tail;
	                });
	            }

	            fullTemplate += e.template.mid;

	            if ( $.isArray(table) ) {
	                 Object.keys(table).forEach(function(i){
	                    fullTemplate += e.template.table.head + "{table" + i + "}" + e.template.table.tail;
	                });
	            }

	            fullTemplate += e.template.foot;

	            for (i in table) {
	                e.ctx["table" + i] = table[i];
	            }
	            delete e.ctx.table;

	            var isIE = navigator.appVersion.indexOf("MSIE 10") !== -1 || (navigator.userAgent.indexOf("Trident") !== -1 && navigator.userAgent.indexOf("rv:11") !== -1); // this works with IE10 and IE11 both :)
	            //if (typeof msie !== "undefined" && msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // this works ONLY with IE 11!!!
	            if (isIE) {
	                if (typeof Blob !== "undefined") {
	                    //use blobs if we can
	                    fullTemplate = e.format(fullTemplate, e.ctx); // with this, works with IE
	                    fullTemplate = [fullTemplate];
	                    //convert to array
	                    var blob1 = new Blob(fullTemplate, { type: "text/html" });
	                    window.navigator.msSaveBlob(blob1, getFileName(e.settings) );
	                } else {
	                    //otherwise use the iframe and save
	                    //requires a blank iframe on page called txtArea1
	                    txtArea1.document.open("text/html", "replace");
	                    txtArea1.document.write(e.format(fullTemplate, e.ctx));
	                    txtArea1.document.close();
	                    txtArea1.focus();
	                    sa = txtArea1.document.execCommand("SaveAs", true, getFileName(e.settings) );
	                }

	            } else {
	                var blob = new Blob([e.format(fullTemplate, e.ctx)], {type: "application/vnd.ms-excel"});
	                window.URL = window.URL || window.webkitURL;
	                link = window.URL.createObjectURL(blob);
	                a = document.createElement("a");
	                a.download = getFileName(e.settings);
	                a.href = link;

	                document.body.appendChild(a);

	                a.click();

	                document.body.removeChild(a);
	            }

	            return true;
	        }
	    };

	    function getFileName(settings) {
	        return ( settings.filename ? settings.filename : "table2excel" );
	    }

	    // Removes all img tags
	    function exclude_img(string) {
	        var _patt = /(\s+alt\s*=\s*"([^"]*)"|\s+alt\s*=\s*'([^']*)')/i;
	        return string.replace(/<img[^>]*>/gi, function myFunction(x){
	            var res = _patt.exec(x);
	            if (res !== null && res.length >=2) {
	                return res[2];
	            } else {
	                return "";
	            }
	        });
	    }

	    // Removes all link tags
	    function exclude_links(string) {
	        return string.replace(/<a[^>]*>|<\/a>/gi, "");
	    }

	    // Removes input params
	    function exclude_inputs(string) {
	        var _patt = /(\s+value\s*=\s*"([^"]*)"|\s+value\s*=\s*'([^']*)')/i;
	        return string.replace(/<input[^>]*>|<\/input>/gi, function myFunction(x){
	            var res = _patt.exec(x);
	            if (res !== null && res.length >=2) {
	                return res[2];
	            } else {
	                return "";
	            }
	        });
	    }

	    $.fn[ pluginName ] = function ( options ) {
	        var e = this;
	            e.each(function() {
	                if ( !$.data( e, "plugin_" + pluginName ) ) {
	                    $.data( e, "plugin_" + pluginName, new Plugin( this, options ) );
	                }
	            });

	        // chain jQuery functions
	        return e;
	    };

	})( jQuery, window, document );
</script>
    <script>
			$(function() {
				$(".exportToExcel5").click(function(e){
					/*  alert("fsdfds");  */
					var table5 =  $('.hhh5');
					/*  alert(table5.html());  */
					if(table5 && table5.length){
						
						$(table5).table2excel({
							exclude: ".noExl",
							name: "Excel Document Name",
							filename: "DanhSachSanPhamPhieuNhap",
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