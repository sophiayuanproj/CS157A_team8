<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Spartan Supplies- Item Description</title>
    </head>
  <body>
    <h1>Welcome to Spartan Supplies!</h1>

<span style="float:right"></span><a href="Cart.jsp">Cart</a></span>

    <center>
      <form id = "searchForm" method = "post" action = "itemMainScreen.jsp" class = "form-horizontal">
        <b>Search on Spartan Supplies:</b>  <input type="text" placeholder="Search item name..." name = "searchQuery" id = "searchQuery" name = "Search">
         <input type=submit value="Submit">
      </form>

    <span style="float:right"></span><a href="searchClass.jsp">Search for your class here!</a></span>

   <br>
    </center>
   <center>
<b>Sort by: </b> <span style="float:right"></span><a href="Textbooks.jsp">Textbooks</a></span> <text> | </text> 

<span style="float:right"></span><a href="Utilities.jsp">Utilities</a></span> <text> | </text> 

<span style="float:right"></span><a href="Technologies.jsp">Technologies</a></span> <text> | </text> 

<span style="float:right"></span><a href="Apparel.jsp">Apparel</a></span>
<br>
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
            //out.println(db + " database successfully opened.<br/><br/>");
            
            //out.println("Initial entries in table \"item_description\": <br/>");
            Statement stmt = con.createStatement();
           
           String searchQuery = request.getParameter("searchQuery");

           //For testing
           //out.println("THIS IS THE SEARCH QUERY:" + searchQuery);

            out.println("<table border=\"1\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"200\">Name</th>\n" +
                    "            <th width=\"200\">Stock</th>\n" +
                    "            <th width=\"200\">Grade</th>\n" +
                    "            <th width=\"200\">Status</th>\n" +
                    "            <th width=\"200\">Rating</th>\n" +
                    "            <th width=\"200\">Class</th>\n" +
                    "            <th width=\"200\">Price</th>\n" +
                    "        </tr>\n");

           if(searchQuery == null) {
               ResultSet rs = stmt.executeQuery("SELECT ItemName, Stock, Grade, Status, Rating, Class, Price FROM Items");
               while (rs.next()) {
                   out.println("<tr>");
                   out.println("<td style=\"text-align: center;\">" + rs.getString(1) + "</td>" + " " +
                           "<td style=\"text-align: center;\">" + rs.getInt(2) + "</td>" + " " +
                           "<td style=\"text-align: center;\">" + rs.getString(3) + "</td>" + " "
                           + "<td style=\"text-align: center;\">" +  rs.getString(4) + "</td>" + " " +
                           "<td style=\"text-align: center;\">" + rs.getBigDecimal(5) + "</td>" + " "
                           + "<td style=\"text-align: center;\">" + rs.getString(6) + "</td>"+
                           "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(7) + "</td>");
                   out.println("</tr>");
               }
               out.println("</table>");
           }
           else {

               ResultSet rs = stmt.executeQuery("SELECT ItemName, Stock, Grade, Status, Rating, Class, " +
                       "Price FROM Items WHERE ItemName LIKE " + "\"" + searchQuery + "\""
                       + " OR " + "LOWER(ItemName) LIKE " + "\"" + "LOWER(" + searchQuery + ")" + "\"");

               if(rs.next() == false){
                   out.println("No results for your search query... please try again");
                   out.println("</table>");
               }
               else {
                   while (rs.next()) {
                       out.println("<tr>");
                       out.println("<td>" + rs.getString(1) + "</td>" + " " + "<td>" + rs.getInt(2) + "</td>" + " " +
                               "<td>" + rs.getString(3) + "</td>" + " " + "<td>" +  rs.getString(4) + "</td>" + " " +
                               "<td>" + rs.getBigDecimal(5) + "</td>" + " " + "<td>" + rs.getString(6) + "</td>"+ "<td>"
                               + "$" + rs.getBigDecimal(7) + "</td>");
                       out.println("</tr>");
                   }
                   out.println("</table>");
               }
           }
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    </center>
  </body>
</html>
