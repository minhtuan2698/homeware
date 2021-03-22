<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.TinhTrangDAO"%>
<%@page import="Model.TinhTrang"%> 
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
<title>TS-HOMEWARE | Chi tiết bảo hành</title>
</head>
<body>
	<div class="Bh">
		<jsp:include page="header.jsp"></jsp:include>
		</div>
	<section style="background: white;">
		<!-- Đường dẫn trang -->
        <div style="background-color: #e9f4f5">
            <div class="top-content container">
                       <a href="">Trang chủ</a> > <a href="">Bảo hành</a> > <a href="">Chi tiết bảo hành</a>
            </div>    
        </div>
        <div class="container">
            <!-- Form nhập nội dung bảo hành -->
            <div class="center-content">
                <h3>TÌNH TRẠNG BẢO HÀNH</h3>
                <p>Vui lòng thêm tình trạng bảo hành.</p>
                <label><b>Chọn tình trạng: </b></label>
                <br>
		        <select id="cmbTinhTrang" style=" width:50%; padding: 5px 0px; border: 1px solid lightgray; border-radius: 5px;">
													 <% 	TinhTrang tt =new TinhTrang();
														TinhTrangDAO ttDAO= new TinhTrangDAO();
														List<TinhTrang> listtt= new ArrayList<>();
														listtt= ttDAO.listTinhTrangs();
														for(int i=0;i<listtt.size();i++){ 
														
													%>
						 							 <option value=" <%=listtt.get(i).getId()%>" ><%=listtt.get(i).getTentinhtrang()%></option> 
													
				</select>
		        <br>
						
		        <label style="margin-top: 20px; margin-bottom: 5px"><b>Thời gian sửa dự kiến</b></label>
		       <p><%=listtt.get(i).getThoigiansuachua()%></p> 
      			<%
														} 
													%> 
		        <button style="background-color: #4CAF50; padding: 10px 20px; border: 0; border-radius: 5px; color: white;" type="submit">Hoàn tất</button>
            </div>
        </div>
        <div>
           <img width="100%" src="images/home/hotline.png" alt="">
        </div>
	</section>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>