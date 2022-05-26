package HQL;

import java.sql.*;

import static utils.HiveUtils.getConnection;

public class hql5 {
    private final static String TABELNAME = "niit.movies";

    public static int[] getMovie() throws SQLException {
        int sum = 45836, prime = 5781, composite = 40055;
        String query1 = "select count(*) as sum from " + TABELNAME + " " +
                        "where movie_duration_second is not null";
        String query2 = "select count(*) as prime from " + TABELNAME + " " +
                        "where isPrime(" +
                        "if(movie_duration_second is null, 0, movie_duration_second)" +
                        ") > 0";
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement()
        ) {
            ResultSet result = statement.executeQuery(query1); result.next();
            sum = result.getInt(1);
            result = statement.executeQuery(query2); result.next();
            prime = result.getInt(1);
            composite = sum - prime;
            result.close();
        }
        return new int[]{prime, composite};
    }

    public static void main(String[] args) {
        int[] movie = new int[0];
        try {
            movie = getMovie();
            int prime = movie[0];
            int composite = movie[1];
            System.out.println("prime: " + prime + " composite: " + composite);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
