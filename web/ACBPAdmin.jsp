<%-- 
    Document   : ACBPAmin
    Created on : 08-Mar-2017, 19:24:11
    Author     : birju_000
--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="ACBPBanner.jsp"/>
    
    <h2>Admin: Data Maintenance</h2>
    <a href="ACBPDisplayBooks">Maintain Books</a><br>
    <a href="<c:url value='ACBPMemberAdmin'>
                       <c:param name='action' value='displayMembers' /> 
                   </c:url>"/>
    Display Members</a>
    
    <jsp:include page="ACBPFooter.jsp" />

