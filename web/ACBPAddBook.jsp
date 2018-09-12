<%-- 
    Document   : ACBPAddBook
    Created on : 08-Mar-2017, 23:38:24
    Author     : birju_000
--%>

    <jsp:include page="ACBPBanner.jsp"/>
    
    <h2>Add Book</h2>
    <p class="required"><i>${errorMessage}</i></p>
    <form action="ACBPAddBook" method="post">        
         <label>Code:</label>
         <input type="text" id="bookCode" class="bookCodeInput" name="bookCode" value="${bookCode}"><br>
         <label>Description:</label>
         <input type="text" id="bookDescription" class="descriptionInput" name="bookDescription" value="${bookDescription}"><br>
         <label>Quantity:</label>
         <input type="text" id="bookQuantity" class="qtyInput" name="bookQuantity" value="${bookQuantity}"><br>
           
        <input type="submit" class="margin_left" value="Save">
        <a href="ACBPDisplayBooks"><input type="button" value="Cancel"></a>
    </form>
    
    <jsp:include page="ACBPFooter.jsp"/>

