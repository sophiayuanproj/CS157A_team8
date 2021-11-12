<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%--reference: https://www.w3schools.com/howto/howto_css_image_center.asp--%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <a href="homeScreen.jsp">Home</a>

</div>
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
            ResultSet rs = stmt.executeQuery("SELECT ItemName, Quantity, Price FROM ItemsInCart");
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