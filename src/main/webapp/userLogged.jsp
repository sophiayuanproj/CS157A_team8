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
    <title>User Logged Successfully</title>
</head>
<body>
<%@ include file="navbar.jspf" %>

<main>
    <% UserBean currentUser2 = (UserBean) session.getAttribute("currentSessionUser");%>
    <h1>Welcome <%= currentUser2.getName() %>!</h1>
</main>
</body>
</html>