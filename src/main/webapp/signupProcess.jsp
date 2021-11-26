<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,java.util.*, java.security.*, java.nio.charset.StandardCharsets"%>
<%@ page import="java.math.BigDecimal" %>

<%!
    public String hashPassword(String passwordToHash, String salt){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt.getBytes(StandardCharsets.UTF_8));
            byte[] bytes = md.digest(passwordToHash.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++){
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }
%>

<%
    String email = request.getParameter("email");

    String db = "cs157a_team8_database";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

        Statement statement = connection.createStatement();
        String name = request.getParameter("name");
        String accountPassword = request.getParameter("password");
        String salt = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 5);
        String newPassword = hashPassword(accountPassword, salt);

        int i = statement.executeUpdate("INSERT INTO users(name, email, password, salt) VALUES('" + name + "','" + email + "','" + newPassword + "','" + salt + "')");

        statement.close();
        connection.close();
    }
    catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

        Statement statement = connection.createStatement();

        BigDecimal rating = new BigDecimal(0.0);
        String type = request.getParameter("type");

        int i = statement.executeUpdate("INSERT INTO sellers(email, rating, type) VALUES('" + email + "','" + rating + "','" + type + "')");

        statement.close();
        connection.close();
    }
    catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);

        Statement statement = connection.createStatement();

        int numberOfReviews = 0;

        int i = statement.executeUpdate("INSERT INTO customers(email, number_of_reviews) VALUES('" + email + "','" + numberOfReviews + "')");

        statement.close();
        connection.close();
        response.sendRedirect("/login.jsp");
    }
    catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
