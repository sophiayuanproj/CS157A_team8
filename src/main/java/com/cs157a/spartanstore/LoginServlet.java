package com.cs157a.spartanstore;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserBean user = new UserBean();
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            user = UserDAO.login(user);

            if (user.isValid()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", user);
                response.sendRedirect("userLogged.jsp"); //logged-in page
            }
            else
                response.sendRedirect("invalidLogin.jsp"); //error page
        }

        catch (Throwable theException) {
            System.out.println(theException);
        }
    }

    /*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    */
}
