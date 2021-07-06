package com.sayantan.roy;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MsgSend extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public MsgSend() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        java.sql.Connection con = null;
        java.sql.Statement stmt = null;

        String uid = (String) session.getAttribute("uid");

        String pwd = null, alvl = null, fnm = null, lnm = null, adr = null, phn = null, dob = null, email = null, gndr = null, msgid, fromrecv, sndrfnm, sndrlnm, torecv, sub, msgbody, tym;

        int id = (int) (Math.random() * 100000);
        msgid = "msgid" + id;

        torecv = request.getParameter("torecv");
        sub = request.getParameter("sub");
        msgbody = request.getParameter("msgbody");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery("select * from custdb where uid='" + uid + "'");

            while (rs.next()) {
                System.out.println(uid + "    " + rs.getString(2) + "    " + rs.getString(3) + "    " + rs.getString(4) + "    " + rs.getString(5) + "    " + rs.getString(6) + "    " + rs.getString(7) + "    " + rs.getString(8) + "    " + rs.getString(9) + "    " + rs.getString(10));
                pwd = rs.getString(2);
                fnm = rs.getString(3);
                lnm = rs.getString(4);
                adr = rs.getString(5);
                phn = rs.getString(6);
                dob = rs.getString(7);
                email = rs.getString(8);
                gndr = rs.getString(9);
                alvl = rs.getString(10);
            }
        } catch (ClassNotFoundException | SQLException e) {
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
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            int i = stmt.executeUpdate("insert into msgdb set msgid='" + msgid + "',fromrecv='" + uid + "',sndrfnm='" + fnm + "',sndrlnm='" + lnm + "',torecv='" + torecv + "',sub='" + sub + "',msgbody='" + msgbody + "',tym=NOW() ");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully Updated...");
                if (null == alvl) {
                    getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
                } else {
                    switch (alvl) {
                        case "cust":
                            getServletContext().getRequestDispatcher("/CustInbox.jsp").forward(request, response);
                            break;
                        case "manager":
                            getServletContext().getRequestDispatcher("/ManInbox.jsp").forward(request, response);
                            break;
                        case "admin":
                            getServletContext().getRequestDispatcher("/AdminInbox.jsp").forward(request, response);
                            break;
                        default:
                            getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
                            break;
                    }
                }
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

        System.out.println(
                "Resources closed!");

    }
}
