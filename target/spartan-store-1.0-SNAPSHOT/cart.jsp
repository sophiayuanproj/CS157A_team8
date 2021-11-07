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
    
   <span style="float:right"></span><a href="../../../team8.jsp">Back</a></span>
   <br>
          
        <table border="1">
      <tr>
        <td>Item Name</td>
        <td>Amount</td>
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
            
           
            ResultSet rs = stmt.executeQuery("SELECT cart_description.itemName, amount, price FROM cart_description, item_description  WHERE cart_description.itemName = item_description.itemName");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getInt(2) + " " + rs.getInt(3) + "<br/><br/>");
            }
            
            
            
            //Can't figure this part out for now
/*             String option = request.getParameter("search");
            
            out.println(request.getParameter("search"));
            
            if(option.equals("Textbooks")){
            	ResultSet textbook = stmt.executeQuery("SELECT * FROM item_description WHERE itemType = \"Textbook\"");
	            while (textbook.next()) {
	            	out.println(textbook.getString(1) + " " + textbook.getInt(2) + " " + textbook.getString(3) + " " + textbook.getInt(4) + " " + textbook.getString(5)+ " " + textbook.getString(6) + "<br/><br/>");
	            } 
	            textbook.close();
	        } */
            
            
            
            //making test for cart
            //String add_test = "INSERT INTO item_description VALUES ('test3', 1, 'test3', 1, 'test3', 'test3')";
            
            //int test = stmt.executeUpdate(add_test);
            
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>