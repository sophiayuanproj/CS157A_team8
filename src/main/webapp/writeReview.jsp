<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.*" %>
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
            String customerEmail = navbarCurrentUser.getEmail();
            String sellerEmail = request.getParameter("write-review");
            BigDecimal updatedRating = new BigDecimal(0.0);
            long reviewID;

            try (
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
            ) {
                String query = "INSERT INTO reviews(customer_email, seller_email, title, body, rating) " +
                        "VALUES(?, ?, ?, ?, ?)";
                String title = request.getParameter("title");
                String body = request.getParameter("review-body");
                BigDecimal rating = new BigDecimal(request.getParameter("review-rating"));

                PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                statement.setString(1, customerEmail);
                statement.setString(2, sellerEmail);
                statement.setString(3, title);
                statement.setString(4, body);
                statement.setBigDecimal(5, rating);

                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Creating message failed, no rows affected.");
                }

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reviewID = generatedKeys.getLong(1);
                    }
                    else {
                        throw new SQLException("Creating review failed, no ID obtained.");
                    }
                }
            }
        %>

        <%
            try (
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
            ) {
                String query = "INSERT INTO writes(customer_email, review_id) " +
                        "VALUES(?, ?)";

                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, customerEmail);
                statement.setLong(2, reviewID);

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
                String query = "INSERT INTO have(seller_email, review_id) " +
                        "VALUES(?, ?)";

                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, sellerEmail);
                statement.setLong(2, reviewID);

                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Creating message failed, no rows affected.");
                }
            }
        %>

        <%
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
                Statement stmt = conn.createStatement();
            ) {
                String query = "UPDATE customers " +
                        "SET number_of_reviews = number_of_reviews + 1 WHERE email = " + "'" + customerEmail + "'";
                stmt.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>

        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT AVG(rating) FROM reviews WHERE seller_email = " + "'" + sellerEmail + "'");

                while (rs.next()) {
                    updatedRating = rs.getBigDecimal(1);
                }

                statement.close();
                connection.close();
            }
            catch(Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }
        %>

        <%
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
                 Statement stmt = conn.createStatement();
            ) {
                String query = "UPDATE sellers " +
                        "SET rating = " + updatedRating + " WHERE email = " + "'" + sellerEmail + "'";
                stmt.executeUpdate(query);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </main>
</body>
</html>
