<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<h1>Sign Up</h1>
<form action="signupProcess.jsp" method="POST">
    <div class="container">
        <label for="name"><b>Name</b></label>
        <input id="name" type="text" placeholder="Enter Name" name="name" required>

        <label for="email"><b>Email</b></label>
        <input id="email" type="email" placeholder="Enter Email" name="email" required>

        <label for="password"><b>Password</b></label>
        <input id="password" type="password" placeholder="Enter Password" name="password" required>

        <input type="submit" value="Sign Up">
    </div>
</form>
</body>
</html>
