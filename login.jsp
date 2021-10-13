<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login</title>
	</head>
	
	<body>  
		<h1>Login</h1>
		<!-- Not sure what to do with action yet, but I do know that form data will be sent to the page specified by it -->
		<!-- We could either send it login.jsp and have the authentication logic here, or we could send it to some other page specifically for the auth logic -->
		<form action="login.jsp">
			<div class="container">
				<label for="username"><b>Username</b></label>
				<input type="text" placeholder="Enter Username" name="username" required>
				
				<label for="password"><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password" required>
				
				<button>Login</button>
				<label>
					<input type="checkbox" checked="checked" name="rememberMe"> Remember me
				</label>
			</div>
			
			<div class="container" style="background-color:#f1f1f1">
				<button type="button" class="cancelButton">Cancel</button>
				<span class="psw"><a href="#">Forgot password?</a></span>
			</div>
		</form>
	</body>  
</html>  