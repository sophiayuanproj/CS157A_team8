<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Spartan Supplies- Item Description</title>
    </head>
  <body>
    <h1>Item Description</h1>
    
    <table border="1">
      <tr>
        <td>Item Type</td>
        <td>Item Number</td>
        <td>Item Name</td>
        <td>Stock</td>
        <td>Item Description</td>
        <td>Item Author</td>
        
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
            
            out.println("Initial entries in table \"item_description\": <br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM item_description");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getInt(2) + " " + rs.getString(3) + " " + rs.getInt(4) + " " + rs.getString(5)+ " " + rs.getString(6) + "<br/><br/>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
