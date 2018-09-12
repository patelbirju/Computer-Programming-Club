/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package club.admin;

import club.business.Book;
import club.data.BookIO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author birju_000
 * AddBook servlet
 */
public class ACBPAddBookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/ACBPAddBook.jsp";
        String errorMessage = "";
        
        String bookCode = request.getParameter("bookCode");
        String bookDescription = request.getParameter("bookDescription");
        String bookQuantity = request.getParameter("bookQuantity");
        
        if(bookCode == "" || bookCode == null)
        {
            errorMessage += "Book code is required" + "<br>";
        }
        if(bookDescription == null)
        {
            bookDescription = "";
        }
        
        if(bookDescription.length() < 2)
        {
            errorMessage += "Description must have at least 2 characters" + "<br>";
        } 
        
        if(bookQuantity != null)
        {
             if(Integer.parseInt(bookQuantity) <= 0 || bookQuantity == "")
            {
                errorMessage += "Quantity must be a positive number";
            }
        }
        else
        {
            errorMessage += "Book quantity required";
        }
       
        Book book =  new Book(bookCode, bookDescription, Integer.parseInt(bookQuantity));
        if(errorMessage != "")
        {
            request.setAttribute("book", book);
            request.setAttribute("errorMessage", errorMessage);
            
            //Restoring the values
            request.setAttribute("bookCode", bookCode);
            request.setAttribute("bookDescription", bookDescription);
            request.setAttribute("bookQuantity", bookQuantity);
            
        }
        else
        {
            ServletContext context = getServletContext();
            String path = context.getRealPath("/WEB-INF/books.txt");
            BookIO.insert(book, path);
            url = "/ACBPDisplayBooks.jsp";
            
            ArrayList<Book> books = BookIO.getBooks(path);
            request.setAttribute("books", books);
        }
       
         getServletContext()
                 .getRequestDispatcher(url)
                 .forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
