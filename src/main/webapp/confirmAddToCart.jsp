<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Item Description</title>
    <style>
        body{
            font-family: Arial;
        }
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
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


<div>
    <%
        UserBean currentUser = null;
        //currentUser.setName("sophia");
        currentUser = (UserBean) session.getAttribute("currentSessionUser");
        if (currentUser == null) {
            out.println("Welcome! Please login.");
        }
        else {
            out.println("Welcome " + currentUser.getEmail());
        }
    %>
</div>

<%
    String itemID = request.getParameter("itemID");
    String itemName = request.getParameter("itemName");
    String itemType = request.getParameter("itemType");
    String qty = request.getParameter("qty");

    //For testing
//    out.println(itemID);
//    out.println(itemName);
//    out.println(itemType);

    String db = "cs157a_team8_database";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";

    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();

        //For testing
        //out.println(currentUser.getEmail() + currentUser.getEmail().getClass());
//        out.println("this is: " + itemType);
//        out.println("this is: " + itemID);
//        out.println("this is: " + itemName);


        stmt.executeUpdate("INSERT INTO ItemsInCart (ItemID, ItemName, Quantity, Price) " +
                "VALUES ((SELECT Items.ItemID " +
                "FROM Items," + itemType + " " +
                "WHERE Items.ItemID =" + itemType + ".ItemID AND Items.ItemName =" + itemType + ".ItemName" +
                " AND Items.ItemID =" + itemID + " AND Items.ItemName =" + "\"" + itemName + "\"" + ")" + ", "
                +
                "(SELECT Items.ItemName " +
                "FROM Items," + itemType + " " +
                "WHERE Items.ItemID =" + itemType + ".ItemID AND Items.ItemName =" + itemType + ".ItemName" +
                " AND Items.ItemID =" + itemID + " AND Items.ItemName =" + "\"" + itemName + "\"" + ")" +  ", "
                +
                qty + ","
                +

                "(SELECT Items.Price " +
                "FROM Items," + itemType + " " +
                "WHERE Items.ItemID =" + itemType + ".ItemID AND Items.ItemName =" + itemType + ".ItemName" +
                " AND Items.ItemID =" + itemID + " AND Items.ItemName =" + "\"" + itemName + "\"" + "));");

        stmt.executeUpdate("INSERT INTO Shopping (listingID, email) " +
                "VALUES(" + "(" + "SELECT MAX(listingID) " +
                "FROM ItemsInCart" + ")" + ", " + "\"" + currentUser.getEmail()  + "\"" + ");");

        out.println( itemName + " has been added to your cart.");

        stmt.close();
        con.close();

    } catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
        //out.println("Please enter this page from item selection");
    }
%>

</body>
</html>
