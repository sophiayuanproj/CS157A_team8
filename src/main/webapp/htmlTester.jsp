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

<div>
    <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
</div>
<br>
<a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
<br>
<br>
<br>
<center>
    <form method="get" style="text-align:center">
        <b>Quantity:</b>  <input type=text name="qty" id = "qty">
        <br>
        <br>
        <input type=submit value="Add">
    </form>
</center>

<%

    String itemType = "Technologies";
    int itemID = 0;
    String itemName = "Macbook";

    String db = "cs157a_team8_database";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";
    try {

        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();

        //out.println("this is: " + itemType);

        ResultSet rs = stmt.executeQuery("SELECT Image, Items.ItemName, Stock, Status, Rating, Price, ItemDescription\n" +
                "FROM Items," + itemType + "\n" +
                "WHERE Items.ItemID =" + itemType + ".ItemID AND Items.ItemName = " + itemType + ".ItemName " +
                "AND Items.ItemID = " + itemID + " AND Items.ItemName = \"" + itemName + "\"");

        while (rs.next()) {
            out.println("<br>");
            out.println("<img src = \"images/" + rs.getString(1) + "\" alt = \"Item Image\" width= \"300\" height = \"275\">");
            out.println("<center>");
            out.println("<h1>" + rs.getString(2) + "</h1>");
            out.println("<b>Item price: </b>" + "$" + rs.getBigDecimal(6));
            out.println("<br>");
            out.println("<br>");
            out.println("<b>Item description: </b>" + rs.getString(7));
            out.println("<br>");
            out.println("<br>");
            out.println("<b>Item stock: </b>" + rs.getInt(3));
            out.println("<br>");
            out.println("<br>");
            out.println("<b>Item status: </b>" + rs.getString(4));
            out.println("<br>");
            out.println("<br>");
            out.println("<b>Item rating: </b>" + rs.getBigDecimal(5));
            out.println("<br>");
            out.println("<br>");
            out.println("</center>");
        }

        stmt.close();
        con.close();

    } catch(SQLException e) {
        //out.println("SQLException caught: " + e.getMessage());
        out.println("Please enter this page from item selection");
    }

%>
<%

    try {
        java.sql.Connection con;
        String qty = request.getParameter("qty");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
        Statement stmt = con.createStatement();

        stmt.executeUpdate("INSERT INTO ItemsInCart (ItemID, ItemName, email, Quantity, Price) " +
                "VALUES (" + "(SELECT Items.ItemID " +
                "FROM Items," + itemType + " " +
                        "WHERE Items.ItemID =" + itemType + ".ItemID AND Items.ItemName =" + itemType + ".ItemName" +
                        " AND Items.ItemID =" + itemID + " AND Items.ItemName =\""+ itemName + "\"" + ")" + ", \"tester\", \"testeremail\"," + qty + "," + 5 +");");

        out.println("this is qty: " + qty);

        out.println( itemName + " has been added to your cart.");

        stmt.close();
        con.close();

    } catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
        //out.println("Please enter this page from item selection");
    }
%>

<br>
</body>
</html>
