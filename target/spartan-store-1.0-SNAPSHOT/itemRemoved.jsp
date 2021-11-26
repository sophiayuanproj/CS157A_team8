<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spartan Supplies- Apparel</title>
</head>
<body>
<%@ include file="navbar.jspf" %>

<span style="float:right"></span><a href="Cart.jsp">Back</a></span>
<br>
<br>

<p>Item removed from your cart</p>
<div>
    <%
        String db = "cs157a_team8_database";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "root";

        String qty = request.getParameter("qty");
        String listingID = request.getParameter("listingID");

        try {

            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
            //out.println(db + " database successfully opened.<br/><br/>");

            Statement stmt = con.createStatement();

            stmt.executeUpdate("DELETE FROM ItemsInCart WHERE listingID = (SELECT Shopping.listingID FROM " +
                    "Shopping WHERE listingID = " + listingID +");");

            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
</div>
</body>
</html>
