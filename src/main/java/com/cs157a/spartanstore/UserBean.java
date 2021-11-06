package com.cs157a.spartanstore;

public class UserBean {
    private String name;
    private String email;
    private String password;
    private String salt;
    public boolean valid;

    public String getName() {
        return name;
    }

    public void setName(String newName) {
        name = newName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String newEmail) {
        email = newEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String newPassword) {
        password = newPassword;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String newSalt) {
        salt = newSalt;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean newValid) {
        valid = newValid;
    }
}
