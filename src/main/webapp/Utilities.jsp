<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spartan Supplies- Utilities</title>
</head>
<body>
    <h1>Utilities</h1>
      <span style="float:right"></span><a href="itemMainScreen.jsp">Back</a></span>
         
    <table border="1">
      <tr>
        <td>Item Type</td>
        <td>Item Number</td>
        <td>Item Name</td>
        <td>Stock</td>
        <td>Item Description</td>
        <td>Item Author</td>
        
   </tr>
        </br>
    
           <% 
     String db = "cs157a_team8_database";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "root";
        try {
           
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false",user, password);
            //out.println(db + " database successfully opened.<br/><br/>");
            
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM Utilities");
            while (rs.next()) {
                out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");
            } 
            
            
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>