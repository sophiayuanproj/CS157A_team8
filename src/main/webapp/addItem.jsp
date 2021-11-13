<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    <title>Spartan Supplies- Add your items here</title>
</head>
<body>

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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1 style="text-align:center">Add items to your store</h1>
<br>
<form method="get" style="text-align:center">
  <b>Item Name:</b>  <input type=text name="name" id = "name">
  <br>
  <br>
  <b>Item Image:</b> <input type=file accept="image" name="image" id="image">
  <br>
  <br>
  <b>Item Description:</b>  <input type=text name= "desc" id = "desc">
  <br>
  <br>
  <b>Item Stock:</b>  <input type=text name="stock" id = "stock">
  <br>
  <br>
  <b>Item Status:</b>  <input type=text name="status" id = "status">
  <br>
  <br>
  <b>Grade:</b>  <input type=text name="grade" id = "grade">
  <br>
  <br>
  <b>Class:</b>  <input type=text name="class" id = "class">
  <br>
  <br>
  <b>Item Price:</b>  <input type=text name="price" id = "price">
  <br>
  <br>
  <input type=submit value="Submit">
</form>

  <%

    String db = "cs157a_team8_database";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";
    try {

      java.sql.Connection con;
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
      Statement stmt = con.createStatement();




      stmt.close();
      con.close();
    } catch(SQLException e) {
      out.println("SQLException caught: " + e.getMessage());
    }

  %>

</body>
</html>