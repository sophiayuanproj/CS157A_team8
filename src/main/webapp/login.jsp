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
        <title>Spartan Supplies - Login</title>
    </head>
    <body>
        <%@ include file="navbar.jspf" %>

        <main>
            <h1>Login</h1>
            <form action="/LoginServlet">
                <div class="container">
                    <label for="email"><b>Email</b></label>
                    <input id="email" type="email" placeholder="Enter Email" name="email" required>

                    <label for="password"><b>Password</b></label>
                    <input id="password" type="password" placeholder="Enter Password" name="password" required>

                    <button type="submit">Login</button>
                </div>
            </form>
            Don't have an account? <a href="signup.jsp">Sign Up</a>
        </main>
    </body>
</html>
