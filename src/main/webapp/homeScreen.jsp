<%--reference: https://www.w3schools.com/howto/howto_js_topnav.asp--%>
<%--reference: https://www.w3schools.com/howto/howto_css_image_center.asp--%>
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
<div>
<img src="images/s_s.png" align="left" style = "display: block; width: 15%; height: 15%;" border="0">
</div>
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
<br>
<br>
<div>
<img src="images/sjsu_img1.jpg" class="center" style = "width: 70%;">
</div>

</body>
</html>
