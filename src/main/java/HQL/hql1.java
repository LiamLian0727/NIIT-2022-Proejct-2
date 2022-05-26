package HQL;

import model.KV_JavaBeen;

import java.sql.*;
import java.util.ArrayList;

import static utils.HiveUtils.getConnection;

public class hql1 {
    private final static String TABELNAME = "niit.movies";

    public static ArrayList<KV_JavaBeen> getMovie(int from, int to) throws SQLException {
        ArrayList<KV_JavaBeen> kvs = new ArrayList<>();
        String source = "[]";
        int skip = from - 1, wide = to - from;
        String query = "select movie_name,rating,year_of_release from " + TABELNAME +
                       " order by rating desc limit " + skip + "," + wide;

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet result = statement.executeQuery(query);
        ) {
            while (result.next()) {
                KV_JavaBeen kv = new KV_JavaBeen();
                kv.setK(result.getString(1));
                kv.setV(result.getDouble(2) + "$" + result.getInt(3));
                kvs.add(kv);
            }
        }
        return kvs;
    }

    public static void main(String[] args) throws SQLException {
        ArrayList<KV_JavaBeen> movie = getMovie(1, 10);
        for (KV_JavaBeen kv_javaBeen : movie) {
            System.out.println(kv_javaBeen);
        }
    }
}

