package utils;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static utils.HiveUtils.getConnection;


/**
 * @author 连仕杰
 */


public class DataFromTxt {

    public static final String DATABASENAME = "niit";
    public static final String TABLENAME = "movies";

    public static void dataFromTxtToHive(String path) throws IOException, URISyntaxException, InterruptedException {

        try (Connection connection = getConnection()) {
            Statement statement = connection.createStatement();
            statement.execute("use " + DATABASENAME);
            statement.execute("DROP table " + TABLENAME);
            String query = "create table " + TABLENAME +
                           "(id int, movie_name string,year_of_release int,rating double,movie_duration_second int)" +
                           "row format delimited " +
                           "fields terminated by ',' " +
                           "lines terminated by '\\n' " +
                           "stored as textfile TBLPROPERTIES (\"skip.header.line.count\"=\"1\")";
            statement.execute(query);
            System.out.println("Table has been create successfully");
            query = "LOAD DATA INPATH '" + path + "' into TABLE " + TABLENAME;
            statement.execute(query);
            System.out.println("Table has been load successfully");
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            dataFromTxtToHive("hdfs://niit:9000/movies.txt");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


}
