<%-- 
    Document   : ACBPDisplayMember
    Created on : 04-Feb-2017, 03:17:17
    Author     : birju_000
--%>


        <jsp:include page="ACBPBanner.jsp"/>
        
        <h2>Thanks for joining our club!</h2>
        <p>Here is the information you entered:</p>
        
        <form action="ACBPRegister.jsp">
            <b>Full Name:</b>${param.fullName}<br>
            <b>Email:</b>${param.email}<br>
            <b>Phone:</b>${param.phone}<br>
            <b>IT Program:</b>${param.program}<br>
            <b>Year Level:</b>${param.yearLevel}<br>
            
            <p>To register another member, click on the Back button in your browser or the Return button shown below.</p>
            
            <input type="submit" value="Return">
        </form>
        
        <jsp:include page="ACBPFooter.jsp"/>
    