<%@ page import="com.cs157a.spartanstore.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/5/2021
  Time: 10:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spartan Supplies - Sign Up</title>
</head>
<body>
<%@ include file="navbar.jspf" %>

<main>
    <h1>Sign Up</h1>
    <form action="signupProcess.jsp" method="POST">
        <div class="container">
            <label for="name"><strong>Name</strong></label>
            <input id="name" type="text" placeholder="Enter Name" name="name" required>

            <label for="email"><strong>Email</strong></label>
            <input id="email" type="email" placeholder="Enter Email" name="email" required>

            <label for="password"><strong>Password</strong></label>
            <input id="password" type="password" placeholder="Enter Password" name="password" required>

            <label for="type"><strong>Type of Seller</strong></label>
            <select name="type" id="type">
                <option value="">--Please choose the type of seller you are--</option>
                <option value="student">Student</option>
                <option value="company">Company</option>
            </select>

            <input type="submit" value="Sign Up">
        </div>
    </form>
    Already have an account? <a href="login.jsp">Login</a>
</main>
</body>
</html>