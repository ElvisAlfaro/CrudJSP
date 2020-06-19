package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionSQL {
    Connection conn;

    public ConexionSQL() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/persona", "root", "");
        } catch (Exception ex) {
            System.out.println("Error:" + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return conn;
    }
    
}
