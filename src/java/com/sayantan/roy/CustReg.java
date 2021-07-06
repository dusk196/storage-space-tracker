package com.sayantan.roy;

import java.io.PrintWriter;
import java.io.IOException;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustReg extends HttpServlet {

    private static final long serialVersionUID = 1L;


    public CustReg() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pwd, fnm, lnm, adr, dob, email, gndr, phn, alvl, uid;

        java.sql.Connection con = null;
        java.sql.Statement stmt = null;

        fnm = request.getParameter("fnm");
        lnm = request.getParameter("lnm");
        adr = request.getParameter("adr");
        phn = request.getParameter("phn");
        dob = request.getParameter("dob");
        email = request.getParameter("email");
        gndr = request.getParameter("gndr");
        alvl = "cust";

        int id = (int) (Math.random() * 10000);
        uid = fnm + id;
        String alphabet = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ";
        pwd = "";
        Random random = new Random();

        for (int i = 0; i < 6; i++) {
            char c = alphabet.charAt(random.nextInt(52));
            pwd += c;
        }

        System.out.println(uid + "    " + pwd + "    " + fnm + "    " + lnm + "    " + adr + "    " + phn + "    " + dob + "    " + email + "    " + gndr + "    " + alvl);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            int i = stmt.executeUpdate("insert into custdb(uid,pwd,fnm,lnm,adr,phn,dob,email,gndr,alvl)values('" + uid + "','" + pwd + "','" + fnm + "','" + lnm + "','" + adr + "','" + phn + "','" + dob + "','" + email + "','" + gndr + "','" + alvl + "') ");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully Registered...");
                HttpSession session = request.getSession();
                session.setAttribute("uid", uid);
                session.setAttribute("alvl", alvl);
                getServletContext().getRequestDispatcher("/ShowUidPwd.jsp").forward(request, response);
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