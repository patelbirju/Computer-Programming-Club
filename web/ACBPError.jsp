<%-- 
    Document   : ACBPError
    Created on : Mar 9, 2017, 5:21:53 PM
    Author     : acarreiro-cc
--%>


    <jsp:include page="ACBPBanner.jsp"/>

    <h1>Java Error</h1>
    <p>Sorry, Java has thrown an exception.</p>
    <p>To continue, click the Back button.</p>

    <h2>Details</h2>
    <p>Type: ${pageContext.exception["class"]}</p>
    <p>Message: ${pageContext.exception.message}</p>
       
    <jsp:include page="ACBPFooter.jsp"/>

