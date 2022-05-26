package servlet.jsp.Echarts;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import HQL.hql1;
import com.alibaba.fastjson.JSONObject;
import model.KV_JavaBeen;

/**
 * @author 郑欣然 连仕杰
 */
@WebServlet(urlPatterns = "/Echart1")
public class Echart1 extends HttpServlet {
    private static final String URL = "http://localhost:8080/Group2/analyze/jsp1.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String stauts = "error";
        int from = Integer.parseInt(request.getParameter("from"));
        int to = Integer.parseInt(request.getParameter("to"));
        System.out.println(from + ":" + to);
        try {
            ArrayList<KV_JavaBeen> movie = hql1.getMovie(from, to);
            JSONObject targetJson = new JSONObject();
            targetJson.put("rows", movie);
            request.getSession().setAttribute("data1", targetJson);
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
}
