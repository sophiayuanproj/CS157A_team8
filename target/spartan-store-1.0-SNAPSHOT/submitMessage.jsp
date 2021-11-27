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
        String customerEmail = request.getParameter("customer-email2");
        String sellerEmail = request.getParameter("seller-email2");
        long messageID;

        try (
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
        ) {
            String query = "INSERT INTO messages(customer_email, seller_email, content) VALUES(?, ?, ?)";
            String content = request.getParameter("new-message");

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, customerEmail);
            statement.setString(2, sellerEmail);
            statement.setString(3, content);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating message failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    messageID = generatedKeys.getLong(1);
                }
                else {
                    throw new SQLException("Creating message failed, no ID obtained.");
                }
            }
        }
    %>

    <%
        try (
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
        ) {
            String query = "INSERT INTO ask_questions(customer_email, message_id) " +
                    "VALUES(?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, customerEmail);
            statement.setLong(2, messageID);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating message failed, no rows affected.");
            }
        }
    %>

    <%
        try (
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
        ) {
            String query = "INSERT INTO answer_questions(seller_email, message_id) " +
                    "VALUES(?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, sellerEmail);
            statement.setLong(2, messageID);

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating message failed, no rows affected.");
            }
        }
    %>
</main>
</body>
</html>
