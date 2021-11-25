<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body{
            font-family: Arial;
        }
        .center {
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
    <title>Spartan Supplies- Search for your class</title>
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
    <h1>Find Supplies for your class here!</h1>
    
     <form method=get>
  	<b>Enter class name(e.g. CS):</b>  <input type=text name=guess>
 	 <input type=submit value="Submit">
  </form>
    <form method=get>
        <b>Enter class code(e.g. 157A):</b>  <input type=text name=guess>
        <input type=submit value="Submit">
    </form>

</body>
</html>