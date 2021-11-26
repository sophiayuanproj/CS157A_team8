<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spartan Supplies- Search for your class</title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
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