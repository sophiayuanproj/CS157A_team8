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
  <title>Spartan Supplies - Invalid Login</title>
</head>
<body>
<%@ include file="navbar.jspf" %>

<main>
  <h1>Sorry, login failed!</h1>
  <p><a href="login.jsp">Try again</a></p>
  <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
</main>
</body>
</html>