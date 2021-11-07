package com.cs157a.spartanstore;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {
    static Connection currentCon = null;
    static ResultSet rs = null;

    public static String hashPassword(String passwordToHash, String salt){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt.getBytes(StandardCharsets.UTF_8));
            byte[] bytes = md.digest(passwordToHash.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++){
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public static UserBean login(UserBean bean) {
        //preparing some objects for connection
        Statement stmt = null;

        String email = bean.getEmail();
        String password = bean.getPassword();

        String searchQuery =
                "select * from users where email='"
                        + email
                        + "'";

        // "System.out.println" prints in the console; Normally used to trace the process
        System.out.println("Your email is " + email);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            //connect to DB
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user does not exist set the isValid variable to false
            if (!more) {
                System.out.println("Sorry, you are not a registered user! Please sign up first");
                bean.setValid(false);
            }

            //if user exists set the isValid variable to true
            else if (more) {
                String salt = rs.getString("salt");
                password = hashPassword(password, salt);

                if (password.equals(rs.getString("password"))) {
                    String name = rs.getString("name");
                    System.out.println("Welcome " + name);
                    bean.setName(name);
                    bean.setValid(true);
                }
                else {
                    System.out.println("Sorry, you are not a registered user! Please sign up first");
                    bean.setValid(false);
                }
            }
        }

        catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        //some exception handling
        finally {
            if (rs != null)	{
                try {
                    rs.close();
                } catch (Exception e) {}
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {}
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {}
                currentCon = null;
            }
        }

        return bean;
    }
}
