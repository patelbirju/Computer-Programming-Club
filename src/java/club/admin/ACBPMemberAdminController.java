/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package club.admin;

import club.business.Member;
import club.data.MemberDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author birju_000
 */
public class ACBPMemberAdminController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String url= "";
        String action = request.getParameter("action");
        
        if (action == null)
        {
            action = "displayMembers";
        }
        else if (action.equals("displayMembers"))
        {
            url = "/ACBPDisplayMembers.jsp";
            ArrayList<Member> members = MemberDB.selectMembers();
            request.setAttribute("members", members);
        }
        else if (action.equals("displayMember"))
        {
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            //request.setAttribute("member", member);
            session.setAttribute("member", member);
            url = "/ACBPRegister.jsp";
        }
        else if (action.equals("confirmDeleteMember"))
        {
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            request.setAttribute("member", member);
            url = "/ACBPConfirmMemberDelete.jsp";
        }
        else if (action.equals("deleteMember"))
        {
            doPost(request, response);
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
        
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
        HttpSession session = request.getSession();
        
        String url= "/ACBPRegister.jsp";
        String action = request.getParameter("action");
        String errorMessage = "";
        
        if(action.equals("addMember"))
        {
            String fullName = request.getParameter("fullName");
            String emailAddress = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            String programName = request.getParameter("program");
            String yearLevel = request.getParameter("yearLevel");
            
            if (fullName == null || fullName.trim().equals(""))
            {
                fullName = "";
                errorMessage+= "You must enter a valid name" + "<br>";
            }
            if (emailAddress == null || emailAddress.equals(""))
            {
                emailAddress = "";
                errorMessage+= "You must enter a valid email" + "<br>";
            }
            else if(MemberDB.emailExists(emailAddress))
            {
                errorMessage+= "This email address is already taken" + "<br>";
            }
            if (phoneNumber == null)
            {
                phoneNumber = "";
            }
            Member member = new Member(fullName, emailAddress);
            member.setPhoneNumber(phoneNumber);
            member.setProgramName(programName);
            member.setYearLevel(Integer.parseInt(yearLevel));
            
            request.setAttribute("member_error", member);
            request.setAttribute("errorMessage", errorMessage);
            
            if (errorMessage.equals(""))
            {
                MemberDB.insert(member);
                ArrayList<Member> members = MemberDB.selectMembers();
                request.setAttribute("members", members);
                url = "/ACBPDisplayMembers.jsp";
            }
        }
        
        else if(action.equals("updateMember"))
        {
            String fullName = request.getParameter("fullName");
            String emailAddress = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            String programName = request.getParameter("program");
            String yearLevel = request.getParameter("yearLevel");
            Member member = (Member) session.getAttribute("member");
            
            if (fullName != null && emailAddress != null)
            {
                if(!member.isValid())
                {
                    errorMessage+= "Member information is not valid. You must enter a valid name and email." + "<br>";
                }
            }
            else if (fullName == null || emailAddress == null)
            {
                errorMessage+= "Member information is not valid. You must enter a valid name and email." + "<br>";
            }
            
            if (phoneNumber == null)
            {
                phoneNumber = "";
            }
            
            member.setFullName(fullName);
            member.setEmailAddress(emailAddress);
            member.setPhoneNumber(phoneNumber);
            member.setProgramName(programName);
            member.setYearLevel(Integer.parseInt(yearLevel));
            
            if (errorMessage.equals(""))
            {
                if(MemberDB.emailExists(emailAddress))
                {
                    MemberDB.update(member);
                }
                else
                {
                    MemberDB.insert(member);
                }

                ArrayList<Member> members = MemberDB.selectMembers();
                request.setAttribute("members", members);
                url = "/ACBPDisplayMembers.jsp";
            }
            else
            {
                request.setAttribute("member", member);
                request.setAttribute("errorMessage", errorMessage);
                url = "/ACBPRegister.jsp?action=displayMember";
            } 
        }
        
        else if (action.equals("deleteMember"))
        {
            String emailAddress = request.getParameter("email");
            Member member = MemberDB.selectMember(emailAddress);
            MemberDB.delete(member);
            ArrayList<Member> members = MemberDB.selectMembers();
            
            request.setAttribute("members", members);
            url = "/ACBPDisplayMembers.jsp";
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
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
