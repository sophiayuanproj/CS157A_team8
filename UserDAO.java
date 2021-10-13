import java.sql.*;
 
public class UserDAO {
    public User checkLogin(String email, String userPassword) throws SQLException,
            ClassNotFoundException {
				
		String db = "cs157a_team8_database";
		String user = "root";
		String password = "root";
 
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a_team8_database?autoReconnect=true&useSSL=false", user, password);
		
        String sqlStatement = "SELECT * FROM users WHERE email = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sqlStatement);
        statement.setString(1, email);
        statement.setString(2, userPassword);
 
        ResultSet result = statement.executeQuery();
        User user = null;
 
        if (result.next()) {
            user = new User();
            user.setFullname(result.getString("name"));
            user.setEmail(email);
        }
 
        connection.close();
 
        return user;
    }
}