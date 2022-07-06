package controller.Account;

import dao.QuestionDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.Question;
import modal.User;

@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_username = request.getParameter("username");
        String raw_password = request.getParameter("password");
        String raw_gender = request.getParameter("gender");
        String raw_dateofbirth = request.getParameter("dateofbirth");
        String raw_question = request.getParameter("question");
        String raw_answer = request.getParameter("answer");

        String username = raw_username;
        String password = raw_password;
        String gender = raw_gender;
        Date dateofbirth = Date.valueOf(raw_dateofbirth);
        String answer = raw_answer;
        int typeOfAccount = 1;
        int question = Integer.parseInt(raw_question);
        String displayname = raw_username;
        
        UserDao db = new UserDao();
        User check = db.getUsername(username);

        if (check == null) {
            User u = new User();
            u.setQuestionID(question);
            u.setUsername(username);
            u.setGender(gender);
            u.setDob(dateofbirth);
            u.setAnswer(answer);
            u.setPassword(password);
            u.setTypeOfAccount(typeOfAccount);
            u.setDisplayname(displayname);
            db.register(u);
            QuestionDao db1 = new QuestionDao();
            ArrayList<Question> quest = db1.getQuestions();
            request.setAttribute("quest", quest);
            request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
            
        } else {
            QuestionDao db1 = new QuestionDao();
            ArrayList<Question> quest = db1.getQuestions();
            request.setAttribute("quest", quest);
            request.setAttribute("message2", "Already Exist!");
            request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
