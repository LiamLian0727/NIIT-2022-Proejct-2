package utils;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;

/**
 * @author 连仕杰
 */
public class HiveUtils {
    private static final String CONFIG = "D:\\work\\Group2\\src\\env\\hive.yaml";
    public static Connection getConnection() throws SQLException {
        HashMap<String, Object> yaml = new HashMap();
        try {
            yaml = LoadYaml.<Object>getYaml(CONFIG);
            Class.forName((String) yaml.get("driverClass"));
        } catch (ClassNotFoundException | FileNotFoundException e) {
            e.printStackTrace();
        }
        HashMap<String, String> hive_config = (HashMap<String, String>)yaml.get("hive_config");
        Connection connection = DriverManager.getConnection(
                hive_config.get("url"),
                hive_config.get("user"),
                hive_config.get("password")
        );
        return connection;
    }

    public static void main(String[] args) throws FileNotFoundException, SQLException {
        getConnection();
    }



}
