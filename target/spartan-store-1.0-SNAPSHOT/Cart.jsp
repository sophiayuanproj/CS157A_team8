<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spartan Supplies- Cart</title>
</head>
<body>
    <h1>My Cart</h1>
    
   <span style="float:right"></span><a href="itemMainScreen.jsp">Back</a></span>
   <br>
          
        <table border="1">
      <tr>
        <td>Item Name</td>
        <td>Quantity</td>
        <td>Price</td>

        
   </tr>
    <% 
     String db = "cs157a_team8_database";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {
           
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            //out.println("Initial entries in table \"item_description\": <br/>");
            Statement stmt = con.createStatement();
            
           out.println("Mock cart, edit soon");
            ResultSet rs = stmt.executeQuery("SELECT ItemName, Quantity, Price FROM Cart");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getInt(2) + " " + rs.getBigDecimal(3) + "<br/><br/>");
            }
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>