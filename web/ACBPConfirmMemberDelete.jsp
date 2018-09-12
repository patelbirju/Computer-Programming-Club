<%-- 
    Document   : ACBPConfirmMemberDelete.jsp
    Created on : 16-Apr-2017, 18:16:25
    Author     : birju_000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ACBPBanner.jsp"/>
    
<h2>Do you really want to delete this member?</h2>
<table>
    <thead>
        <th>Full Name</th>
        <th>Email Address</th>
        <th>Phone</th>
        <th>Program Name</th>
        <th>Year Level</th>
    </thead>
    <tbody>
        <tr>
            <td>${member.fullName}</td>
            <td>${member.emailAddress}</td>
            <td>${member.phoneNumber}</td>
            <td>${member.programName}</td>
            <td>${member.yearLevel}</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            
            <td colspan="5">
                
            </td>
        </tr>
    </tfoot>
</table>
<a href="<c:url value='ACBPMemberAdmin'>
                                <c:param name='action' value='deleteMember' />
                                <c:param name='email' value='${member.emailAddress}' />
                             </c:url>"/>
                    <input type="button" value="Yes" class="btnYN">
                </a>
        
                <a href="<c:url value='ACBPMemberAdmin'>
                                <c:param name='action' value='displayMembers' />
                             </c:url>"/>
                    <input type="button" value="No" class="btnYN">
                </a>
    
<jsp:include page="ACBPFooter.jsp" />
