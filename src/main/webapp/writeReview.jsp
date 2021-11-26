<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Review Submitted!</title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
    <main>
        <h1>Review Submitted!</h1>
        <%
            String user = "root";
            String password = "root";

            try (
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
            ) {
                String query = "INSERT INTO reviews(customer_email, seller_email, title, body, rating) " +
                        "VALUES(?, ?, ?, ?, ?)";
                String customerEmail = navbarCurrentUser.getEmail();
                String sellerEmail = request.getParameter("write-review");
                String title = request.getParameter("title");
                String body = request.getParameter("review-body");
                BigDecimal rating = new BigDecimal(request.getParameter("review-rating"));

                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, customerEmail);
                statement.setString(2, sellerEmail);
                statement.setString(3, title);
                statement.setString(4, body);
                statement.setBigDecimal(5, rating);

                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Creating message failed, no rows affected.");
                }
            }
        %>
    </main>
</body>
</html>
