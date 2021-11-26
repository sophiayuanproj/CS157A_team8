<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Message Submitted!</title>
</head>
<body>
<%@ include file="navbar.jspf" %>
<main>
    <h1>Message Submitted!</h1>
    <%
        String user = "root";
        String password = "root";

        try (
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
        ) {
            String query = "INSERT INTO messages(customer_email, seller_email, content) VALUES(?, ?, ?)";
            String customerEmail = request.getParameter("customer-email2");
            String sellerEmail = request.getParameter("seller-email2");
            String content = request.getParameter("new-message");

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, customerEmail);
            statement.setString(2, sellerEmail);
            statement.setString(3, content);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating message failed, no rows affected.");
            }
        }
    %>
</main>
</body>
</html>
