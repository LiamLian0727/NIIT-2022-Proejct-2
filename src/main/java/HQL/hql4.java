package HQL;

import model.KV_JavaBeen;

import java.sql.*;
import java.util.ArrayList;

import static utils.HiveUtils.getConnection;

public class hql4 {
    private final static String TABELNAME = "niit.movies";
    public static ArrayList<KV_JavaBeen> getMovies(int year, int limit) throws SQLException {
        ArrayList<KV_JavaBeen> kvs = new ArrayList<>();
        String sql = "select movie_name, rating from " + TABELNAME + " " +
                     "where year_of_release = "+ year +" order by rating desc limit " + limit;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet res = statement.executeQuery(sql);
        ) {
            while (res.next()) {
                KV_JavaBeen kv = new KV_JavaBeen();
                kv.setK(res.getString(1));
                kv.setV(String.valueOf(res.getDouble(2)));
                kvs.add(kv);
            }
        }
        return kvs;
    }

    public static void main(String[] args) {
        try {
            getMovies(2000,10);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
