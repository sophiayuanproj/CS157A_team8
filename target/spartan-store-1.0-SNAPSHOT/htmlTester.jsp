<%--
  Created by IntelliJ IDEA.
  User: SophiaYuan
  Date: 11/11/21
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <style>
        td {border: 1px #DDD solid; padding: 5px; cursor: pointer;}

        .selected {
            background-color: brown;
            color: #FFF;
        }
        </style>
    <title>Test your code here</title>
</head>
<body>

<div>
    <%
        String db = "cs157a_team8_database";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "root";
        try {

            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
            //out.println(db + " database successfully opened.<br/><br/>");

            //out.println("Initial entries in table \"item_description\": <br/>");
            Statement stmt = con.createStatement();


            out.println("<table id=\"table\" border=\"1\" align=\"right\">\n" +
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

            String filter = request.getParameter("$10-$500");
            String filter2 = request.getParameter("$500-$1000");
            String filter3 = request.getParameter("$1000+");
            String filter4 = request.getParameter("small");
            String filter5 = request.getParameter("medium");
            String filter6 = request.getParameter("large");
            String filter7 = request.getParameter("student");
            String filter8 = request.getParameter("company");

            ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, itemID FROM Items");

            //"<a href=\"displayItem.jsp?userId=5test&what=6wut\" />" +  + "</a>"
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                        "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                        "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                        "&" + "itemName=" + rs.getString(2) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                        "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                        "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                        + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                        "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                        + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                        "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                out.println("</tr>");
                //out.println("VALUES: " + rs.getString(9) + rs.getString(2));
            }
            out.println("</table>");

            String searchQuery = request.getParameter("searchQuery");
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }

    %>

</div>
<%--<a href="displayItem.jsp?userId=5test&what=6wut" />link1</a>--%>
</body>
</html>
