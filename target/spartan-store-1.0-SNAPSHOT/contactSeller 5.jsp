<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Messages</title>
</head>
<body>
<%@ include file="navbar.jspf" %>
<main>
    <h1>Messages with <%= request.getParameter("seller-email") %></h1>
    <%
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

            Statement statement = connection.createStatement();
            String customerEmail = navbarCurrentUser.getEmail();
            String sellerEmail = request.getParameter("seller-email");

            ResultSet rs = statement.executeQuery("SELECT * FROM messages WHERE customer_email = "
                    + "'" + customerEmail + "'" + "AND seller_email = " + "'" + sellerEmail + "'");

            out.println("<table border=\"1\" align=\"right\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"175\">Message ID</th>\n" +
                    "            <th width=\"175\">Customer Email</th>\n" +
                    "            <th width=\"175\">Seller Email</th>\n" +
                    "            <th width=\"175\">Message</th>\n" +
                    "        </tr>\n");

            while (rs.next()) {

                out.println("<tr>");
                out.println("<td style=\"text-align: center;\">" + rs.getInt(1) + "</td>" + " "
                        + "<td style=\"text-align: center;\">" + rs.getString(2) + "</td>" + "</td>"
                        + "<td style=\"text-align: center;\">" + rs.getString(3) + "</td>" + "</td>"
                        + "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            statement.close();
            connection.close();
        }
        catch(Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    %>
</main>
</body>
</html>
