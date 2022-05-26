package servlet.jsp.Echarts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import HQL.hql5;

/**
 * @author 连仕杰
 */
@WebServlet(urlPatterns = "/Echart5")
public class Echart5 extends HttpServlet {
    private static final String URL = "http://localhost:8080/Group2/analyze/jsp5.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String stauts = "error";
        int[] movie = new int[0];
        try {
            movie = hql5.getMovie();
            int prime = movie[0];
            int composite = movie[1];
            request.getSession().setAttribute("prime", prime);
            request.getSession().setAttribute("composite", composite);
            stauts = "success";
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        response.sendRedirect(URL + "?status=" + stauts);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public static void main(String[] args) {

    }
}
