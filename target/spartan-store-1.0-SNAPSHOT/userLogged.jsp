<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cs157a.spartanstore.UserBean" %>

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
    <title>User Logged Successfully</title>
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
    <% UserBean currentUser2 = (UserBean) session.getAttribute("currentSessionUser");%>
    <h1>Welcome <%= currentUser2.getName() %>!</h1>
</main>
</body>
</html>