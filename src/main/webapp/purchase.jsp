<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.cs157a.spartanstore.UserDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 10:39 AM
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
    <title>Proceed to checkout</title>
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
        <%
            String user = "root";
            String password = "root";
            long orderID;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

                Statement statement = connection.createStatement();
                String email = navbarCurrentUser.getEmail();
                String shippingStatus = "packaging";
                BigDecimal amountPaid = (BigDecimal) session.getAttribute("amountPaid");

                int i = statement.executeUpdate("INSERT INTO orders(customer_email, shipping_status, amount_paid) VALUES('" + email + "','" + shippingStatus + "','" + amountPaid + "')");

                connection.close();
                statement.close();
            }
            catch(Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }

            try (
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
            ) {
                String query = "INSERT INTO orders(customer_email, shipping_status, amount_paid) VALUES(?, ?, ?)";
                String email = navbarCurrentUser.getEmail();
                String shippingStatus = "packaging";
                BigDecimal amountPaid = new BigDecimal(0.0);
                if (session.getAttribute("amountPaid") != null) {
                    amountPaid = (BigDecimal) session.getAttribute("amountPaid");
                }

                PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                statement.setString(1, email);
                statement.setString(2, shippingStatus);
                statement.setBigDecimal(3, amountPaid);

                int affectedRows = statement.executeUpdate();

                if (affectedRows == 0) {
                    throw new SQLException("Creating order failed, no rows affected.");
                }

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        orderID = generatedKeys.getLong(1);
                    }
                    else {
                        throw new SQLException("Creating order failed, no ID obtained.");
                    }
                }
            }
        %>
        <h1>Congratulations! Your order ID is <%= orderID %>.</h1>
    </main>
</body>
</html>
