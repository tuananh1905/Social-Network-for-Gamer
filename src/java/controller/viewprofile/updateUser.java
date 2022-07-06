/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.viewprofile;

import dao.UserDao;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import modal.User;

/**
 *
 * @author duynh
 */
@WebServlet(name = "updateUser", urlPatterns = {"/updateUser"})
@MultipartConfig(maxFileSize = 16177215)
public class updateUser extends HttpServlet {

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
        User user = (User) session.getAttribute("account");
        UserDao db = new UserDao();
//        ArrayList<User> userAccount = db.getProfile(user.getID());
        ArrayList<User> userAccount = db.getProfile(user.getID());
        request.setAttribute("userAccount", userAccount.get(0));
        request.getRequestDispatcher("view/Profile/UpdateUser.jsp").forward(request, response);
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
        String Displayname = request.getParameter("newDis");
        String Gender = request.getParameter("newGeneder");
        HttpSession session = request.getSession();
        User current = (User) session.getAttribute("account");
        String oldpassword = request.getParameter("oldPassword");
        String newpass = request.getParameter("newPassword");
        String newpass2nd = request.getParameter("newPassword2");
        Date newUserDob = Date.valueOf(request.getParameter("newuDate"));
        if (!oldpassword.equals(current.getPassword()) || !newpass.equals(newpass2nd)) {
            request.getRequestDispatcher("view/Profile/UpdateUser.jsp").forward(request, response);
        } else {
            UserDao db = new UserDao();
            User update = new User();
            update.setDisplayname(Displayname);
            update.setGender(Gender);
            update.setPassword(newpass);
            update.setDob(newUserDob);
            InputStream inputStream = null;
            String message = null;
            List<Part> fileParts = request.getParts().stream().filter(part -> "photo".equals(part.getName()) && part.getSize() > 0)
                    .collect(Collectors.toList());
            for (Part filePart : fileParts) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                InputStream fileContent = filePart.getInputStream();
                db.updatebasicprofile(current.getID(), update,fileContent);
            }
            request.getRequestDispatcher("view/Profile/userProfile.jsp").forward(request, response);
        }

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
