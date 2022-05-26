package servlet.jsp.Echarts;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import HQL.hql3;
import com.alibaba.fastjson.JSONObject;
import model.KV_JavaBeen;

/**
 * @author 连仕杰
 */
@WebServlet(urlPatterns = "/Echart3")
public class Echart3 extends HttpServlet {
    private static final String URL = "http://localhost:8080/Group2/analyze/jsp3.jsp";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stauts = "error";
        int len = Integer.parseInt(request.getParameter("len"));
        int from = Integer.parseInt(request.getParameter("from"));
        int to = Integer.parseInt(request.getParameter("to"));
        try {
            ArrayList<KV_JavaBeen> movies = hql3.getMovies(len, from, to);
            JSONObject targetJson = new JSONObject();
            targetJson.put("rows", movies);
            request.getSession().setAttribute("data3", targetJson);
            stauts = "success";
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect(URL+"?status=" + stauts);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
