<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%--reference: https://www.w3schools.com/howto/howto_css_image_center.asp--%>

<%@ page import="java.sql.*"%>
<%@ page import="com.cs157a.spartanstore.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Spartan Supplies- Cart</title>
</head>
<body>
<div class="upperLabel">
    <a href="login.jsp">Login</a>
    <a href="Apparel.jsp">Apparel</a>
    <a href="Textbooks.jsp">Textbook</a>
    <a href="Utilities.jsp">Utilities</a>
    <a href="Technologies.jsp">Technologies</a>
    <a href="itemMainScreen.jsp">All Items</a>
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

    <h1>My Cart</h1>
    
   <span style="float:right"></span><a href="itemMainScreen.jsp">Back</a></span>
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
            
            //out.println("Initial entries in table \"item_description\": <br/>");
            Statement stmt = con.createStatement();
                        out.println("<table border=\"1\" align=\"left\">\n" +
                    "        <tr>\n" +
                    "            <th width=\"175\">Item Name</th>\n" +
                    "            <th width=\"175\">Quantity</th>\n" +
                    "            <th width=\"175\">Price</th>\n" +
                                "            <th width=\"175\">Remove</th>\n" +
                    "        </tr>\n");

            ResultSet rs = stmt.executeQuery("SELECT ItemName, SUM(Quantity), SUM(Price), MAX(listingID) " +
            "FROM ItemsInCart JOIN Shopping USING (listingID) " +
            "WHERE email =" + "\""+ currentUser.getEmail() + "\"" +
            " GROUP BY ItemName;");

            while (rs.next()) {
                out.println("<tr>");
                    out.println("<td style=\"text-align: center;\">" + rs.getString(1) + "</td>" + " " +
                            "<td style=\"text-align: center;\">" + rs.getInt(2) + "</td>" + " "
                            + "<td style=\"text-align: center;\">" + rs.getBigDecimal(3) + "</td>" +
                           "<td style=\"text-align: center;\"><a href=\"itemRemoved.jsp?"+ "qty=" + rs.getInt(2)
                            + "&listingID=" + rs.getString(4) +"\" />" +
                            "<img src=\"images/trashcan.png\" " +
                            "width=\"50\" height=\"50\" >" + "</a></td>");
                    out.println("</tr>");
                }
                out.println("</table>");

            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");
            out.println("<b><h3>Total: ");
            rs = stmt.executeQuery("SELECT SUM(Price)\n" +
                    "FROM ItemsInCart JOIN Shopping USING (listingID)\n" +
                    "WHERE email =" + "\"" + currentUser.getEmail() + "\"" + ";");

            while(rs.next()){
                out.println(rs.getBigDecimal(1));
            }
            out.println("</h3></b>");


           
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
</body>
</html>