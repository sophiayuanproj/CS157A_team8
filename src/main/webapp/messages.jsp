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
    <style>
        body{
            font-family: Arial;
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
    <title>Your Messages</title>
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

    <form action="submitMessage.jsp" method="post">
        <label for="customer-email2">Enter customer email:</label>
        <input type="email" name="customer-email2" id="customer-email2" />
        <label for="seller-email2">Enter seller email:</label>
        <input  type="email" name="seller-email2" id="seller-email2" />
        <label for="new-message">New Message</label>
        <textarea name="new-message" id="new-message" rows="10" cols="40"></textarea>
        <input type="submit" value="Submit" />
    </form>
</main>
</body>
</html>
