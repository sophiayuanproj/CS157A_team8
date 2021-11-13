<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<%@ page import="com.cs157a.spartanstore.UserBean" %>
=======
<%@ page import="com.cs157a.spartanstore.UserBean, jakarta.servlet.http.*" %>
>>>>>>> 63c207e (Finished signup and login features)

<html>
<head>
    <title>User Logged Successfully</title>
</head>
<body>
    <div>
        <% UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");%>
        Welcome <%= currentUser.getName() %>
    </div>
</body>
</html>
