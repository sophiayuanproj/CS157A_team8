<%--
  Created by IntelliJ IDEA.
  User: SophiaYuan
  Date: 11/8/21
  Time: 9:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spartan Supplies- Add your items here</title>
</head>
<body>
<h1>Add items to your store</h1>

<form method=get>
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
</body>
</html>
