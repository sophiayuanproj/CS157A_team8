<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sign Up</title>
	</head>
	
	<!-- 
	In database, we can do
	email VARCHAR(something)
	password VARCHAR(something)
	-->
	
	<body>  
		<h1>Sign Up</h1>
		<form action="signupProcess.jsp" method="POST">
			<div class="container">
				<label for="email"><b>Email</b></label>
				<input type="email" placeholder="Enter Email" name="email" required>
				
				<label for="password"><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password" required>
				
				<input type="submit" value="Sign Up">
			</div>
		</form>
	</body>  
</html>  