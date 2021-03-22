<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
</head>
<body>
   <form action="${initParam['posturl']}" method="POST">
      <input type="hidden" name="upload" value="1" />
      <input type="hidden" name="return" value="${initParam['returnurl']}" />
      <input type="hidden" name="cmd" value="_cart" />
      <input type="hidden" name="business" value="${initParam['business']}" />
      
      <input type="text" name="item_name_1" value="Product 1" />
      <input type="text" name="amount_1" value="10" />
      <input type="text" name="quantity_1" value="1" />
      <input type="submit" value="Payment" />
   
   </form>
</body>
</html>