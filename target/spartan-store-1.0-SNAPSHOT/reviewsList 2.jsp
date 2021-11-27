<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
    <main>
        <h1>Viewing Reviews for <%= request.getParameter("view-review") %></h1>
        <%
            String user = "root";
            String password = "root";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

                Statement statement = connection.createStatement();
                String sellerEmail = request.getParameter("view-review");

                ResultSet rs = statement.executeQuery("SELECT * FROM reviews WHERE seller_email = " + "'" + sellerEmail + "'");

                out.println("<table border=\"1\" align=\"right\">\n" +
                        "        <tr>\n" +
                        "            <th width=\"175\">Customer Email</th>\n" +
                        "            <th width=\"175\">Title</th>\n" +
                        "            <th width=\"250\">Body</th>\n" +
                        "            <th width=\"175\">Rating</th>\n" +
                        "        </tr>\n");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + rs.getString(2) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + "</td>"
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + "</td>"
                            + "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + "</td>");
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
