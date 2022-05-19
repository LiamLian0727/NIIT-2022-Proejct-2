package servlet.jsp.Echarts;


import HQL.hql2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * @author 殷明，刘宣兑
 */
@WebServlet(urlPatterns = "/Echart2")
public class Echart2 extends HttpServlet {
    private static final String URL = "http://localhost:8080/Group2/analyze/jsp2.jsp";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stauts = "error";
        double rate = Double.parseDouble(request.getParameter("rate"));
        int len = Integer.parseInt(request.getParameter("len"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        System.out.println("Rate: " + rate + " Len: " + len + " Limit: " + limit);
        try {
            List<String> movies = hql2.getMovies(3.0,30,10);
            for (String movie : movies) {
                System.out.println(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        stauts = "success";
        response.sendRedirect(URL+"?status=" + stauts);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
