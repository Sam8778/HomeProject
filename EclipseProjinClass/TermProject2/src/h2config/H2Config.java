package h2config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * H2Config
 */
public class H2Config {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.h2.Driver";
    static final String DB_URL = "jdbc:h2:tcp://localhost/~/SkillMap";

    // Database credentials
    static final String USER = "sa";
    static final String PASS = "";

    	public static Connection getConnection() {
    		Connection conn = null;
            Statement stmt = null;

            try {
                Class.forName(JDBC_DRIVER);
                conn = DriverManager.getConnection(DB_URL, USER, PASS);
                stmt = conn.createStatement();
//                stmt.close();
//                conn.close();
            }
            catch(SQLException se) {  
                se.printStackTrace();
            } 
            catch (Exception e) {
                e.printStackTrace();
            }
		return conn;
	}
   

}
