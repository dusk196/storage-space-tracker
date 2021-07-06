package com.sayantan.roy;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminSpaceDel extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AdminSpaceDel() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        java.sql.Connection con = null;
        java.sql.Statement stmt = null;

        String planid;

        planid = request.getParameter("planid");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            int i = stmt.executeUpdate("DELETE FROM plandb WHERE planid='" + planid + "' ");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully Updated...");
                getServletContext().getRequestDispatcher("/AdminWareDB.jsp").forward(request, response);
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
