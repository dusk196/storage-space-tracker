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

public class BuySpaceFirst extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public BuySpaceFirst() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("uid");

        String planid, plan, day = "0", space, rc, price, pdate, edate, usedspace = "0", freespace;

        java.sql.Connection con = null;
        java.sql.Statement stmt = null;

        plan = request.getParameter("plan");
        pdate = request.getParameter("pdate");
        
        edate = pdate;

        int id = (int) (Math.random() * 100000);
        planid = "pid" + id;

        System.out.println(uid + "    " + plan + "    " + pdate);

        if (null == plan) {
            day = "0";
            space = "0";
            rc = "0";
            price = "0";
        } else {
            switch (plan) {
                case "Basic":
                    day = "1";
                    space = "2000";
                    rc = "1";
                    price = "6000";
                    break;
                case "Pro":
                    day = "7";
                    space = "3000";
                    rc = "3";
                    price = "40000";
                    break;
                case "Premium":
                    day = "30";
                    space = "5000";
                    rc = "10";
                    price = "150000";
                    break;
                case "None":
                    day = "0";
                    space = "0";
                    rc = "0";
                    price = "0";
                    break;
                default:
                    day = "0";
                    space = "0";
                    rc = "0";
                    price = "0";
                    break;
            }
        }
        
        freespace = space;

        System.out.println(planid + "    " + uid + "    " + plan + "    " + space + "    " + rc + "    " + price + "    " + pdate + "    " + edate + "    " + day);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            stmt = con.createStatement();
            int i = stmt.executeUpdate("insert into plandb(planid,uid,plan,space,rc,price,pdate,edate,day,usedspace,freespace)values('" + planid + "','" + uid + "','" + plan + "','" + space + "','" + rc + "','" + price + "','" + pdate + "','" + edate + "','" + day + "','" + usedspace +"','" + freespace + "') ");
            stmt.executeUpdate("update plandb SET edate=ADDDATE(pdate," + day + ") where planid='" + planid + "';");
            stmt.executeUpdate("update plandb SET dayr=DATEDIFF(edate,NOW()) where planid='" + planid + "';");

            if (i != 0) {
                PrintWriter out = response.getWriter();
                System.out.println("Successfully alloted space for the first time...");

                getServletContext().getRequestDispatcher("/CustDash.jsp").forward(request, response);
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
