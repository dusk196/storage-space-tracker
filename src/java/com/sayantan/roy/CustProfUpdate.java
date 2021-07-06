package com.sayantan.roy;

import java.io.PrintWriter;
import java.io.IOException;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustProfUpdate extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CustProfUpdate() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("uid");

        String pwd, fnm, lnm, adr, dob, email, gndr, phn;

        java.sql.Connection con = null;
        java.sql.Statement stmt = null;

        fnm = request.getParameter("fnm");
        lnm = request.getParameter("lnm");
        pwd = request.getParameter("pwd");
        adr = request.getParameter("adr");
        phn = request.getParameter("phn");
        dob = request.getParameter("dob");
        email = request.getParameter("email");
        gndr = request.getParameter("gndr");

        System.out.println(pwd + "    " + fnm + "    " + lnm + "    " + adr + "    " + phn + "    " + dob + "    " + email + "    " + gndr);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            int i = stmt.executeUpdate("update custdb set pwd='" + pwd + "',fnm='" + fnm + "',lnm='" + lnm + "',adr='" + adr + "',phn='" + phn + "',dob='" + dob + "',email='" + email + "',gndr='" + gndr + "' where uid='" + uid + "';");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully Updated...");
                getServletContext().getRequestDispatcher("/CustProfile.jsp").forward(request, response);
            }

        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            System.out.println("Error occured... Exception caught...");

        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                    System.out.println("Statement closed!");
                }
            } catch (SQLException se2) {
            }
            try {
                if (con != null) {
                    con.close();
                    System.out.println("Connection closed!");
                }
            } catch (SQLException se) {
                System.out.println("Exception caught! Run se.printStackTrace(); to diagnose");
                //se.printStackTrace();
            }
        }
        System.out.println("Resources closed!");
    }
}
