package HQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static utils.HiveUtils.getConnection;

public class hql2 {

    public static List<String> getMovies(double rate, int len, int limit) throws Exception {
        List<String> movieList = new ArrayList<>();
        try (Connection connection = getConnection()) {
            System.out.println("-----------------------Begin-----------------------");
            Statement statement = connection.createStatement();
            System.out.println("-----------------------connection successfully-----------------------");
            String sql = "select movie_name,rating, length(movie_name) from " +
                             "(select * from movies where rating>" + rate +
                             " and length(movie_name)>" + len + ")a " +
                         "order by rating desc limit " + limit;
            System.out.println("Running: " + sql);
            ResultSet res = statement.executeQuery(sql);
            while (res.next()) {
                String line = res.getString(1) + " " +
                        Double.valueOf(res.getString(2)) + " " +
                        Integer.parseInt(res.getString(3));
                movieList.add(line);
            }
            statement.close();
        }
        return movieList;
    }

    public static void main(String[] args) {
        try {
            List<String> movies = getMovies(3.0,30,10);
            for (String movie : movies) {
                System.out.println(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
