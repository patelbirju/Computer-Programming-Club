<%-- 
    Document   : ACBPDisplayBooks
    Created on : 08-Mar-2017, 20:11:10
    Author     : birju_000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="ACBPBanner.jsp"/>
    <h2>List of Books</h2>
    <span>${error}</span>
    
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
        </tr>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.code}</td>
                <td>${book.description}</td>
                <td>${book.quantity}</td>
            </tr>
        </c:forEach>
    </table>
    
    <a href="ACBPAddBook.jsp"><input type="button" value="Add Book"></a>
    
    <jsp:include page="ACBPFooter.jsp"/>

