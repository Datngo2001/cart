<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>JDBC</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    
<h1>Laptop list</h1>
<table>
    <tr>
        <th>Description</th>
        <th class="right">Price</th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="item" items="${listProduct}">
    <tr>
        <td>${item.description}</td>
        <td class="right">${item.getPriceCurrencyFormat()}</td>
        <td>
        	<form action="${pageContext.request.contextPath}/CartController" method="post">
            	<input type="hidden" name="productId" value="${item.id}">
                <input type="submit" value="Add To Cart">
            </form>
        </td>
    </tr>
    </c:forEach>
</table>
        
</body>
</html>
    
