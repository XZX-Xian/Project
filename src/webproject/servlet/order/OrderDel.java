package webproject.servlet.order;

import com.alibaba.fastjson.JSON;
import webproject.service.OrderService;
import webproject.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 删除订单
 */
@WebServlet(name = "OrderDel",urlPatterns = "/orderdel")
public class OrderDel extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
       String ordernumber=request.getParameter("ordernumber");

        OrderService str=new OrderServiceImpl();
        int count=str.OrderDel(ordernumber);
        String json= JSON.toJSONString(count);
        out.print(json);
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
