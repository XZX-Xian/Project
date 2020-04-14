package webproject.servlet.comm;

import com.alibaba.fastjson.JSON;
import webproject.service.CommService;
import webproject.service.impl.CommServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 商品删除
 */
@WebServlet(name = "ComDel",urlPatterns = "/commdel")
public class ComDel extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String ids=request.getParameter("ids");
        CommService str=new CommServiceImpl();
        int count=str.ComDel(ids);
        String json=null;
        json= JSON.toJSONString(count);
        out.print(json);
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
