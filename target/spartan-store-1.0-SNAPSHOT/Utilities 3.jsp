<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>

<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spartan Supplies- Utilities</title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
    <h1>Utilities</h1>
    <div>
        <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
    </div>
    <br>
    <a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
    <br>
    <br>
    <br>
    
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
            
            ResultSet rs = stmt.executeQuery("SELECT Utilities.itemName, itemDescription, Image, Price, " +
                    "Utilities.ItemID, Items.ItemType " +
                    "FROM Utilities JOIN Items USING (ItemID) WHERE ItemType=" + "\"" + "Utilities" + "\";");

            out.println("<table border=\"1\" align=\"center\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"175\">Image</th>\n" +
                    "            <th width=\"175\">Item Name</th>\n" +
                    "            <th width=\"175\">Description</th>\n" +
                    "            <th width=\"175\">Price</th>\n" +
                    "        </tr>\n");

            while (rs.next()) {

                out.println("<tr>");
                out.println("<td style=\"text-align: center;\">" + "<img src = \"images/" + rs.getString(3) +
                        "\" alt = \"Item Image\" width= \"125\" height = \"100\">" + "</td>" +
                        "<td style=\"text-align: center;\"><a href=\"displayItem.jsp?" + "itemID=" + rs.getString(5) +
                        "&" + "itemName=" + rs.getString(1) +
                        "&" + "itemType=" + rs.getString(6) + "\" />" + rs.getString(1) + "</a></td>" + " "
                        + "<td style=\"text-align: center;\">" + rs.getString(2) + "</td>"
                        + "<td style=\"text-align: center;\">" + rs.getString(4) + "</td>"
                        + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>