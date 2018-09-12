<%-- 
    Document   : ACBPDisplayMembers.jsp
    Created on : 16-Apr-2017, 00:23:25
    Author     : birju_000
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ACBPBanner.jsp"/>
        
<h2>List of Members</h2>

<table>
        <tr>
            <th>Email</th>
            <th>Program</th>
            <th>Year</th>
        </tr>
        <c:forEach var="member" items="${members}">
            <tr>
                <td>${member.emailAddress}</td>
                <td>${member.programName}</td>
                <td>${member.yearLevel}</td>   
                <td><a href="<c:url value='ACBPMemberAdmin'>
                       <c:param name='action' value='displayMember' />
                       <c:param name='email' value='${member.emailAddress}' />
                   </c:url>"/>
                Update</a>
                </td>
                <td><a href="<c:url value='ACBPMemberAdmin'>
                       <c:param name='action' value='confirmDeleteMember' />
                       <c:param name='email' value='${member.emailAddress}' />
                   </c:url>"/>
                Delete</a>
                </td>
            </tr>
        </c:forEach>
</table><br>
<a href="<c:url value='ACBPRegister.jsp'>
                       <c:param name='action' value='addMember' />
                   </c:url>"/>
                <input type="button" value="Add Member"></a>
        
<jsp:include page="ACBPFooter.jsp"/>
