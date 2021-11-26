<%@ page import="com.cs157a.spartanstore.UserBean" %><%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%--reference: https://www.w3schools.com/howto/howto_css_image_center.asp--%>
<!DOCTYPE html>
<html>
<head>
    <title>Spartan Supplies - Home</title>
</head>
<body>
<%@ include file="navbar.jspf" %>
<div>
    <img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
</div>
</div>
<br>
<a href="Cart.jsp"><img style="float:right" src="images/cart.png" width="50" height="50"></a>
<br>
<br>
<br>
<form align = "right" id = "searchForm" method = "post" action = "itemMainScreen.jsp" class = "form-horizontal">
    <b>Search on Spartan Supplies:</b>  <input type="text" placeholder="Search item name..." name = "searchQuery" id = "searchQuery" name = "Search">
    <input type=submit value="Submit">
</form>
<br>
<span style="float:right"><a href="searchClass.jsp">Search for your class here!</a></span>
<br>
<br>
<br>
<br>
<br>
<div>
    <p style="text-align:center;"><img src="images/sjsu_img1.jpg" style = "width: 70%;"></p>
</div>
<div>
    <a href="credits.jsp">Image credits</a>
</div>
</body>
</html>
