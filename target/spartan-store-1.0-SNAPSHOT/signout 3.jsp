<%@ page import="com.cs157a.spartanstore.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/13/2021
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spartan Supplies - Sign Out</title>
</head>
<body>
<%@ include file="navbar.jspf" %>
<%
    session.setAttribute("currentSessionUser", null);
    response.sendRedirect("/login.jsp");
%>
<main>
    <h1>You have successfully signed out.</h1>
</main>
</body>
</html>