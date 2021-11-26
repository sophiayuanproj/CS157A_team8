<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spartan Supplies- Search for your class</title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
    <h1>Find Supplies for your class here!</h1>
    
     <form method=get>
  	<b>Enter class name (e.g. CS):</b>  <input type=text id = name name=name>
        <b>Enter class code (e.g. 157A):</b>  <input type=text id=code name=code>
        <input type=submit value="Submit">
    </form>

    <h2>Search by grade level!</h2>

    <form method=get>
        <b>Enter grade level (e.g. Sophomore):</b>  <input type=text id=grade name=grade>
        <input type=submit value="Submit">
    </form>
    <br>

<%
    String db = "cs157a_team8_database";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";

    String name = request.getParameter("name");
    String code = request.getParameter("code");
    String grade = request.getParameter("grade");

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

    if(name != null && code != null){
        ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, itemID, " +
                "itemType FROM Items WHERE Class ="+ "\"" + name + code + "\"" + " ");

        if(rs.next() == false) {
            out.println("<p style=\"color:#FF0000\";>Please enter a valid input.</p>");
            out.println("</table>");
        }

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

    }
    else if(grade != null){
        ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, itemID, " +
                "itemType FROM Items WHERE Grade ="+ "\"" + grade + "\"" + " ");

        if(rs.next() == false) {
            out.println("<p style=\"color:#FF0000\";>Please enter a valid input.</p>");
            out.println("</table>");
        }

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

    }
    else if(grade == null || name == null && code == null) {

        ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, itemID, " +
                "itemType FROM Items");

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
    }
    stmt.close();
    con.close();

    } catch(SQLException e) {
    out.println("SQLException caught: " + e.getMessage());
    }
%>

</body>
</html>