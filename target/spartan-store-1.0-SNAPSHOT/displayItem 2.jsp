<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Item Description</title>
</head>
<body>
<%@ include file="navbar.jspf" %>

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
<%--<center>--%>
<%--&lt;%&ndash;    <form method="get" style="text-align:center">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <b>Quantity:</b>  <input type=text name="qty" id = "qty">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <input type=submit value="Add">&ndash;%&gt;--%>
<%--&lt;%&ndash;    </form>&ndash;%&gt;--%>
<%--</center>--%>

<%
    String itemID = request.getParameter("itemID");
    String itemName = request.getParameter("itemName");
    String itemType = request.getParameter("itemType");

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
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("   <span style=\"float:right\"></span><a href=\"itemMainScreen.jsp\">Back</a></span>\n" +
                    "   <br>\n" +
                    "<br>");
            out.println("<br>");
            out.println("<center>");
            out.println("<img src = \"images/" + rs.getString(1) + "\" alt = \"Item Image\" width= \"300\" height = \"275\">");
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

        // making qty 1
        out.println("<center><a href=\"confirmAddToCart.jsp?" + "itemID=" + itemID +
                "&" + "itemName=" + itemName +
                "&" + "itemType=" + itemType +
                "&" + "qty=" + 1 +
                "\" />" + "Add to cart" + "</a></center>");

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
