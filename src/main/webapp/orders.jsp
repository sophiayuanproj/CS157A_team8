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
    <title>Your Orders</title>
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
