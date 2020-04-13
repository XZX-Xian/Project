package webproject.servlet.comm;

import com.alibaba.fastjson.JSON;
import webproject.entity.Comm;
import webproject.service.CommService;
import webproject.service.impl.CommServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * 商品模糊查询
 */
@WebServlet(name = "ComLike",urlPatterns = "/comlike")
public class ComLike extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");

        List<Comm> list = new ArrayList<>();
        CommService str=new CommServiceImpl();
        list=str.CommLike(name);
        String json=null;
        json= JSON.toJSONString(list);

        System.out.println(json);
        out.print(json);
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
