<%--
  Created by IntelliJ IDEA.
  User: Edward
  Date: 11/25/2021
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reviews</title>
</head>
<body>
    <%@ include file="navbar.jspf" %>
    <main>
        <h1>See a Seller's Reviews</h1>
        <form action="reviewsList.jsp" method="post">
            <label for="view-review">Seller's Email:</label>
            <input type="email" name="view-review" id="view-review" />
            <input type="submit" value="Submit" />
        </form>

        <h1>Create a Review</h1>
        <form action="writeReview.jsp" method="post" >
            <label for="write-review">Seller's Email:</label>
            <input type="email" name="write-review" id="write-review" />
            <br />
            <br />
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" />
            <br />
            <br />
            <label for="review-body">Review:</label>
            <textarea name="review-body" id="review-body" rows="10" cols="40"></textarea>
            <br />
            <br />
            <label for="review-rating">Rating (1.00 - 5.00):</label>
            <input type="number" name="review-rating" id="review-rating" step="0.01" min="1" max="5" />
            <br />
            <br />
            <input type="submit" value="Submit" />
        </form>
    </main>
</body>
</html>
