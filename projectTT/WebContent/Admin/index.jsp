<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin TS-Homeware</title>

<link href="/TheSinh_Homeware/Admin/assets/css/bootstrap.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/font-awesome.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<link href="/TheSinh_Homeware/Admin/assets/css/custom.css"
	rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<%
		if (session.getAttribute("memberSession") == null) {
			response.sendRedirect("/TheSinh_Homeware/account.jsp");
		}
	%>
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<jsp:include page="content.jsp"></jsp:include>
	</div>
</body>
</html>