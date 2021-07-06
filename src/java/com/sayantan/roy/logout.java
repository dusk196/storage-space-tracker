package com.sayantan.roy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logout extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public logout() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            try {

                session.removeAttribute("uid");
                session.removeAttribute("alvl");
                session.invalidate();
                System.out.println("Session closed!");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                System.out.println("Redirected!");
            } catch (IOException | ServletException sqle) {
                System.out.println("error UserValidateServlet message : " + sqle.getMessage());
                System.out.println("error UserValidateServlet exception : " + sqle);
            }
        }
        else {
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
