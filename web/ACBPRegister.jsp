<%-- 
    Document   : ACBPRegister.jsp
    Created on : 04-Feb-2017, 02:25:01
    Author     : birju_000
--%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:include page="ACBPBanner.jsp"/>
        
        <section>
            <h3>New Member Registration Form</h3>
            <span class="required"><i>${errorMessage}</i></span>
            <form action="ACBPMemberAdmin" method="POST">
                     <c:if test="${param['action'] eq 'displayMember'}">
                         <input type="hidden" name="action" value="updateMember">
                         <label class="fldInput">Full Name:</label>
                         <input type="text" class="fullNameInput" name="fullName" value="${member.fullName}" required=""><br>
                         <label class="fldInput">Email:</label>
                         <input type="email" class="emailInput" name="email" value="${member.emailAddress}"><br>
                         <label class="fldInput">Phone:</label>
                         <input type="text" class="phoneInput" name="phone" value="${member.phoneNumber}"><br>
                         <label class="fldInput">IT Program:</label>
                         <select name="program" value="${member.programName}" class="fldInput">
                             <option value="CAD" ${member.programName == 'CAD' ? 'selected' : ''}>CAD</option>
                             <option value="CP" ${member.programName == 'Cp' ? 'selected' : ''}>CP</option>
                             <option value="CPA" ${member.programName == 'CPA' ? 'selected' : ''}>CPA</option>
                             <option value="ITID" ${member.programName == 'ITID' ? 'selected' : ''}>ITID</option>
                             <option value="ITSS" ${member.programName == 'ITSS' ? 'selected' : ''}>ITSS</option>
                             <option value="MSD" ${member.programName == 'MSD' ? 'selected' : ''}>MSD</option>
                         </select><br>
                         <label class="fldInput">Year Level:</label>
                         <select name="yearLevel" value="${member.yearLevel}" class="fldInput">
                             <option value="1" ${member.yearLevel == '1' ? 'selected' : ''}>1</option>
                             <option value="2" ${member.yearLevel == '2' ? 'selected' : ''}>2</option>
                             <option value="3" ${member.yearLevel == '3' ? 'selected' : ''}>3</option>
                             <option value="4" ${member.yearLevel == '4' ? 'selected' : ''}>4</option>
                         </select><br>
                     </c:if>
                     <c:if test="${param['action'] eq 'addMember'}">
                         <input type="hidden" name="action" value="addMember">
                         <label class="fldInput">Full Name:</label>
                         <input type="text" class="fullNameInput" name="fullName" required="" value="${member_error.fullName}"><br>
                         <label class="fldInput">Email:</label>
                         <input type="email" class="emailInput" name="email" value="${member_error.emailAddress}"><br>
                         <label class="fldInput">Phone:</label>
                         <input type="text" class="phoneInput" name="phone" value="${member_error.phoneNumber}"><br>
                         <label class="fldInput">IT Program:</label>
                         <select name="program"  class="fldInput">
                             <option value="CAD" ${member_error.programName == 'CAD' ? 'selected' : ''}>CAD</option>
                             <option value="CP" ${member_error.programName == 'Cp' ? 'selected' : ''}>CP</option>
                             <option value="CPA" ${member_error.programName == 'CPA' ? 'selected' : ''}>CPA</option>
                             <option value="ITID" ${member_error.programName == 'ITID' ? 'selected' : ''}>ITID</option>
                             <option value="ITSS" ${member_error.programName == 'ITSS' ? 'selected' : ''}>ITSS</option>
                             <option value="MSD" ${member_error.programName == 'MSD' ? 'selected' : ''}>MSD</option>
                         </select><br>
                         <label class="fldInput">Year Level:</label>
                         <select name="yearLevel"  class="fldInput">
                             <option value="1" ${member_error.yearLevel == '1' ? 'selected' : ''}>1</option>
                             <option value="2" ${member_error.yearLevel == '2' ? 'selected' : ''}>2</option>
                             <option value="3" ${member_error.yearLevel == '3' ? 'selected' : ''}>3</option>
                             <option value="4" ${member_error.yearLevel == '4' ? 'selected' : ''}>4</option>
                         </select><br>
                     </c:if>
                <input type="submit" class="margin_left" value="Save">
                <input type="reset" value="Reset">              
            </form>
        </section>    
        <jsp:include page="ACBPFooter.jsp"/>
    
