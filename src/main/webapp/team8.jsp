<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Spartan Supplies- Item Description</title>
    </head>
  <body>
    <h1>Welcome to Spartan Supplies!</h1>
    
  <%-- code found here: https://stackoverflow.com/questions/45307836/placing-button-on-bottom-right-corner-of-jsp-page --%>>
<span style="float:right"></span><a href="src/main/webapp/cart.jsp">Cart</a></span>

   <%-- code found here: http://localhost:8080/examples/jsp/num/numguess.jsp.html--%>
  <form method=get>
  	<b>Search on Spartan Supplies:</b>  <input type=text name=guess>
 	 <input type=submit value="Submit">
  </form>
  
<span style="float:right"></span><a href="src/main/webapp/searchClass.jsp">Search for your class here!</a></span>

 
 <center>
   <br>
    <table border="1">
      <tr>
        <td>Item Type</td>
        <td>Item Number</td>
        <td>Item Name</td>
        <td>Stock</td>
        <td>Item Description</td>
        <td>Item Author</td>
        </tr>
</center>        
        
<!--    <form action = "team8.jsp">
   <select name = "search">
   <option value = "Everything">Everything</option>
   <option value = "Textbooks">Textbooks</option>
   <option value = "Utilities">Utilities</option>
   <option value = "Technologies">Technologies</option>
   <option value = "Apparel">Apparel</option>
   </select>
   <input type="submit" value="Submit">
   </form> -->
   
<b>Sort by: </b> <span style="float:right"></span><a href="Textbooks.jsp">Textbooks</a></span> <text> | </text> 

<span style="float:right"></span><a href="Utilities.jsp">Utilities</a></span> <text> | </text> 

<span style="float:right"></span><a href="Technologies.jsp">Technologies</a></span> <text> | </text> 

<span style="float:right"></span><a href="src/main/webapp/Apparel.jsp">Apparel</a></span>
<br>
  
  </table>
	
	<br>

<center>
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
           
            
            ResultSet rs = stmt.executeQuery("SELECT * FROM item_description");
            while (rs.next()) {
                out.println(rs.getString(1) + " " + rs.getInt(2) + " " + rs.getString(3) + " " + rs.getInt(4) + " " + rs.getString(5)+ " " + rs.getString(6) + "<br/><br/>");
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
    </center>
  </body>
</html>
