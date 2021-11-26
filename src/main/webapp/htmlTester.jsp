<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>

<html>
<head>
    <title>Spartan Supplies- Item Description</title>
</head>

<body>
<%@ include file="navbar.jspf" %>
<%--    <h1>Welcome to Spartan Supplies!</h1>--%>
<div>
    <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
</div>
<br>
<a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
<br>
<br>
<br>
<%--<span style="float:right"></span><a href="Cart.jsp">Cart</a></span>--%>

<form align = "right" id = "searchForm" method = "post" action = "htmlTester.jsp" class = "form-horizontal">
    <b>Search on Spartan Supplies:</b>  <input type="text" placeholder="Search item name..." name = "searchQuery" id = "searchQuery" name = "Search">
    <input type=submit value="Submit">
</form>

<div>
    <%
        UserBean currentUser = null;
        currentUser = (UserBean) session.getAttribute("currentSessionUser");
        if (currentUser == null) {
            out.println("Welcome! Please login.");
        }
        else {
            out.println("Welcome " + currentUser.getEmail());
        }
    %>
</div>

<span style="float:right"><a href="searchClass.jsp">Search for your class here!</a></span>
<br>
<br>
<u><b>Filter</b></u>
<%--Scroll down for the rest of the filter--%>

<%
    String db = "cs157a_team8_database";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";
    try {

        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
        //out.println(db + " database successfully opened.<br/><br/>");

        //out.println("Initial entries in table \"item_description\": <br/>");
        Statement stmt = con.createStatement();

        String searchQuery = request.getParameter("searchQuery");

        //For testing
        //out.println("THIS IS THE SEARCH QUERY:" + searchQuery);

        out.println("<table border=\"1\" align=\"right\">\n" +
                "        <tr>\n" +
                "            <th width=\"175\">Image</th>\n" +
                "            <th width=\"175\">Name</th>\n" +
                "            <th width=\"175\">Stock</th>\n" +
                "            <th width=\"175\">Grade</th>\n" +
                "            <th width=\"175\">Status</th>\n" +
                "            <th width=\"175\">Rating</th>\n" +
                "            <th width=\"175\">Class</th>\n" +
                "            <th width=\"175\">Price</th>\n" +
                "        </tr>\n");


            ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, " +
                    "ItemID, ItemType,Price FROM Items WHERE ItemName LIKE " + "\"" + searchQuery + "\""
                    + " OR " + "LOWER(ItemName) LIKE " + "\"" + "LOWER(" + searchQuery + ")" + "\"");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                            "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                            "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                            "&" + "itemName=" + rs.getString(2) +
                            "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                            "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");

        stmt.close();
        con.close();

    } catch(SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }

    //This section is for the Filter
%>
<form id = "multipleSearch" method = "post" action = "itemMainScreen.jsp" class = "form-horizontal">
    <p>Price:</p>
    <input type="checkbox" id="$10-$500" name="$10-$500">
    <label for="$10-$500">$10-$500</label>
    </div>
    <div>
        <input type="checkbox" id="$500-$1000" name="$500-$1000">
        <label for="$500-$1000">$500-$1000</label>
    </div>
    <div>
        <input type="checkbox" id="$1000+" name="$1000+">
        <label for="$1000+">$1000+</label>
    </div>
    <p>Size:</p>
    <div>
        <input type="checkbox" id="small" name="small">
        <label for="small">Small</label>
    </div>
    <div>
        <input type="checkbox" id="medium" name="medium">
        <label for="medium">Medium</label>
    </div>
    <div>
        <input type="checkbox" id="large" name="large">
        <label for="large">Large</label>
    </div>
    <p>Seller:</p>
    <div>
        <input type="checkbox" id="student" name="student">
        <label for="student">Student</label>
    </div>
    <div>
        <input type="checkbox" id="company" name="company">
        <label for="company">Company</label>
    </div>
    <br>
    <input type=submit value="Submit">
    <a href="itemMainScreen.jsp">Clear filter selection</a>
</form>
</body>
</html>
