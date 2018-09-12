<%-- 
    Document   : ACBPELoan
    Created on : Mar 23, 2017, 6:27:50 PM
    Author     : Bpatel0967
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ACBPBanner.jsp"/>
 

<table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>QOH</th>
            <th>Action</th>
        </tr>
        <c:forEach var="book" items="${loanitems}">
            <tr>
                <td>${book.code}</td>
                <td>${book.description}</td>
                <td>${book.quantity}</td>
                
            <input type="hidden" value="${book.code}" name="bookCode">
            <c:if test="${book.quantity == 0}">               
                <td>N/A</td>
            </c:if>
            <c:if test="${book.quantity != 0}">
                <td><a href="<c:url value='ACBPCart'>
                       <c:param name='action' value='reserve' />
                       <c:param name='bookCode' value='${book.code}' />    
                       
                   </c:url>"/>
                Reserve</a>
            </td>
            </c:if>               
            
            </tr>
        </c:forEach>
</table>



 <jsp:include page="ACBPFooter.jsp"/>
