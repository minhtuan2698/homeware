<%@page import="Model.KetQuaBH"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css"
      integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link rel="stylesheet" href="../Css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <style><%@include file="../Css/BaoHanh.css"%></style>  --%>
<link href="css/BaoHanh.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>TS-HOMEWARE | Bảo hành</title>
</head>
<body>
    <script>
     	$(document).ready(function() {
     		$("#btn-check").click(function() {
     			var seri = $("#text_seri").val();
     			$.ajax({
					type:"post",
					url:"/TheSinh_Homeware/CheckSeri",
					data:{
						seri : seri
					},success:(function(response){
						var a = response.split("-");
						$("#productName").html(a[0]);
						$("#seriNumber").html(a[1]);
						$("#date1").html(a[2]);
						$("#date2").html(a[3]);
						
						 if(a[3] == 0){
							$("#date2").html("Không bảo hành");
							$("#date2").css('color','red');
							$("#th").css('display','none');
						
						}else{
							$("#th").css('display','block');
						}
						 if(a[4] == 1){
							$("#date3").html("Đã kích hoạt");
							$("#date3").css('color','green');
						}else{
							$("#date3").html("Chưa kích hoạt");
							$("#date3").css('color','red');
						}
						 if(a[1] == 0){
								$("#po").css('display','none');
								$("#po1").css('display','none');
								$("#lk").css('display','block');
								$("#lk").html("SỐ SERI NÀY KHÔNG TỒN TẠI");
							}else{
								$("#po").css('display','block');
								$("#po1").css('display','block');
								$("#lk").css('display','none');
								
							}
						
						$("#id03").modal();
					})
				}); 
     		});
     	});
	 </script>
	 <div class="Bh">
		<jsp:include page="header.jsp"></jsp:include>
		</div>
	<section style="margin-top: 0" id="page-content">
        
        <div class="container">
            <!-- Form nhập nội dung bảo hành -->
            <div class="center-content">
                <h3>TRUNG TÂM BẢO HÀNH TS-HOMEWARE</h3>
                <p>Tất cả trung tâm bảo hành ủy quyền TS-HOMEWARE trên toàn quốc đều được đào tạo và chỉ sử dụng linh kiện chính hãng TS-HOMEWARE trong mọi hoạt động sửa chữa.</p>
                <p>Tra cứu hạn bảo hành (<i>Nhập số seri, sau đó click tra cứu để lấy dữ liệu</i>).</p>
                <div class="check-bh">
                    <input id="text_seri" type="text" placeholder="Nhập số seri"> 
                    <button id="btn-check" class="btn btn-info btn-lg"><i class="fas fa-search"></i></button>
                </div>
                <br>
                <a data-toggle="collapse" href="#demo" role="button" aria-expanded="false" aria-controls="collapseExample">
                        >>> Chính sách bảo hành của TS-HOMEWARE
                </a>
                
            </div>
            
            <!-- Chính sách bảo hành -->
            <div id="demo" class="bottom-content collapse">
                <h2>Chính sách bảo hành nhóm hàng gia dụng tại TS-HOMEWARE</h2>
                <p>(Nhóm hàng điện gia dụng bao gồm: lò nướng, bếp các loại, máy xay/ép, bàn ủi, nồi cơm điện, lẩu
                    điện, bình siêu tốc, quạt,...)</p>
                <h3>1. Điều kiện để được bảo hành</h3>
                <ul>
                    <li>Đối với sản phẩm không dán tem bảo hành điện tử: Sản phẩm sẽ có tem bảo hành, phiếu bảo
                            hành kèm theo (Phiếu bảo hành phải còn thời hạn bảo hành và ghi đầy đủ thông tin: model, số serial,
                            tên khách hàng, ngày mua hàng), hoặc giấy tờ chứng minh được sản phẩm còn thời hạn bảo hành.</li>
                    <li>Trường hợp mất phiếu bảo hành, phiếu bảo hành không hợp lệ hoặc mất Giấy tờ chứng minh sản phẩm còn
                            bảo hành: sản phẩm vẫn được bảo hành miễn phí nếu sản phẩm còn trong thời hạn bảo hành. Thời hạn bảo
                            hành sản phẩm được tính như sau:</li>
                </ul>
                <p>(Ngày sản xuất được in trên tem bảo hành sản phẩm).</p>
                <h3>2. Điều kiện từ chối bảo hành</h3>
                <p>Trung tâm bảo hành của Công ty và các Trung tâm bảo hành ủy quyền sẽ từ chối bảo hành đối với các sản
                    phẩm thuộc trường hợp sau:
                </p>
                <ul>
                    <li>Sản phẩm không có tem bảo hành khi sửa chữa lần đầu tiên hoặc tem bị rách (có dấu hiệu đã mở sản
                        phẩm)</li>
                    <li>Sản phẩm bị hư hỏng do các trường hợp bất khả kháng như: thiên tai, lũ lụt, hỏa hoạn…</li>
                    <li>Sản phẩm hư hỏng do sử dụng sai nguồn điện, các mối tiếp điện không tốt, nguồn nước bị ô nhiễm …</li>
                    <li>Sản phẩm sử dụng không đúng theo hướng dẫn, lắp đặt sai quy cách quy định của Nhà sản xuất.</li>
                    <li>Sản phẩm bị thay đổi, điều chỉnh của bên thứ 3 không thuộc hệ thống bảo hành của SUNHOUSE.</li>
                    <li>Sản phẩm bị mối mọt, oxy hóa, hoen rỉ …do đặt trong môi trường ẩm ướt, bảo quản không đúng cách.</li>
                    <li>Sản phẩm bị cong vênh, rạn nứt, trầy xước, bể vỡ….</li>
                    <li>Sản phẩm hết hạn bảo hành theo thời hạn được ghi trên phiếu bảo hành.</li>
                </ul>
               
                <p>Lưu ý: Không bảo hành phụ kiện sản phẩm</p>
                <h3>3. Sản phẩm hết hạn bảo hành</h3>
                <p>- Các sản phẩm hết hạn bảo hành được quy định là các sản phẩm ngoài điều kiện bảo hành thi
                    sẽ áp dụng tính phí theo bảng giá phí dịch vụ đính kèm SH-BH-CSBH-01-PL01( Áp dụng cho
                    các sản phẩm hết hạn bảo hành thuộc các ngành hàng : Điện gia dụng, Thiết bị nhà bếp, Điện tử- Điện
                    lạnh( Trừ sản phẩm điều hòa không khí)).</p>
                <p>- Sản phẩm điều hòa không khí hết hạn bảo hành được quy định là sản phẩm điều hòa không khí ngoài điều
                    kiện bảo hành thì sẽ áp dụng tính phí theo bảng giá dịch vụ đính kèm SH-BH-CSBH-01-PL03.
                </p>

                <h3>4. Thời gian sửa chữa</h3>
                <ul>
                    <li>Thời gian sửa chữa trung bình là 02 ngày làm việc (1) tính từ lúc nhận hàng của khách hàng
                        đến lúc P.CSKH&BHSP sửa xong cho khách hàng.</li>
                    <li>Thời gian sửa chữa tối đa: 10 ngày làm việc đối với những trường hợp đặc biệt (2).</li>
                </ul>

                <p><b>Lưu ý:</b></p>
                <ul>
                    <li>(1) Ngày làm việc là thời gian làm việc theo quy định của Trung tâm bảo hành không bao gồm các ngày nghỉ, ngày lễ, tết.</li>
                    <li>(2) Trường hợp đặc biệt: là những sản phẩm đổi mới, giảm trừ công nợ, sản phẩm đã dừng sản xuất, phân phối sau thời gian 01 năm, hoặc các sản phẩm cần có chế độ theo dõi kiểm tra nhiều ngày, sản phẩm lỗi chập chờn…có thời gian bảo hành lâu hơn và có thông báo cụ thể khi phát sinh.</li>
                </ul>
            </div>
            
        </div>
        <div>
            <img width="100%" src="images/home/hotline.png" alt="">
        </div>

    </section>
    
    <div id="id03" class="modal fade" role="dialog">
    <div class="modal-dialog">
		          <form class="modal-content animate" >
		            <div class="imgcontainer modal-header">
		              <!-- <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span> -->
		              <h3 style="color: #219AFC;text-align:center;font-weight:bold">TRA CỨU HẠN BẢO HÀNH</h3>
		            </div>
		            <div id="lk" style="display:none; text-align:center; font-weight:bold; color:red; margin-top:25px; margin-bottom:25px"></div>
		            
		            <div id="po1"  class="container-1">
		            	<p style="text-align:center"><b>Chào quý khách</b></p>
		            	<p style="text-align:center">Cảm ơn quý khách đã sử dụng sản phẩm của <span style="color:red">TS-HOMEWARE</span>.</p>
		            	
		            </div>
		        
		            <div id="po" class="container-1">
		              <label for="uname"><b>Tên sản phẩm: </b></label>
		              <span id="productName" class="show-bh" style="float: right;"></span>
		              <br>
						
		              <label for="uname"><b>Số seri: </b></label>
		              <span id="seriNumber"  class="show-bh" style="float: right;"></span>
		              <br>
		              
		              <label for="uname"><b>Ngày mua: </b></label>
		              <span id="date1"  class="show-bh" style="float: right; "></span>
		              <br>
		              
		              <label for="uname"><b>Hạn bảo hành: </b></label>
		              <div  class="show-bh" style="float: right; color: red;"><span id="date2" style="margin-right:3px"> </span> <span id="th" style="float: right;"> tháng</span></div>
		              
		              <br>
		              
		              <label for="uname"><b>Tình trạng kích hoạt: </b></label>
		              <span  class="show-bh" id="date3" style="float: right; color: red;"> </span>
		              <br>
		                
		              <button onclick="document.getElementById('id03').style.display='none'" id="btn-nhanbh" style="background-color: #219AFC; margin: 20px 180px; padding:10px 100px;border-radius:20px; font-weight:bold; color: white;">Xong</button>
		              
		            </div>		       
		          </form>
		           </div>
    </div>
   
   	<jsp:include page="footer.jsp"></jsp:include>
</body>
<style>
.Bh .baohanh-header{
	display:none;
}
.container-1 label{
margin-left:15%;
}
.container-1 .show-bh{
margin-right:15%;
}
</style>
</html>