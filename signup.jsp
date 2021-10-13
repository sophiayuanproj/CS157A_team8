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
	
	Could improve security through a salt
	salt CHAR(5)
	-->
	
	<body>  
		<h1>Sign Up</h1>
		<form action="signup.jsp" method="POST">
			<div class="container">
				<label for="email"><b>Email</b></label>
				<input type="text" placeholder="Enter Email" name="email" required>
				
				<label for="password"><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password" required>
				
				<label for="passwordRepeat"><b>Repeat Password</b></label>
				<input type="password" placeholder="Repeat Password" name="passwordRepeat" required>
				
				<div class="buttonBlock">
				  <button type="button" class="cancelButton">Cancel</button>
				  <button type="submit" class="signupButton">Sign Up</button>
				</div>
			</div>
		</form>
		
		
	</body>  
</html>  