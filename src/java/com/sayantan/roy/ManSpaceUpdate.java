package com.sayantan.roy;

import java.io.PrintWriter;
import java.io.IOException;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManSpaceUpdate extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ManSpaceUpdate() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String newusedspace = null, planid, space = null;
        
        int newfreespace = 0;

        java.sql.Connection con = null;
        java.sql.Connection con1 = null;
        java.sql.Statement stmt = null;
        java.sql.Statement stmt1 = null;

        planid = request.getParameter("planid");
        newusedspace = request.getParameter("newusedspace");

        System.out.println(planid + "    " + newusedspace + "    " + newfreespace);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            
            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt1 = con1.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select * from plandb where planid='" + planid + "'");
            while (rs1.next()) {
                space = rs1.getString(4);
            }
            
            System.out.println(planid + "    " + newusedspace + "    " + newfreespace + "    " + space);
            newfreespace = (Integer.parseInt(space)) - (Integer.parseInt(newusedspace));
            System.out.println(planid + "    " + newusedspace + "    " + newfreespace + "    " + space);
            
            stmt = con.createStatement();
            int i = stmt.executeUpdate("update plandb set usedspace='" + newusedspace + "',freespace='" + newfreespace + "' where planid='" + planid + "';");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully Updated...");
                getServletContext().getRequestDispatcher("/ManWarehouse.jsp").forward(request, response);
            }
            
            stmt1.close();
            con1.close();

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
