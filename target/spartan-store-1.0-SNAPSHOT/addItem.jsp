<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
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

<div>
  <%
    UserBean currentUser = null;
    //currentUser.setName("sophia");
    currentUser = (UserBean) session.getAttribute("currentSessionUser");
    if (currentUser == null) {
      out.println("Welcome! Please login.");
    }
    else {
      out.println("Welcome " + currentUser.getEmail());
    }
  %>
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
  <b>Item Type (Apparel, Utilities, Technologies, Textbooks):</b>  <input type=text name="type" id = "type">
  <br>
  <br>
  <b>ISBN (If the item is a textbook):</b>  <input type=text name="isbn" id = "isbn">
  <br>
  <br>
  <b>Author (If the item is a textbook):</b>  <input type=text name="author" id = "author">
  <br>
  <br>
  <b>size (If the item is an apparel):</b>  <input type=text name="size" id = "size">
  <br>
  <br>
  <b>color (If the item is an apparel):</b>  <input type=text name="color" id = "color">
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

      String name = request.getParameter("name");
      String image = request.getParameter("image");
      String desc = request.getParameter("desc");
      String stock = request.getParameter("stock");
      String status = request.getParameter("status");
      String grade = request.getParameter("grade");
      String itemClass = request.getParameter("class");
      String price = request.getParameter("price");
      String itemType = request.getParameter("type");

      out.println("Item type: " + itemType);

      String isbn = request.getParameter("isbn");
      String author = request.getParameter("author");
      String color = request.getParameter("color");
      String size = request.getParameter("size");

      java.sql.Connection con;
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
      Statement stmt = con.createStatement();

      stmt.executeUpdate("INSERT INTO EditItem (ItemName, Email) VALUES (" + "\"" + name + "\"" + "," + "\"" +
              currentUser.getEmail() + "\"" + ");");

      stmt.executeUpdate("INSERT INTO Items (Items.ItemID, ItemName, Stock, Grade, Status," +
              "Class, Price, Image, ItemType)\n" +
              "VALUES ((SELECT MAX(EditItem.ItemID) FROM EditItem), " + "\"" + name + "\"" + "," + stock +
              "," + "\"" + grade  + "\"" + "," + "\"" + status + "\"" + "," + "\"" + itemClass +
              "\"" + "," + price + "," + "\"" + image + "\"" + ","+ "\"" + itemType + "\"" + ");");

      if(itemType.equals("Technologies")){
        stmt.executeUpdate("INSERT INTO Technologies (itemID, itemName, itemDescription)\n" +
                "VALUES ((SELECT MAX(EditItem.ItemID) FROM EditItem),"+ "\"" + name + "\"" + "," +
                "\"" + desc + "\""  +" );");

      }
      else if(itemType.equals("Textbooks")){
        stmt.executeUpdate("INSERT INTO Textbooks (ItemID, ItemName, ISBN, AuthorOne, ItemDescription) " +
                "VALUES ((SELECT MAX(EditItem.ItemID) FROM EditItem)," + "\"" +
                name + "\"" + "," + "\"" + isbn+ "\""  + ","+ "\""  + author + "\"" + "," + "\"" + desc + "\"" + ");");

      }
      else if(itemType.equals("Utilities")){
        stmt.executeUpdate("INSERT INTO Utilities (ItemID, ItemName, ItemDescription) " +
                "VALUES ((SELECT MAX(EditItem.ItemID) FROM EditItem)," + "\"" + name + "\"" + "," +
                "\"" + desc + "\"" + ");");

      }
      else if(itemType.equals("Apparel"));
      {
        stmt.executeUpdate("INSERT INTO Apparel (ItemID, ItemName, Size, Color, ItemDescription) " +
                "VALUES ((SELECT MAX(EditItem.ItemID) FROM EditItem),"+ "\"" + name + "\"" + "," + "\"" +
                size + "\"" + "," + "\"" + color + "\"" + "," + "\"" + desc + "\"" +");");

      }

      stmt.close();
      con.close();
    }catch(SQLException e){
        //out.println("SQLException caught: " + e.getMessage());
      out.println("");
      }

  %>

</body>
</html>