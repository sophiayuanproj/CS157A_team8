<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Orders</title>
</head>
<body>
<%@ include file="navbar.jspf" %>
<main>
    <h1>Your Orders</h1>
    <%
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

            Statement statement = connection.createStatement();
            String email = navbarCurrentUser.getEmail();

            ResultSet rs = statement.executeQuery("SELECT * FROM orders WHERE customer_email = " + "'" + email + "'");

            out.println("<table border=\"1\" align=\"right\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"175\">Order ID</th>\n" +
                    "            <th width=\"175\">Shipping Status</th>\n" +
                    "            <th width=\"175\">Amount Paid</th>\n" +
                    "        </tr>\n");

            while (rs.next()) {

                out.println("<tr>");
                out.println("<td style=\"text-align: center;\">" + rs.getString(1) + "</td>" + " "
                        + "<td style=\"text-align: center;\">" + rs.getString(3) + "</td>" + "</td>"
                        + "<td style=\"text-align: center;\">" + rs.getBigDecimal(4) + "</td>" + "</td>");
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
