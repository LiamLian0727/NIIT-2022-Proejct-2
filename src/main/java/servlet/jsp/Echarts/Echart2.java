package servlet.jsp.Echarts;


import HQL.hql2;
import com.alibaba.fastjson.JSONObject;
import model.KV_JavaBeen;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
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
            ArrayList<KV_JavaBeen> movies = hql2.getMovies(rate, len, limit);
            JSONObject targetJson = new JSONObject();
            targetJson.put("rows", movies);
            request.getSession().setAttribute("data2", targetJson);
            stauts = "success";
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(URL+"?status=" + stauts);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
