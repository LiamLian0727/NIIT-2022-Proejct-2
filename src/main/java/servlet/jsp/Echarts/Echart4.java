package servlet.jsp.Echarts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import HQL.hql4;
import com.alibaba.fastjson.JSONObject;
import model.KV_JavaBeen;

/**
 * @author 连仕杰
 */
@WebServlet(urlPatterns = "/Echart4")
public class Echart4 extends HttpServlet {
    private static final String URL = "http://localhost:8080/Group2/analyze/jsp4.jsp";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String stauts = "error";
        int year = Integer.parseInt(request.getParameter("year"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        try {
            ArrayList<KV_JavaBeen> movies = hql4.getMovies(year, limit);
            JSONObject targetJson = new JSONObject();
            targetJson.put("rows", movies);
            request.getSession().setAttribute("year", year);
            request.getSession().setAttribute("data4", targetJson);
            stauts = "success";
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect(URL+"?status=" + stauts);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public static void main(String[] args) {

    }
}
