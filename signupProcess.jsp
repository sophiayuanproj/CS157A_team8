<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*"%>

<%
	String email = request.getParameter("email");
	String accountPassword = request.getParameter("password");
	
	out.println(email);
	out.println(accountPassword);
	
	String db = "cs157a_team8_database";
    String user = "root";
    String password = "root";

	try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
		
		Statement statement = connection.createStatement();

		int i = statement.executeUpdate("INSERT INTO login(email, password) VALUES('" + email + "','"+ accountPassword +"')");
		out.println("Data is successfully inserted!");
	}
	catch(Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>