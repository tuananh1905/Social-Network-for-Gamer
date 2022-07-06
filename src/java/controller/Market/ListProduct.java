/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Market;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Game;
import modal.Product;
import modal.User;

/**
 *
 * @author LENNOVO
 */
@WebServlet(name = "ListProduct", urlPatterns = {"/listproduct"})
public class ListProduct extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String raw_page = request.getParameter("page");
//        ProductDBcontext dbProduct = new ProductDBcontext();
//        if (raw_page == null || raw_page.trim().length() == 0) {
//            raw_page = "1";
//        }
//        int products = dbProduct.countProduct();
//        int totalpage = (products % 10 == 0) ? (products / 10) : (products / 10) + 1;
//        int page = Integer.parseInt(raw_page);
//        GameDBContext dbGame = new GameDBContext();
//        UserDBContext dbUser = new UserDBContext();
//        ArrayList<Product> p = dbProduct.getProduct(2);
//        ArrayList<Game> g = dbGame.listGame();
//        ArrayList<User> u = dbUser.getAllUser();
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        String json = new Gson().toJson(p);
//        PrintWriter printWriter = response.getWriter();
//        printWriter.print(json);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
