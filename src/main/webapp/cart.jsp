<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
</head>
<body>

<h1>Your cart</h1>
<table border="1" cellpadding="5">
  <tr>
    <th>Quantity</th>
    <th>Description</th>
    <th>Price</th>
    <th>Total</th>
  </tr>
	<c:forEach var="item" items="${cart.items}">
	  <tr>
	    <td>
	      <form action="" method="post">
	        <input type="hidden" name="productId" 
	               value="<c:out value='${item.product.id}'/>">
	        <input type=text name="quantity" 
	               value="<c:out value='${item.quantity}'/>" id="quantity">
	        <input type="submit" value="Update">
	      </form>
	    </td>
	    <td><c:out value='${item.product.description}'/></td>
	    <td>${item.product.priceCurrencyFormat}</td>
	    <td>${item.totalCurrencyFormat}</td>
	    <td>
	      <form action="" method="post">
	        <input type="hidden" name="productId" 
	               value="<c:out value='${item.product.id}'/>">
	        <input type="hidden" name="quantity" value="0">
	        <input type="submit" value="Remove Item">
	      </form>
	    </td>
	  </tr>

</c:forEach>
</table>

<p><b>To change the quantity</b>, enter the new quantity 
      and click on the Update button.</p>
  
<form action="." method="post">
  <input type="hidden" name="action" value="shop">
  <input type="submit" value="Continue Shopping">
</form>


</body>
</html>
