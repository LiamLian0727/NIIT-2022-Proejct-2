package HQL;

import model.KV_JavaBeen;

import java.sql.*;
import java.util.ArrayList;

import static utils.HiveUtils.getConnection;

public class hql2 {

    private final static String TABELNAME = "niit.movies";

    public static ArrayList<KV_JavaBeen> getMovies(double rate, int len, int limit) throws Exception {
        ArrayList<KV_JavaBeen> kvs = new ArrayList<>();
        String sql = "select movie_name, rating, length(movie_name) from " + TABELNAME + " " +
                     "where rating > " + rate + " and length(movie_name) > " + len + " " +
                     "order by rating desc limit " + limit;

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet res = statement.executeQuery(sql);
        ) {
            while (res.next()) {
                KV_JavaBeen kv = new KV_JavaBeen();
                kv.setK(res.getString(1));
                kv.setV(res.getString(2) + "$" + res.getString(3));
                kvs.add(kv);
            }
        }
        return kvs;
    }

    public static void main(String[] args) {
        try {
            getMovies(3, 30, 5);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
