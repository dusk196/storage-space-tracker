package com.sayantan.roy;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAll extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginAll() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uid, pwd, alvl;

        uid = request.getParameter("uid");
        pwd = request.getParameter("pwd");
        alvl = request.getParameter("alvl");

        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        System.out.println(uid + "    " + pwd + "    " + alvl);

        try {

            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            pst = conn.prepareStatement("select * from custdb where uid=? and pwd=? and alvl=?");
            pst.setString(1, uid);
            pst.setString(2, pwd);
            pst.setString(3, alvl);
            rs = pst.executeQuery();

            if (rs.next()) {
                System.out.println(uid + "    " + pwd);

                HttpSession session = request.getSession();

                session.setAttribute("uid", uid);
                session.setAttribute("alvl", alvl);

                switch (alvl) {
                    case "cust": {
                        RequestDispatcher rd = request.getRequestDispatcher("/CustDash.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "manager": {
                        RequestDispatcher rd = request.getRequestDispatcher("/ManDash.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    case "admin": {
                        RequestDispatcher rd = request.getRequestDispatcher("/AdminDash.jsp");
                        rd.forward(request, response);
                        break;
                    }
                    default: {
                        RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
                        rd.forward(request, response);
                        break;
                    }
                }

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
                rd.forward(request, response);
            }

        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            System.out.println("Error occured... Exception caught...");
            RequestDispatcher rd = request.getRequestDispatcher("/404.jsp");
            rd.forward(request, response);

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    //e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    //e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    //e.printStackTrace();
                }
            }
        }
        System.out.println("Resources closed!");
    }
}
