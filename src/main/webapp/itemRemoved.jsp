<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body{
            font-family: Arial;
        }
        .upperLabel {
            overflow: hidden;
            background-color: #474A47;
        }

        .upperLabel a {
            float: right;
            font-size: 15px;
            color: #ffffff;
            padding: 14px 20px;
        }

    </style>
    <meta charset="UTF-8">
    <title>Spartan Supplies- Apparel</title>
</head>
<body>
<nav>
    <div class="upperLabel">
        <%
            UserBean navbarCurrentUser = null;
            navbarCurrentUser = (UserBean) session.getAttribute("currentSessionUser");
            if (navbarCurrentUser == null) {
        %>
        <a href="login.jsp">Login</a>
        <%
        }
        else {
        %>
        <a href="signout.jsp">Sign Out</a>
        <%
            }
        %>

        <a href="Apparel.jsp">Apparel</a>
        <a href="Textbooks.jsp">Textbook</a>
        <a href="Utilities.jsp">Utilities</a>
        <a href="Technologies.jsp">Technologies</a>
        <a href="index.jsp">Home</a>
    </div>
</nav>

<span style="float:right"></span><a href="Cart.jsp">Back</a></span>
<br>
<br>

<body>
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
