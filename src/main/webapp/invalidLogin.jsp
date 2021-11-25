<%@ page import="com.cs157a.spartanstore.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>
    body{
      font-family: Arial;
    }
    center {
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
  <title>Spartan Supplies - Invalid Login</title>
</head>
<body>
<nav>
  <div class="upperLabel">
    <%
      UserBean currentUser = null;
      currentUser = (UserBean) session.getAttribute("currentSessionUser");
      if (currentUser == null) {
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
  <h1>Sorry, login failed!</h1>
  <p><a href="login.jsp">Try again</a></p>
  <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</main>
</body>
</html>