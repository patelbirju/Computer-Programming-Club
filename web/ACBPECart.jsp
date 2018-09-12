<%-- 
    Document   : ACBPECart
    Created on : Mar 23, 2017, 8:14:32 PM
    Author     : Bpatel0967
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ACBPBanner.jsp"/>

<table>
    <thead>
        <tr>
            <th class="titleCenter" colspan="3">Your Loan Cart</th>
        </tr>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="total"  value="0"/>  
        <c:forEach var="book" items="${cartitems}">
            <tr>
                <td>${book.code}</td>
                <td>${book.description}</td>
                <td class="totalQty">${book.quantity} </td>
            </tr>
        <c:set var="total" value="${book.quantity + total}"/>  
        </c:forEach>
    </tbody>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="totalQty">Total:</td>
                <td colspan="3" class="totalQty" ><c:out value="${total}" /></td>
            </tr>   
</table>
       

<a href="ACBPClearCart">Clear the cart</a><br>
<a href="ACBPLoan">Return to eLoan</a>
            
      
 <jsp:include page="ACBPFooter.jsp"/>
