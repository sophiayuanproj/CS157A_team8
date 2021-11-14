<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>

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
      <title>Spartan Supplies- Item Description</title>
  </head>

  <body>
      <nav>
          <div class="upperLabel">
              <%
                  UserBean currentUser = null;
                  currentUser = (UserBean) session.getAttribute("currentSessionUser");
                  if (currentUser == null) {
              %>
              <a href="login.jsp">Login</a>
              <%
              }
              else {
              %>
              <a href="signout.jsp">Sign Out</a>
              <%
                  }
              %>

              <a href="Apparel.jsp">Apparel</a>
              <a href="Textbooks.jsp">Textbook</a>
              <a href="Utilities.jsp">Utilities</a>
              <a href="Technologies.jsp">Technologies</a>
              <a href="index.jsp">Home</a>
          </div>
      </nav>

<%--    <h1>Welcome to Spartan Supplies!</h1>--%>
      <div>
          <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
      </div>
      <br>
      <a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
      <br>
      <br>
      <br>
      <%--<span style="float:right"></span><a href="Cart.jsp">Cart</a></span>--%>

      <form align = "right" id = "searchForm" method = "post" action = "itemMainScreen.jsp" class = "form-horizontal">
        <b>Search on Spartan Supplies:</b>  <input type="text" placeholder="Search item name..." name = "searchQuery" id = "searchQuery" name = "Search">
         <input type=submit value="Submit">
      </form>

      <div>
          <%
              UserBean currentUser2 = null;
              currentUser2 = (UserBean) session.getAttribute("currentSessionUser");
              if (currentUser2 == null) {
                  out.println("Welcome! Please login.");
              }
              else {
                  out.println("Welcome " + currentUser2.getEmail());
              }
          %>
      </div>

    <span style="float:right"><a href="searchClass.jsp">Search for your class here!</a></span>
      <br>
      <br>
    <u><b>Filter</b></u>
<%--Scroll down for the rest of the filter--%>

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

            out.println("<table border=\"1\" align=\"right\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"175\">Image</th>\n" +
                    "            <th width=\"175\">Name</th>\n" +
                    "            <th width=\"175\">Stock</th>\n" +
                    "            <th width=\"175\">Grade</th>\n" +
                    "            <th width=\"175\">Status</th>\n" +
                    "            <th width=\"175\">Rating</th>\n" +
                    "            <th width=\"175\">Class</th>\n" +
                    "            <th width=\"175\">Price</th>\n" +
                    "        </tr>\n");

            String filter = request.getParameter("$10-$500");
            String filter2 = request.getParameter("$500-$1000");
            String filter3 = request.getParameter("$1000+");
            String filter4 = request.getParameter("small");
            String filter5 = request.getParameter("medium");
            String filter6 = request.getParameter("large");
            String filter7 = request.getParameter("student");
            String filter8 = request.getParameter("company");

//            //For testing
//            if(filter == null){
//                out.println("filter is null");
//            }
//            else if(filter.equals("on")) {
//                out.println("filter: " + filter + " filter 2: " + filter2);
//            }

            int low = 0;
            int high = 0;

            if(filter != null){
                low = 10;
                high = 500;
            }
            else if(filter2 != null){
                low = 500;
                high = 1000;
            }
            else if(filter3 != null){
                low = 1000;
                //2147483647 is the max int number in SQL
                high = 2147483647;
            }

            String size = "";

            if(filter4 != null){
                size = "S";
            }
            else if(filter5 != null){
                size = "M";
            }
            else if(filter6 != null){
                size = "L";
            }

            String seller = "";
            if(filter7 != null){
                seller = "student";
            }
            else if(filter8 != null){
                seller = "company";
            }

            if(low != 0 || high != 0){

                ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, ItemID, ItemType" +
                        " FROM Items WHERE Price BETWEEN " + low + " AND " + high + ";");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                            "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                            "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                            "&" + "itemName=" + rs.getString(2) +
                            "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                            "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
            else if(size != ""){
                ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, ItemID, ItemType \n" +
                        "FROM Items\n" +
                        "WHERE ItemName IN (SELECT ItemName FROM Apparel WHERE Size = \"" + size + "\");");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                            "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                            "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                            "&" + "itemName=" + rs.getString(2) +
                            "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                            "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
            else if(seller != ""){
                ResultSet rs = stmt.executeQuery("SELECT Items.Image, Items.ItemName, Items.Stock, Items.Grade, Items.Status, " +
                        "Items.Rating, Items.Class, Items.Price, Items.ItemID, Items.ItemType \n" +
                        "FROM Items JOIN EditItem USING (itemID) JOIN sellers USING (email)\n" +
                        "WHERE sellers.type = \"" + seller + "\";");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                            "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                            "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                            "&" + "itemName=" + rs.getString(2) +
                            "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                            "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }

            else if(searchQuery != null) {
                ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, " +
                        "ItemID, ItemType,Price FROM Items WHERE ItemName LIKE " + "\"" + searchQuery + "\""
                        + " OR " + "LOWER(ItemName) LIKE " + "\"" + "LOWER(" + searchQuery + ")" + "\"");

                if(rs.next() == false){
                    out.println("<p style=\"color:#FF0000\";>No results for your search query... please try again</p>");
                    out.println("</table>");
                }
                else {
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                                "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                                "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                                "&" + "itemName=" + rs.getString(2) +
                                "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                                "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                                "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                                + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                                "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                                + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                                "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                }
            }
            else {
                ResultSet rs = stmt.executeQuery("SELECT Image, ItemName, Stock, Grade, Status, Rating, Class, Price, itemID, " +
                        "itemType FROM Items");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(1) +
                            "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" + " " +
                            "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(9) +
                            "&" + "itemName=" + rs.getString(2) +
                            "&" + "itemType=" + rs.getString(10) + "\" />" + rs.getString(2) + "</a></td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(3) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(5) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getBigDecimal(6) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getString(7) + "</td>" +
                            "<td style=\"text-align: center;\">" + "$" + rs.getBigDecimal(8) + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }

            stmt.close();
            con.close();

        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }

        //This section is for the Filter
    %>
    <form id = "multipleSearch" method = "post" action = "itemMainScreen.jsp" class = "form-horizontal">
    <p>Price:</p>
    <input type="checkbox" id="$10-$500" name="$10-$500">
    <label for="$10-$500">$10-$500</label>
    </div>
    <div>
        <input type="checkbox" id="$500-$1000" name="$500-$1000">
        <label for="$500-$1000">$500-$1000</label>
    </div>
    <div>
        <input type="checkbox" id="$1000+" name="$1000+">
        <label for="$1000+">$1000+</label>
    </div>
    <p>Size:</p>
    <div>
        <input type="checkbox" id="small" name="small">
        <label for="small">Small</label>
    </div>
    <div>
        <input type="checkbox" id="medium" name="medium">
        <label for="medium">Medium</label>
    </div>
    <div>
        <input type="checkbox" id="large" name="large">
        <label for="large">Large</label>
    </div>
    <p>Seller:</p>
    <div>
        <input type="checkbox" id="student" name="student">
        <label for="student">Student</label>
    </div>
    <div>
        <input type="checkbox" id="company" name="company">
        <label for="company">Company</label>
    </div>
        <br>
        <input type=submit value="Submit">
        <a href="itemMainScreen.jsp">Clear filter selection</a>
    </form>
  </body>
</html>
