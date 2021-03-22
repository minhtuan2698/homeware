 <%@page import="Model.KetQuaBH"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>TS-HOMEWARE | Bảo Hành</title>
</head>
<body>
    <script>
     	$(document).ready(function() {
     		$("#btn-check").click(function() {
     			var seri = $("#text_bh").val();
     			$.ajax({
					type:"post",
					url:"/TheSinh_Homeware/CheckBH",
					data:{
						seri : seri
					},success:(function(response){
						var a = response.split(".");
						$("#productName").html(a[0]);
						$("#seriNumber").html(a[1]);
						$("#date1").html(a[2] + " ngày");
						if(a[3] == 1){
							$("#date3").html("Đã nhận");
							$("#date3").css('color','green');
						}else if(a[3] == 2){
							$("#date3").html("Đang sửa chữa");
							$("#date3").css('color','red');
						}else if(a[3] == 3){
							$("#date3").html("Đã sửa xong");
							$("#date3").css('color','orange');
						}else{
							$("#date3").html("Đã giao");
							$("#date3").css('color','blue');
						}
						 if(a[3] == 0){
								$("#poo").css('display','none');
								$("#poo1").css('display','none');
								$("#lkk").css('display','block');
								$("#lkk").html("MÃ BẢO HÀNH NÀY KHÔNG TỒN TẠI");
							}else{
								$("#poo").css('display','block');
								$("#poo1").css('display','block');
								$("#lkk").css('display','none');
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
        <!-- Đường dẫn trang -->
       
        <div class="container">
            <!-- Form nhập nội dung bảo hành -->
            <div class="center-content">
                <h3>TRUNG TÂM BẢO HÀNH TS-HOMEWARE</h3>
                <p>Tất cả trung tâm bảo hành ủy quyền TS-HOMEWARE trên toàn quốc đều được đào tạo và chỉ sử dụng linh kiện chính hãng TS-HOMEWARE trong mọi hoạt động sửa chữa.</p>
                <p>Tra cứu đơn sản phẩm bảo hành của bạn (<i>Nhập đơn bảo hành, sau đó click tra cứu để lấy dữ liệu</i>).</p>
                <div class="check-bh">
                    <input id="text_bh" type="text" placeholder="Nhập mã bảo hành"> 
                    <button id="btn-check" ><i class="fas fa-search"></i></button>
                </div>
                <br>               
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
		         <!--      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span> -->
		              <h3 style="color: #219AFC;text-align:center;font-weight:bold">TRA CỨU ĐƠN BẢO HÀNH</h3>
		            </div>
		              <div id="lkk" style="display:none; text-align:center; font-weight:bold; color:red; margin-top:25px; margin-bottom:25px"></div>
		            
		            <div id="poo1" class="container-12">
		            	<p style="text-align:center"><b>Chào quý khách</b></p>
		            	<p style="text-align:center">Cảm ơn quý khách đã sử dụng sản phẩm của <span style="color:red">TS-HOMEWARE</span>.
		            	 <br> Bên dưới là thông tin đơn bảo hành của quý khách !</p>
		            </div>
		        
		            <div id="poo" class="container-12">
		              <label for="uname"><b>Ngày nhận: </b></label>
		              <span id="productName" class="show-bh12"  style="float: right;"></span>
		              <br>
						
		              <label for="uname"><b>Ngày trả: </b></label>
		              <span id="seriNumber" class="show-bh12"  style="float: right"></span>
		              <br>
		              
		              <label for="uname"><b>Thời gian dự kiến: </b></label>
		              <span id="date1" class="show-bh12"  style="float: right"></span>
		              <br>
		              
		              
		              <label for="uname"><b>Tình trạng: </b></label>
		              <span id="date3" class="show-bh12"  style="float: right; color: red;"> </span>
		              <br>
		                
		              <button onclick="document.getElementById('id03').style.display='none'" id="btn-nhanbh" style="background-color: #219AFC; margin-top: 35px; padding: 10px 160px; margin: 20px 110px;border-radius:20px; font-weight:bold; color: white">Xong</button>
		              
		            </div>		       
		          </form>
    </div>
        </div>
    
   
    	<jsp:include page="footer.jsp"></jsp:include>
</body>
<style>
.container-12 label{
margin-left:25%;
}
.container-12 .show-bh12{
margin-right:25%;
}
</style>
</html>