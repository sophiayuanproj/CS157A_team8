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
        <title>Spartan Supplies - Sign Up</title>
    </head>
    <body>
        <nav>
            <div class="upperLabel">
                <a href="login.jsp">Login</a>
                <a href="Apparel.jsp">Apparel</a>
                <a href="Textbooks.jsp">Textbook</a>
                <a href="Utilities.jsp">Utilities</a>
                <a href="Technologies.jsp">Technologies</a>
                <a href="index.jsp">Home</a>
            </div>
            <%--    <h1>Welcome to Spartan Supplies!</h1>--%>
            <div>
                <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
            </div>
            <br>
            <a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
            <br>
            <br>
            <br>
        </nav>

        <main>
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
            Already have an account? <a href="login.jsp">Login</a>
        </main>
    </body>
</html>
