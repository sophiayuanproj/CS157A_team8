<%@ page import="com.cs157a.spartanstore.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 2:28 PM
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
    <h1>Your Messages</h1>
    <form action="contactSeller.jsp" method="post">
        <label for="seller-email">Enter seller email: </label>
        <input type="email" name="seller-email" id="seller-email"/>
        <input type="submit" value="Submit">
    </form>

    <form action="contactCustomer.jsp" method="post">
        <label for="customer-email">Enter customer email: </label>
        <input type="email" name="customer-email" id="customer-email"/>
        <input type="submit" value="Submit">
    </form>

    <br />

    <h1>New Message</h1>
    <form action="submitMessage.jsp" method="post">
        <label for="customer-email2">Enter customer email:</label>
        <input type="email" name="customer-email2" id="customer-email2" />
        <br />
        <br />
        <label for="seller-email2">Enter seller email:</label>
        <input  type="email" name="seller-email2" id="seller-email2" />
        <br />
        <br />
        <label for="new-message">New Message:</label>
        <textarea name="new-message" id="new-message" rows="10" cols="40"></textarea>
        <br />
        <br />
        <input type="submit" value="Submit" />
    </form>
</main>
</body>
</html>
