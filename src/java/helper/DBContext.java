package helper;

import config.DBInformation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            //Change the username password and url to connect your own database
            String username = DBInformation.USER_NAME;
            String password = DBInformation.PASS_WORD;
            String URLformat = "jdbc:sqlserver://%s;databaseName=%s";
            String url = String.format(URLformat, DBInformation.LOCAL_HOST, DBInformation.DB_NAME);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("connect database sucessfully");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
