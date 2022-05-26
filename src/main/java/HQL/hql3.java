package HQL;

import model.KV_JavaBeen;

import java.sql.*;
import java.util.ArrayList;

import static utils.HiveUtils.getConnection;


public class hql3 {
    private final static String TABELNAME = "niit.movies";

    public static ArrayList<KV_JavaBeen> getMovies(int length, int from, int to) throws SQLException {
        ArrayList<KV_JavaBeen> kvs = new ArrayList<>();
        String sql = "select year_of_release, count(id) from " + TABELNAME + " " +
                     "where length(movie_name) >= " + length + " " +
                     "group by year_of_release " +
                     "having year_of_release >= " + from + " and year_of_release <= " + to;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet res = statement.executeQuery(sql);
        ) {
            while (res.next()) {
                KV_JavaBeen kv = new KV_JavaBeen();
                kv.setK(String.valueOf(res.getInt(1)));
                kv.setV(String.valueOf(res.getInt(2)));
                kvs.add(kv);
            }
        }
        return kvs;
    }

    public static void main(String[] args) {
        try {
            getMovies(30, 1995, 2005);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
